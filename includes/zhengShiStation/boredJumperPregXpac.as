/* BoredJumper: Add preg stuff by William*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
	BJUMPER_HORSE_TOTAL_KIDS //number of kids you and horse bored jumper have together
	BJUMPER_TERRAN_TOTAL_KIDS //number of kids you and terran bored jumper have together
	BJUMPER_DOG_TOTAL_KIDS //number of kids you and dog bored jumper have together
	BJUMPER_CAT_TOTAL_KIDS //number of kids you and cat bored jumper have together
	BJUMPER_PREG_TIMER //days bored jumper has been pregnant
	BJUMPER_BIRTH_SCENE //should jumper birth scene trigger undef/0 no, 1 yes
	BJUMPER_BIRTH_SCENE_FURCOLOR1 //one fur color
	BJUMPER_BIRTH_SCENE_FURCOLOR2 //second fur color if applicable
	BJUMPER_BIRTH_SCENE_HAIRCOLOR1 //one hair color
	BJUMPER_BIRTH_SCENE_HAIRCOLOR1 //second hair color if applicable
	BJUMPER_BIRTH_SCENE_BOYS //count of sons for birth scene
	BJUMPER_BIRTH_SCENE_GIRLS //count of daughters for birth scene
	BJUMPER_BIRTH_SCENE_HERMS //count of herms for birth scene
	BJUMPER_MISSED_BIRTH //pc missed jumper birth scene undef/0 no, 1 yes
	BJUMPER_MISSED_BIRTH_CNT_HORSE //pc missed jumper birth count
	BJUMPER_MISSED_BIRTH_CNT_DOG //pc missed jumper birth count
	BJUMPER_MISSED_BIRTH_CNT_CAT //pc missed jumper birth count
	BJUMPER_MISSED_BIRTH_CNT_TERRAN //pc missed jumper birth count
	BJUMPER_NUM_BABIES //number of babies in current pregnancy (2-8)
	BJUMPER_BABY_GENDERS //array used to track genders of current pregnancy
	BJUMPER_PREG_TYPE //which jumper is preggers
	BJUMPER_PC_PREG_TYPE //which jumper got pc preggers pregslot 0
	BJUMPER_PC_PREG_TYPE1 //which jumper got pc preggers pregslot 1
	BJUMPER_PC_PREG_TYPE2 //which jumper got pc preggers pregslot 2
	BJUMPER_HORSE_PREG_ENC_JUMPER //times encountered while jumper preg
	BJUMPER_TERRAN_PREG_ENC_JUMPER //times encountered while jumper preg
	BJUMPER_DOG_PREG_ENC_JUMPER //times encountered while jumper preg
	BJUMPER_CAT_PREG_ENC_JUMPER//times encountered while jumper preg
	BJUMPER_HORSE_PREG_GOWITH //times Go with
	BJUMPER_TERRAN_PREG_GOWITH //times Go with
	BJUMPER_DOG_PREG_GOWITH //times Go with
	BJUMPER_CAT_PREG_GOWITH //times Go with
	BJUMPER_DODGE_DECK//times on dodge deck
	BJUMPER_HORSE_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_TERRAN_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_DOG_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_CAT_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_HORSE_PREG_NAME //undef/0 not give name, 1 = gave
	BJUMPER_TERRAN_PREG_NAME //undef/0 not give name, 1 = gave
	BJUMPER_DOG_PREG_NAME //undef/0 not give name, 1 = gave
	BJUMPER_CAT_PREG_NAME //undef/0 not give name, 1 = gave
	BJUMPER_TRIED_TO_LEAVE //undef/0 did not, 1 did
	BJUMPER_REST_MENU //undef/0 did not, 1 did
	BJUMPER_SEX_MENU //undef/0 did not, 1 did
	BJUMPER_SEND_PIC //undef/0 did not, 1 did
	BJUMPER_SEND_TIMER //timestamp for send email timer
	BJUMPER_SEND_TYPE //which jumper type is sending reply email
	BJUMPER_SEND_PICKTYPE //which type of pic is being sent
	BJUMPER_CAN_LEAVE //undef/0 cannot, 1 can
	BJUMPER_PREG_ENC_COOLDOWN //timestamp when last meet preg jumper
	BJUMPER_PC_PREG_ENC_COOLDOWN //timestamp when last meet jumper that got pc preg
	BJUMPER_HEAT_SEX //undef/0 no, 1 = yes
	BJUMPER_HORSE_PC_PREG_ENC_JUMPER //times encountered while steele preg
	BJUMPER_TERRAN_PC_PREG_ENC_JUMPER //times encountered while steele preg
	BJUMPER_DOG_PC_PREG_ENC_JUMPER //times encountered while steele preg
	BJUMPER_CAT_PC_PREG_ENC_JUMPER//times encountered while steele preg
	BJUMPER_HORSE_PC_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_TERRAN_PC_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_DOG_PC_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_CAT_PC_PREG_NEW //undef/0 not encountered this preg
	BJUMPER_HORSE_PC_PREG_ASSIST //undef/0 hasn't assisted, 1+ = has
	BJUMPER_TERRAN_PC_PREG_ASSIST //undef/0 hasn't assisted, 1+ = has
	BJUMPER_DOG_PC_PREG_ASSIST //undef/0 hasn't assisted, 1+ = has
	BJUMPER_CAT_PC_PREG_ASSIST //undef/0 hasn't assisted, 1+ = has
	BJUMPER_PREG_SCENE_TYPE //which jumper is helping pc give birth
	BJUMPER_PC_BIRTH_SCENE_FURCOLOR1 //one fur color
	BJUMPER_PC_BIRTH_SCENE_FURCOLOR2 //second fur color if applicable
	BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1 //one hair color
	BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1 //second hair color if applicable
	
*/
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.Templates.BoredJumperHorseUniqueChild;
import classes.GameData.Pregnancy.Templates.BoredJumperDogUniqueChild;
import classes.GameData.Pregnancy.Templates.BoredJumperCatUniqueChild;
import classes.GameData.Pregnancy.Templates.BoredJumperTerranUniqueChild;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

//show nude and/or preg bust
public function showPregBoredJumper(nude:Boolean = false,preg:Boolean = false,jumperType:int = 0):void
{	
	//passed in preg parameter is just to toggle the check to display or not
	if (preg)
	{
		//check if it is the preg jumper
		if (flags["BJUMPER_PREG_TYPE"] == undefined || flags["BJUMPER_PREG_TYPE"] != jumperType) preg = false;
		//set false if not actually showing
		if (flags["BJUMPER_PREG_TIMER"] == undefined || flags["BJUMPER_PREG_TIMER"] < 50) preg = false;
	}
	//currently no non nude preg bust, so if preg, always show nude as well
	if (preg) nude = true;
	showName("BORED\nJUMPER");
	if(jumperType == GLOBAL.TYPE_EQUINE) showBust("BORED_JUMPER_EQUINE" + (nude ? "_NUDE" : "") + (preg ? "_PREGNANT" : ""));
	else if(jumperType == GLOBAL.TYPE_FELINE) showBust("BORED_JUMPER_FELINE" + (nude ? "_NUDE" : "") + (preg ? "_PREGNANT" : ""));
	else if(jumperType == GLOBAL.TYPE_CANINE) showBust("BORED_JUMPER_CANINE" + (nude ? "_NUDE" : "") + (preg ? "_PREGNANT" : ""));
	else showBust("BORED_JUMPER_TERRAN" + (nude ? "_NUDE" : "") + (preg ? "_PREGNANT" : ""));
	author("William");
}

//This returns your preg score on a scale of 0-99999, or 0%-99.999%
public function boredJumperKnockupChance():int
{
	var vir:Number;
	var chance:Number = -.223; //jumpers on low quality birth control so base chance is around 20%
	var cumQ:Number = pc.cumQ();
	
	if(pc.virility() == 0 || enemy.fertility() == 0 || chance == 0) return 0;
	
	vir = (pc.virility() + enemy.fertility());
	
	//increase base virility by cum volume up to a max of +2 (at a certain point the rest is just excess and will never get near the egg and is irrelevant for preg chance)
	//plus this keeps player virility more important than volume for large preg change increases
	if (cumQ >= 2000) vir += 2;
	else if (cumQ > 0) vir += cumQ / 1000;
	
	vir = vir / 2;
	
	return (1 - Math.exp(chance * vir)) * 10000;
}
//Return value of true if she gets impregnated, else false
public function tryKnockUpBoredJumper(heatSex:Boolean=false):Boolean
{
	var chance:Number;
	var minBabies:Number = 2;
	var kidSex:int;
	
	//If pc is infertile or a bored jumper is already preggo return false
	if(pc.virility() == 0 || flags["BJUMPER_PREG_TIMER"] != undefined) return false;
	
	chance = boredJumperKnockupChance();
	
	//rand returns 0 to 9999, chance returns 0 to 9999, 0 chance will never result in pregnancy obviously
	if(rand(10000) < chance || heatSex)
	{
		//succesful impregnation
		flags["BJUMPER_PREG_TIMER"] = 0;
		//2-8 babies
		flags["BJUMPER_NUM_BABIES"] = rand(7) + 2;
		//increase number of babies based on virility and cum volume
		minBabies += Math.round(pc.virility() - 1);
		minBabies += Math.round(pc.cumQ() / 1000);
		if (minBabies > 8) minBabies = 8;
		
		if (flags["BJUMPER_NUM_BABIES"] < minBabies) flags["BJUMPER_NUM_BABIES"] = minBabies;
		
		flags["BJUMPER_BABY_GENDERS"] = new Array();

		//Lets roll for genders 33/33/33
		for(var i:int = 0; i < flags["BJUMPER_NUM_BABIES"]; i++)
		{
			kidSex = rand(3);
			if(kidSex == 0) flags["BJUMPER_BABY_GENDERS"].push("M");
			if(kidSex == 1) flags["BJUMPER_BABY_GENDERS"].push("F");
			else flags["BJUMPER_BABY_GENDERS"].push("H");
		}

		pc.clearRut();
		
		//set which jumper got preggers
		if(enemy.hasCock(GLOBAL.TYPE_EQUINE)) flags["BJUMPER_PREG_TYPE"] = GLOBAL.TYPE_EQUINE;
		else if(enemy.hasCock(GLOBAL.TYPE_FELINE)) flags["BJUMPER_PREG_TYPE"] = GLOBAL.TYPE_FELINE;
		else if(enemy.hasCock(GLOBAL.TYPE_CANINE)) flags["BJUMPER_PREG_TYPE"] = GLOBAL.TYPE_CANINE;
		else flags["BJUMPER_PREG_TYPE"] = GLOBAL.TYPE_HUMAN;
		
		return true;
	}
	else return false;
}
//process any preg events for jumper preg
public function processBoredJumperPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["BJUMPER_PREG_TIMER"] != undefined) flags["BJUMPER_PREG_TIMER"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;
	
	//delayed email from pc sending nursery pics
	if (flags["BJUMPER_SEND_TIMER"] != undefined && (timestamp + ((rand(24) + 1) * 60)) > flags["BJUMPER_SEND_TIMER"])
	{
		resendMail("jumper_sendpic", timestamp);
		flags["BJUMPER_SEND_TIMER"] = undefined;
	}
	
	if(flags["BJUMPER_PREG_TIMER"] != undefined)
	{
		if (flags["BJUMPER_PREG_TIMER"] >= 184 && flags["BJUMPER_BIRTH_SCENE"] == 1)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["BJUMPER_PREG_TIMER"] * 24 * 60) + (184 * 24 * 60));
			flags["BJUMPER_MISSED_BIRTH"] = 1;
			if (boredJumperKnowsSteelesName(flags["BJUMPER_PREG_TYPE"])) resendMail("jumper_birth", timestamp);
			boredJumperBirth(timestamp);
		}
		else if (flags["BJUMPER_PREG_TIMER"] >= 175) flags["BJUMPER_BIRTH_SCENE"] = 1;
	}
}
//make the kids for jumper birth
public function boredJumperBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild;
	var jumperType:int = flags["BJUMPER_PREG_TYPE"];
	var i:int = 0
	var skipSex:Boolean = true;
	
	flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] = undefined;
	flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] = undefined;
	flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] = undefined;
	flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR2"] = undefined;
	flags["BJUMPER_BIRTH_SCENE_BOYS"] = 0;
	flags["BJUMPER_BIRTH_SCENE_GIRLS"] = 0;
	flags["BJUMPER_BIRTH_SCENE_HERMS"] = 0;

	//special logic for just two babies, make twins
	if (flags["BJUMPER_NUM_BABIES"] == 2)
	{
		if (jumperType == GLOBAL.TYPE_EQUINE) c = new BoredJumperHorseUniqueChild(); 
		else if (jumperType == GLOBAL.TYPE_CANINE) c = new BoredJumperDogUniqueChild(); 
		else if (jumperType == GLOBAL.TYPE_FELINE) c = new BoredJumperCatUniqueChild(); 
		else c = new BoredJumperTerranUniqueChild(); 
		
		c.RaceType = GLOBAL.TYPE_LAPINE;
		
		for (i = 0; i < flags["BJUMPER_NUM_BABIES"]; i++)
		{
			if (flags["BJUMPER_BABY_GENDERS"][i] == "M")
			{
				c.NumMale += 1;
				IncrementFlag("BJUMPER_BIRTH_SCENE_BOYS");
			}
			else if (flags["BJUMPER_BABY_GENDERS"][i] == "F")
			{
				c.NumFemale += 1;
				IncrementFlag("BJUMPER_BIRTH_SCENE_GIRLS");
			}	
			else
			{
				c.NumIntersex += 1;
				IncrementFlag("BJUMPER_BIRTH_SCENE_HERMS");
			}
		}
		
		// Race modifier (if different races)
		c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
		// Adopt father's colors at random (if applicable):
		if(rand(2) == 0) c.skinTone = traitChar.skinTone;
		//if(rand(2) == 0) c.lipColor = traitChar.lipColor;
		//if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
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
		flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] = c.furColor;
		flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] = c.hairColor;
	
	}
	//else cycle through and make each group by sex unique
	else
	{
		//determine how many of each sex
		for(i = 0; i < flags["BJUMPER_NUM_BABIES"]; i++)
		{
			if (flags["BJUMPER_BABY_GENDERS"][i] == "M")
			{
				IncrementFlag("BJUMPER_BIRTH_SCENE_BOYS");
			}
			else if (flags["BJUMPER_BABY_GENDERS"][i] == "F")
			{
				IncrementFlag("BJUMPER_BIRTH_SCENE_GIRLS");
			}
			else
			{
				IncrementFlag("BJUMPER_BIRTH_SCENE_HERMS");
			}
		}
		//loop through the sexes
		for(i = 0; i < 3; i++)
		{
			skipSex = true;
			
			if (i == 0)
			{
				if (flags["BJUMPER_BIRTH_SCENE_BOYS"] > 0) skipSex = false;
			}
			else if (i == 1)
			{
				if (flags["BJUMPER_BIRTH_SCENE_GIRLS"] > 0) skipSex = false;
			}
			else if (i == 2)
			{
				if (flags["BJUMPER_BIRTH_SCENE_HERMS"] > 0) skipSex = false;
			}
			
			if (!skipSex)
			{
				if (jumperType == GLOBAL.TYPE_EQUINE) c = new BoredJumperHorseUniqueChild(); 
				else if (jumperType == GLOBAL.TYPE_CANINE) c = new BoredJumperDogUniqueChild(); 
				else if (jumperType == GLOBAL.TYPE_FELINE) c = new BoredJumperCatUniqueChild(); 
				else c = new BoredJumperTerranUniqueChild(); 
						
				c.RaceType = GLOBAL.TYPE_LAPINE;
		
				if (i == 0) c.NumMale += flags["BJUMPER_BIRTH_SCENE_BOYS"];
				else if (i == 1) c.NumFemale += flags["BJUMPER_BIRTH_SCENE_GIRLS"];
				else if (i == 2) c.NumIntersex += flags["BJUMPER_BIRTH_SCENE_HERMS"];

				// Race modifier (if different races)
				c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
				// Adopt father's colors at random (if applicable):
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
				if (flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] == undefined) flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] = c.furColor;
				else if (flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] != c.furColor) flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] = c.furColor;
				if (flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] == undefined) flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] = c.hairColor;
				else if (flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] != c.hairColor) flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR2"] = c.hairColor;
			}
		}
	}
	
	if (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_EQUINE)
	{
		StatTracking.track("pregnancy/jumper horse sired", flags["BJUMPER_NUM_BABIES"]);
		if(flags["BJUMPER_HORSE_TOTAL_KIDS"] == undefined) flags["BJUMPER_HORSE_TOTAL_KIDS"] = 0;
		flags["BJUMPER_HORSE_TOTAL_KIDS"] += flags["BJUMPER_NUM_BABIES"];
		IncrementFlag("BJUMPER_HORSE_PREG_NEW");
	}
	else if (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_CANINE)
	{
		StatTracking.track("pregnancy/jumper dog sired", flags["BJUMPER_NUM_BABIES"]);
		if(flags["BJUMPER_DOG_TOTAL_KIDS"] == undefined) flags["BJUMPER_DOG_TOTAL_KIDS"] = 0;
		flags["BJUMPER_DOG_TOTAL_KIDS"] += flags["BJUMPER_NUM_BABIES"];
		IncrementFlag("BJUMPER_DOG_PREG_NEW");
	}
	else if (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_FELINE)
	{
		StatTracking.track("pregnancy/jumper cat sired", flags["BJUMPER_NUM_BABIES"]);
		if(flags["BJUMPER_CAT_TOTAL_KIDS"] == undefined) flags["BJUMPER_CAT_TOTAL_KIDS"] = 0;
		flags["BJUMPER_CAT_TOTAL_KIDS"] += flags["BJUMPER_NUM_BABIES"];
		IncrementFlag("BJUMPER_CAT_PREG_NEW");
	}
	else
	{
		StatTracking.track("pregnancy/jumper terran sired", flags["BJUMPER_NUM_BABIES"]);
		if(flags["BJUMPER_TERRAN_TOTAL_KIDS"] == undefined) flags["BJUMPER_TERRAN_TOTAL_KIDS"] = 0;
		flags["BJUMPER_TERRAN_TOTAL_KIDS"] += flags["BJUMPER_NUM_BABIES"];
		IncrementFlag("BJUMPER_TERRAN_PREG_NEW");
	}
	
	StatTracking.track("pregnancy/total sired", flags["BJUMPER_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["BJUMPER_NUM_BABIES"]);

	if (flags["BJUMPER_MISSED_BIRTH"] != 1) flags["BJUMPER_PREG_TYPE"] = undefined;
	flags["BJUMPER_PREG_TIMER"] = undefined;
	flags["BJUMPER_NUM_BABIES"] = undefined;
	flags["BJUMPER_BABY_GENDERS"] = undefined;
	flags["BJUMPER_BIRTH_SCENE"] = undefined;
}
//determine who is laquine preg at 50+ days: jumper, steele, or both
//pass in jumperType such as GLOBAL.TYPE_EQUINE for specific jumper or -1 if any jumper 
//0 no preggers, 1 bored jumper only, 2 pc only, 3 both same, 4 both diff, 5 both same + diff as steel multi jumper preg (4 & 5 returned for jumperType -1 only)
public function boredJumperPregScene(jumperType:int=-1):int
{
	var preg:int = 0;
	var lateTerm:Boolean = false;
	var lateTerm1:Boolean = false;
	var lateTerm2:Boolean = false;
	var remIncub:Number = 132 * 24 * 60;
	var cnt:int = 0;
	
	//check if jumper is preg 50+ days
	if ((flags["BJUMPER_PREG_TYPE"] == jumperType || jumperType == -1) && flags["BJUMPER_PREG_TYPE"] != undefined && flags["BJUMPER_PREG_TIMER"] != undefined)
	{
		if (flags["BJUMPER_PREG_TIMER"] >= 50)
		{
			preg = 1;
		}
	}
	//check if steele is preg by any jumpper for 50+ days
	if (jumperType == -1 && (flags["BJUMPER_PC_PREG_TYPE"] != undefined || flags["BJUMPER_PC_PREG_TYPE1"] != undefined || flags["BJUMPER_PC_PREG_TYPE2"] != undefined))
	{
		//check if at 50+ days preg
		if (flags["BJUMPER_PC_PREG_TYPE"] != undefined && pc.pregnancyData[0].pregnancyIncubation <= remIncub) lateTerm = true; 
		if (flags["BJUMPER_PC_PREG_TYPE1"] != undefined && pc.pregnancyData[1].pregnancyIncubation <= remIncub) lateTerm1 = true; 
		if (flags["BJUMPER_PC_PREG_TYPE2"] != undefined && pc.pregnancyData[2].pregnancyIncubation <= remIncub) lateTerm2 = true; 
	}
	//check if steele is preg by specific jumper for 50+ days
	if (flags["BJUMPER_PC_PREG_TYPE"] == jumperType || flags["BJUMPER_PC_PREG_TYPE1"] == jumperType || flags["BJUMPER_PC_PREG_TYPE2"] == jumperType)
	{
		//check if at 50+ days preg
		if (flags["BJUMPER_PC_PREG_TYPE"] == jumperType && pc.pregnancyData[0].pregnancyIncubation <= remIncub) lateTerm = true; 
		if (flags["BJUMPER_PC_PREG_TYPE1"] == jumperType && pc.pregnancyData[1].pregnancyIncubation <= remIncub) lateTerm1 = true; 
		if (flags["BJUMPER_PC_PREG_TYPE2"] == jumperType && pc.pregnancyData[2].pregnancyIncubation <= remIncub) lateTerm2 = true;
	}
	
	//check if flags set for any womb to have jumper preg of 50+ days
	if (lateTerm || lateTerm1 || lateTerm2)
	{
		//if a jumper is preg 50+ as well we need to figure out if it is the same, not same, or same but also there are other wombs with other jumper pregs
		if (preg == 1)
		{
			//set same (3) or diff (4)
			if (lateTerm && flags["BJUMPER_PREG_TYPE"] == flags["BJUMPER_PC_PREG_TYPE"]) preg = 3;
			else if (lateTerm1 && flags["BJUMPER_PREG_TYPE"] == flags["BJUMPER_PC_PREG_TYPE1"]) preg = 3;
			else if (lateTerm2 && flags["BJUMPER_PREG_TYPE"] == flags["BJUMPER_PC_PREG_TYPE2"]) preg = 3;
			else if (jumperType == -1) preg = 4;
			
			//count up number of wombs with jumper preg 50+ days that are from unique jumpers
			if (lateTerm) cnt++;
			if (lateTerm1 && flags["BJUMPER_PC_PREG_TYPE1"] != flags["BJUMPER_PC_PREG_TYPE"]) cnt++;
			if (lateTerm2 && flags["BJUMPER_PC_PREG_TYPE2"] != flags["BJUMPER_PC_PREG_TYPE"] && flags["BJUMPER_PC_PREG_TYPE2"] != flags["BJUMPER_PC_PREG_TYPE1"]) cnt++;
			
			//if we have preggers from multi jumpers but one of them is also matching preggers, we want to return 5
			if (cnt >= 2 && preg == 3 && jumperType == -1) preg = 5;
		}
		else preg = 2;
	}
	return preg;
}
//jumper preg, steele not
public function boredJumperPregEncounterJumperPreg():Boolean
{
	if (flags["BJUMPER_PREG_ENC_COOLDOWN"] != undefined)
	{
		if (GetGameTimestamp() < (flags["BJUMPER_PREG_ENC_COOLDOWN"] + (3 * 24 * 60))) return false;
	}
	
	clearOutput();
	var jumperType:int = -1;
	if (flags["BJUMPER_PREG_TYPE"] != undefined) jumperType = flags["BJUMPER_PREG_TYPE"];
	showPregBoredJumper(false, true,jumperType);
	var firstTime:Boolean = true;
	var newPreg:Boolean = false;
	var samePreg:Boolean = false;
	var encLocation:int = boredJumperPregLocation();
	
	setEnemy(new JumperBored());
	enemy.furColor = boredJumperFurColor(jumperType);
	enemy.hairColor = boredJumperHairColor(jumperType);
	enemy.eyeColor = boredJumperEyeColor(jumperType);
	enemy.lipColor = boredJumperLipColor(jumperType);
	enemy.nippleColor = boredJumperNippleColor(jumperType);
	
	flags["BJUMPER_PREG_ENC_COOLDOWN"] = GetGameTimestamp();
	
	if (jumperType == GLOBAL.TYPE_EQUINE) 
	{
		if (flags["BJUMPER_HORSE_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_HORSE_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper horse births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_HORSE_PREG_ENC_JUMPER");
		flags["BJUMPER_HORSE_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 14;
		enemy.shiftCock(0,GLOBAL.TYPE_EQUINE);
		enemy.cocks[0].cockColor = "chocolate";
	}
	else if (jumperType == GLOBAL.TYPE_CANINE)
	{
		if (flags["BJUMPER_DOG_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_DOG_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper dog births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_DOG_PREG_ENC_JUMPER");
		flags["BJUMPER_DOG_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 12;
		enemy.shiftCock(0,GLOBAL.TYPE_CANINE);
		enemy.cocks[0].cockColor = "red";
	}
	else if (jumperType == GLOBAL.TYPE_FELINE)
	{
		if (flags["BJUMPER_CAT_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_CAT_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper cat births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_CAT_PREG_ENC_JUMPER");
		flags["BJUMPER_CAT_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 13;
		enemy.shiftCock(0,GLOBAL.TYPE_FELINE);
		enemy.cocks[0].cockColor = "pink";
	}
	else if (jumperType == GLOBAL.TYPE_HUMAN)
	{
		if (flags["BJUMPER_TERRAN_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_TERRAN_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper terran births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_TERRAN_PREG_ENC_JUMPER");
		flags["BJUMPER_TERRAN_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 12;
		enemy.shiftCock(0,GLOBAL.TYPE_HUMAN);
		enemy.cocks[0].cockColor = "pink";
	}
	
	if (firstTime)
	{
		output("A faint smell catches you off guard; a very powerful scent is carried on the air. Your body recognizes it instantly, instinctively drawn in its direction. You wrinkle your nose and stop yourself, wondering why that is. The instinct for self-preservation kicks in right after, and you raise your [pc.weapon], now determined to figure it out.");
		if (encLocation == 1) output(" This area of Zheng Shi is well-defended, and you can’t go wandering into any traps.");
		else if (encLocation == 2) output(" Despite the general emptiness of the lower hangar, you can’t afford to stumble into a trap.");
		else output(" These molten mines are a dangerous place. If not the robots, then the fuckbunnies wandering around.");
		
		output("\n\nYou don’t have to go far to get your answer. The origin of that smell is on the tip of your tongue, but you’re just waiting to see the source before confirming it absolutely. When you step around the corner, there’s first a whimper, and then a creak. A latex creak -- it’s a [enemy.furColor]-furred laquine Jumper, and she’s looking rather indisposed. You knock the wall to get her attention, and the gravid hare whips around in shock, yelping and nearly tumbling to the ground with a dim fear in her [enemy.eyeColor] eyes.");
		output("\n\n<i>“Oh woah, don’t you-”</i> she cries, just before recognizing you. <i>“W-wait... oh... it’s you");
		if (boredJumperKnowsSteelesName()) output(", [pc.name]");
		output(". Oof, that’s great. Got a really bad headache...”</i> She presses her back to the wall, grunts, and slumps down, clutching her visibly rounded tummy. Her taut and ropy muscles have disappeared under the heft of a rounding baby bulge that’s punched through the lower end of her zipsuit. The top is unfastened around the neck just to breathe.");
		output("\n\n<i> “F - fuck, so heavy...” </i> she murmurs. Looks like she’s an expecting mother, and considering the potent fragrance coming off her, she’s no doubt bearing <i>your children.</i > Thinking about it, she smelled like a long-stewed fuckbunny before... but now her aroma is magnified by the weight in her womb.");
		output("\n\nThe moment you realize this, you kneel down next to her with a smile");
		if (pc.isMischievous()) output(", quipping that she’s not going to be doing much jumping now. She laughs with you");
		output(".");
		if (samePreg) output(" Now she knows exactly how you felt carrying her kids!");
		
		output("\n\n<i>“Didn’t think I’d get pregnant while on a pill, but you’re a virile [pc.guyGirl], hot-stuff,”</i> she huffs and smiles, but looks around nervously. <i>“Can’t really get Sterilex around here, its used for the slaves but uh-”</i> A distant clank of metal- <i>“Eek!”</i> She covers her head.");
		output("\n\nYou ask what’s got her so nervous. That stress can’t be good for her babies.");
		output("\n\n<i>“I can’t be seen like this!”</i> she snaps, immediately remorseful. <i>“The boss’ll have my balls if I’m caught and then... fuck, I shouldn’t even be out here! If anyone sees me pregnant I’ll be in so much trouble, and I don’t... I don’t wanna lose them.”</i> The lop-eared outlaw flicks her eyes down meaningfully, running a hand over her gut-bump. A tiny thud, and... <i>“Oh- they kicked. Little guys are growin’ fast...”</i>");
		output("\n\nShe shakes the hormones off. <i>“If anyone sees me... shit, I don’t wanna think about it. I have to sneak food off the ship when nobody’s around and I have to hide in the walls or on the dodge deck. If- ooh...”</i> she moans, fingers roaming across her belly again. <i>“Thank the stars for dispensers,”</i> she muses, pulling out a bottle of water and downing it straight away. <i>“Never been pregnant before, it’s way hotter than the mines...”</i> she husks.");
		if (flags["BJUMPER_DODGE_DECK"] == undefined) output("\n\nWhat’s that about a <i>dodge deck?</i> The unfocused bunny-girl perks up and tries to stand, eager to answer. <i>“Not every deck on this crummy station is used. Some of us found a place to sneak off and sleep when we get really bored,”</i> she tells you much too proudly. <i>“So uh...”</i> she sniffs, leaning closer to you with a vacant look in her eye.");
		
		output("\n\n<i>“Mmm, you smell really good.”</i> You fold your arms. <i>“Okay okay.”</i> She laughs. <i>“Y-you wanna come hang out with me?”</i> she stammers and grins, looking seriously fatigued. <i>“Since you’re here and these are your kids.”</i> She looks down and around nervously again. <i>“...Nobody else could have gotten me pregnant, you’re the only one who’s been in there.”</i>");
		output("\n\nYour eyes are locked to the wobbly, latex-wrapped sphere filling out her uniform and threatening to snap her zipper. What she needs is just a little bit of comfort.");
		if (pc.isBimbo() || pc.isBro()) output(" <i>“Shhh...”</i> you hush");
		else output(" <i>“Calm down,”</i> you whisper");
		output(", stroking her stomach with a gentle caress. She falls into your hand, cooing cutely, begging for more with her [enemy.eyeColor] eyes.");
		
		output("\n\n<i>“T-that feels really good...”</i> she moans, assisting your [pc.hand]. <i>“Sorry, I’ve just been on edge. The drugs and now these kids... I’m a bit scared.”</i>");
		output("\n\nA ginger scritch behind her inflexible ears quells that stress, and the big bad bunny-pirate rubs back against that palm. You could go with her, help put her at ease, or you could move on. The more you lavish her bulged-out belly with paternal caresses, the more you feel like going with her would be a fine idea.");
	}
	else
	{
		output("<i>Sniff.</i> Pheromones, and not just any. They’re the pheromones of a ripe, pregnant laquine. Again, not just any, <b>but the mother of your children.</b>");
		if (newPreg) output(" Looks... <i>Smells</i> like you’ve gotten a bunny pregnant again!");
		output(" It doesn’t take you long to zero in on her, ");
		if (encLocation == 1) output("crouched behind some equipment.");
		else if (encLocation == 2) output("hiding herself behind a few shipping containers.");
		else output("hidden away at a marginally cooler dead end mineshaft.");
		output(" You hear a flask open and a few desperate gulps following it.");
		
		output("\n\nWhen you step into sight, she nearly throws it in terror. You wordlessly sit next to the hapless pirate, caressing her noticeably larger stomach, watching her squirm and sigh under your touches. <i>“Hey,");
		if (boredJumperKnowsSteelesName()) output(" [pc.name]");
		output("”</i> she murmurs. <i>“You really don’t need to do this...”</i >");
		output("\n\nYou glower at her.");
		if (pc.isBimbo() || pc.isBro()) output(" <i>“That’s not true at all!”</i> you say, looking dramatically wounded.");
		else output(" <i>“You’re the mother of my children,”</i> you say matter-of-factly. <i>“Your safety, and their safety, is important to me.”</i>");
		
		output("\n\nMisty [enemy.eyeColor] eyes look back into yours. <i>“W-well, since you’re here, you wanna go upstairs for a bit? It’d be nice to have someone to hang out with. It uh... it’s really lonely around here carrying a buncha kids. Gives me a lot to think about. Things I don’t want to think about...”</i>");
		output("\n\nWhile you consider your options, you don’t stop rubbing her belly. Before you answer, you bring her into a sweet and unmistakably passionate kiss that doesn’t last long enough. You decide...");
	}
	
	flags["BJUMPER_CAN_LEAVE"] = undefined;
	
	processTime(5);
	clearMenu();
	addButton(0,"Go With",boredJumperPregEncounterGoWith,[jumperType,newPreg,samePreg],"Go With","Yeah, you could use a break. Maybe something more?");
	addButton(1, "Don’t Go", boredJumperPregEncounterDontGo, jumperType, "Don’t Go", "Too bad for her, you’ve got other places to be. Maybe next time!");
	return true;
}
//steele preg, jumper not
public function boredJumperPregEncounterSteelePreg():Boolean
{
	if (flags["BJUMPER_PC_PREG_ENC_COOLDOWN"] != undefined)
	{
		if (GetGameTimestamp() < (flags["BJUMPER_PC_PREG_ENC_COOLDOWN"] + (3 * 24 * 60))) return false;
	}
	clearOutput();
	var jumperType:int = -1;
	
	//check each womb for jumper preg that doesn't match a preg jumper and add to possible list of which jumper
	var sel:Array = [];
	var i:int;
	var rn:int;
	
	if (flags["BJUMPER_PC_PREG_TYPE"] != undefined && (flags["BJUMPER_PC_PREG_TYPE"] != flags["BJUMPER_PREG_TYPE"] || flags["BJUMPER_PREG_TIMER"] < 50)) sel.push(flags["BJUMPER_PC_PREG_TYPE"]);
	if (flags["BJUMPER_PC_PREG_TYPE1"] != undefined && (flags["BJUMPER_PC_PREG_TYPE1"] != flags["BJUMPER_PREG_TYPE"] || flags["BJUMPER_PREG_TIMER"] < 50)) sel.push(flags["BJUMPER_PC_PREG_TYPE1"]);
	if (flags["BJUMPER_PC_PREG_TYPE2"] != undefined && (flags["BJUMPER_PC_PREG_TYPE2"] != flags["BJUMPER_PREG_TYPE"] || flags["BJUMPER_PREG_TIMER"] < 50)) sel.push(flags["BJUMPER_PC_PREG_TYPE2"]);
	
	i = sel.length;
	
	if (i > 0)
	{
		rn = rand(i);
		//set which jumper is meet
		jumperType = sel [rn];
	}
	
	showPregBoredJumper(false, true,jumperType);
	var firstTime:Boolean = true;
	var newPreg:Boolean = false;
	var samePreg:Boolean = false;
	var encLocation:int = boredJumperPregLocation();
	var multiJumper:Boolean = false;
	if (i > 1)
	{
		if (flags["BJUMPER_PC_PREG_TYPE"] != undefined && flags["BJUMPER_PC_PREG_TYPE1"] != undefined && flags["BJUMPER_PC_PREG_TYPE"] != flags["BJUMPER_PC_PREG_TYPE1"]) multiJumper = true;
		if (flags["BJUMPER_PC_PREG_TYPE"] != undefined && flags["BJUMPER_PC_PREG_TYPE2"] != undefined && flags["BJUMPER_PC_PREG_TYPE"] != flags["BJUMPER_PC_PREG_TYPE2"]) multiJumper = true;
		if (flags["BJUMPER_PC_PREG_TYPE1"] != undefined && flags["BJUMPER_PC_PREG_TYPE2"] != undefined && flags["BJUMPER_PC_PREG_TYPE1"] != flags["BJUMPER_PC_PREG_TYPE2"]) multiJumper = true;
	}
	
	flags["BJUMPER_PC_PREG_ENC_COOLDOWN"] = GetGameTimestamp();
	
	flags["BJUMPER_CAN_LEAVE"] = undefined;
	
	setEnemy(new JumperBored());
	enemy.furColor = boredJumperFurColor(jumperType);
	enemy.hairColor = boredJumperHairColor(jumperType);
	enemy.eyeColor = boredJumperEyeColor(jumperType);
	enemy.lipColor = boredJumperLipColor(jumperType);
	enemy.nippleColor = boredJumperNippleColor(jumperType);
		
	if (jumperType == GLOBAL.TYPE_EQUINE) 
	{
		if (flags["BJUMPER_HORSE_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_HORSE_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper horse sired") > 0) samePreg = true;
		IncrementFlag("BJUMPER_HORSE_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_HORSE_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 14;
		enemy.shiftCock(0,GLOBAL.TYPE_EQUINE);
		enemy.cocks[0].cockColor = "chocolate";
	}
	else if (jumperType == GLOBAL.TYPE_CANINE)
	{
		if (flags["BJUMPER_DOG_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_DOG_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper dog sired") > 0) samePreg = true;
		IncrementFlag("BJUMPER_DOG_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_DOG_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 12;
		enemy.shiftCock(0,GLOBAL.TYPE_CANINE);
		enemy.cocks[0].cockColor = "red";
	}
	else if (jumperType == GLOBAL.TYPE_FELINE)
	{
		if (flags["BJUMPER_CAT_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_CAT_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper cat sired") > 0) samePreg = true;
		IncrementFlag("BJUMPER_CAT_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_CAT_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 13;
		enemy.shiftCock(0,GLOBAL.TYPE_FELINE);
		enemy.cocks[0].cockColor = "pink";
	}
	else if (jumperType == GLOBAL.TYPE_HUMAN)
	{
		if (flags["BJUMPER_TERRAN_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_TERRAN_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper terran sired") > 0) samePreg = true;
		IncrementFlag("BJUMPER_TERRAN_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_TERRAN_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 12;
		enemy.shiftCock(0,GLOBAL.TYPE_HUMAN);
		enemy.cocks[0].cockColor = "pink";
	}
	
	
	if (firstTime)
	{
		output("You place a hand on the wall to steady yourself, knocked off balance by an inner heave in your bloated stomach. [pc.LegOrLegs] nearly giving out, you squat down and catch your breath, glad that there’s no imminent danger. While pregnant you should probably be staying back on Tavros, at least your ship... but you’ve handled yourself well enough up to this point!");
		if (flags["ZHENG_SHI_PROBED"] == 1) output(" A pirate base isn’t the best place to be shouldering kids around, but sometimes you’re not in a position to be choosy.");
		else output(" Besides, your cousin’s no doubt got a leg up on you. What’s a little progress under duress?");
		
		output("\n\nA noticeable creak of latex - and a strangely powerful scent - makes the reach for your [pc.weapon] a little difficult. The physical and hormonal weight dulled your senses long enough for a lop-eared Jumper to close the distance, bounding noisily in your direction with twinkling [enemy.eyeColor] eyes. There’s a moment you consider catching her off guard - she’s not armed? - but she’s not sizing you up with any amount of hostility.");
		
		output("\n\n<i>“Heyyy");
		if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]");
		output(",");
		if (pc.hasPerk("Musky Pheromones")) output(" smelled ‘ya a mile away, cutie!”</i>");
		else output(" looking a little heavy there, cutie!”</i>");
		output(" she chirps, staring pointedly at your swollen");
		if (pc.isTaur()) output(" underbelly.");
		else output(" tummy.");
		output(" It’s the same [enemy.furColor]-furred laquine you had a brief encounter with, and she looks more than pleased by what she sees.");
		if (samePreg) output(" <i>“Hehe, you look just like I did!”</i>");
		
		output("\n\n<i>“Can I?”</i> She smiles shyly, rubber-clad hand reaching for your belly. The closer she gets, the closer she brings her unmistakably pleasant aroma. Before, she smelled... like a fuckbunny. Just an unwashed and sweaty, musky laquine. You guess her being the ‘father’ of your kids has only made her scent signature that much more potent... and arousing.");
		
		output("\n\nThat said... why not let her?");
		if (pc.isTaur()) output(" You point the way, hefting your underbelly for inspection.");
		else output(" You heft yourself up for inspection, simply glad that she’s not trying to stick you with any drugs.");
		output(" You can’t identify any of the sultry vacancy you saw in her before - least the dope has her head on right this time! The Jumper’s slick paw is");
		if (!pc.isTaur() && !pc.isChestExposed()) output(" digging past your [pc.chestCover] and");
		output(" running over your [pc.belly] before you know it. Your bunny-sire coos delightedly, thighs noisily squirming as her other hand touches down on your laquine-taut [pc.skinFurScalesNoun].");
		
		output("\n\n<i>“Wow, they’re kicking already! You’ve gotta have a lot of kids in there, huh?”");
		if (multiJumper) output(" Looks way too big to just be one too. You smell like you’ve been around my whole gang!");
		output("</i> <i>Thump.</i> <i>“Oof, that was a strong one! They’re sure growing fast. Wonder if that’s ‘cause ‘a you or me?”</i> she squeals and giggles");
		if (pc.isTaur())
		{
			if (pc.hasCock()) output(", showing a surprising amount of restraint so close to your [pc.cocksLight].");
			else output(", showing a surprising amount of restraint so close to your [pc.pussy].");
		}
		else
		{
			if (pc.hasTits()) output(", showing a surprising amount of restraint this close to your [pc.breasts].");
		}
		
		output("\n\nHer joyful caresses accelerate, and your newfound sensitivity forces you to moan against her ministrations. <i>“Ooh, you make the sexiest sounds!”</i> She kneels down and presses her fuzzy face into your");
		if (pc.isTaur()) output(" hanging gut, whiskers tickling you into laughter. Unsteady, you grip her shoulders for support");
		else output(" navel, whiskers tickling you into laughter. Unsteady, you grip her slippery lop ears for support");
		output(", inadvertently smushing her into your baby bump and making it all the better.");
		
		output("\n\nThe laquine’s cajoling is enough to make you forget you’re not on the safest space station...");
		output("\n\n<i>“Mmm, you smell a lot better since before too. Betcha’ve been a lot hornier recently.”</i> She glances up, waiting for an answer");
		if (pc.libido() >= 75 || pc.isBimbo()) output(" You’re always horny, but yeah, she’s absolutely right! Carrying her kids has made you so much hotter than before. She seems unabashedly proud of everything you tell her, especially the frequency at which you’ve had to masturbate.");
		else if (pc.libido() < 33) output(" Yeah... she’s not wrong. You’ve definitely been feeling a little too hot under the collar -- you remark you’re probably not much different than her in that suit.");
		else output(" Nodding quickly, you’re not ashamed to admit how much you’ve wanted to masturbate lately. To that and more, she listens raptly.");
		
		output("\n\n<i>“Wanna take a break?”</i> she asks, standing. The bunny-woman");
		if (pc.isTaur()) output(" hops over and");
		if (pc.tallness >= 69) output(" wraps an arm around your body");
		else output(" wraps an arm around your shoulder");
		if (!pc.isTaur()) output(", still rubbing gingerly at your beautifully rounded gut");
		output(". <i>“Bet you’d like to get off your feet for a bit, and there are a few places we can do that...”</i> she purrs, leaning closer as if to kiss, but simply pecking you on the cheek. <i>“The dodge deck was made for moments like these; I don’t want anyone around here taking advantage of you like this!”</i>");
		
		if (flags["BJUMPER_DODGE_DECK"] == undefined) output("\n\n<i>Dodge deck?</i> Well, whatever that place is, sitting down sounds good.");
		else output("\n\nIt sure was.");
		output(" Some small part of your mind tries to remind you of the dopey pirate bunny you saw in those hellish mines, but you also recognize that, at least for now, she’s nowhere near that level of addled. Besides, why would she hurt the mother of her children?");
		
		output("\n\nWill you go with her?");
	}
	else
	{
		output("<i>“Heyyy");
		if (boredJumperKnowsSteelesName(jumperType)) output(", [pc.name]");
		output("!”</i> the [enemy.furColor]-furred Jumper calls out to you, prompting you to turn - which takes some effort with the weight in your gut.");
		if (multiJumper) output(" <i>“Gosh, you trying to get knocked up by the whole gang? I can tell I’m not the only one whose been down there, ‘ya cute, heavy slut!”</i>");
		
		output("\n\nBefore you make it all the way around, you’re hugged tight by a busty, athletic bunny, both of her rubber-encased hands pawing possessively at your tummy.");
		if (newPreg) output(" <i>“Looks like you’re a proud mom again!");
		else output(" <i>“Lookin a little bigger than before.");
		if (samePreg) output(" I see you’re sharin’ the burden now!");
		output(" Still smell just as good,”</i> she husks, exhaling along your neck and falling to her knees just to rub her face into your [pc.belly]. <i>“Glad you’re doing fine!”</i>");
		
		output("\n\nBefore you say anything else, she hops up and kisses you right on the lips, pulling you into her sweaty arms while tonguing over your teeth. Her sweltering embrace and her aggressive, affectionate assault cause you to melt into her. All you manage while reciprocating her oral initiation is a moan. <i>“Love how you taste,”</i> she smooches you on the nose, nuzzling into your neck. <i>“God! You look so cute! I think I’m starting to hate you not being around more often.”</i>");
		
		if (pc.isBimbo()) output("\n\nAww! You feel the same way too, and you let her know how much you’ve been thinking about her with a little touch to the [enemy.cockNoun 0] bulging between her thighs.");
		else if (pc.isBro()) output("\n\nAll you do is smirk, gripping her bulgy [enemy.cockNoun 0].");
		else if (pc.isNice()) output("\n\n<i>“You could see me more if you’d leave this place behind,”</i> you say, stroking her fluff-ball tail.");
		else if (pc.isMischievous()) output("\n\n<i>“I think I’m starting to hate not having this ass in my hand wherever I go.”</i> You slap the laquine’s tush, droplets of moisture flying off from impact.");
		else output("\n\nYou grip the rabbit-woman by her ear and nibble at her neck. <i>“Could just put a leash on you, then maybe your boss wouldn’t care you’re gone.”</i>");
		
		output("\n\n<i>“F-fuck, you know how to make me such a hot mess. You just being on this station makes me want to bust a nut. Come on... wanna take a break, babe?”</i> she thrusts into your groin, a lust-mad blush on her muzzle. There’s a brief moment of enlightenment where the bunny-minx remembers her manners. <i>“Please?”</i>");
		output("\n\nWill you take a load off with the horny hare?");
	}	
	
	processTime(5);
	clearMenu();
	addButton(0,"Go With",boredJumperPregEncounterGoWith,[jumperType,newPreg,samePreg],"Go With","Yeah, you could use a break. Maybe something more?");
	addButton(1, "Don’t Go", boredJumperPregEncounterDontGo, jumperType, "Don’t Go", "Too bad for her, you’ve got other places to be. Maybe next time!");
	return true;
}
//both jumper and steele preg
public function boredJumperPregEncounterBothPreg():Boolean
{
	if (pc.isTaur()) return false;
		
	if (flags["BJUMPER_PC_PREG_ENC_COOLDOWN"] != undefined)
	{
		if (GetGameTimestamp() < (flags["BJUMPER_PC_PREG_ENC_COOLDOWN"] + (3 * 24 * 60))) return false;
	}
	
	clearOutput();
	var jumperType:int = -1;
	
	if (flags["BJUMPER_PC_PREG_TYPE"] != undefined && flags["BJUMPER_PC_PREG_TYPE"] == flags["BJUMPER_PREG_TYPE"]) jumperType = flags["BJUMPER_PC_PREG_TYPE"];
	else if (flags["BJUMPER_PC_PREG_TYPE1"] != undefined && flags["BJUMPER_PC_PREG_TYPE1"] == flags["BJUMPER_PREG_TYPE"]) jumperType = flags["BJUMPER_PC_PREG_TYPE1"];
	else if (flags["BJUMPER_PC_PREG_TYPE2"] != undefined && flags["BJUMPER_PC_PREG_TYPE2"] == flags["BJUMPER_PREG_TYPE"]) jumperType = flags["BJUMPER_PC_PREG_TYPE2"];
	
	showPregBoredJumper(false, true,jumperType);
	var firstTime:Boolean = true;
	var newPreg:Boolean = false;
	var samePreg:Boolean = false;
	var encLocation:int = boredJumperPregLocation();
	
	flags["BJUMPER_PREG_ENC_COOLDOWN"] = GetGameTimestamp();
	flags["BJUMPER_PC_PREG_ENC_COOLDOWN"] = GetGameTimestamp();
	
	flags["BJUMPER_CAN_LEAVE"] = undefined;
	
	setEnemy(new JumperBored());
	enemy.furColor = boredJumperFurColor(jumperType);
	enemy.hairColor = boredJumperHairColor(jumperType);
	enemy.eyeColor = boredJumperEyeColor(jumperType);
	enemy.lipColor = boredJumperLipColor(jumperType);
	enemy.nippleColor = boredJumperNippleColor(jumperType);
		
	if (jumperType == GLOBAL.TYPE_EQUINE) 
	{
		if (flags["BJUMPER_HORSE_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_HORSE_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_HORSE_PREG_NEW"] > 0) newPreg = true;
		if (flags["BJUMPER_HORSE_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper horse sired") > 0) samePreg = true;
		if (StatTracking.getStat("pregnancy/jumper horse births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_HORSE_PREG_ENC_JUMPER");
		IncrementFlag("BJUMPER_HORSE_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_HORSE_PREG_NEW"] = 0;
		flags["BJUMPER_HORSE_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 14;
		enemy.shiftCock(0,GLOBAL.TYPE_EQUINE);
		enemy.cocks[0].cockColor = "chocolate";
	}
	else if (jumperType == GLOBAL.TYPE_CANINE)
	{
		if (flags["BJUMPER_DOG_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_DOG_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_DOG_PREG_NEW"] > 0) newPreg = true;
		if (flags["BJUMPER_DOG_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper dog sired") > 0) samePreg = true;
		if (StatTracking.getStat("pregnancy/jumper dog births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_DOG_PREG_ENC_JUMPER");
		IncrementFlag("BJUMPER_DOG_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_DOG_PREG_NEW"] = 0;
		flags["BJUMPER_DOG_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 12;
		enemy.shiftCock(0,GLOBAL.TYPE_CANINE);
		enemy.cocks[0].cockColor = "red";
	}
	else if (jumperType == GLOBAL.TYPE_FELINE)
	{
		if (flags["BJUMPER_CAT_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_CAT_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_CAT_PREG_NEW"] > 0) newPreg = true;
		if (flags["BJUMPER_CAT_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper cat sired") > 0) samePreg = true;
		if (StatTracking.getStat("pregnancy/jumper cat births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_CAT_PREG_ENC_JUMPER");
		IncrementFlag("BJUMPER_CAT_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_CAT_PREG_NEW"] = 0;
		flags["BJUMPER_CAT_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 13;
		enemy.shiftCock(0,GLOBAL.TYPE_FELINE);
		enemy.cocks[0].cockColor = "pink";
	}
	else if (jumperType == GLOBAL.TYPE_HUMAN)
	{
		if (flags["BJUMPER_TERRAN_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_TERRAN_PC_PREG_ENC_JUMPER"] > 0) firstTime = false;
		if (flags["BJUMPER_TERRAN_PREG_NEW"] > 0) newPreg = true;
		if (flags["BJUMPER_TERRAN_PC_PREG_NEW"] > 0) newPreg = true;
		if (StatTracking.getStat("pregnancy/jumper terran sired") > 0) samePreg = true;
		if (StatTracking.getStat("pregnancy/jumper terran births") > 0) samePreg = true;
		IncrementFlag("BJUMPER_TERRAN_PREG_ENC_JUMPER");
		IncrementFlag("BJUMPER_TERRAN_PC_PREG_ENC_JUMPER");
		flags["BJUMPER_TERRAN_PREG_NEW"] = 0;
		flags["BJUMPER_TERRAN_PC_PREG_NEW"] = 0;
		enemy.cocks[0].cLengthRaw = 12;
		enemy.shiftCock(0,GLOBAL.TYPE_HUMAN);
		enemy.cocks[0].cockColor = "pink";
	}
	
	if (firstTime)
	{
		output("On the next step you take, you clench and lean from a pang of pain. You clutch the wall, heaving and gasping, nearly falling to your [pc.legOrLegs]. Picking yourself up is a little too hard, so you sit there, weighed by the critter-packed tummy you’re carrying around. The motivation to stand disappears a little too fast when you caress the rabbit-taut [pc.skinFurScalesNoun], sighing happily, trying desperately to remind yourself you’re still on Zheng Shi.");
		output("\n\nGod, something smells amazing too. It’s not you. You smell great, you’ve noticed recently, but there’s something else contrasting against the dank air around here. Whatever that potent scent is, it compels you to stand and seek it out in a haze of happiness.");
		output("\n\nWhen you round the corner, you bump into someone you didn’t hear coming.");
		output("\n\n<i>“Owww,”</i> a girlish voice shakes you from your pheromone-induced stupor, and you realize you’re standing over a [enemy.furColor]-laquine pirate, who’s sitting on her ass staring up drearily. <i>“Mmmm, that’s what smelled so good...”</i> she purrs, looking up to you happily.");
		output("\n\n<i>“Heya,");
		if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]");
		else output(" cutie");
		output("! Looks like uh... went and had a little too much fun, huh?”</i>");
		
		output("\n\nYou lean down and pull her up by the slick, gloved paw, and she wraps her arms around your neck, pulling you into a hug that smushes your gravid bellies against each other. <i>“Fuck, you’re so hot! It’s... it’s so hot I mean!”</i> She kisses you on the lips right away, pawing all over your tummy, your [pc.ass], and your [pc.hips]. <i>“Mmfff...”</i> she exhales over your neckline, cooing softly when you return the touches. <i>“This was worth it! Sooo worth it! But... Ow...”</i>");
		output("\n\nThe [enemy.eyeColor]-eyed bun winces, breaking the kiss and falling to the ground against the wall, looking pained and worried in equal measure. <i>“I-I’ll get in so much trouble if they see me. I don’t wanna lose my kids... You have no idea what the boss’ll do if I’m caught like this...”</i>");
		output("\n\nLeaning down, all it takes to ease the worried bun is a stroke to her muzzle; her face sinks into your palm like melting butter. Some sweat pools, too. <i>“But I have a lot of ideas on what I wanna do with you, babe...”</i> she grins. <i>“God! You have no idea how hot it’s gotten since I got pregnant! I can’t believe you were virile enough to do it either. The sterilex is for the help around here, but the stuff we get is u-u-usually... good...”</i> The horny hare falls into you again, taking you to the ground. <i>“C’monnn, you wanna come up to the dodge deck? We can uh... get some air there, if you know what I mean.”</i> She smiles adorably, hovering over you with a needy look writ upon her face.");
		
		if (flags["BJUMPER_DODGE_DECK"] == undefined) output("\n\nYou have no idea what the ‘dodge deck’ is, but");
		else output("\n\nYou know what the dodge deck is, and");
		output(" considering how touchy feely your pirate lover’s getting, you’re seriously considering playing hooky with the Jumper. She paws at your belly, you paw at hers, there’s nothing to <i>not</i> like about the idea of spending some time with the mother <i>and</i> ‘father’ of your little laquines.");
	}
	else
	{
		output("There’s that scent again. You couldn’t mistake it mingling with your own. The air visibly humps itself dry on your pheromones and the musk of");
		if (newPreg) output(" a pregnant laquine.");
		else output(" your bunny-mate.");
		output(" Moisture builds in your eyes from the sexual heat brushing against your face. Spit seems to build and froth of its own accord in your mouth. You’re certain your leporine opposite is feeling exactly the same, because you’ve been drawn together again by the power of wanton carnality.");
		
		output("\n\n<i>“[pc.name]...!”</i> the [enemy.furColor] Jumper purrs, happily hugging you, mindful of her belly-weight. <i>“Fuuuck, you smell soooo goood! I can’t believe how easy it is without drugs, being pregnant is soo much better than a little lust draught, I’m hot all the time and I all I can do is think of how good you feel. Come onn, you wanna go to the dodge deck again? Sides...”</i> She grimaces, looking down to her gurgling gut. <i>“If anyone sees me, I’ll get in trouble. I hate being alone when I could be just fine with you!”</i>");
		output("\n\nBefore anything else, you kiss and grind in a haze of horniness, so close to getting hot, bothered, and much too sweaty. When you think of your kids being put in possible danger by your shamelessness, you manage to shake free of your immobilizing lusts for a few precious seconds, tugging on her ear and reminding her of the burden she bears. <i>“Fiiine, I know, I know...”</i>");
		output("\n\nWith that out of the way, you decide...");
	}
	
	processTime(5);
	clearMenu();
	addButton(0,"Go With",boredJumperPregEncounterGoWith,[jumperType,newPreg,samePreg],"Go With","Yeah, you could use a break. Maybe something more?");
	addButton(1, "Don’t Go", boredJumperPregEncounterDontGo, jumperType, "Don’t Go", "Too bad for her, you’ve got other places to be. Maybe next time!");
	return true;
}
//dont go
public function boredJumperPregEncounterDontGo(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true, jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	if (sceneNum >= 2)
	{
		output("You break free from your daydreaming, simply smiling at her and shrugging your shoulders. The lawless laquine looks crestfallen but understanding, kissing you on the cheek before hopping aside. <i>“Don’t you go getting hurt now, I’ll never forgive you!”</i> she recitates, flinging one lop-ear aside. <i>“And don’t be a stranger, ‘kay? I’d love to see you again. Oh, don’t worry! I won’t be taking any stims while");
		if (sceneNum == 3) output(" we’re carryin’ kids! Just uh, stay outta the mines, alright? The others won’t care if you’re pregnant or not!”</i>");
		else if (sceneNum == 2) output(" you’re carrying my kids! Just uh, stay outta the mines, alright? The others won’t care if you’re pregnant or not!”</i>");
		else output(" I’m pregnant!”</i>");
	
		output("\n\nShe waves and sashays off, latex creaking in her wake. You, however, were more distracted by her shimmery ass...");
	}
	else
	{
		output("After a heavy sigh, you playfully knock her beret, rub her cheek, and stand, telling her you can’t stay long. The libidinous lapine-woman looks genuinely defeated, but does her best to hide it. <i>“Okay, just... don’t get hurt. I don’t wanna see you naked, collared, and on someone’s lap. You’ve got kids to live for.”</i> She looks up, one sweaty ear sliding across her shoulder. <i>“Me too.”</i>");
		output("\n\nShe smiles, waves, and you [pc.move] on, hoping she’ll stay out of trouble.");
	}
	setEnemy(null);
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//go with
public function boredJumperPregEncounterGoWith(arg:Array):void
{
	clearOutput();
	var jumperType:int = arg[0];
	var newPreg:Boolean = arg[1];
	var samePreg:Boolean = arg[2];
	
	showPregBoredJumper(false, true, jumperType);
	
	var firstTime:Boolean = true;
	var firstJPreg:Boolean = true;
	var firstPCPreg:Boolean = true;

	var sceneNum:int = boredJumperPregScene(jumperType);
	
	if (jumperType == GLOBAL.TYPE_EQUINE) 
	{
		if (flags["BJUMPER_HORSE_PREG_GOWITH"] > 0) firstTime = false;
		IncrementFlag("BJUMPER_HORSE_PREG_GOWITH");
		if (StatTracking.getStat("pregnancy/jumper horse sired") > 0) firstJPreg = false;
		if (StatTracking.getStat("pregnancy/jumper horse births") > 0) firstPCPreg = false;
	}
	else if (jumperType == GLOBAL.TYPE_CANINE)
	{
		if (flags["BJUMPER_DOG_PREG_GOWITH"] > 0) firstTime = false;
		IncrementFlag("BJUMPER_DOG_PREG_GOWITH");
		if (StatTracking.getStat("pregnancy/jumper dog sired") > 0) firstJPreg = false;
		if (StatTracking.getStat("pregnancy/jumper dog births") > 0) firstPCPreg = false;
	}
	else if (jumperType == GLOBAL.TYPE_FELINE)
	{
		if (flags["BJUMPER_CAT_PREG_GOWITH"] > 0) firstTime = false;
		IncrementFlag("BJUMPER_CAT_PREG_GOWITH");
		if (StatTracking.getStat("pregnancy/jumper cat sired") > 0) firstJPreg = false;
		if (StatTracking.getStat("pregnancy/jumper cat births") > 0) firstPCPreg = false;
	}
	else if (jumperType == GLOBAL.TYPE_HUMAN)
	{
		if (flags["BJUMPER_TERRAN_PREG_GOWITH"] > 0) firstTime = false;
		IncrementFlag("BJUMPER_TERRAN_PREG_GOWITH");
		if (StatTracking.getStat("pregnancy/jumper terran sired") > 0) firstJPreg = false;
		if (StatTracking.getStat("pregnancy/jumper terran births") > 0) firstPCPreg = false;
	}
	
	if (firstTime)
	{
		if (sceneNum == 1)
		{
			output("<i>“Sure.”</i> You take her hand and help her stand, certain she’d be a joyful bunny if not for her encumbrance.");
			output("\n\n<i>“Awesome!”</i> she says, exhaling hard afterward. <i>“Just follow me, it’s kinda hard to find. My head’s a bit fuzzy too, but we should be fine. Watch out for those nosy cats, and those rats too... they run around this place, one side acting like cops the others just being annoying!”</i>");
			if (ratsPCIsGood()) output("\n\nWell, the techno-felines might pose an issue, but if you stumbled on any of those rodents you’re sure they’d be helping you out!");
			output("\n\nOn your way through Zheng Shi you take too many turns to count, led by the rubbery hand of your laquine lover. You eventually come to a door that you wouldn’t be able to find if you weren’t looking for it -- looks like it’s been painted over, too. A spiral staircase on the other side leads up and down, though going down would be rough considering the steps are shattered. Upon reaching your destination, you find yourself on another floor entirely in a place that seems wholly disused.");
		}
		else if (sceneNum == 2)
		{
			output("You nod, and she’s all squeals and smiles. <i>“Great! The rec deck’s too loud. Luckily,”</i> she bumps her boobs into you, <i>“...I know some quiet places. Good places to sneak away!”</i> The Jumper nuzzles into your neck, giggling cutely.");
			output("\n\nShe takes you by the hand, looking as alert as you once were, very aware of your precious cargo. <i>“Ah, wait,”</i> she stops you, peeking around a corner. <i>“Can’t let those nosy cats see ‘ya, they’ll ask too many questions! Hope we don’t find any of those dumb rats around either...”</i>");
			if (ratsPCIsGood()) output("\n\nEven if you did, you’re sure they wouldn’t get in the way of your little rendezvous. They owe you too much!");
			
			output("\n\nAfter a rather lengthy walk through the labyrinthian station, you’re guided to an out of the way door you’d never find if you didn’t know it was there -- it’s been painted over several times by the look of things. She helps you up the spiral staircase inside until you’re on another floor entirely, but the place itself seems disused.");
		}
		else if (sceneNum == 3)
		{
			output("<i>“Let’s go.”</i> You pull the bunny to her feet and tell and her to lead on.");
			output("\n\n<i>“Ohh yes! I was hoping you’d say that, cutie!”</i> She grabs you by the hand and hurries on, a real bounce to her lapine step. You’re guided through the labyrinthian corridors and passages, taking so many turns your head spins thinking about it. <i>“We need to watch out for those nosy cats... all they do is get in the way, and then there’re these little rats that just run around being annoying!”</i> she groans, looking around each and every corner.");
			if (ratsPCIsGood()) output("\n\nWell, if it comes to that, you’re sure the rat gang would let you two go on without any hassle, considering how much they like you!");
			
			output("\n\n<i>“Over here,”</i> she says, pointing to a wall that looks like it’s been painted over several times. She waddles over and works a hard to see handle, making it clear you’d not be able to find this if you didn’t know it was here. Once inside, you and she take careful steps up the spiral staircase until you’re on another floor.");
			output("\n\nYou hope you’re near to your destination, this is too much exhaustion for one day!");
		}
	}
	else
	{
		output("The [enemy.furColor]-furred laquine’s eyes glow before you even finish agreeing to her proposition. After kissing you, she takes you by the hand and leads you down an all too familiar path. You still don’t think you could mimic her steps to the dodge deck, not in any safe capacity anyway, but you’re simply glad she’s on top of it. The hidden door cracks open as before, and you’re heading up the metal stairs back to a little ‘home away from home’ on this pirate-controlled station.");
	}

	if (flags["BJUMPER_DODGE_DECK"] > 0)
	{
		output("\n\nThe state of disrepair on the dodge deck is a breath of fresh air compared to anywhere else you go on Zheng Shi. It’s a remarkably quiet place, like a hotel but completely unmaintained. Well, aside from your usual spot, which you and your squeaky mate dart for right away. Dank air is strangled by");
		if (sceneNum == 1) output(" her");
		else if (sceneNum == 2) output(" your");
		else output(" both of your");
		output(" pregnancy-magnified pheromones, the first luxury of sorts you appreciate as you shed your belongings and sit down among the pillows and blankets.");
		
		output("\n\nBefore anything else, the horny Jumper smothers you with her bottled-up affections, dousing you with her scent and spit, kissing all over you with hormonally-enhanced passion. For a brief and almost magical period, you reciprocate her emotions, all too happy to have a nice place to enjoy the company of your lawless yet no less sexy lover.");
	}
	else
	{
		output("\n\nDiscarded tools and broken items litter the place. It’s quite cool, not like the other decks, and certainly not like the mines. It doesn’t look like the pirates have set up camp here, and the decor seems... alien. It occurs to you that these must be the architectural remnants of the fractured planet nearby. Zheng Shi is, after all, simply built into one of its biggest fragments.");
		output("\n\nDespite that, it’s the kind of comfortable little getaway you’d expect overworked staff to build on a roof and keep secret from the bosses. The area you’re led to is the only clean and dusted section of the floor, and when you set your things aside and sit down among the assortment of pillows and sheets, your lapine lover is all over you again, humming contently,");
		if (sceneNum >= 2) 
		{
			if (pc.isTaur()) output(" rubbing your human half happily.");
			else output(" caressing your belly almost possessively.");
		}
	}	
	
	IncrementFlag("BJUMPER_DODGE_DECK");
	
	output("\n\n");
	if (sceneNum >= 2)
	{
		if (firstPCPreg) output("<i>“I’m glad it took. Always wanted kids before I ended up here!”</i>");
		else if (newPreg) output("<i>“Hard to believe we keep doing this, but I’m not complaining. Nice to spend time with a cutie like you!”</i>");
		else output("<i>“" + RandomInCollection(["I gotta say, I’ve been so much happier seeing you around. I really hope you’ve been takin’ care of yourself.","You’re doing ok, right? Of course you are, you’re right here in my arms!","How’s the babies? You’re lookin’ nice and fat, all vulnerable and lovable, hehe.","The most precious thing on Zheng Shi, right here next to me, carrying my kids! You’re the best, cutie!"]) + "”</i>");
		if (sceneNum == 3) output(" ");
	}
	if (sceneNum == 1 || sceneNum == 3)
	{
		if (firstJPreg) output("<i>“I’m still tryin’ to get used to this, but I’m kind of glad you knocked me up. Gave me a lotta time to relax.”</i>");
		else if (newPreg) output("<i>“Mmm, you keep impregnating me, you might make me your live-in breeding bitch one of these days!”</i>");
		else output("<i>“" + RandomInCollection(["I don’t know if I like being pregnant yet. But I know I like when you come around and want to be with me. That’s better than anything I’ve had in the last few months.","These little tykes are so heavy... but I don’t feel useless. You coming around is the best thing in months!","You have no idea how excited I get when I smell you from far away. It’s crazy, like I’ve fallen in love!"]) + "”</i>");
	}
	output(" She smiles and kisses you on the cheek again, fully intent on showering you with physical and emotional love");
	if (sceneNum == 1 || sceneNum == 3) output(" while you show her some back with several belly rubs");
	output(".");
	
	if (firstTime) output(" <i>“But I kinda feel bad...”</i>");
	else output(" <i>“Still... Doing it on this station...”</i>");
	output(" You look up to the sultry hare, noting a nervous and miserable expression twisting her face. Realizing how sullen she suddenly got, the rabbit shakes her head so fast that one of her ears winds around your neck.");
	
	if (firstTime)
	{
		if (sceneNum == 1) output("\n\n<i>“I’ll be able to see ‘em when they’re born but... I can’t keep them here, and I have nowhere to send them... nobody to help me either...”</i>");
		else output("\n\n<i>“I mean... I can’t really leave and come see ‘em after they’re born!”</i>");
		
		output(" The laquine’s head slumps and her once bubbly voice becomes monotone. <i>“Boss would never allow that. Geez, you don’t know what that zappy bitch is like... Or the others I’ve seen. Some of the fuckers on this station’d sell off any kids they had for a quick credit, they wouldn’t care one bit if it was theirs either. Someone else’s? That’s just free cash. That’s why I’m...”</i>");
			
		output("\n\nYou’re quick to allay her fear, finding yourself sharing that alarming thought.");
		
		if (pc.isBimbo()) output(" <i>“That’s horrible!”</i> you pout, tugging her closer and patting the back of her head. You whisper sweet-nothings while twirling downy locks of [enemy.hairColor] hair around your [pc.fingers]. <i>“But don’t you worry honey bun! I’ve got a place where nobody can hurt our kids.”</i>");
		else if (pc.isBro()) output(" <i>“Despicable,”</i> you murmur, tugging her closer and scratching behind her large ears. <i>“You shouldn’t worry about that. I have a nursery back in core space. Our kids will be just fine.”</i>");
		else if (pc.isNice()) output(" It takes you awhile to find words for that; it’s a bit too chilling a reminder of where you are. You settle for pulling her close to your shoulder, scritching behind her inflexible ears. <i>“I have a nursery, a place where our kids will be fine. They’ll be cared for until they’re of age, so don’t worry.”</i>");
		else if (pc.isMischievous())
		{
			output(" Instinct takes over and you pull your bunny");
			if (sceneNum >= 2) output("-sire");
			output(" closer");
			if (pc.smallestTitSize() > 0) output(", pushing her head into your [pc.breasts]");
			output(". <i>“Don’t go worrying about that alright? I’ve got a place to keep my kids safe. They’ll be cared for, educated, and sheltered until they’re of age. You’ll be able to come and see them any time, and nobody is going to get their hands on ‘em,”</i> you whisper, petting her behind one ear.");
			
		}
		else output(" You cup her cheek and pull her down into your lap, something she doesn’t resist at all. <i>“Nobody is going to take my kids away. I have a nursery in Core space where they’ll be raised in safety, far from this place,”</i> you explain, both hands on her worried head.");
		
		output("\n\nYou go on to describe the facilities you have available, the staff on hand, and more, easing the outlaw’s worries with each subject.");
		if (StatTracking.getStat("pregnancy/total day care") > 0)
		{
			output(" It’s handling your other children just fine. You produce a few pictures you keep on your codex");
			if (pc.hasKeyItem("Water Princess Note")) output(", and dig out the cute drawing your water princesses doodled for you");
			output(". Your reassurances, physical and digital, have the desired effect.");
		}
		else output(" Your reassurances have the desired effect.");
		
		output(" Tension rapidly drains from the Jumper’s shoulders, and she sinks into your embrace");
		if (sceneNum == 1) output(", whispering something while rubbing at her bunny-bulged womb.");
		else if (sceneNum == 2) output(", eyes on your bunny-bulged womb.");
		else output(", bumping her bunny-bulged womb into yours.");
		
		output("\n\n<i>“Hey, I may not be able to stop in, but that’s not like I can never do it someday! Here,”</i> she hands you a hastily scrawled note, containing an email address. <i>“Send me");
		if (sceneNum == 1) output(" a message sometime so I can reply with some baby");
		else output(" some");
		output(" pics when they’re born, ‘kay?”</i> You pocket it, telling her that’ll be the first thing you do, and then she looks far more horny than before. <i>“Maybe some pics of");
		if (sceneNum >= 2) output(" that momma belly you’ve got too");
		else output(" you yourself");
		output("... Naked, preferably!”</i>");
		
		output("\n\nYou playfully pinch her arm in response.");
	}
	else
	{
		if (sceneNum >= 2 && !firstPCPreg) output("\n\n<i>“Here you are having my kids again and I haven’t even gotten to come meet the first ones!”</i> She laughs, though it’s more sympathetic than jovial. You’re reminded by what she said before, and of the paranoia hovering over her like a thunderstorm waiting to kick off.");
		else if (sceneNum == 1 && !firstJPreg) output("\n\n<i>“Here I am having your kids again and I haven’t even gotten to come meet the first ones!”</i> She laughs, though it’s more sympathetic than jovial. You’re reminded by what she said before, and of the paranoia hovering over her like a thunderstorm waiting to kick off.");
		else output("\n\nYou’re reminded by what she said before, and of the paranoia hovering over her like a thunderstorm waiting to kick off.");
		
		if (pc.isBimbo()) output("\n\n<i>“You could just leave with me, who’d know, hun?”</i> you say, feeling her up in the process. <i>“Got more than a few places you could stay!”</i> She moans at your touch");
		else if (pc.isBro()) output("\n\n<i>“Seems like an easily solved problem to me. Just get on my ship and let’s get out of here, there are a few places I can think of you staying,”</i> you say with a wink. She moans at your touch");
		else if (pc.isNice()) output("\n\n<i>“Would it really be so hard for you to leave?”</i> you ask, frowning. It does strike you as odd that she’s so paranoid. Would she really be missed? She sighs");
		else if (pc.isMischievous()) output("\n\n<i>“Come on, who would come looking for a tough girl like you? Should they really get in the way of you and your kids?”</i> you smirk, slapping her on the butt. She yelps at your touch");
		else output("\n\n<i>“Don’t give me that, you could come with me at any time,”</i> you pinch her arm, staring at her inquisitively. She yelps at your touch");
			
		output(", perking up and hugging you just a bit tighter. <i>“Not her. Our boss is... I don’t wanna talk about what she does when you join the gang, but when you’re in, you’re in for good. This place may look like a floating landfill, but she’s got money and she’s got connections; she’s got us all by the nuts, enough that I’d just be stressed out for you and them if I up and left.”</i>");
		
		output("\n\nShe glances across the room, smiling optimistically. <i>“Maybe someday. But for now,");
		if (((sceneNum == 1 || sceneNum == 3) && !firstJPreg) || (sceneNum >= 2 && !firstPCPreg)) output(" you just keep those pics comin’, babe.”</i>");
		else output(" just keep me company. That’s all I can ask for,”</i> she says, winking.");
	}
	
	output("\n\nThe [enemy.furColor] bunny pulls you closer, her hand resuming its journey across the curvature of your");
	if (sceneNum >= 2) output(" belly");
	else output(" hips");
	output(", simply happy to be there with you, sighing warmly alongside. You could rest here for a while, talk to the laquine pirate, or just get going. The daintily rubbing paw on your head");
	if (pc.hasEmoteEars()) output(", between your [pc.ears]");
	output(" makes the argument to stay a lot more powerful...");
	
	processTime(10 + rand(10));
	clearMenu();
	addButton(0,"Why Pirate?",boredJumperPregEncounterGoWithWhyPirate,jumperType,"Why Pirate?","Ask her why she joined the gang.");
	addButton(1,"Drugs",boredJumperPregEncounterGoWithDrugs,jumperType,"Drugs","Ask about the stims they use.");
	addButton(2,"Rest",boredJumperPregEncounterGoWithRest,jumperType,"Rest","What other purpose does this place serve than letting tired guys and girls get some shuteye?");
	if (!pc.isTaur() && pc.hasGenitals()) addButton(3, "Sex", boredJumperPregEncounterGoWithSex, jumperType, "Sex", "No beating around the bush.");
	else addDisabledButton(3,"Sex","Sex","You need to be bipedal to engage in pregnant coitus with your Jumper.");
	if (flags["BJUMPER_CAN_LEAVE"] == 1) addButton(4, "Leave", boredJumperPregEncounterDontGoLeave, jumperType, "Leave", "Disengage the cuddles.");
	else addDisabledButton(4,"Leave","Leave","You came this far, why not do something first?");
}
//talk why pirate
public function boredJumperPregEncounterGoWithWhyPirate(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	flags["BJUMPER_CAN_LEAVE"] = 1;
	
	output("In a soft voice, you ask your bunny-babe why she’s thrown in with a gang of pirates. Her mouth opens, yet nothing comes out. She looks confused by the question just before answering, <i>“Not everyone joins because they want to. Others get pressed into it. They’re usually from other, weaker crews out in the galaxy whose ships got smashed. My reason is uh...”</i>");
	output("\n\nShe pauses, and doesn’t continue until you urge her into it, making it clear you’re not here to judge her.");
	
	if (jumperType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\n<i>“I wanted to,”</i> she says with some trepidation, both eyes darting around the room. She doesn’t seem all that used to being able to talk to anyone like this. <i>“I’m nobody special, I was just another agri-worker on a lousy colony. I didn’t have much of a family to begin with...”</i> She grins. <i>“Well, until you anyway.”</i> She grips just a bit tighter on your arm, looking even more attractive. <i>“I didn’t like being alone so I hung out with a lot of bad crowds in the city after work. Mmm... they weren’t the best people, but I couldn’t imagine being anywhere else!”</i> She repeats a few mundane actions with her arms while she acts out her story’s unspoken elements. <i>“I started having a lot of fun doing jobs with them, and we escalated. It really wasn’t about the money for me, just the thrill! Eventually we went after an orbital warehouse...”</i>");
		output("\n\nShe glances down, voice quieting. <i>“Well, I’ll spare you the nasty stuff, but the Jumpers showed up at the same time we did. This and that happened, and I was given the offer to join, ‘cause I’m a laquine. The others either refused or... well, like I said, nothing nasty. I got put through the boss’ </i>‘initiation’<i> and here I am!”</i> the gray rabbit says with bewildering pride.");
		output("\n\nHer hand trails gingerly down your shoulder as she leans back, vacantly pondering. <i>“It’s not the most stellar life, I just felt like a nobody and wanted more action.”</i> Her eyes flick back to yours, closing slightly. <i>“Joining was hard, and the boss is even harder. What she did is not something I want a repeat of that’s for sure.”</i> She shudders against you, exhaling rather hotly.");
		output("\n\n<i>“But... just flying around, raiding ships for loot that won’t be missed, feeling like I’m accomplishing something, that was good enough for me. I try not to hurt people... er, I know that doesn’t really justify the stuff we get up to.”</i> She turns away just to sigh. <i>“Anyway, even when I got paid back at that old job I just didn’t want to do anything with the cash. That just wasn’t the life for me, waking up, wasting my time getting nothing done on a colony being run by a megacorp, and then doing it all again the next day.”</i>");
		output("\n\nShe sits up again, kissing you on the neck. <i>“Here, I get to have all the sex I want and I’m friends with most of the crew! It’s not boring... not usually. We’ve just been sitting around a little too long. I still talk to my dad but he has no idea what I’m doing, nor who I’m doing. Yet,”</i> she winks. <i>“So don’t you go getting beat up, sweetie! I’d like him to see what we’re making possible.”</i>");
		output("\n\nThe Jumper simpers. <i>“Heh, minus the whole pirating thing...”</i>");
		output("\n\nYou thank her for the story, and she in turn, thanks you for not being harsh.");
	}
	else if (jumperType == GLOBAL.TYPE_CANINE)
	{
		output("\n\n<i>“Eh. No reason to lie, I wanted in, and I’ve been running jobs with ‘em for a few months. Lotta perks to being a pirate. Don’t have to pay taxes, don’t have to worry where my next meal’s coming from, and I get all the pussy and ass I want,”</i> she says matter-of-factly, her slightly brusque tone catching you off guard. <i>“Nothing else to say really, that’s just how it is. Picking up that dick changing machine a while back was a big boost to morale... the boss is a bitch but what boss isn’t, right?”</i>");
		output("\n\nShe giggles when you frown at her.");
		output("\n\n<i>“You someone’s boss?”</i> she asks, and you almost say yes. <i>“Well, you’ve probably got your own ship if you’ve been wandering around here. If you wanted a personal story there’s nothing to tell. To the galaxy I’m just a useless bitch. I don’t care if you think of me like that, but...”</i> she glances down, <i>“...I hope it won’t affect our kids. I really didn’t plan on having kids. Sterilex is used on the workers, last thing we want is slaves having children, so you can’t really get good contraceptives out here. And it...”</i>");
		output("\n\nEyebrow arched, you prod her into continuing. <i>“If anyone has a kid here, bad things’ll happen,”</i> she grimaces. <i>“Don’t wanna go into that kind of detail after what I saw, it’s just not right. And I don’t want my boss knowing about this either. Fuck... she’d probably try to raise ‘em as her crew... I don’t want my kids in a life like this, not ever.”</i>");
		output("\n\n<i>“So the big tough pirate has a soul underneath all that white fur,”</i> you quip.");
		output("\n\n<i>“You’re a good fuck,”</i> she smiles, bunny-teeth on display. <i>“If this is the kinda mark I get to make on the galaxy that’s fine by me. Can’t wait to make it again.”</i> She pats");
		if (sceneNum == 1) output(" her belly");
		else output(" you on the belly");
		output(". <i>“I’m really glad they’ll be taken care of. I’ll send some cash that way when I can. Make sure you send a video my way one of these days!”</i>");
		output("\n\nYou suggest that she send herself your way too; your kids will undoubtedly be overjoyed to meet their");
		if (sceneNum == 1) output(" mother");
		else if (sceneNum == 2) output(" father");
		else output(" other parent");
		output(". When you say that, the rough talking laquine looks rather sad. <i>“Maybe someday... Just been doing this so long that... nevermind. Better you don’t think about me too much. You’ll be in their lives better than I can right now... better for them to have someone in their life who isn’t me.”</i>");
		output("\n\n<i>For now,</i> you suggest. The white-furred Jumper smiles lightly.");
		output("\n\nYou thank her for the story. Her topaz eyes shimmer in advance of her kissing you on the nose");
		if (sceneNum >= 2) output(" and then your belly");
		output(".");
	}
	else if (jumperType == GLOBAL.TYPE_FELINE)
	{		
		output("\n\n<i>“I was one of the first! Been here since the start, before we had our own posters, our own little fleet, and these sexy uniforms!”</i> she says, almost sings, twisting in her outfit for good measure. <i>“I was brought in by my friend’s friend and we just went at it. Why am I here? Well, why not? Kinda grew up doing this, things like this I mean. Don’t really wanna do anything else.”</i>");
		output("\n\nA bit cavalier, but you can understand why.");
		output("\n\n<i>“Easy life and plenty to do! But, I gotta say,”</i> she looks wistfully across the room, then back to you. <i>“I liked it when we were smaller, tearing through high-sec systems and making off with valuable goods. We still kinda do that, but gosh, we’ve been on this station for so long building that thing we don’t get to have fun like the good ‘ol days. So many new members it’s easy to get lost in the crowd.”</i>");
		output("\n\nIs she worried about anything?");
		output("\n\n<i>“Nah!”</i> she chimes. <i>“What’s there to be worried about?”</i>");
		output("\n\nYou flick your eyes meaningfully to");
		if (sceneNum == 1) output(" her belly");
		else if (sceneNum == 2) output(" your belly");
		else output(" your bellies");
		output(", and she looks like she just got schooled by a teacher. <i>“R - right... I was trying to ignore that a bit. Still kinda shocked. I thought I was on some good contraceptives, but you’re a");
		if (sceneNum == 1) output(" virile");
		else output(" fertile");
		
		output(" [pc.guyGirl] aren’tcha?”</i> she licks up your cheek, pushing her warm muzzle into your [pc.skinFurScalesNoun]. <i>“I was worried, really worried, until you told me about that place ‘ya got. I don’t want our kids falling into someone’s hands. There’s more than us five gangs here...”</i>");
		output("\n\nThe creamy-yellow bun looks to the side and sighs, head lilting with her voice. <i>“I’m not the best person, I don’t really think I deserve to be part of their life or anything, but... it kinda gives me hope, ‘ya know? Sorry, kinda just blazin’ past your question here, but yeah. I can’t wait to see them, even if it’s a picture, and that’s what I have to say. Dunno if I’ll ever get out of the game but at least I’ve got a reason to try, right?”</i>");
		output("\n\nYeah, that’s true.");
		output("\n\nYou thank her for the story, though she merely responds by rubbing");
		if (sceneNum == 1) output(" her belly again.");
		else output(" your belly again.");
	}
	else
	{
		output("\n\n<i>“I was part of another small-time gang, just me and four others,”</i> she starts, green eyes glancing around the room. <i>“I was born in a really big family and I was one of the youngest. My mom and dad were a bit too crazy for me, convinced that the fertility plague was a conspiracy to wipe out our race, so they started having too many kids to possibly support. They started begging me for money after my really young siblings got taken into a service because they couldn’t be cared for. I definitely wasn’t going to give ‘em anything to waste.”</i>");
		output("\n\nThe brown hare’s eyes squint and she sighs almost miserably. <i>“So. I was runnin’ around the local system with them - my gang I mean - and we were hitting small targets, trying to keep a low profile. The captain had a fancy ship: fast, quiet, and a stealth system of sorts. The U.G.C. couldn’t catch us while we made off with loads of luxury goods. It was a lot of fun!”</i> She mimics a few movements with her arms, acting like she’s carrying a weapon, then kicks with her lapine legs to represent jumping. <i>“That rush of boarding, subduing the guards, and making off with a haul to sell, I fuckin’ loved it!”</i>");
		output("\n\nYou find yourself enraptured by her story as it goes on, especially the descriptions of what she took. Tamani cargo, Aegis products, even going so far as to rob a shipyard of some new tech.");
		output("\n\n<i>“That was a <b>very</b> bad move,”</i> she says bluntly, each word thicker than her voice was meant for. <i>“We weren’t the only ones after it. We shouldn’t have gone after it, but our dicks were erect and we were riding high on success. The Jumpers showed up that day and my new captain killed my old captain. I didn’t want to die,”</i> she shakes her head, <i>“not like that, not when I had family I wanted to take care of.”</i>");
		output("\n\nShe turns to you rather misty eyed. <i>“The things that shock bitch did to the four of us when we decided to join, fuck, I don’t ever want to think about it again.”</i> Her head whips left and right. <i>“But it was either that or... uh, moving on. I try to keep my head down. We’ve been on the station for a long time, nothing much to do but fuck, get hopped up on drugs, and fuck even more.”</i>");
		output("\n\nThe water in her eyes evaporates and she smiles brightly. <i>“I’m just glad that I don’t have to worry too much about our kids.”</i> She puts a hand on");
		if (sceneNum == 1) output(" her belly. <i>“I wasn’t planning on that, ‘ya know! But my body had other ideas.");
		else if (sceneNum == 2) output(" your belly. <i>“I wasn’t planning on that, ‘ya know! But your body had other ideas.");
		else output(" her belly. <i>“I wasn’t planning on that, ‘ya know! But our bodies had other ideas.");
		output(" I’ll make sure to send a little to your nursery when I can, it’s the least I can do. Maybe someday I’ll be able to get out of here, come see ‘em?”</i>");
		output("\n\nYou hope so, too.");
		output("\n\nYou thank her for the story, and your caramel-furred lover simply kisses you on the cheek.");
	}	
	
	processTime(5);
	addDisabledButton(0, "Why Pirate?", "Why Pirate?", "You already talked about this.");
	addButton(4, "Leave", boredJumperPregEncounterDontGoLeave, jumperType, "Leave", "Disengage the cuddles.");
}
//talk drugs
public function boredJumperPregEncounterGoWithDrugs(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	flags["BJUMPER_CAN_LEAVE"] = 1;
	
	output("The Jumper doesn’t stop you from shifting your weight and reaching for her belt, pulling out a medical injector containing some cyan-blue liquid. You’ve seen them using it once or twice, and ask her why they do, and more importantly, what it does.");
	output("\n\n<i>“Yeah, we all kinda... take that. It’s a black market regenerative for when we get hurt, but we all kinda just take it to get horny. Not supposed to be used like that, really messes with our heads if it has nothing to heal. It’s addictive too, but it’s all we’re rationed. There’s one thing you learn around here,”</i> she slowly grasps for it, <i>“and that’s to take what’s on offer. Even if it’s something like that.”</i>");
	output("\n\nYou twirl it between your fingers, meeting her eyes expectantly, telling her <i>“You better not use this while");
	if (sceneNum == 1) output(" you’re");
	else if (sceneNum == 2) output(" I’m");
	else output(" we’re");
	output(" pregnant”</i> with a furrowed brow.");
	
	output("\n\n<i>“I promise, but... sometimes we don’t use them on ourselves, if you catch my drift. Some of the crew get a little too rowdy. I’ll try to keep a low profile while");
	if (sceneNum == 1) output(" I’m");
	else if (sceneNum == 2) output(" you’re");
	else output(" we’re");
	output(" uh, <b>heavy</b>, but I can’t... what’s the word... guarantee that promise later. It’s just how things are.”</i>");
	
	output("\n\nMelancholy fills your lapine lover’s face for too long. She shakes her head and pockets the thing, very much wishing to move on from the topic.");
	
	processTime(5);
	addDisabledButton(1, "Drugs", "Drugs", "You already talked about this.");
	addButton(4, "Leave", boredJumperPregEncounterDontGoLeave, jumperType, "Leave", "Disengage the cuddles.");
}
//rest
public function boredJumperPregEncounterGoWithRest(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	flags["BJUMPER_CAN_LEAVE"] = 1;
	
	output("Time off sounds great, and what better way to relax than in the admittedly squeaky embrace of a dopey pirate bunny? Looking around, you add a few more pillows to your arrangement and lean up against a blanketed wall. Settling in, you suddenly realize how cozy it is - it’s almost like being back on your ship in your own bed. The effort put into making this hidden space comfortable is genuinely admirable, but it’s the lop-eared rabbit to your side, snuggling up against you, that <i><b>makes</b></i> this encounter.");
	if (sceneNum == 1) output("\n\nYou pull her close, slipping your [pc.arm] around her back and firming your palm to her baby-rounded stomach, leaning into her. Fit together, you’re able to cuddle much like a romantic couple on a proverbial park bench,");
	else if (sceneNum == 2) output("\n\nThe bunny-woman weaves an arm around your lower back, her paw emerging on the other side to caress your spherical gut. Positioned appropriately now, you can lean on each other like a romantic couple on a proverbial park bench,");
	else output("\n\nConsidering the two of you are weighted by your heavy bellies, it takes a little scooting and a lot more wiggling to get snug and relaxed. You and she slide arms over and under each other, around each other’s lower backs, and get [pc.hand] and paw on each other’s bellies. Like this, you’re a regular romantic couple enjoying the serenity of a proverbial park bench,");
	
	if (pc.tallness >= 69) output(" and with your size, you’re cradling her under your chin in an intensely warm and protective position that nestles her into your very soul.");
	else output(" and because of your height, she’s cradling your scalp with her softly humming chin in an intensely warm and protective position that nestles you into her very soul.");
	
	output("\n\n<i>“Hold on, it’s a bit tight like this.”</i> She yanks the zipper at her neck, pulling it down as quietly as she can (which isn’t much), far enough that her breasts threaten to pop out from the loosened material. Latex creases and wrinkles under her bosomy weight, and those [enemy.nippleColor] nipples, erect as can be, are poking lewdly into your [pc.skinFurScales].");
	output("\n\nShe presses her twitchy nose to your neck and sniffs again. <i>“You smell so... so good...”</i> she whispers. <i>“Not used to getting cozy like this. I’m probably gonna get really horny.”</i> Indeed, you don’t even need to look to hear the inches adding to her endowed cock. <i>“Urk, sorry,”</i> she pants. <i>“I’ll try to keep it in for a bit. You understand, right? Like... damn... I just can’t believe how hot this all is. So hard to hold back!”</i>");
	
	if (pc.libido() >=75 || pc.isBimbo())
	{
		output("\n\nIt fucking is.");
		if (pc.isHerm()) output(" Your [pc.clits], not to mention your [pc.cocksLight], are throbbing so powerfully that you can feel their presence in every muscle.");
		else if (pc.hasVagina())
		{
			output(" Your [pc.clits] and [pc.eachPussy]");
			if (pc.vaginaTotal() > 1) output(" are throbbing so powerfully that you can feel their presence in every muscle.");
			else output(" is throbbing so powerfully that you can feel its presence in every muscle.");
		}
		else if (pc.hasCock())
		{
			output(" Your [pc.cocks]");
			if (pc.cockTotal() > 1) output(" are");
			else output(" is");
			output(" growing");
			if (!pc.isCrotchExposed()) output(" and straining against your [pc.crotchCoverUnder]");
			if (pc.cockTotal() > 1) output(", throbbing so powerfully that you can feel their presence in every muscle.");
			else output(", throbbing so powerfully that you can feel its presence in every muscle.");
		}		
		
		output(" The pheromones do nothing, you want to crawl over her and make her prove how much she wants to fuck you right now, maybe show her how much you feel, too.");
		pc.changeLust(30);
	}
	else if (pc.libido() < 33)
	{
		output("\n\nShe’s not wrong. This close to one another, the long-stewed odors you’re sharing are more powerful than ever. It’s like the pheromones are fighting for control of your brain, intent on turning your ‘want to fuck’ switches on and locking them in place");
		if (pc.isHerm()) output(", starting with your [pc.clits] and moving to your [pc.cocksLight].");
		else if (pc.hasVagina()) output(", starting with your [pc.clits].");
		else if (pc.hasCock()) output(", starting with your [pc.cocks].");
		else output(".");
		pc.changeLust(10);
	}
	else
	{		
		output("\n\nYou too. This close, your combining pheromones are unmistakably powerful, more than they ever could be. Putting up a defense is pointless, because you can feel");
		if (pc.isHerm()) output(" your [pc.clits] throbbing and vibrating beneath your erecting [pc.cocksLight].");
		else if (pc.hasVagina()) output(" your [pc.clits] throbbing and vibrating, helping squeeze out another batch of femslime.");
		else if (pc.hasCock()) output(" your [pc.cocks] erecting and beginning the process of bubbling out some precum.");
		else output(" a growing warmth.");
		pc.changeLust(20);
	}
		
	output("\n\nDepthless gasping makes your closeness not as solitary as could otherwise be expected. Laquines, especially this one, are just too damn horny to slow down, even during pregnancy. For a few minutes you try to focus on her heartbeat mixed with your own, but in those moments of fevered concentration you are inevitably distracted by the pulsing in your crotch, and the shunting of blood to");
	if (pc.isHerm()) output(" [pc.eachPussy] and [pc.eachCock].");
	else if (pc.hasVagina()) output(" [pc.eachPussy].");
	else if (pc.hasCock()) output(" [pc.eachCock].");
	else output(" your groin.");
	
	output("\n\n<i>“Hey...”</i> she calls, prompting you to look her in the [enemy.eyeColor] eyes. <i>“If you don’t say- do, anything.... I’m gonna cum in my suit... Then I don’t know what’ll happen!”</i> she huffs. The bunny girl reclines with you, remorseful yet hopeful.");
	output("\n\nIf you kissed her right now you know that she’d not wanna stop stop until you fucked each other into unconsciousness. On the other hand, if you showed any amount of restraint, she’d probably be able to as well. Whatever, the tension is pretty real right now. Every ounce of her is begging for an answer.");
	
	if (boredJumperisSneakBBOK(sceneNum))
	{
		output("\n\nSomething deep down inside <i>you</i> is also begging for an answer. The longer you stare at her belly, the more your own feels... empty. You’re carrying breeder’s bliss. It won’t cause the Jumper to go into heat, that purpose has already been fulfilled. But she’s a hermaphrodite... and if there’s one thing a race of fuckbunnies can do, it’s fuck. If you wanted to turn that hypersensitive and burdened bunny into a rutting animal and mother a litter next to her... you could slip her that little, colorless pill.");
		output("\n\nProbably not the best idea you’ve ever had, though.");
	}
	flags["BJUMPER_REST_MENU"] = 1;
	processTime(10 + rand(10));
	clearMenu();
	if (pc.isTaur())
	{
		if (sceneNum == 1) addButton(0, "Rest With Her", boredJumperPregEncounterGoWithRestRWH, jumperType, "Rest With Her", "Really. Is she that much of a horn-bun that she can’t appreciate the finer things in life, like sitting next to the [pc.raceShort] that knocked her up and enjoying said time?");
		else addButton(0, "Rest With Her", boredJumperPregEncounterGoWithRestRWH, jumperType, "Rest With Her", "Really. Is she that much of a horn-bun that she can’t appreciate the finer things in life, like sitting next to the [pc.raceShort] she impregnated and enjoying said time?");
	}
	else
	{
		addButton(0,"Kiss Her",boredJumperPregEncounterGoWithRestKissHer,jumperType,"Kiss Her","You know where this is gonna go.");
		addButton(1, "Rest With Her", boredJumperPregEncounterGoWithRestRWH, jumperType, "Rest With Her", "Hold back for now. You can show her a good time <i>later.</i> Right now, you’re just glad to be at rest.");
		if (boredJumperisSneakBBOK(sceneNum)) addButton(2, "Sneak B.B", boredJumperPregEncounterGoWithRestSneakBB, jumperType, "Sneak B.B", "Sneak a Breeder’s Bliss pill into the pregnant bun’s mouth, and instil a rut that’ll no doubt leave you as gravid as her.");
		else if (!pc.hasVagina()) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "You need a pussy to share the burden, so to speak.");
		else if (pc.isFullyWombPregnant()) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "All your wombs are full! If you give her this now, you’ll certainly be responsible for causing harm to your children!");
		else if (sceneNum >= 2) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "You’re already pregnant! If you give her this now, you’ll certainly be responsible for causing harm to your children!");
		else if (!pc.hasItemByClass(BreedersBliss, 1)) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "You’ll need a procreation pill to enable the Jumper’s paternal side.");
	}
}
//sex
public function boredJumperPregEncounterGoWithSex(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	flags["BJUMPER_CAN_LEAVE"] = 1;
	
	output("You catch the bunny-girl off guard, curling your fingers around the pointed protrusions on her perky chest. She was ready for everything but the timing. The slick and sweaty rabbit thrusts her heaving breasts forward, suit glistening. <i>“Fuck yes. That’s what I want!”</i> Droplets of moisture bead off the tips of her insulating outfit. You’re starting to feel just as moist, slickened with perspiration and arousal. What other reason did you have to follow a bunny to a glorified motel if not to fuck her?");
	output("\n\nTwo fingers go to the zipper at her neck, and the Jumper’s [enemy.cockNoun 0] grows to full mast behind her crotch. <i>“Ooh fuck, I’m more of a mess than usual.”</i> She yanks the hasp down, unveiling her creamy [enemy.furColor] fur to the point that your [pc.hands] can get inside. You force apart the upper-middle of her unsealing uniform, availing yourself of the pert swells of her tits.");
	output("\n\nShe’s not holding back either. The horny hare’s hands are pawing over your own crotch");
	if (sceneNum >= 2) output(" if they’re not caressing your baby bump");
	output(".");
	
	if (pc.isHerm())
	{
		output(" She notices your bulge right away,");
		if (pc.isCrotchExposed()) output(" and her hungry efforts");
		else output(" and all efforts to dig past your [pc.crotchCoverUnder]");
		output(" tickle your [pc.cocksLight] into greater tumescence");
		if (pc.balls > 0) output(", and they fatten your ballsack with a heavier load of [pc.cumNoun]");
		output(". Once she slides down your [pc.base], her slick fingers glide past your vaginal cleft, drenching themselves in minutes old pussy juice to harvest fresher amounts.");
	}
	else if (pc.hasVagina())
	{
		if (pc.isCrotchExposed()) output(" She slides");
		else output(" She wiggles past your [pc.crotchCoverUnder] to slide");
		output(" her fingers around your vulva, collecting minutes-old pussy juice before diving in, intent on harvesting the freshest batches.");
	}
	else if (pc.hasCock())
	{
		output(" Her paws are enamored with your bulge");
		if (pc.isCrotchExposed())
		{
			output(" and her playful clutches and strokes fatten your [pc.cocksLight]");
			if (pc.balls > 0) output(" and balls");
			output(", imbuing them with the lust they need to please her.");
		}
		else
		{
			output(" and her struggles with your [pc.crotchCoverUnder] only have your growing [pc.cocksLight] spread them for her");
			if (pc.balls > 0) output(" and they only fatten your balls with a heavier load of [pc.cumNoun]");
			output(".");
		}
	}
	
	output(" With her prize in hand, you both fall into a long, steamy moment, so enamored with each other that you can’t think of doing much else besides brazenly groping one another.");
	output("\n\nMouth watering powerfully, you’re the first to break it - foreplay could last forever otherwise - but there’s an animal urge inside bidding you back to your");
	if (sceneNum == 1 || sceneNum == 3) output(" pregnant");
	output(" lover.");
	
	output("\n\n<i>“W-want me to take the lead... babe?”</i> she moans, eyes flicking down meaningfully. <i>“My cock’s so hard that it’s like the only part of my body that exists!”</i>");
	output("\n\nYou laugh with her.");
	if (pc.hasCock()) output("\n\n<i>“O-of course... my pussy too, fuck... I’d love you in there, spreading my legs, my cunt, makin’ me your floppy bitch... Please, fuck me already!”</i>");
	else output("\n\n<i>“Please, let me fuck you already!”</i>");
	
	if (boredJumperisSneakBBOK(sceneNum))
	{
		output("\n\nAn extremely lewd idea comes to mind. You’re carrying breeder’s bliss, a colorless pill capable of unlocking the most primeval urges shared across the races in this galaxy: the overriding need to breed. There’s no way she’d agree to take it in her pregnant state, but if you slipped her that reproductive enhancer, you’d induce a rut in the hermaphroditic outlaw and find yourself mothering a litter of laquines right next to her. It’s perhaps the most arousing thing you’ve thought of in recent memory.");
		output("\n\nAnd yet, it’s probably not the best idea you’ve ever had.");
	}
	flags["BJUMPER_SEX_MENU"] = 1;
	processTime(10 + rand(10));
	clearMenu();
	if (sceneNum == 1 && pc.hasCock()) addButton(0, "Spooning", boredJumperPregEncounterGoWithRestSpooning, jumperType, "Spooning", "Give the bunny mom-to-be the love (and filling) she craves.");
	else if (!pc.hasCock()) addDisabledButton(0, "Spooning", "Spooning", "You’ll need a dick to fuck your pirate-bun gently.");
	else addDisabledButton(0, "Spooning", "Spooning", "You can’t exactly spoon your bunny-sire with that gut in the way!");
	if (pc.hasVagina()) addButton(1, "Rvs Cowgirl", boredJumperPregEncounterGoWithRestRvsCowgirl, jumperType, "Rvs Cowgirl", "Ride the horny bunny’s cock.");
	else addDisabledButton(1, "Rvs Cowgirl", "Rvs Cowgirl", "You need a vagina for this.");
	if (boredJumperisSneakBBOK(sceneNum)) addButton(2, "Sneak B.B", boredJumperPregEncounterGoWithRestSneakBB, jumperType, "Sneak B.B", "Sneak a Breeder’s Bliss pill into the pregnant bun’s mouth, and instil a rut that’ll no doubt leave you as gravid as her.");
	else if (!pc.hasVagina()) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "You need a pussy to share the burden, so to speak.");
	else if (pc.isFullyWombPregnant()) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "All your wombs are full! If you give her this now, you’ll certainly be responsible for causing harm to your children!");
	else if (sceneNum >= 2) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "You’re already pregnant! If you give her this now, you’ll certainly be responsible for causing harm to your children!");
	else if (!pc.hasItemByClass(BreedersBliss, 1)) addDisabledButton(2, "Sneak B.B", "Sneak B.B", "You’ll need a procreation pill to enable the Jumper’s paternal side.");

}
//leave
public function boredJumperPregEncounterDontGoLeave(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	output("Satisfied with your time away from the hustle and bustle of Zheng Shi, and the respite from your goal, you tell your lop lover that you’ve got to get going. Before you stand, she pulls you into a desperate, slobbery kiss. <i>“Wait, maybe before you go...”</i>");
	output("\n\nThe [enemy.furColor] rabbit looks down to her crotch, the growth of her bulgy [enemy.cockNoun 0] visible against the latex bodysuit. She thrusts helplessly against you, begging with her eyes. <i>“Maybe you wanna... have a little fun before you go?”</i> She smiles toothily. <i>“Since we’re all alone!”</i>");
	output("\n\nFuck, she looks kissable right now. The crystalline strand connecting your lips to hers, and the horny glow enveloping the two of you, makes her offer a sinfully tempting one.");
	if (pc.isHerm())
	{
		output(" You don’t even need to look down to know how painfully erect your [pc.cocks]");
		if (pc.cockTotal() > 1) output(" have");
		else output(" has");
		output(" become, nor see how wet [pc.eachPussy]");
		if (pc.vaginaTotal() > 1) output(" have");
		else output(" has");
		output(" gotten.");
	}
	else if (pc.hasVagina())
	{
		output(" You needn’t look down to see or feel how wet your [pc.pussies]");
		if (pc.vaginaTotal() > 1) output(" are.");
		else output(" is.");
		output(" That flooding feeling only intensifies the longer you go stare at her.");
	}
	else if (pc.hasCock())
	{
		output(" You don’t even need to look down to know or feel how rigid your [pc.cocks]");
		if (pc.cockTotal() > 1) output(" have");
		else output(" has");
		output(" become, stretching so hard");
		if (pc.isCrotchExposed()) output(" that you could cum all over her just by thinking about it.");
		else output(" that it threatens to puncture your [pc.crotchCoverUnder].");
	}
	
	output("\n\nWhat will you do?");
	
	flags["BJUMPER_TRIED_TO_LEAVE"] = 1;
	pc.changeLust(10);
	processTime(5);
	clearMenu();
	if (pc.isTaur()) addButton(0, "Pet Her", boredJumperPregEncounterGoWithRestPetHer, jumperType, "Pet Her", "Her idea of fun is appealing, but in your current form that just isn’t going to be possible. ‘Course, that’s not going to stop you from showing a little affection.");
	else
	{	
		addButton(0, "Kiss Her", boredJumperPregEncounterGoWithRestKissHer, jumperType, "Kiss Her", "You know where this is going.");
		addButton(1, "Pet Her", boredJumperPregEncounterGoWithRestPetHer, jumperType, "Pet Her", "You can show her a good time <i>later...</i>.");
	}
}
//kiss her
public function boredJumperPregEncounterGoWithRestKissHer(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	//not used in this scene, reset
	if (flags["BJUMPER_REST_MENU"] == 1) flags["BJUMPER_REST_MENU"] = 0;
	
	if (flags["BJUMPER_TRIED_TO_LEAVE"] == 1)
	{
		output("Nope, you can’t resist a face like that. This slut-bun wants you, and you’d be a terrible liar if you said you didn’t want her. Leaning back down, you can see her whole body - every muscle - flex and power on, as it were, sensing your readiness.");
		output("\n\n");
		flags["BJUMPER_TRIED_TO_LEAVE"] = 0;
	}
	
	output("You can feel her tail wagging");
	if (pc.hasTail()) output(" along with yours");
	output(" before you even touch your fingers to her neck. She’s quick to press her [enemy.lipColor] lips to yours, more than eager to dance with your [pc.tongue]. The laquine pirate is tying stems with the tip of your");
	if (pc.hasLongTongue()) output(" long");
	output(" oral muscle in record time, swishing and swashing with mechanical speed - an unfocused speed that has her licking up and down your cheeks, your brow... everywhere. She’s painting you in her uncontrollable libido.");
	output("\n\nAccelerating, she’s seeing to the rest of your body, massaging your [pc.arms] and [pc.legsNoun]. <i>“Yes!”</i> she screams into your mouth. <i>“Fuck, you’re just... you know how to get me going!”</i> the slutty humper cries, thrusting against your body, making her bulge all too noticeable.");
	
	processTime(5 + rand(5));
	clearMenu();
	if (sceneNum == 1)
	{
		output("\n\n<i>“Come on, you gotta... get your hands right here!”</i> she grunts, pulling your [pc.hands] to her breasts and tummy. You pull her zipper down another few inches, freeing her swollen stomach from its rubbery confines while you manhandle her tits with all the strength of a paternal beast. Those jutting [enemy.nippleColor] nipples, weapons-grade density, are so hard that they could bite back if you rolled them between your teeth. You dive into her milky chest, sucking out a few droplets of sweet laquine cream. <i>“Oh f-fuck, I’m just a milk stop now!”</i> she groans. <i>“Mmm, better leave some for the kids, cutie!”</i>");
		output("\n\nYou will. Right now, all you can manage on this silly girl are brutal molestations that have her arching needfully into you, begging for more. She’s yours to command, and she’s all too willing to be your gravid fuckpuppet. <i>“Don’t tease long, I need you in me again, babe!”</i> You can <i>feel</i> the musk of her erecting ");
		output("[enemy.cockNoun 0] being strangled by the pheromones of her baby-filled horse-cunt.");
		output("\n\nThere’s only one way to handle this horny herm-hare...");
		
		if (pc.hasCock()) addButton(0, "Spooning", boredJumperPregEncounterGoWithRestSpooning, jumperType, "Spooning", "Give the bunny mom-to-be the love (and filling) she craves.");
		else if (pc.hasVagina()) addButton(0, "Rvs Cowgirl", boredJumperPregEncounterGoWithRestRvsCowgirl, jumperType, "Rvs Cowgirl", "Ride the horny bunny’s cock.");
		else
		{
			output("\n\nYou don’t have any genitals! Time to go.");
			setEnemy(null);
			addButton(0, "Next", mainGameMenu);
		}
		
	}
	else if (sceneNum == 2)
	{
		output("\n\nHer paws run marathons over your tenderest places at an almost abusive pace - they’re never too far from your [pc.belly]. Your [pc.hips] squirm against hers and you fall under her, arms wrapped around her head and scritching for her ears. Aiming downward, she");
		if (!pc.isCrotchExposed()) output(" digs past your [pc.crotchCoverUnder] and");
		output(" fingers your aching [pc.pussyNoun] until you clamp down and");
		if (pc.highestWetness() >= 3) output(" squirt");
		else output(" cum");
		output(" in low amounts, coating her gloved paw in [pc.girlCumNoun], all the while her other paw is bounding across your [pc.chest].");
		
		output("\n\n<i>“I can’t believe how amazing you smell!”</i> she purrs. <i>“And you’re allll mine!”</i> It’s easy to give her command of the situation, of your weighted body, and after another exaggerated make-out session, she tells you just how she’d like to have you...");

		addButton(0,"Rvs Cowgirl",boredJumperPregEncounterGoWithRestRvsCowgirl,jumperType,"Rvs Cowgirl","Ride the horny bunny’s cock.");
	}
	else
	{
		output("\n\n<i>“Fuck, it’s hot, hotter than the mines and hotter than the stims...!”</i> the boner-wielding bunny thrusts against you, but her gut only bounces off yours. She lifts you up and forward, straining her spine against the protrusion of her potbelly. You’re forced to do the same to meet the wet lips on her creasing muzzle. Salty liquids flex on your palate before her tongue dives into your maw, and all you can taste now are her pheromones and spit.");
		output("\n\n<i>“Mmmf, fuuck, sooo gooood!”</i> she moans, falling to the side with you, crying into your mouth delirious with carnal hunger. Returning her kiss is all you attempt, but the weight, physical and hormonal, only keeps you following her pace. The outlaw-bun has total control over you, and it’s something her lust-addled mind relishes even if it doesn’t fully grasp it. She’s drenching you in her sweat and scent with fervent squeezes to your every curve.");
		output("\n\nWhile you struggle for each other’s milky teats, she’s maneuvering you into position slowly, groaning blissfully while she sits back and pulls you closer.");
		
		addButton(0,"Rvs Cowgirl",boredJumperPregEncounterGoWithRestRvsCowgirl,jumperType,"Rvs Cowgirl","Ride the horny bunny’s cock.");
	}
}
//really rest
public function boredJumperPregEncounterGoWithRestRWH(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	//not used in this scene, reset
	if (flags["BJUMPER_REST_MENU"] ==1) flags["BJUMPER_REST_MENU"] = 0;
	
	output("The lovely laquine grows excited when you raise your hand, only to moan all sensitive-like when you slide your [pc.hand] across her cheek and toward her ear. <i>“Awww...”</i> she pouts, melting like butter. You sniff again, almost sneezing, achieving clarity and a sense of restraint despite the rampant stench of pure <i>want</i> in the air.");
	output("\n\nYou’re not entirely interested in having a steamy rendezvous right now, but you’re letting her know one finger’s stroke at a time that you’ll acknowledge her needs at a later time.");
	output("\n\nSkillfully avoiding her erogenous zones, you pat the curly haired rabbit-woman on her head, slinking under her beret, gathering her [enemy.hairColor] into pigtails that you tug gently. <i>“Not now,”</i> you start.");
	if (pc.isBimbo()) output(" <i>“Feels kinda bad to turn ‘ya down. But next time, honey bun! I’ll be ready,”</i> you chime, smooching her flat nose.");
	else if (pc.isBro()) output(" <i>“I’m not here for that. Next time, though...”</i> you grin.");
	else if (pc.isNice()) output(" <i>“I hate to leave you hanging, but...”</i> You tilt your head, smiling warmly. <i>“Let’s just stay like this.”</i>");
	else if (pc.isMischievous())
	{
		output(" <i>“Later, ”</i> you sternly remind. <i>“Later... you and I will have a meeting to remember. Even more than");
		if (sceneNum == 1) output(" that,”</i> you eye her belly proudly.");
		else output(" this,”</i> you eye your belly proudly.");
	}
	else output(" <i>“You’ll have to wait a little longer,”</i> you brush her ear, tugging it as you let go. <i>“Next time, I’ll think about it.”</i>");
		
	
	output("\n\n<i>“O-kayyy,”</i> she gropes your [pc.ass], hooding her eyes and propping her chin on your shoulder, whispering, <i>“next time, cutie.”</i>");
	output("\n\nNext time will no doubt come soon, because now that you’ve calmed the horny hare, it doesn’t take long to end up fast asleep on each other’s shoulders. Resting like this isn’t easy... but it certainly is the best place for it. Seconds before peaceful sleep, you satisfy yourself with the thought that you’re right where you need to be, secretly hoping that she may come around in the future, maybe live with you...");
	
	pc.changeLust( -40);
	processTime(60 + rand(60));
	restHeal();
	
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestRWHNext,jumperType);
}
public function boredJumperPregEncounterGoWithRestRWHNext(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var firstName:Boolean = boredJumperSetSteelesName(jumperType);
	
	output("Unsurprisingly, your dreams are full of sex, as if the cosmos is giving you one hell of a karmic reminder. The images are too blurry to understand make out besides what’s going on: two belly-burdened herms fucking like beasts, moaning from incredible pleasure. Even before you wake up, you know deep down that your");
	if (pc.isCrotchExposed()) output(" [pc.thighs]");
	else output(" [pc.crotchCoverUnder]");
	output(" will be smeared with");
	
	if (pc.isHerm()) output(" [pc.girlCumNoun] and [pc.cumNoun].");
	else if (pc.hasVagina()) output(" [pc.girlCumNoun].");
	else if (pc.hasCock()) output(" [pc.cumNoun].");
	else output(" juices.");
	
	output("\n\nYou gasp awake, feeling much too hot thanks to the incredibly warm, cuddly bunny. The abruptness awakens the [enemy.furColor] bunny latched to your [pc.arm], and she’s much more wild about it -- the first thing she does is lick across your cheek, smacking her lips with the taste of [pc.raceShort]-flavored sweat. <i>“Hey,”</i> she coos");
	if (sceneNum == 1) output(" while you rub her belly.");
	else output(", rubbing your belly.");
	output(" <i>“Mmmh, haven’t slept with someone else for a long time. You’re helpin’ me get back into a lot of things I’ve been missing, hun.”</i>");
	
	output("\n\nFor the next few minutes you both just sit there, making small talk about this and that. Part of you can’t help but think about the situation and smile about it. Here you are with a pirate whom you barely know,");
	if (sceneNum == 1) output(" who’s also carrying your kids,");
	else if (sceneNum == 2) output(" carrying her kids,");
	else output(" mutually pregnant,");
	output(" and you’re chatting about small or humorous events in your lives. You don’t let slip any details about your goal to claim your inheritance, but you do tell her about the planets you’ve been and what you’ve seen there.");
	
	output("\n\nAnd she’s all too happy to listen, telling you a few jokes in return. Yes... a hundred Jumpers walking backwards is indeed a receding hare line. You put the kibosh on anymore verbal punishments, not even deigning to respond after the second. It was enough to make you groan so hard that you thought you were in labor.");
	output("\n\nNonetheless, it’s the kind of rest period you were hoping for. Anyone can find someone nice, spend time with them... but this is more than that. This Jumper, for better or worse, is the");
	if (sceneNum == 1) output(" mother of your children. You’re all too sympathetic to her situation, and even more eager to be there when she does give birth, to get your kids out of this place before something bad happens to her or them.");
	else output(" father of your children. You’re all too sympathetic to her situation and even more eager to share with her the lives your kids are going to have.");
	output(" You start talking about what they might look like, who they’re going to take after appearance-wise, how many boys, girls... it’s like you’re not on Zheng Shi at all.");
	
	output("\n\nSadly, the time does come when you have to go. You can only sit still for so long, get ravished with attention until you’re bored out of your mind, and you know she feels the same.");
	if (sceneNum >= 2) output("Despite her weight, s");
	else output(" S");
	output("he hops up and stretches, snapping the stiffness from her bones and muscles with a few lithe and limber flexings. <i>“Ahhh, that was perfect. Feeling so much better now!”</i> she says, ears dripping with sweat.");
	output("\n\nShe notices you staring, then laughs. <i>“Should be able to get a shower in at this hour, that’ll do me good. Gotta say, thought I’d be too horny to do much when I woke up, but I feel great, babe. Thanks for coming up here!”</i>");
	output("\n\nGrabbing your [pc.hand], she");
	if (sceneNum == 1) output(" yanks");
	else output(" guides");
	output(" you to your feet, giving you a molten hug. <i>“Guess you gotta go right?”</i>");
	
	output("\n\nUnfortunately, yes. You look to your belongings and begin to gather them up.");

	if (firstName)
	{
		output("\n\nThere’s an insistent tug on your [pc.arm] when you turn. <i>“Waait!”</i> she yells. You turn back, meeting that shy smile. <i>“Sorry, I almost forgot! You don’t have to give me your full name but... you’re");
		if (sceneNum == 1) output(" the father");
		else if (sceneNum == 2) output(" the mother");
		else output(" a mother");
		output(" of our kids so...”</i>");
		
		output("\n\n<i>“[pc.name],”</i> you say");
		if (pc.isBimbo()) output(" cutely.");
		else if (pc.isBro()) output(" stoically.");
		else if (pc.isNice()) output(" happily.");
		else if (pc.isMischievous()) output(" impishly.");
		else output(" coldly.");
		
		output("\n\n<i>“[pc.name]... Okay! Don’t worry, it’s just between us, alright?”</i>");
		output("\n\nAnd what about her?");
		output("\n\n<i>“Heh heh... Not while I’m on Zheng Shi. I’ll try to surprise you someday, ‘kay?”</i>");
		output("\n\nSure.");
	}
	
	output("\n\nAfter a kiss goodbye, you’ve parted. Compared to the time it took to get up here, it doesn’t take you long to get back to where you were, far away from the ‘dodge deck’ and ready to face down the galaxy once again. Strangely, you can already smell your Jumper again. Guess she’s back to prowling, too.");
	
	sweatyDebuff(1);
	processTime(15 + rand(15));
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//spooning
public function boredJumperPregEncounterGoWithRestSpooning(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	var kok:int;
	if (pc.hasCock()) kok = pc.biggestCockIndex();
	else kok = -1;
	
	//not used in this scene so clear it
	flags["BJUMPER_SEX_MENU"] = 0;
	
	output("The pregnant pirate’s boobs incentivize you to lavish them with more attention than you otherwise would, dripping with the rich, alabaster cream that her kids are going to need when they’re born. Her already sizeable chest sags with the warm load it now has to carry, and before you can think about relieving the horse-bunny’s needs down below, you are unable to resist slaking your thirst.");
	output("\n\nHot, stimulating breaths coax out white pearls of laquine milk, and you pop the proverbial cork with a few sensuous tongue-strokes, gulping down the first batches of lactic delight. One [pc.arm] around her back and the other on her unlicked tit, you rub your [pc.face] against her matronly cleavage and tease her boobs into trickling alabaster fluid to their heart’s content.");
	output("\n\nSpheres of thirst-quenching goodness roll down her furry breast, absorbing into her dutifully spongy fur until it can’t handle the excess. You suck that and the sweat from her, voraciously claiming your meal from her glowing chest, and then wring it like a sopping wet rag.");
	output("\n\n<i>“W-wow... You’re really going at it! Does it taste that good?”</i> she asks.");
	output("\n\nYou answer the Jumper by sealing one lovely [enemy.nippleColor] nub between your teeth and inhaling, hollowing your cheeks to flood your maw with the sweet-tasting contents of her chest. <i>“W-woahhh...”</i> she moans, eyes rolling back. <i>“Mmm, with boobies like these I could give ‘ya a nice, messy titfuck! Get your dick nice and wet and you can fuck it all right into me!”</i> The density and strength of her erect nipple makes biting into it an irresistible action, and not only does she moan in pain-flecked pleasure, she tugs your head left and right, combating the sting of heavy, unceasing lactation with the taperings of your teeth.");
	output("\n\nThick, asymmetrical yanks lend her [enemy.furColor] fur pretty white highlights that giving her an aesthetically pleasing gradient");
	if (jumperType == GLOBAL.TYPE_CANINE) output(", though you have to look really hard to see that against her splotchy fur!");
	else output(".");
	output(" Her body glistens in the dodge deck’s light, and the more you work the more abuse you find yourself having to level against the insatiable laquine. You never feel like you’re in charge of those puffed-up and fantastically sensitive teats, let alone her entire body.");
	
	output("\n\nAll the attention you’ve given her has certainly had an effect: she looks more like a milk slave than a fearsome pirate-bunny. But really... she’s the mother of your children, and a gifted breeder at that. There’s no other way to treat her... no other way she <i>needs to be handled.</i>");
	output("\n\nGrowling against her chest, you push the aroused laquine down, landing atop her with respect for her distended gut. <i>“Squeeze it all out,");
	if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]!");
	else output(" big [pc.guyGirl]!");
	output(" Puddle all my milk on my chest and fuck me senseless, I don’t care!”</i> Compliant, horny, juicy, and so, so wet, the warm bunny avails herself of your maddening erection");
	if (pc.cockTotal() > 1) output("s");
	output(", biting her mewling lip. ‘Life or death’ describes her desperation to find and grip your [pc.cocks]. <i>“Fuck my tits, and fuck me into the deck! Make me as hot as you are now; drench me in cum, honey!”</i>");
	
	if (pc.biggestCockLength() < 12 ) output("\n\nShe eyes up your [pc.cockBiggestNoun], humming cutely. <i>“When we’re done, I want you to get bigger for me too, grow a real bitch-stretching rod and bury me under it. Thinkin’ of you walking around with a nice, big, fat, pirate-taming cock is about to make me nut myself!”</i> ");
	else output("\n\nHer eyes dilate in appreciation of your hefty [pc.cockBiggestNoun]. <i>“That’s what I like to see, babe! A huge, fat, pirate-taming cock, enough to bury a bitch like me under its shadow! You’re gonna smash my tits and teach me my place, and then you’re gonna fuck my pussy until I’m begging to get pregnant all over again!”</i>");
	if (pc.cockTotal() > 2) output(" She grips your extra dicks lovingly. <i>“And these, they’ll each get their turn inside, pumping me up to maximum load!”</i>");
	else if (pc.cockTotal() > 1) output(" She grips your extra dick lovingly. <i>“And this will get its turn inside, pumping me up to maximum load!”</i>");
	
	output("\n\nIf her addled goal was to inspire some semblance of rut in you, it worked.");
	if (pc.inRut()) output(" Not that it mattered, silly girl! Already in rut, you plan for nothing else except fucking her out of piracy and into motherhood. She’s pregnant already, but you’re just making sure she knows her true calling.");
	
	output("\n\nAlthough you’re in no position to think very rationally, you seat yourself carefully at the border of her muscled middle and rounded gut, planting your [pc.cocks] into the valley of her cleavage with a resoundingly moist slap of prickflesh against herm-slut. She’s nodding eagerly, licking [pc.eachCockHead] obediently while you withdraw and abruptly slam into her sloshy tits. Milk flies out in thick arcs, breaking against you, her, and especially [pc.eachCock].");
	if (pc.balls > 0) output(" Your nutsack claps into the underside of her motherly jugs, eliciting thinner arcs of tit-cream; they tighten and clench on the verge of premature release.");
	
	output("\n\n<i>“Mmm, fuck, how do you taste so goooood?”</i> she moans, the musky odor of your squirting pre filling her nostrils. <i>“I can smell your cum, baby! All that yummy cum that turned me into your bitch!”</i> Her happy tail wags, blurring at the speed of its fluffy joy. You rail her chest, fingers sinking into shimmery, quivering titflesh, tiny matting hairs of bunny fur leaving smears of passion on your [pc.skinFurScalesNoun]. <i>“I can feel how pent-up you are, sweetie! Your heartbeat... Ahh... Ahh...”</i>");
	output("\n\nThe bunny-mom’s arms cup her chest together in wanton enjoyment, stabilizing her cushiony chest for an even more aggressive fucking. Every thick thrust proves you the true mate of this laquine, throwing your head back and howling at the top of your lungs. The soft compression of her chest envelops your [pc.cocksLight] in the middle of every powerful gyration. Fuck-drunk and mentally dominated by the sight of and the sensations her jiggle provides, you plow her tide-washed cleavage, all the milky and sweaty superfluity flying off in obscene gouts.");
	output("\n\nCurrents of milk warm your ferally straining dick");
	if (pc.cockTotal() > 2) output("s. Your extra members may not have access to her cock-pleasing channel, but they keep the streams flowing every time your cumslits deflect off her lust-fattened peaks");
	else if (pc.cockTotal() > 1) output("s. Your extra member may not have access to her cock-pleasing channel, but it keeps the streams flowing every time its cumslit deflects off her lust-fattened peaks");
	output(". Her overpoweringly erect cock is bouncing back and forth to the relentless speed at which you glide in and out");
	if (pc.hasTail()) output(", smacking your [pc.tails] with pre");
	output(". You knead her tits in circular patterns, slowing down only slightly, all the pressure on her molten-hot breast reaching a body-curling plateau.");
	
	output("\n\nThere’s no time to marvel at how flushed she is, how hot and bothered the two of you are. You twist your thumbs around her shiny [enemy.nippleColor] areolae, grunting right alongside her until her bouncy, prick-pleasing cleavage is clamped down, trying to milk you like you’ve milked her. <i>“Fuck YEAH!”</i> the sensitive slut-bun cries, legs unable to hold back. She thrusts upwards behind you, tongue beginning to loll on the cusp of total orgasm. <i>“My stupid fat cow tits... are only... good for being fucked! They’re perfect for you, cutie!”</i>");
	output("\n\nIn love with everything you’re doing, she squeals with joy when you launch into an even faster rhythm");
	if (pc.hasVagina()) output(", grinding [pc.oneClit] into her lower ribcage");
	output(". Your cock-slime mixes well with the milk and sweat, allowing you to drive in so hard that you reach her mouth");
	if (pc.biggestCockLength() >= 12) output(" and throat");
	output(" in your stallion motions. The hapless horse-bunny rewards your savage vigor with sucks and licks that increase the flow of liquid excitement.");
	
	output("\n\nYou grip the bunny-bitch’s sweaty ears, pumps slowing to thunderously deliberate strikes. Bloated to capacity with dick drool, you can feel your internal plumbing churning out the first jet of [pc.cum], your male-half tightening up on the edge of climax. That [pc.cumFlavor] discharge is just the beginning");
	if (pc.hasVagina()) 
	{
		output(", your [pc.pussies]");
		if (pc.vaginaTotal() > 1) output(" are");
		else output(" is");
		
		if (pc.isSquirter()) output(" squirting her tummy with [pc.girlCumNoun]");
		else output(" creaming her tummy with [pc.girlCumNoun]");
	}	
	output(".");
	
	output("\n\nLaquine eyes widen when a rope of jism lassos across her cheek. You slam your dick in to the hilt, feeling all the hot [pc.cumNoun] inside surging through your effluent-drenched rod, simmering it to a greater level of stimulation. Instead of holding still, the ecstatic rabbit is jacking your searing [pc.cocksLight] faster, making sure your superheated orgasm reaches her in its scorching entirety.");
	output("\n\nEruptions of sizzling, [pc.cumVisc] [pc.raceShort]-seed impregnate the rabbit-girl’s head-fuzz while you gingerly thrust in and out.");
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 4000)
	{
		output(" Yowling at the sudden stretch in your spunk-vein, [pc.cumVisc], scalding seed gives your urethra a tasty bulge when it surges like the crashing of an ocean, bursting out onto the submissive pirate’s hot-hot chest. You unload jet after jet of seed on her muzzle and the wall, each monstrously thick wad losing some of itself between her lips, destined for her cum-thirsty gut.");
		output("\n\nEven though she’s not getting a throatful, there’s a point the poor bunny becomes dazed with liquid torpor, and you could swear that she’s developing a greater gut over the duration of your orgasm. Pockets of [pc.cumFlavor] sperm develop in her cleavage, exploding on your thrusts or in the very next cumshot. For all the world, this pirate bitch is just a [pc.cumColor]-stained cum-dumpster.");
	}
	else if (cumQ >= 1000) output(" Thick ropes of musky seed slough in the laquine’s chest, puddling with everything else to the point that it explodes outward when you push back in. The weight and power of your masculine release drenches the horny bunny in [pc.cumVisc], seed-filled fluid; long ropes squirt out from your violently twitching [pc.cockNoun " + kok + "] onto her hungry muzzle and glowing tits. [pc.CumFlavor] sperm pockets in her cupped cleavage, bursting when you apply the slightest pressure. Your [pc.cumVisc] impressions dribble down her neck, cheek, or throat, and she makes sure to slurp the dregs of your subsiding orgasm from the [pc.cockHead " + kok + "].");
	else output(" Thin ropes of [pc.cumNoun] paint her face in your modest orgasm, and the rhythmic heave of masculine release lifts the weight of paternal desire. Your volume may not be the best, and it may certainly not match hers, but its incredible heat and unmistakable scent are all your submissive laquine needs to be happy. <i>You are her mate.</i> [pc.CumColor] goo paints her face like ruined makeup, and whatever’s near her lips she’s all too happy to lap up, slurping the rest from your [pc.cockHead " + kok + "] in exquisitely blissful suckles.");
	
	output("\n\nLeaning forward, your [pc.hips] lurch a few last times, fervent latex squeezes wringing out every last drop of your first orgasm into her swampy morass. <i>“You...”</i> she pants, licking her [pc.cumColor]-speckled lips, cleaning your throbbing tool of any unloved amount. <i>“Nobody else can make me feel like that...”</i> She licks at your [pc.cockHead " + kok + "], <i>“...you are just the best! Now...”</i> She taps at your [pc.cock " + kok + "], which remains fully erect thanks to her pheromones. <i>“Betcha aren’t satisfied with a chest-pussy!”</i>");
	output("\n\nNo. No, you are not.");

	processTime(10 + rand(10));
	enemy.loadInMouth(pc);
	pc.orgasm();
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestSpooningNext,[jumperType,kok]);
	
}
public function boredJumperPregEncounterGoWithRestSpooningNext(arg:Array):void
{
	var jumperType:int = arg[0];
	var kok:int = arg[1];
	
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var kok2:int = pc.biggestCockIndex2();
	if (kok2 < 0) kok2 = 0;
	
	output("Falling to your side, you grip the laquine’s latex-girded thigh and lift it into the air, making it clear how you’ll have her. <i>“");
	if (pc.isBimbo()) output("Can’t hurt the kids now! How ‘bout you turn over and lean into me, hunny bunny?");
	else if (pc.isBro()) output("This will be easier for the both of us. Turn over, babe, and let me give you the filling you need.");
	else if (pc.isNice()) output("This will be safer... and I’ll be able to give you the filling you deserve.");
	else if (pc.isMischievous()) output("Can’t go hurtin’ our kids. Go on, turn over a bit, and you’ll get just what you need sweetheart.");
	else output("I’m not going to put the kids in danger. Turn over, and let me take care of the rest.");
	output("”</i>");
	
	output("\n\n<i>“No problem!”</i> she cheers, turning to her right and pressing her spine into you. Your [pc.cocksLight] nestle into the underside of her half-emptied sack, slip-and-sliding between her powerfully muscled and rubber-clad legs, just inches away from her sopping wet scent box. Warm, wet rabbit ears drape over your");
	if (pc.hasHair()) output(" [pc.hair]");
	else output(" head");
	output(" and shoulders, somehow making you feel even closer to the dopey rabbit than by your [pc.chest] molding to the contours of her back.");
	
	output("\n\nRipe, thick horse-cunt reaches out to you, its pregnancy-enhanced pheromones like an ambassador to your olfactory senses. Rubbery black lips, aching for a plowing, ‘wink’ on contact with [pc.cockColor " + kok + "] cockflesh. Fat hare-clitty prods into the shaft of your [pc.cockBiggestNoun], and a spurt of laquine honey wettens your [pc.base] in advance. You squeeze her sodden tit and breathe into her neck, signalling to her your primal readiness.");
	if (pc.biggestCockLength() >= 12)
	{
		output("\n\n<i>“F-fuck, I know you’re not in yet but you’re sooo big and it feels like you’re fucking me already just by being there, cutie! Make me a slut c’monc’mon!”</i> You slap the roiled rabbit’s ass, causing her to buck backwards into your lap. <i>“Mmm, better hit harder");
		if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]");
		output("!”</i> You squeeze a tit and <i>thwack</i> her again, feeling your [pc.cockBiggest] bouncing off her own. <i>“Spread me like you did before, I can’t wait!”</i>");
	}
	else output("\n\n<i>“Starrrsss, I hope you make yourself a bit bigger... Mmm, laquine pussy is deep and wide, cutie!”</i> You slap her ass, telling her that she’ll be screaming your praises regardless of how much twat you have access to. <i>“I can’t wait! C’monc’mon make me a slut!”</i> You slap again, telling her that she’s still a mom.");
	
	pc.cockChange();
	
	output("\n\nWithdrawing feels so good you forget to finish the movement. The rubbery pressure on your [pc.cocksLight] is incredible, and you can tell your aggressive lover is keen on making you work for everything you want out of her. It takes a hard yank and a bite to her neck to part her legs, revealing the shining black lips of her soggy horse-cunt. The Jumper’s tender black ridges shine with feminine excitement, and you can’t help but dive a [pc.hand] between her copious ass-cheeks and into that sinful tunnel.");
	output("\n\nPanting, the rabbit strokes her [enemy.cock 0], looking over her shoulder with a lustfully vacant expression. A broad smile builds on her euphoric features. <i>“Pleeease, no teasing! I... that’s... that’s a crime!”</i> Is it now? <i>“Nooo, I can’t take it!”</i> The begging slut’s hips are shuddering hard against your [pc.thighs], and then she volcanos. <i>“Hieekk!”</i> she rasps, a powerful male climax straining her rent urethra. Hermaphroditic orgasm interrupts your train of thought. Against your shaft");
	if (pc.cockTotal() > 1) output("s");
	output(" you feel her rhythmically contracting balls urging out a desperate load, taking her IQ with it.");
	output("\n\n<i>“Stop,”</i> you command, taking both melting ears in hand, shushing the moaning bun. Her plush, puffy lips part even further, vulva on the verge of inhaling your rod from the wrong side. Supple laquine testes sag, no longer stocked by pent-up seed. <i>“Relax,”</i> you tell her, <i>“...and get ready.”</i>");
	output("\n\nBouncing against you, quieted into a momentary placitude, the laquine clutches your [pc.hand] lovingly, insensate after her dopamine overindulgence. Intoxicating bunny-pussy is seconds away, somehow growing hotter and wetter when your [pc.cockHead " + kok + "] brushes its hypersensitive exterior. <i>“Eeeek!”</i> she yelps again, but you silence her with a tug to the ear and a nuzzle to the neck. Leg still lifted, you direct your [pc.cock " + kok + "] inside, finding no difficulty whatsoever in spreading her to your [pc.cockType " + kok + "] shape.");
	output("\n\nThe gentleness at which you penetrate her is the kind of pace change she needed after such a thick and heavy start. It’s an oddly satisfying moment of tranquility, and an exquisitely pleasurable trip at that. Her drizzling cunt is speared by your dominant maleness, all the sweat and femslime mixing into an aromatic syrup which squelches on the deepest inches claimed.");
	if (pc.biggestCockLength() >= 20) output(" The ligaments in her legs flex along with the muscles in her beautifully wet mare-pussy. The Jumper’s cunt clamps down on your member just after you hit the entrance to her womb, locked up tight for the safety of her precious load. Her clit throbs against your [pc.base] while you delight in the milking friction of your mate’s fertile hole.");
	else
	{
		if (pc.biggestCockLength() >= 12) output(" You bottom out a short");
		else output(" You bottom out a fair");
		output(" distance from her womb, but her tight pocket accommodates you like it would a greater endowment. You jerk your hips up and down, left and right, pressing into nerves you wouldn’t hit otherwise, drawing pleasured shrieks from her lips.");
	}
	if (pc.cockTotal() > 1) output("\n\nYou can’t tell if she’s ready for what comes next either. You slide your next biggest cock up to her winking asshole, hidden in the depths of her wide bubbly bunny butt, and buck inside. Thanks to the workout from before, your lubed [pc.cockNoun " + kok2 + "] doesn’t just slip in, it’s engulfed. [pc.EachCock] are soon pulsing communicatively in the pirate’s holes, signalling to her intensely grateful nerves how fucked she’s going to be, and how packed she’s going to become.");
	
	if (pc.cockTotal() > 1)
	{
		if (pc.cockCanSting(kok))
		{
			if (pc.cockCanSting(kok2)) output("\n\nYour alien biology has a plan of its own. The stingers on your dual-slotted [pc.cocksLight] lash out at every corner of the Jumper’s pussy- and ass-flesh they can reach, dumping copious amounts of lust-venom into her most sensitive areas. Like an overtuned vibrator she waggles against you, spasming in a pool of sweat, her voice breaking apart into a million pieces.");
			else output("\n\nYour alien biology has a plan of its own. The stingers on your slotted [pc.cock " + kok + "] lash out at every corner of the Jumper’s pussy-flesh they can reach, dumping copious amounts of lust-venom into her most sensitive areas. Like an overtuned vibrator she waggles against you, spasming in a pool of sweat, her voice breaking apart into a million pieces.");
		}
		else if (pc.cockCanSting(kok2)) output("\n\nYour alien biology has a plan of its own. The stingers on your slotted [pc.cock " + kok2 + "] lash out at every corner of the Jumper’s ass-flesh they can reach, dumping copious amounts of lust-venom into her most sensitive areas. Like an overtuned vibrator she waggles against you, spasming in a pool of sweat, her voice breaking apart into a million pieces.");
	}
	else if (pc.cockCanSting(kok)) output("\n\nYour alien biology has a plan of its own. The stingers on your slotted [pc.cock " + kok + "] lash out at every corner of the Jumper’s pussy-flesh they can reach, dumping copious amounts of lust-venom into her most sensitive areas. Like an overtuned vibrator she waggles against you, spasming in a pool of sweat, her voice breaking apart into a million pieces.");
	
	output("\n\n<i>“Yesss... Yes!”</i> she stirs from her stupor, [enemy.cockNoun 0] still hard, still dribbling. Her laughs return, and so does her lagomorphic libido. <i>“");
	if (boredJumperKnowsSteelesName(jumperType)) output("[pc.name], ");
	output("I... I can’t describe what I’m feeling!”</i> She looks to you, drooling and heaving with a glimmer in her eyes. <i>“Can you go slow at first? Let’s just...”</i>");
	
	output("\n\nYou silence her, knowing exactly what to do.");
	output("\n\nA crisp gasp floats from the laquine’s lips when you pull back for the first time. The raw heat and vivid texture of her moist nethers almost compels you to cum. Vision realigning, you pull back from her pheromone-box until only");
	if (pc.cockTotal() > 1) output(" both cockheads are inside her holes");
	else output(" your cockhead is inside her hole");
	output(", and thrust forward faster, but in a divinely smooth motion. <i>“Ahh... So warm...”</i> Once again. Juices squelch in your tender pumps. The fatuous futa-bunny’s neck strains to pepper your face with kisses - you do the same. Numbness overtakes your entire body until the only thing you feel is the rhythmic penetration of horse-cunt.");
	output("\n\nSighing in equal parts arousal and relief, pre drools out in nearly orgasmic volumes, producing a euphoric buzz that twists and turns down your spine. There’s absolutely no doubt she feels the same, gingerly tending to her [enemy.cockNoun 0] and well-drained tits. Furry fingers dig into the space between your [pc.cockNoun " + kok + "] and her pussy, impaling herself so that she can add to the girlish pleasure");
	if (pc.hasKnot(kok)) output(", while stealing gropes at your knot");
	else if (pc.hasSheath(kok)) output(", while stealing gropes at your sheath");
	output(". <i>“When you cum, I want you to do it hard, don’t hold back for my sake, okay?”</i>");
	
	output("\n\nHer voice is received, but again, your body is already one step ahead. Exhaling, you build up to a faster pace, whispering your affections into her inflexible ear, telling her how happy you are that she’s the mother of your kids, reminding her they will be taken care of, and sneaking a few comments in about how she can leave her lawless life behind.");
	output("\n\nThe prick-rabbit mewls sympathetically while your dick");
	if (pc.cockTotal() > 1) output("s");
	output(" rake her interiors");
	if (pc.cocks[kok].cType == GLOBAL.TYPE_FELINE) output(" and your fleshy ‘barbs’ brush her clitty in consistent, muscle-seizing patterns");
	else if (pc.cockTotal() > 1)
	{
		if (pc.cocks[kok2].cType == GLOBAL.TYPE_FELINE) output(" and your fleshy ‘barbs’ brush her asshole in consistent, muscle-seizing patterns");
	}
	output(". Powerful lapine legs remain supine under your lusty, muscle-driven propulsions, left thigh propped up to bare her fertile crescent. You’re barreling into the lovelorn laquine a little bit faster each time, the gaps between your thrusts decreasing and the girth of unholstered dick narrowing.");
	
	output("\n\n<i>“Haaa! Hyeee!”</i> she whines, your veins rubbing her inner flesh down. <i>“Ohhh, that’s the kinda hit I needed! More of that! Moremoremore!”</i> she cries.");
	
	if (pc.biggestCockLength() > 20) output("\n\n[pc.CockNoun " + kok + "] strains happy laquine cunt into greater levels of elasticity.");
	else output("\n\n[pc.CockNoun " + kok + "] closes the gaps between wide laquine cunt.");
	output(" You can only imagine what you must look like to a third party, but you’ve got a pretty good idea.");
	if (pc.cockTotal() > 1) output(" The extra layer of friction your anally-holstered [pc.cockNoun " + kok2 + "] provides enables you to reach a higher level of perversity.");
	if (pc.balls > 0)
	{
		if (pc.ballDiameter() >= 6) output(" Your tremendous");
		else if (pc.ballDiameter() >= 4) output(" Your heavy");
		else output(" Your thick");
		output(" ballsack wobbles back and forth every time you hilt yourself inside the pirate-mom, her eyes dilating under the caress of its [pc.cumNoun]-taut contents.");
	}
	output(" Her breaths scale to hyperventilations and her cooperative clenchings fall apart into reckless, orgasmic aches.");
	
	output("\n\n<i>Plap plap plap.</i> <i>“A little harder. Please...?”</i> she whimpers, all the frenzied desire from before seeming to return per her faint and needy squeaks. You reply vigorously, ramping up by pushing yourself into her, one arm curled under and over her leporine limb and the other her neck. Against the wishes of your internals you strain your body to its limits, feeling burns all throughout your back, neck, and [pc.thighs]. Before she gets any other ideas, before she even realizes what she wants, you give your slutty, furry, bunny-bearing bitch what she wants.");
	output("\n\n<i>The shameless rabbit loves it.</i>");
	output("\n\nAdoration and lust vie for presence on the herm’s muzzle. Her [enemy.cockNoun 0] is so hard and erect that even her suit couldn’t contain it, and it hangs there helplessly. She licks crazily at the air, miming motions perfect for oral sex until reeling her tongue back in and biting down to stop it. Strands of spittle dangle from her chin, wobbling back and forth in web-forming ropes. The pleasure you provide her tumultuous twat and the loving emotions you fill her with are a combined assault she can never hope to win against, perhaps never adapt to.");
	output("\n\nYour [pc.cocksLight] slap into her as if you were fucking her doggy style, pressing so hard that your burgeoning [pc.cockHead " + kok + "] is pounding her G-spot, zeroing in thanks to the risks you take. Her honeyed hole greases your pole every five seconds now - you have indeed gotten her orgasms down to a science. She’s left to get on by sound and feel right now, and those two sensations are utterly suffused with the cock of her studly companion.");
	output("\n\nThe incredibly aroused Jumper shudders and howls, her cock-tip ballooning in another climax that scrapes the bottom of her two cum-factories. White seed dribbles from her tip and you fuck her right through that mini-orgasm, intent on stuffing her magnificent pussy with all that you have left. Layers of salty grime drip from the tips of your ears and chin. Nothing is experienced so delightfully save for the fine, fleshy details of her rapidly contracting walls.");
	output("\n\nThose inner cheeks squeeze tight and suck with enough force that you nearly lose grip and collapse. You would, if you didn’t just batter her womb and plunge into the release you’ve been working towards. One last erotic thought");
	if (pc.hasKnot(kok)) output(", and the insertion of your [pc.knots],");
	output(" makes you groan in abject-minded bliss: you’re one hell of a lovemaker.");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 4000)
	{
		output("\n\nGroin slamming into orgasm, your");
		if (pc.hasSheath(kok)) output(" flaring");
		else output(" ballooning");
		output(" [pc.cockHeads] erupt with [pc.cumNoun], geysering into the rabbit-mom’s");
		if (pc.cockTotal() > 1) output(" twin holes.");
		else output(" hole.");
		
		output(" Womb-swelling loads of [pc.cumFlavor] jizz backwash almost immediately, pockets forming and bursting in her cum-thirsty tunnel. You sigh and grunt in equal measure, feeling your spunk-vein bloat with inhuman loads. Her biology eases it out as best it can, and you do you part by simply fantasizing about how easy it would be to knock the slut up all over again.");
		
		if (pc.cockTotal() > 3) output(" With your extra endowments, she’s getting a faint visual of such a possibility too. The dicks not inside blasts a few deck-smearing torrents across her body, creating a small, warm little pool that expands beneath her legs.");
		else if (pc.cockTotal() > 2) output(" With your extra endowment, she’s getting a faint visual of such a possibility too. The dick not inside blasts a few deck-smearing torrents across her body, creating a small, warm little pool that expands beneath her legs.");
		
	}
	else if (cumQ >= 1000)
	{
		output("\n\nThe laquine thumps backwards into your crotch, enough that your dick would probably be bulging through her tummy were it not so inflated. [pc.Cum] fires through your twitching rod, immobilized in the blushing girl’s fluid-raining cunt. You fill the Jumper’s horse-twat with so much [pc.cumVisc] seed that it backwashes");
		if (pc.hasKnot(kok) && pc.hasKnot(kok2)) output(" around your knots");
		else if (pc.hasKnot(kok) || pc.hasKnot(kok2)) output(" around your knot");
		output(". Inner walls clench and curl around your [pc.cocksLight], making sure that no drop of your monumental load is left behind.");
		
		if (pc.cockTotal() > 3) output(" Although all of your cocks weren’t getting a taste of her wonderful holes, her thighs help them rub out a few thick loads into her fur, the excess running down her tendons and spreading against the deck.");
		else if (pc.cockTotal() > 2) output(" Although your third cock didn’t get a taste of her wonderful holes, her thighs help it rub out a few thick loads into her fur, the excess running down her tendons and spreading against the deck.");
	}
	else
	{
		output("\n\nRocking your [pc.hips] back and forth, you ease out your loads into that cushiony cunt");
		if (pc.cockTotal() > 1) output(" and the capacious colon just above it");
		output(". [pc.Cum] spurts and spurts and spurts, shooting inward as laquine musk shoots outward. Her fleshy walls assault you between ‘yawns’, furling and twisting around your rod to draw out the [pc.cumVisc] contents of your");
		if (pc.balls > 0) output(" [pc.balls].");
		else output(" shaft.");
		output(" Dizzied, you thrust forward a bit harder, your body’s natural urge to reach her deepest recesses and impregnate her all over again. Maybe next time.");
		
		if (pc.cockTotal() > 3) output(" Even though they weren’t getting any action, your unslotted cocks plant a few erotic lines on her body, though the accumulated sweat prevents it from absorbing.");
		else if (pc.cockTotal() > 2) output(" Even though it wasn’t getting any action, your unslotted cock plants a few erotic lines on her body, though the accumulated sweat prevents it from absorbing.");
	}
	
	output("\n\nNo feel in your [pc.arms], you set her leg down and <i>breathe.</i> For a minute you two lie there in the afterglow of the most passionate lovemaking anyone’s likely to find or experience on Zheng Shi. Streams of [pc.cumNoun] and laquine girl-juice pour from her pussy while you soften inside, not willing to leave or go anywhere else. This is where you belong.");
	output("\n\nSensing that she must have passed out by now, you gladly do the same.");
	
	processTime(10 + rand(10));
	enemy.loadInCunt(pc, 0);
	pc.orgasm();
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestSpooningNext2,jumperType);
	
}
public function boredJumperPregEncounterGoWithRestSpooningNext2(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	output("<i>Exhale.</i> Your eyes open, bringing you back to reality from a dreamless yet no less pleasant sleep. The smells you’re greeted with are lewd and all too arousing. What you see when you open your eyes is the [enemy.furColor] back of your bunny-girl, whom still snoozes in the security of your [pc.arms]. You nuzzle into the back of her neck again, kissing upwards to her cheek, finally waking the slumbering Jumper.");
	output("\n\n<i>“Ahhh... where...”</i> she starts, then turns to face you, smiling happily. <i>“Hey");
	if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]");
	output("...”</i> she whispers, shivering. It has gotten a bit cold.");
	output("\n\nShe smooches you on the nose and starts looking around, no doubt fiercely satisfied after what you just did. <i>“Oh man, I wonder what time it is. I feel like a brand new girl!”</i> she boasts, giggling. When she tries to turn to face you, your cock slides out of her pussy, along with a thin stream of lubricant. <i>“You are the fucking best. I loved everything about that.”</i> She says that and more with misty eyes, and you chat for a while about her pregnancy. <i>“Will you try to be around when they’re born? I really don’t wanna ask but... I’ll need help and we can’t-”</i>");
	output("\n\nYou touch a finger to her lips and shake your head. Now’s not the time.");
	output("\n\n<i>“R-right... When it’s time, I’ll do my best, too.”</i>");
	
	var firstName:Boolean = boredJumperSetSteelesName(jumperType);
	
	if (firstName)
	{
		output("\n\nShe tilts her head. <i>“So, before you go, can I ask you something? I was wondering if... well, you don’t have to, but can I know your name? You’re their " + pc.mf("dad","mom too") + " so...”</i>");
		
		output("\n\n<i>“[pc.name], ”</i> you say");
		if (pc.isBimbo()) output(" cutely");
		else if (pc.isBro()) output(" stoically");
		else if (pc.isNice()) output(" happily");
		else if (pc.isMischievous()) output(" impishly");
		else output(" coldly");
		output(" making her react with glee.");
		
		output("\n\n<i>“[pc.name]!”</i> she sings. <i>“Don’t worry, it’s just between us. Gives me somethin’ to scream next time we do this, hehe. Don’t go getting hurt, okay? I want you to be able to see all of ‘em when they’re born!”</i>");
		output("\n\nYou aren’t going to lie to her, you can’t promise anything, but you can assuage her fears by telling her you will come by frequently. You can’t allow your kids to be put in danger by being on Zheng Shi for longer than they have to. When you reluctantly disentangle, she orally cleans your [pc.cockNoun " + pc.biggestCockIndex() + "], staying behind to watch you go. Before you make your way back into Zheng Shi proper, you kiss her and her belly.");
		output("\n\nTime to move on.");
	}
	else
	{
		output("\n\nAnd so shall you. You won’t allow your kids to be put in danger by remaining on Zheng Shi for longer than they have to. When you reluctantly disentangle, she orally cleans your [pc.cockNoun " + pc.biggestCockIndex() + "] and helps you get your things together. Before you return to the task at hand, you plant a kiss on her cheek and her belly, ready to resume your journey.");
	}
	
	processTime(60 + rand(60));
	restHeal();
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//rvs cowgirl
public function boredJumperPregEncounterGoWithRestRvsCowgirl(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	var hole:int = -1;
	if (pc.hasVagina()) hole = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = 0;
	
	if (pc.hasTits() && boredJumperBreastFeedOK())
	{
		if (flags["BJUMPER_SEX_MENU"] == 1)
		{
			output("Nodding, you tell her to take over, and she thanks you profusely.");
			output("\n\n");
			flags["BJUMPER_SEX_MENU"] = 0;
		}
		output("<i>“Before we get to the fun stuff, I gotta have a taste. I can’t keep my eyes off those tits, hot stuff!”</i> The [enemy.furColor]-furred laquine pulls you into somewhat of a hug");
		if (!pc.isChestExposedByArmor()) output(", but keeps enough distance that she can relieve you of your [pc.armor]");
		output(".");
		
		output(" <i>“Mmmf,”</i> the bunny moans, sitting you in her lap, <i>“love a pair of sloshy, jiggly tits!”</i> Her suit creaks as she struggles to get ready. With a lot of effort, she relieves her zipsuit of the strain of her bubbly ass and powerful legs, eager to get those now ungloved hands on your [pc.breasts]");
		if (!pc.isChestExposedByUpperUndergarment()) output(" - after tossing your [pc.upperUndergarment] aside, of course!");
		else output(".");
		
		output("\n\nYour tits wobble almost hypnotically, just slow and sensuously enough that she swoons. It takes a few seconds for her to get into it, totally hypnotized by the");
		if (pc.biggestTitSize() >= 7) output(" sheer");
		else output(" ample");
		output(" amount of [pc.raceShort]-boob she has to play with. <i>“All I gotta do is rub and you drip like crazy!”</i> she cries, fondling you from the undersides. The pulsing in her wrists tells you just how hard her heart is beating. Its thumping rhythm makes it impossible to think when it visibly quakes across your malleable melons; the anticipation achieves a finger-curling high.");
		
		output("\n\nThe merry Jumper pushes both of your");
		if (pc.biggestTitSize() >= 7) output(" bombshell");
		else output(" tranquilizing");
		output(" sugarmounds together until the tips bulge downward into proper [pc.milkNoun]-dripping peaks. The early droplets were the calm before the [pc.milkVisc] storm. <i>“Heyyy, move a little closer- ah, thanks!”</i> she chirps while you thrust your chest out into warm, wet palms. Hot breath washes over your sensitive summits, easing out larger beads of [pc.milkVisc] fluid.");
		
		output("\n\nAerosolized girlmusk tickles the bunny girl’s nostrils in the wake of another orgasm. A");
		if (pc.girlCumQ() >= 1000) output(" wave");
		else output(" shot");
		output(" of [pc.girlCumNoun]-flavored ecstasy");
		if (pc.isSquirter()) output(" squirts");
		else output(" flows");
		output(" from [pc.eachPussy],");
		if (pc.isCrotchExposed()) output(" staining the space between your thighs.");
		else output(" seeping through and ruining your [pc.lowerUndergarment].");
		output(" The laquine’s talented tongue then lashes out after your short climax, dancing across your [pc.milkyNipples] in ravenous, swirling strokes.");
		
		output("\n\nWith as much care as she can - admirable considering the amount of titflesh in her hands and the closeness of her emerging [enemy.cockNoun 0] to your [pc.pussyNoun " + hole + "] - her fingers bend into the undersides of your");
		if (pc.hasFur()) output(" fuzzy");
		else if (pc.hasScales()) output(" scaly");
		output(" swells, enticing a delicious batch of [pc.milk] into her mouth. A little too much flows at first, like champagne fizzing out of a shaken bottle. What she doesn’t swallow spills out at the top of your [pc.chest]. Her paws close off the bottom so that nothing can leak from your slick crevice.");
		
		output("\n\n<i>“Wooahh!”</i> she cheers, bouncing your breasts left and right, right and left; the hungrier she gets, the more excitable she becomes. <i>“Betcha like bein’ sopping wet!”</i> she quips, her long ear falling into a puddle formed by firm tugs. [pc.MilkColor] fluid shoots and dribbles in thin arcs.");
		output("\n\nInstead of slaking her thirst, your [pc.milkFlavor] cream is only intensifying it. She smushes her dopy muzzle into your shapely cleavage, growling into the flooded, pillowy depth until bubbles rise. Ripples stream across your [pc.skinFurScalesNoun] closely followed by aggressive licks trailing all the way down to your [pc.nipples]. She inhales the [pc.milkVisc] treat like oxygen, only exhaling those smoldering breaths when she buries her whiskers in your whorish valley.");
		output("\n\nYour gleaming, blushing breasts are a landmark visible between the stars, their [pc.nippleColor] caps twitching hard in response to the adoration they’re lavished with.");
		output("\n\n<i>“I love these tits! Best <b>ever</b>!");
		if (pc.biggestTitSize() >= 15) output(" Putting all the slaves and titty kitties to shame with this kinda chest!”</i> The futa bunny hugs your gargantuan mounds with her whole body, impregnating her fur with the unceasing streams of [pc.milkNoun]. <i>“Geez, there’s so much jiggle, so much to hold on to and I can’t! You’ve gotta let me come and milk you later, babe. Probably a little too much even for a litter of laquines!”</i> she laughs.");
		else if (pc.biggestTitSize() >= 7) output(" Perfect pair of pillows, all squeezable and huggable...”</i> She does just that, and a river of [pc.milkNoun] pours from your lactic faucets. <i>“God, look how you drain! You’ll definitely have enough for our kids!”</i>");
		else output(" Not the biggest but who cares?”</i> she celebrates, pressing her own [enemy.nippleColor] nipples into yours, bathing them in a trickling shower of [pc.milkNoun]. <i>“All perky and round with milk, perfect for raising a big bunch of kids! ‘Sides, you don’t need all that extra weight, cutie!”</i>");
		
		output("\n\nPleasure flutters in your heart at the pirate’s shameless praise; you bat your eyes when she smiles at you, encouraging her to use your lovely boobs as much as she likes. Her pursing lips seal around you areolae, availing themselves of all the bountiful treat contained within such a hefty bosom. She gulps down another mouthful before licking it off her [pc.milkColor]-flecked lips. <i>“You’re a gifted [pc.guyGirl] to have tits like these! Fuck!”</i> She shudders and audibly groans, assuming a reckless pace. <i>“And your taste is just...”</i> She darts back in to lap at a descending dollop before it leaks into wastedness.");
		if (pc.milkType == GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK || pc.milkType == GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) output("\n\n<i>“Sweet! Sooo sweet, and...”</i> She lashes at your peaks, rubbing them together with childish glee. <i>“...It’s turning me the fuck on! Whatever this stuff is, daaamn... Who needs a pick-me-up when your milk can build bones this strong?”</i> she winks.");
		else if (pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) output("\n\n<i>“Mmmm,”</i> the sultry bunny moans into your compressing gap. <i>“Sweet and warm chocolate milk. How’d you know that’s one of my favorites?”</i> You look coy for her benefit, quietly ushering her back into your chest.");
		else if (pc.milkType == GLOBAL.FLUID_TYPE_STRAWBERRY_MILK) output("\n\n<i>“Mmmm,”</i> the sultry bunny moans into your compressing gap. <i>“I looooove strawberries! Been so long since I had any. Did you get this mod just for me?”</i> You look coy for her benefit, quietly ushering her back into your chest.");
		else if (pc.milkType == GLOBAL.FLUID_TYPE_HONEY) output("\n\n<i>“Thick! A little hard to swallow, but that warmth, mmmm.”</i> She swaps spit and honey with you, leaving a dollop on her nose. While you reach for it she says, <i>“Just like the honey those bee people have. Never had it before...”</i> You wipe her twitchy nostrils and she sucks it right from your finger. <i>“...But I’m definitely a fan!”</i>");
		else if (pc.milkType == GLOBAL.FLUID_TYPE_MILKSAP) output("\n\n<i>“Gosh, what is this... It tastes like...”</i> She smacks her lips, looking up to you with [pc.milkColor] milk-sap dripping from the edges of her [enemy.lipColor] lips. <i>“It’s... I can’t tell!”</i> You ask her if she’s displeased by it, but she’s quick to shake her head. <i>“Hell no! The aftertaste is incredible!”</i>");
		else if (pc.milkType == GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT) output("\n\n<i>“Oh fuck, you’re not just a milky momma, you’re a walkin’ picnic!”</i> The Jumper dives into your chest again, painting her muzzle [pc.milkColor] with your [pc.milkFlavor] treat. <i>“Mm-mmf, sweetness with a bit of crisp. I looove fruity stuff! How’d ‘ya know?”</i> You shrug your shoulders and shove her back into it.");
		else if (pc.milkType == GLOBAL.FLUID_TYPE_NECTAR) output("\n\n<i>“Just... what is this...”</i> The slut-bun licks her lips like a frenzied animal, sucking so hard for your revitalizing nectar that you yelp in pain - when you do, she apologizes profusely. <i>“I... this stuff is delicious, but I feel like I’m getting stronger just by drinking it.”</i> A wide grin spreads on her lapine muzzle. <i>“Just means I’m gonna have plenty of energy for taking care of ‘ya, cutie!”</i>");
		else output("\n\n<i>“Creamy!”</i> she chirps. <i>“Creamy, smooth, good ‘ol fashioned milky milkness!”</i> she giggles, tonguing up and over your " + (pc.hasErectNipples() ? "nubs" : "spouts") + " like a cat playing with a toy, causing them to vibrate and throb in pangs of pure pleasure.");
		
		output("\n\nYour partner’s thick breaths blanket your [pc.chest] in as much heat as [pc.milkNoun]. She works herself into an animalistic rut, slobbering all over you with increasing disregard. You have to remind the sweat-slicked slut of that between your delirious moans, and when you do, she parts your tits and lets all the pooled lactation run down");
		if (sceneNum >= 2) output(" and over");
		output(" your [pc.belly]. It makes you feel uncomfortably empty as well as slightly cold, and then she’s mauling your chest with alternating gropes all over again.");
		
		output("\n\n<i>“I can feel how warm you’re getting...”</i> She slides her fingers around your boobs, kneading them in circles to spread the runoff before slipping right off. <i>“Yeah. I don’t want ‘ya cumming from this!”</i> Her grip shifts to your [pc.nipples] again, one hand falling to your crotch. <i>“That’s enough messin’ around.”</i>");
		output("\n\nSpeaking of messing around, you realize a little late that you’ve been jerking her [enemy.cockNoun 0] the whole time, once playfully, and now fondly.");
	}
	else
	{
		if (flags["BJUMPER_SEX_MENU"] == 1)
		{
			output("Nodding, you tell her to take over, and she thanks you profusely by pulling you into her.");
			output("\n\n");
			flags["BJUMPER_SEX_MENU"] = 0;
		}
		if (!pc.hasTits()) output("<i>“Kind of a shame you’ve got nothing for me to play with, cutie.”</i> The [enemy.furColor]-furred Jumper says");
		else output("<i>“Was hoping you had something for me to play with, sweetie.”</i> The [enemy.furColor]-furred Jumper says");
		if (!pc.isCrotchExposedByArmor()) output(", relieving your of your [pc.armor]");
		output(" and sitting you in her lap. <i>“No milk either... aww...");
		if (sceneNum >= 2) output(" hope you’ve got a plan when you give birth, sweetie!");
		output("”</i> she pouts, running her sweat-slick paws all over your [pc.skinFurScales] and especially your [pc.belly]. <i>“But that’s no big deal. Let’s get you in the mood, baby!”</i>");
		
		output("\n\nSpeaking of being in the mood, you can see her [enemy.cockNoun 0] poking out from the top of her half-yanked zipper, painted thick with lubricant. You waste no time finishing the job, planting your palms to its");
		if (jumperType == GLOBAL.TYPE_HUMAN) output(" swollen shape.");
		else output(" inhuman shape.");
	}
	
	output(" Just holding her meat");
	if (sceneNum >= 2) output(" reminds you of how well she filled you before, and it reminds you of how empty you are without her in there <i>right now.</i> It exudes a fresh musk that reminds your [pc.pussyNoun " + hole + "] of its shape, its place... <i>its purpose.</i>");
	else output(" makes you fantasize about how well it can fill and stretch you, how empty you are without her inside. It exudes a fresh musk that kicks your [pc.pussyNoun " + hole + "] into overdrive, readying itself to be bred by a virile mate.");
	output(" Its demanding pleasure-pulses tell your body the rest.");
	
	output("\n\n<i>“Gotta be careful with you,”</i> she grunts, thrusting upwards involuntarily, moaning cutely. <i>“You know how to make a girl real horny.”</i> Her fingers are");
	if (pc.balls > 0) output(" wiggling beneath your ballsack and");
	output(" diving into your [pc.pussyNoun " + hole + "], parting the [pc.girlCumNoun]-coated folds. <i>“Make a girl wanna fuck until she’s drowning in her own sweat!”</i>");
	
	output("\n\nSliding inside is effortless. You’re so wet that your [pc.vaginaColor " + hole + "] interior is a waterpark. You squirm against the pressure, getting hotter and harder the more she fingers you");
	if (pc.hasCock()) output(", thumbing your [pc.base] in her forceful, juddery motions");
	output(". [pc.OneClit] is so erect and sensitive that you can feel it squirming a few centimeters in your flagging motions. Your [pc.belly] is just as susceptible, wobbling and hitting your brain with the kind of pleasure only a strong tweak to your pussy-button could.");
	
	if (pc.hasCock())
	{
		output(" Your [pc.cocksLight] are jutting");
		if (!pc.isCrotchExposedByLowerUndergarment()) output(" out of your [pc.lowerUndergarment]");
		output(" into the bunny-bitch’s");
		if (sceneNum == 1 || sceneNum == 3) output(" ballooned");
		output(" stomach, lathering her bellyfur with [pc.cumColor] pre.");
	}
	
	output("\n\nHer paws caress you from [pc.thigh] to [pc.ass], gripping abusively before reimmersing themselves in your feminine furnace, wriggling playfully past your [pc.girlCumVisc] cleft. With her other hand she pulls you against her chest, drawing you into a passionate kiss, one that’s slow and tentative");
	if (pc.hasPerk("Myr Venom")) output(", and awash with your aphrodisiac saliva");
	output(".");
	if (pc.hasPerk("Myr Venom")) output(" She attempted to give you something soft and gentle, but your curious mod-work belays that intent permanently.");
	else output(" <i>“You’re so good, and you’re gonna be a great " + pc.mf("dad","mom") + "”</i>, she moans; your cheeks raise and your breathing relaxes, finding her words so very pleasant.");
	
	output("\n\nMeanwhile, your [pc.hand] has mapped her beefy cock’s ridges and bumps, and all of its thrumming veins. You cum again when you think about how easily you can recall the shape of her [enemy.cockNoun 0] just after touching it. Her energetic heartbeats add inch after inch to that swelling breeding stick; her hips twist cheerfully to the heat and friction tickling it into full mast, just as unmanageable as as her whipping tongue.");
	output("\n\nFor but a moment you break the kiss to sample the sweat and pre cocktail churning down there. The pirate-slut’s apple-sized balls feel much bigger too, routinely clenching with the formation of another wad of laquine preseed. Between the tight latex and her hazy crotch, your [pc.fingers] sink into her fuzzy nutsack, coming away moist with sweat and smelling of clingy pheromones. The taste of her superlative maleness rocks your world from head to toe, something about it making you writhe with greater need than before.");
	output("\n\nLips barely connected, you try to push into her, to fall on her and take her cock, extinguish all that burning need... But she pushes back, growling ferally into your neck, making it clear that she’s the one in charge. <i>“Hmm-hm,”</i> she grunts, <i>“not this time.");
	if (sceneNum == 1 || sceneNum == 3) output(" I may be pregnant, but that doesn’t mean I can’t satisfy us both!”</i>");
	else output(" Right now, you gotta leave everything to me.”</i>");
	output(" You relent, and you find yourself thoroughly claimed, the motivation to assert vanishing.");
	
	output("\n\nWhy fight for the top when she’s that hard and that invested in your pleasure, too?");
	output("\n\n<i>“There you go, just let me do this!”</i> The extremely aroused bunny exhales so hotly that you can see the air and scent molecules. She unceremoniously stuffs one paw into your [pc.pussy " + hole + "] and her other fingers into your [pc.asshole], driving into your juice and sweat-oozing canals. More kisses pepper your [pc.face], your cheeks, your neck, she even nibbles on your shoulder. <i>“Stars, I wish this lasted forever!”</i>");
	output("\n\nWrapping your arms around her head, you wordlessly follow her lead, giving her room wherever she aims to tease. You’re close enough to grind your gushing slit into her [enemy.cockNoun 0]");
	if (pc.hasCock()) output(", even brushing your [pc.cockBiggestNoun] into it");
	output(". She’s so slippery and shiny that her [enemy.furColor] fur glows in the dim light, and she’s practically see-sawing on your body. Her powerful muscles strain against yours, ropy tendons flexing through fibrous fur and batting beads of perspirant away on the most strenuous high. When she pushes, you push back, enjoying the mutual back and forth of romantic desire.");
	output("\n\nShe’s not even penetrated you, and this foreplay feels like the best sex for light years.");
	output("\n\n<i>“I need you.”</i> Her words are decidedly neutral, but you can hear the huskiness behind it. The rasp... <i>the lust.</i> <i>“Please!”</i> You cry out when her digits bend inside your clenching cunt, soaking her hand in a sheen of tangy wetness. <i>“Yes! I love watching you cum!”</i> she howls, spreading her legs and letting her uniform undo itself the rest of the way. The laquine’s bloated [enemy.cockNoun 0] slaps against you; a thread of pre connects your navel to her tip for a few seconds, sagging down on the spongy pelt of her churning balls.");

	processTime(10 + rand(10));
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestRvsCowgirlNext,[jumperType,hole]);
}
public function boredJumperPregEncounterGoWithRestRvsCowgirlNext(arg:Array):void
{
	var jumperType:int = arg[0];
	var hole:int = arg[1];
	
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var fullWomb:Boolean = pc.isPregnant(hole);
	
	output("<i>“How about you turn around?”</i> she suggests, grinning widely. When you try to stand, her eyes roll back. All the long-stewed fuck-scent between your");
	if (fullWomb) output(" baby-filled");
	else output(" over-productive");
	
	output(" [pc.pussyNoun " + hole + "] billows out, freed from its confines between your [pc.legOrLegs] and the floor. <i>“H-holy shit,”</i> she babbles. Unable to voice the reaction, you can see and feel it in the intense twitching of her cock. The way it jitters makes you think she’s about to detonate! <i>“F-f-f-fuuuck! You need to be fucked so haaard...”</i>");
	
	if (sceneNum >= 2 && !fullWomb) output("\n\nThe twitchy hare giggles. <i>“And I get to put more kids in you, right next to the others? That’s fucking amazing!”</i>");
	
	output("\n\nYou yelp when the pleasure-drunk pirate grips you by the waist");
	if (pc.isNaga())
	{
		output(" and smashes your [pc.pussyNoun " + hole + "] into her crotch. <i>“Mmmf, fuck yeah!”</i> she moans. Your bunny-lover’s [enemy.cock 0] pokes and prods against your groin,");
		if (sceneNum >= 2) output(" the underside of your distended womb");
		else output(" your abdominals");
		output(" vibrating to the tune of her throbbing masculinity, the gaps between the beats decreasing by the second.");
	}
	else
	{
		output(" and finishes twisting you around, smashing your [pc.ass] into her crotch. <i>“Mmmf, fuck yeah!”</i> she moans.");
		output(" The Jumper thrusts her [enemy.cockNoun 0] deep into your wet canyon, shuddering in delight as she adjusts to her burrow. Your tailbone vibrates to the tune of throbbing masculinity, the gaps between its beats decreasing by the second.");
	}
	
	pc.cuntChange(hole, enemy.cockVolume(0), true, true, false);
	
	output(" Her urethra bulges with precum, so much flowing that it squirts and she’s left a moaning wreck, writhing manically and humping as if to cum.");
	output("\n\nThat’d be no good. She’s tearing herself apart, rather than tear you apart.");
	output("\n\nYou lift yourself and fall against her, denying her dangerously close orgasm with the weight of your");
	if (pc.isNaga()) output(" gut. Looking into her dazedly happy eyes, you can see the libidinous fight she’s struggling with.");
	else output(" rear end. Looking over your shoulder into her dazedly happy eyes, you can see the libidinous fight she’s struggling with.");
	
	output(" <i>“Oh... fuck. I’m sorry...”</i> she shudders, hugging you closer, struggling with the orgiastic glee. <i>“It just felt so good, you smell so good and I-”</i>");
	output("\n\nTouching a finger to her lips, you shush the hyperactive slut and remind her what she needs to do. [pc.Hands] on her thighs and her paws firmly on your waist, you bring your pussy to hover over her angrily trembling dick. Cords of girlhoney rain down, breaking against her cumslit. The heat of your sexual slime about throws her out of whack again. <i>“Slowly,”</i> you command, sinking down on the horny rabbit’s foot-long prong.");
	if (pc.hasCock()) output(" She pets your [pc.cocksLight] affectionately, smearing fresh dribbles of dick-goo all over your conjoining crotches.");
	
	output("\n\nYou don’t even notice or feel your pussylips spreading when that glazed cock of hers comes knocking. It doesn’t hurt to take the hermaphroditic outlaw’s dick. It can’t");
	if (sceneNum >= 2) output(", not when she fucked you this full.");
	else output(" not when you’re <i>this ready</i> to breed.");
	
	output("\n\nTo the bouncy bunny’s [enemy.cockNoun 0], your hole is");
	if (sceneNum == 1) output(" like");
	output(" a well-worn glove. Your beckoning pussy is enamored to welcome its mate");
	if (sceneNum >= 2) output(" back");
	output(" where it belongs, unquestioningly and unthinkingly prepared to be stuffed with her dominant dick.");
	if (sceneNum >= 2) output(" Even though your womb is full, the way she left you has made you needier than ever, more abusable than ever.");
	else output(" Your empty womb craves the same filling that she’s enjoying right now.");
	output(" Only the immense load of the laquine’s pent-up balls could hope to quench your thirst.");
	
	if (pc.vaginaCanSting(hole)) output("\n\nAnd your unique alien biology will ensure that she performs at her best. The stingers lining your cilia-filled cunny sting the abundant flesh of her [enemy.cockNoun 0], depositing their venomous payloads into her ultra sensitive schlong. Her tone fluctuates on her passage through your tightening embrace; you swear that makes her male-half bigger, harder...");
	
	output("\n\n<i>Your body needs her to take charge.</i> It flexes and strains errantly around her shaft, expressing her huge cock until it reaches your");
	if (sceneNum == 1) output(" gagging womb.");
	else output(" packed womb.");
	if (jumperType == GLOBAL.TYPE_CANINE) output(" When her knot bops [pc.oneClit] and pops in, an avalanche of girl-lube spills out all around it.");
	else if (jumperType == GLOBAL.TYPE_EQUINE) output(" When her sheath touches down on [pc.oneClit], it’s coated in [pc.girlCumNoun].");
	else output(" When she finally bottoms out, a rain of sparkling pussy-lube floods over her ecstasy-bloated balls.");
	
	if (pc.isSquirter()) output(" You squirt everywhere,");
	else output(" You cum everywhere,");
	if (pc.hasCock()) output(" your [pc.cocksLight] too,");
	output(" curtaining your extremities in a shimmery sheen of obscenity.");
	
	output("\n\nLetting go of your held breath is one of the best things you’ve ever done. You gasp and open your eyes: she’s already starting to pump back and forth. Pressure shifts throughout your loins");
	if (pc.vaginas[hole].looseness() >= 3) output(", your molded cunt masterfully clenching its queen-sized invader.");
	else output(", your tight pussy spreading to accommodate her queen-sized member once more.");
	output(" A coy smile spreads across her blissed out features. <i>“I like it fast but... this is something special, ‘ya know?”</i>");
	
	output("\n\n<i>“Nng...”</i> you wince, feeling a heaviness in your stomach on your backwards bend. Everything stops for that moment, your lover making sure you’re okay before resuming like a snapping spring. [pc.FootOrFeet] firmly planted, you exhale on the fall and inhale on the rise, following her mildly hastening thrusts that carry you upwards and downwards in mesmerizing flows.");
	if (sceneNum >= 2) output("\n\nYour internals cry out under the weight of your baby bag. Deep, muscular throes force groans from your lungs. In an uncomfortable position, soon alleviated, it felt as though your entire body went to sleep then woke up abruptly. Those wooden sensations would have made it impossible to continue had the skilled laquine not found her rhythm.");
	
	output("\n\n<i>“That’s more like it!”</i> the bunny-girl sings, spreading herself out and forcing you upwards until you’re bent horizontal and you can feel her");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(" sheath ricocheting");
	else if (jumperType == GLOBAL.TYPE_CANINE) output(" knot ricocheting");
	else if (jumperType == GLOBAL.TYPE_FELINE) output(" cock barbs brushing");
	else output(" crotch ricocheting");
	output(" off your [pc.clits]. <i>“Ha! Yes!”</i> she screams at the top of her lungs, repeating that motion infrequently.");
	if (sceneNum == 1 || sceneNum == 3) 
	{
		output(" Her round tummy balances you by your");
		if (pc.isNaga()) output(" own.");
		else output(" tingling spine.");
	}
		
	output(" At the ends of all her thrusts you can feel her cum-taut nutsack clenching against your delicate nerves. Those hefty orbs are like the counterweight to it all, dragging you back down into her embrace and lifting you into the air -- nearer to release.");
	
	output("\n\nHips hauling, bunny-cock slams into you with force and slides out with a rapid yank. The force of her crotch against yours reminds you of your place as the");
	if (sceneNum == 1) output(" likely");
	output(" mother of her children. All of your muscles lock and pleasure-seize, your [pc.hips] shivering when she answers your begging with more of what you want -- what you <i>both</i> want.");
	
	output("\n\nWith no warning and now no more speaking, she plows your well-stretched cunt with lustful intent. Her movements are all strained and half-frenzied. She’s fighting against the position you’re in, struggling to keep you afloat");
	if (sceneNum >= 2) output(" while holding herself back just enough that she doesn’t harm your litter.");
	else output(" without giving you time to adjust.");
	output(" You can’t say you’d be doing any better in her");
	if (sceneNum == 1 || sceneNum == 3) output(" own burdened");
	output(" position. The air is muggy with the combined scents of two");
	if (sceneNum >= 2) output(" successful");
	else output(" hopeful");
	output(" breeders, dimming your consciousness just enough to make this all far more textured than a dirty bump and grind.");
	
	if (sceneNum == 1) output("\n\nShe fills you in unique ways, something you thought impossible with that belly in her way.")
	else if (sceneNum == 2) output("\n\nShe fills you in new ways, something you thought impossible after before.")
	else output("\n\nShe fills you in new ways, something you thought impossible with that belly in her way.")	
	output(" You adore the way she fucks you, makes love to you with caresses, kisses, nibbles, pettings, but most importantly, the inward and outward strokes of her [enemy.cockNoun 0]. The reckless stimulation has your glands pushing out thick rivers of juices.");
	output("\n\nMost of her praise doesn’t get through - you’ve been moaning over her for the better part of a minute. The Jumper hasn’t climaxed yet, and it feels like you’re bigger than before. You can sort of feel it in your");
	if (sceneNum >= 2) output(" already packed womb");
	else output(" feminine core");
	output(", a sensation of euphoric pressure...");
	
	output("\n\n<i>“Oh... fuck, I can’t...!");
	if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]!");
	output("”</i>");
	output(" she whines. Drooling uncontrollably,");
	if (sceneNum >= 2) output(" you can feel her fall to her back");
	else output(" she falls to her back");
	output(" with you splayed out on top of her like a table");
	if (sceneNum == 1 || sceneNum == 3) output(", balanced precariously on her precious paunch");
	output(".");
	
	output(" You moan with her, feeling her control the motions of your numb crotch, humping away at you in short bursts - impassioned gyrations always halting a mere inch from your cervix. You lie there taking it, weak hands spread to the floor, struggling to stay awake and upright");
	if (pc.hasCock()) output(" despite the wild flopping of your [pc.cumNoun] shooting [pc.cocksLight]");
	output(". <i>“Y-Yes!!!”</i> she howls. <i>“Yes! Yes!!”</i>");
	
	output("\n\nAgain and again she drills you, panting like a rabid animal. It’s one of the only two facilities she has now. You finally realize where all the strength’s coming from: she’s bent her feet to propel herself on her hindlegs, railing you with all the strength her leaping, breeding hips can muster. You can’t imagine the tension in her muscles!");
	output("\n\nEach stroke is faster and harder than the last, all with such force that her huge nuts are swinging up and down hard enough to hurt, but also hard enough to bounce on either side of your");
	if (pc.balls > 0) output(" [pc.sack].");
	else output(" your spread taint.");
	output(" Thick gobs of pre absorb your fragrant juices like an amoeba, spilling from your conquered cunt into audible ‘plats’ on the floor.");
	
	output("\n\nMindlessly aware she’s getting faster, the bunny");
	if (sceneNum == 1 || sceneNum == 3) output("-mom");
	output(" humps away at you with expert technique and speed that’d obsolete some machines. <i>“Fuck-”</i> she yowls, hammering home so hard that her apples fly up and smack into her pre-bulged urethra. <i>“I-it’s coming!”</i> Her brutal hips slap into yours, and you squeak in mite pain when you feel her [enemy.cockHead 0] rebound off your womb. <i>“I’m gonna cum sooo haaarrrd!”</i>");
	
	output("\n\nThere’s no way you couldn’t feel her cum, and the satisfying flow of it is orgasmic. <i>“Fuhh... I’m-”</i> she drops you, and you fall, gravity wiggling her cock all the way in until you feel the rhythmic contractions of her balls. Her [enemy.cockNoun 0] swells to capacity with warm, thick, sticky, and undeniably virile laquine seed. There’s a moment of pain when her cum-vein’s growth stretches you to a new level of depravity, but the sting is drowned in her torrential, musky flow.");
	output("\n\nAll of the sense-squelching desire you felt before abates in the wake of her gloriously warm goo sloughing inside. Your cum-socket of a pussy is stuffed to the brim with Jumper’s jism");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(", so much that it spills into the unknowable space of her pricksheath");
	else if (jumperType == GLOBAL.TYPE_CANINE) output(", too much for her fat knot to keep in");
	output(". Her balls unload a torrential flood of bunny-spunk into your tunnel that tsunamis out between your legs. Her eyes roll back as a tide of virility pours out, making you revel in embery bliss. Every time she cums now, when another enviable rope of sperm shoots, you flinch and spasm, your drenched walls milking more ropes of creamy seed into itself.");
	
	output("\n\nSo overwrought by her orgasm, you hardly feel yours. Yes,");
	if (pc.isSquirter()) output(" [pc.girlCumNoun] squirts");
	else output(" a deluge of [pc.girlCumNoun] drains");
	output(" in great, floor-webbing amounts, but your");
	if (sceneNum >= 2) output(" maternal mind only thinks about how pregnant she could make you whenever she wants.");
	else output(" mind only thinks about how pregnant she could make you whenever she wants, and you have little doubt in this moment that she’s going to succeed in doing so. Not with all the seed she’s stuffing you with.");
	if (pc.hasCock()) 
	{
		var cumQ:Number = pc.cumQ();
		output(" She caresses your own [pc.cockNoun " + rand(pc.cockTotal()) + "] until you’re moaning hoarse, forcing your [pc.cocksLight] to add a few");
		if (cumQ >= 2000) output(" puddles");
		else if (cumQ >= 1000) output(" waves");
		else output(" ropes");
		output(" of [pc.cumColor] sperminess to the mix of pooling effluent surrounding you.");
	}
	
	output("\n\nShe fucks you right to another superheated orgasm on her jerkily spastic hips, and a powerful sense of emotional satisfaction blankets you. The knowledge that");
	if (sceneNum >= 2) output(" her cock is going to carry your pregnant scent, and that");
	output(" she can please you so well is an overwhelmingly rapturous feeling, that even when her orgasm reduces to a pleasant dribble you’re still wonderfully overpowered by her lagomorphic libido.");
	
	output("\n\nCompletely saturated, not just by rabbit-spunk but by sweat, your brain gives up on controlling your limbs, and you slump on top of the spent slut");
	if (sceneNum == 1 || sceneNum == 3) output(", mindful of her own pregnant gut.");
	output(" Her idle paws roam weakly across your [pc.skinFurScalesNoun]. <i>“Ohhh... That was the fucking best sex ever, cutie...”</i> she purrs. <i>“Just... a little nap, okay");
	if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]");
	output("”</i>?");
	if (!pc.isNaga())
	{
		output(" You do your best to turn around with her dick lodged inside");
		if (jumperType == GLOBAL.TYPE_CANINE) output(" by the knot");
		output(".");
	}	
	output(" She cradles your head into the warmth of her neck");
	if (pc.isNaga()) output(" while you wrap your [pc.leg] around her lower half");
	output(".");
	output("\n\nIt’s not hard to fall asleep here...");
	
	processTime(10 + rand(10));
	pc.loadInCunt(enemy, hole);
	pc.orgasm();
	sweatyDebuff(1);
	if (pc.hasCock()) pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestRvsCowgirlNext2,jumperType);
}
public function boredJumperPregEncounterGoWithRestRvsCowgirlNext2(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var firstName:Boolean = boredJumperSetSteelesName(jumperType);
	
	output("When you wake, you’re wrapped in the loving arms of your Jumper, and she’s already up. Before you can say or do anything, she licks your cheek and kisses you. <i>“Hey.”</i>");
	output("\n\n<i>“Hey yourself,”</i> you smile, seeing that you’re sitting upright against the wall with her. The place reeks of sex, and a lot of the floor and sheets are dirtied with evidence of your fun.");
	output("\n\n<i>“You have no idea how much I needed that,”</i> she grins, murmuring into your nape. <i>“I lo-”</i>");
	output("\n\nShe stops, shakes her head, and looks sad. <i>“Nevermind... better I not say something like that. I’ll say that if I ever get out of here, and come raise the kids with ‘ya. Maybe spend a week in the bedroom while we’re at it...”</i> she swoons.");

	if (firstName)
	{
		output("\n\n<i>“Hey, before you go, I was wonderin’...”</i> she starts, stroking your [pc.face]. <i>“If we do this again... is it okay for you to tell me your name? Not your whole name just... something to say?");
		if (sceneNum == 1) output(" You’re the father to our kids ‘n all, so...”</i>");
		else if (sceneNum == 2) output(" You’re the mother to our kids ‘n all, so...”</i>");
		else output(" You’re a mother to our kids ‘n all, so...”</i>");
		
		output("\n\n<i>“[pc.name], ”</i> you say");
		if (pc.isBimbo()) output(" cutely");
		else if (pc.isBro()) output(" stoically");
		else if (pc.isNice()) output(" happily");
		else if (pc.isMischievous()) output(" impishly");
		else output(" coldly");
		output(" making her react with glee.");
		
		output("\n\n<i>“[pc.name]!”</i> she chirps. <i>“Great! I’ll be able to find ‘ya whenever, [pc.name]. Come back often, ‘kay? But if you think you’re gonna give birth... Well, try not to put yourself in danger, alright?”</i>");
		output("\n\nUnfortunately, you can’t make promises like that, not in a galaxy like this. You’ll do your absolute best though, and that satisfies her. When you reluctantly disentangle, there’s an outpouring of excess fluid that follows you to your belongings. One wave and belly caress later, you’re back in the stairwell and making your way into Zheng Shi again.");

	}
	else
	{
		output("\n\nAs much as you’d like to stay, you do have to get going. When you tell her that, she reluctantly disentangles, and whatever excess fluid left is now reduced to a low outpour that follows you to your belongings. <i>“Hey [pc.name], come back sometime okay? I’ll be able to find you.");
		if (sceneNum >= 2) output(" Just try not to have the kids on the station, alright? It’s too dangerous.");
		output("”</i>");
		output("\n\nYou can’t make any promises. One wave and belly caress later, you’re back in the stairwell and making your way into Zheng Shi again");
		if (sceneNum == 1) output(", fully expecting that your cum-bloated stomach is going to remain, transforming into a laquine baby-bloat");
		output(".");
	}
	
	processTime(60 + rand(60));
	restHeal();
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//sneak bb
public function boredJumperPregEncounterGoWithRestSneakBB(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	output("Yeah. You’re not sure who’s in for a greater surprise: the Jumper, being fed an extremely potent fertility drug... or <i>you,</i> facing down the rutting beast she’s sure to become. A savage and feral animal overwhelmed with the most primitive need of all: to breed.");
	output("\n\nSomething, as you understand, her race is <i>very good at.</i>");
	
	if (flags["BJUMPER_REST_MENU"] == 1)
	{
		output("\n\nShe looks confused when you disengage the cuddles and meander towards your things just a few steps away. You don’t offer up a good explanation, but she’s too heavily burdened to care. You cheek the featureless drug before walking back, almost breaking face.");
		output("\n\nSubsumed by mischief, you seat yourself next to the bewildered Jumper, your change in behavior too obvious for her to ignore. The laquine opens her mouth to speak, and then you make your move. Grabbing the musky herm by the head, you slide the capsule into her maw, thrusting it to the opening of her throat while pushing inwards.");
		flags["BJUMPER_REST_MENU"] = 0;
	}
		
	if (flags["BJUMPER_SEX_MENU"] == 1)
	{
		output("\n\nYour lover looks confused when you stand and meander towards your packs, subsumed with mischief. Although you offer no reasonable explanation for your curious actions, she’s too gravid to make a fuss.");
		output("\n\nYet. You dig out the featureless drug and cheek it.");
		output("\n\nAfter seating yourself next to the bewildered bunny, she opens her lips to ask what you were up to, and that’s when you make your move. Grabbing the roiled rabbit by her head, you force the capsule into her maw and push it to the opening of her throat, tilting her head backwards.");
		flags["BJUMPER_SEX_MENU"] = 0;
	}	
	pc.destroyItemByClass(BreedersBliss);
	
	output("\n\nThere’s a gargle and a grunt, but you know the randy pirate just swallowed it");
	if (pc.hasLongTongue()) output(" - the lancing of your long tongue helped trigger her reflex");
	output(". She jumps to her feet when you pull away, clutching her neck and looking at you with more fright than anything else. Her vision seems to swim; both [enemy.eyeColor] eyes twitch and roll about in their sockets, adjusting to the onset of drug-enhanced feracity.");
	output("\n\nYou just purposely inflicted an addled, pregnant laquine herm with something sure to transform her pregnant sensitivities into acute, keenly knowable sensations that defy description. Her disturbingly muted wails barely reach you. Frantically, the [enemy.furColor] hare claws at herself in a fight with a bulge to end all bulges, desperate to tear free of a uniform that’s becoming <i>much too hot under the collar.</i> ");
	output("\n\n<i>“Ahh- What was...? What did you-”</i> she starts, voice leaping from tone to tone.");
	if (pc.isBimbo()) output("\n\n<i>“Ohhh, ‘ya know, just getting you ready to fill me up too!”</i> You giggle, bouncing in place. <i>“What better w... wuh...”</i> Your voice trails off, something more important captivating your senses.");
	else if (pc.isBro()) output("\n\n<i>“Getting you ready to do your job. If only...”</i> Your voice trails off, something more important captivating your senses.");
	else if (pc.isNice()) output("\n\n<i>“I gave you a fertility drug. You won’t go into heat... but you will go into rut. And that’s all I want,”</i> you smile cutely, but it’s quickly wiped from your [pc.face] when something captivates your senses.");
	else if (pc.isMischievous()) output("\n\nLaughing, hands on your hips, you tell her, <i>“A fertility drug, babe! I was beginning to envy what you’ve got going on there. You don’t mind making sure I get what I deserve, right?”</i> You don’t get an answer. Instead, something all-powerful captivates your senses.");
	else output("\n\nYou nod slowly, something working its way into your brain and stealing words from you. <i>“Just... a fertility drug. You’ll be... You’ll...”</i> You can’t finish...");
	
	output("\n\nThe unique musk she transmits is a smell you had thought you were adapted to by now, that it was simply a background scent your nose was trained to ignore by proximity.");
	if (pc.libido() >= 75) output(" You were dead wrong. It’s a fact that thrills you, that surrounds you with glee. The only parts of your mind that seem to fire now are the ones telling you that you’re in for the fucking of a lifetime, and your mouth automatically slackens in reverence.");
	else if (pc.libido() >= 33) output(" You were dead wrong, and there’s nothing about that you can dislike. You’re only sure of one thing now: your new quest in life is to drain her balls in any way she wants you to.");
	else output(" You were dead wrong. Even though you’re typically in control of your lusts, you are incapable of denying her sudden biological impulsions. Suddenly... the thought of sucking a ball-draining load into your belly is your new quest in life.");

	output("\n\nAn unseeable force reaches out across the short distance between you; an invisible hand latches onto your libidinous brain with <i>absolute authority.</i> Ineffable shocks surge through your body like gunshots tearing through your soul. Sight crossing, your heart leaps, and your [pc.pussies] react");
	if (pc.vaginaTotal() > 1)
	{
		output(" by squirting");
		if (!pc.isSquirter()) output(" Could they always do that?");
	}
	else
	{
		output("s by squirting.");
		if (!pc.isSquirter()) output(" Could it always do that?");
	}
	if (pc.hasCock()) output(" You’re also... erect, right? Your [pc.cocksLight] are dribbling freely, but regardless of their size, they could never matter as much as hers does right now.");
	output(" Your own sight begins to blur. ");
	output("\n\nIn a moment of uncomfortable silence, an all-natural, sexy, and hyper-magnified smell wafts through your nose.");
	output("\n\nAnd you fall to your knees, supplicant to its dominating effects. A lump forms in your throat, preventing you from speaking. Your mouth doesn’t just water, it foams; spit rains down your chin, polishing your [pc.lips] to a pleasing shimmer. You were trying to be playful about this, but some primeval force wants nothing to do with your practical joke - your whole body is shivering and seizing compulsively.");
	output("\n\nWhy? Your [pc.eyes] tell it to. ");
	output("\n\nYour pregnant lover’s [enemy.cock 0] grows to mammoth size, nearly tearing her suit apart with the massive tent it’s pitching. It’s still over a foot long, and yet it seems so much bigger than that. Behind the package-defining latex her distorted dong throbs; the pendulous bulge wiggles left and right until, one tightening heartbeat later, it breaks the zipper and reveals itself. Sealed scents are liberated in a visible miasma that you can <i>taste.</i> The veins on her");
	if (jumperType == GLOBAL.TYPE_HUMAN) output(" swollen");
	else output(" inhuman");
	output(" member are a stark contrast to the rest of the shaft, something you greatly approve of.");
	
	output("\n\nInfatuated, you fixate longingly on her turgid length, unable to so much as think, and without any motivation to look away. You cum a little bit again when you view her bliss-fattened balls, two furry globes grown well into cantaloupe size coming out <i>swinging</i>, imagining the ultra virile load building up inside. The whimpering rabbit finally divests herself of the sweat-soaked latex, revealing her gorgeously rounded belly, her beautifully soaked curtain of [enemy.furColor] fur, but most importantly, the whole of her [enemy.cockType 0] rod, rippling majestically under the effects of induced rut.");
	output("\n\nYour mate is glowing in sexual splendor...");
	output("\n\n<i>“W - why did you give me that...?”</i> She mumbles incoherently, walking forward, her drooling [enemy.cockNoun 0] wobbling left... right... you follow it devotedly, gasping as you receive more of her amplified signal. <i>“You’re gonna...");
	if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]...”</i>");
	else output(" cutie...”</i>");
	output(" Her rubbery feet stamp across the insufferable gap between you, bringing that twat taming totem closer to your protruding lips. Precum flows like a raging river, matching its wielder’s equally raging horniness. <i>“You’re gonna take care of this!”</i> Her dick is all you can visualize and worship, and that [enemy.cockColor 0], pre-lubed obelisk is drawing nearer to you... nearer to fulfilling its only purpose. ");
	
	output("\n\nThere’s no backing out. The words for such things have been filtered out of every language you know. The glistening thickness of it, the heaviness at which it bobs and sways... you can’t resist in any fashion. Your eyes are completely locked on, never to let go, never to stop feeding the desire arousing your overheating body. Touching yourself is a physiological need, and it’s preparation you’ll need to take that veiny beast.");
	output("\n\nYou have no idea what will happen when she touches you - when <i>it</i> touches you... considering her mind-numbing odor was capable of this. Her hoarse pants cease when she’s only a single step away. In the deepest recesses of your mind, one simple, inelegant truth is clear, one that makes the edges of your mouth quirk upwards as you stare up in a head-spinning stupor:");
	output("\n\nBreeding season has just begun.");
	
	processTime(5 + rand(5));
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestSneakBBNext,jumperType);
	
}
public function boredJumperPregEncounterGoWithRestSneakBBNext(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	output("<i>“You wanna get pregnant that bad, huh?”</i> she grins, floppy ears lifting in delight. <i>“A hundred kids, maybe a thousand, I’ll give you as many as you want!”</i> From here, her distended belly, and what’s past it, seem like a mirage compared to the eye-crossing dazzle of her [enemy.cockNoun 0]. <i>“Gonna fuck you so full of babies!”</i> You’re moist and dripping, completely helpless under the onslaught of her ramped up musk. <i>“Could’a done that any other time. Just wanted to make sure it took, right? Givin’ me those eyes... fuck...”</i> She reaches down to grab your head, and you shake jitterily, sweat flinging off your [pc.skinFurScalesNoun].");
	output("\n\nThe rutting rabbit tilts your face upward, an expression of excitement peering down past her spherical tummy. <i>“Get me ready then, sweetness,”</i> she hefts her unbound mast and lays it on your nose, up between your eyes and past your forehead, presenting you with what might be the fattest, readiest cock on Zheng Shi. The touch of the pirate-bun’s slab of pre-swelled");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(" horse-");
	else if (jumperType == GLOBAL.TYPE_CANINE) output(" doggie-");
	else if (jumperType == GLOBAL.TYPE_FELINE) output(" kitty-");
	else output(" ");
	output("meat short-circuits your mind. <i>“Suck it all out of me, [pc.raceCuteShort]-[pc.guyGirl]!”</i>");
	
	output("\n\nHer gorgeous cock is intimidating, but your [pc.tongue] is eager to act, lapping at the [enemy.base] and trailing upwards. The taste of her cloth-destroying dong is so strong that it makes you slobber like a starving beast. Gathering up every supremely tasty drop is an impossible task, so you spend your time trying to polish her");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(" veiny pole with spit, all the while captivated by its permanent shine, fingering the unknowable space of her penile sheath.");
	else if (jumperType == GLOBAL.TYPE_CANINE) output(" pole with spit, all the while captivated by its permanent shine, squeezing her knot like a dutiful fuck-slave.");
	else if (jumperType == GLOBAL.TYPE_FELINE) output(" barbed pole with spit, all the while captivated by its permanent shine.");
	else output(" pole with spit, all the while captivated by its permanent shine.");
	
	output("\n\nBunny-thighs thrust forward, slapping that swelled nutsack to your nasal openings. Ballmusk plunges through your flared nostrils, the raw, electric effect completing your fall into a ditch of depravity. <i>“F-f-fuck....!”</i> The Jumper’s legs seem to ‘hop’ manically at an increasing pace until she humps upward, clutching to your head while she rubs her sack-straining fruits across your [pc.face]. <i>“It’s too hoooottt!”</i> The sheer weight to her spunk-globes makes you sink a little deeper, feeling draining from your [pc.legOrLegs] to situate you further beneath her intoxicating maleness.");
	output("\n\nAn ambrosial soup collects at the underside of her gurgling nuts, something that you slurp up loudly and enjoyably. Unbidden, your thirsty tongue lashes out to lick at that juice-glazed fur, circling one and then its twin");
	if (pc.hasLongTongue()) output(", wrapping around both at once, curling tight, and flicking upwards to apply a soft pressure that your soon-to-be bunny-sire delights in");
	output(".");
	
	output("\n\n<i>“Ohh fuck, you gifted ball-slut, you! Whatever you gave me is making me feel like I haven’t cum in months! You’re gonna have so many kids and then we’re gonna do this all over again! How’s that sound?”</i>");
	output("\n\nPhallic obsession overtakes you, cradled as you are by her overcharged rod. You don’t taste any amount of salt: whatever it is, you can’t get enough of it, and the more you lick that layer clean the more you writhe and groan into her churning pouch, unable to decide if her balls have a better flavor than the taste of her beefy cock. <i>“Mmmm,”</i> the bunny-slut moans, <i>“you’re really working for that creamy treat, aren’tcha? Yeah, better I cover you in jizz, that way everybody else knows exactly who you belong to. We’re gonna be mates for life, you and me, smelling like the other for all time!”</i>");
	output("\n\nIn only a minute you have her scrotum wearing dangling ropes of spit like a chandelier wears lights. Those slippery spheres are shining with your obedient efforts, and still she continues to hump at your face, smearing them across your reddened cheeks in an unthinking desire to rut. When she does that, a heavy thickness builds in [pc.eachPussy].");
	output("\n\nIt’s not orgasm. Whatever it is, there’s some kind of pressure building the more you swab those weighty testes. You clean her jewels until you’re fully submerged by a wave of expectant euphoria, thinking deeply about all the creamy loads you’re going to receive soon.");
	output("\n\nOn the next particularly ferocious thrust, you slide past her balls and end up nose-first in her child-filled twat, eyes rolling back right away from the intense heat maintained in that zone of sluttery. It’s your first real taste of what she’s feeling, and it’s a fine sample of peak horniness. What it does to you is otherworldly: this is what you’re going to smell like, this is what you’re going to feel... all when she finishes making you <i>her mate.</i>");
	output("\n\nYou now understand just what was building in your womb. The stress peaks; there’s a sudden drop - hollowness... and an egg releases. <i>Her musk is powerful enough to induce ovulation.</i>");
	output("\n\nYou’re caught off guard by her sudden withdrawal and oral penetration. The rich odors tickling your nose dull the pain of that herm-prick spreading your jaw wide and pinning your tongue");
	if (pc.hasLongTongue()) output(" outside your lips, like a wiggling carpet");
	output(". There’s no warning and no time to adapt, she’s reaming your facial fuckhole with all she’s got.");
	if (flags["USED_SNAKEBYTE"] != undefined) output(" You almost want to stick her with throbb just to test the limits of your enhanced dick-sucking capabilities!");
	
	if (pc.canDeepthroat())
	{
		output("\n\nThe lack of a gag reflex is making it a lot easier than it would be, though.");
		if (pc.isTreated()) output(" Empathy bubbles in the back of your mind like her [enemy.cockHead 0] pounds the back of your unresistant throat. This is exactly what you wanted from her! To be used, to be the only one she can go wild on!");
		if (flags["USED_SNAKEBYTE"] != undefined) output(" Your ribbed throat muscles clench and twist around her [enemy.cockNoun 0], begging her to unload in your unresistant throat.");
		output(" Both of the laquine’s thumbs pressing roughly into the supple skin below your eyelids, firmly gripped to your cock-socket of a head. Her uncaring ministrations work up tears in your eyes.");
	}
	else
	{
		output("\n\nTears bead at the corners of your eyes under her jerkily working hips,");
		output(" both of the laquine’s thumbs pressing roughly into the supple skin below your eyelids, firmly gripped to your cock-socket of a head. Her uncaring ministrations force you to shut your eyes.");
	}	
	output(" Those leakages aren’t driven by pain, but by pride, by an emotional state that accepts its place as the willing cum-dump <i>for the pirate you impregnated.</i>");
	
	output("\n\n<i>“Fuck... just thinking about us both being pregnant on each other’s cum, holy shit... We’re gonna be so useless, just rubbing up on each other all day, kissing and making out... what the hell are we gonna do?”</i> She laughs, warm wet trickles of preseed rolling into your belly. You feel used, like you’re not going to be a mom so much as you are going to be her breeding bitch.");
	output("\n\nThat’s fine. Her fragrant balls are slapping into your chin every second rather than one and a half now. Your own needs are a distant and irrelevant matter compared to the");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(" horse-");
	else if (jumperType == GLOBAL.TYPE_CANINE) output(" doggie-");
	else if (jumperType == GLOBAL.TYPE_FELINE) output(" kitty-");
	else output(" swollen ");
	
	output("meat pistoning into your spasming throat. This dominant futa-bunny is your ferocious mate, your tall, furry she-stud, whose aura of rut has already redefined your concepts of belonging. Your position below her and hers above you is the natural state of things, and perhaps the place you were always meant to be.");
	output("\n\nEach cock-filled swallow provokes a faint and lovely twitch in your [pc.clits]. <i>...You can’t wait for her to use your [pc.pussies] the way you used hers...</i>");
	output("\n\nAn ecstatic giggle lurches up from your lungs. You moan against the laquine’s [enemy.cockNoun 0], its thick heartbeat breaking up your vocal vibrations into a dick-pleasing tempo you’d be hard pressed to repeat. An innocent bat of your eyelashes impels the Jumper to pick up the pace; messy thrusts flatten out the creases in your cock-conquered muscles in her drive to permanently reshape your interior.");
	output("\n\nThe horse-bunny’s bulky, seed-sloshing nuts twitch, and your [pc.hands] move to fondle those rapidly-brewing cum-tanks. No doubt the drug has given her the volume and quality she needs to knock up every pussy on station.");
	output("\n\nLack of oxygen dizzies you until all you can think in are images. You wonder how you must look, perhaps no different than a pleasure slave some rough and rugged pirate king keeps on hand to use like a condom. The thought that your laquine lover’s balls are going to be draining <i>just for you</i> is an immensely pleasant one, one that makes you look up to her blissed out muzzle and smile even wider around the [enemy.cockNoun 0] disappearing inside you.");
	
	if (jumperType == GLOBAL.TYPE_EQUINE) output("\n\nShe begins to properly flare, and you’re ripped from your entranced state by a sudden loss of breathing. You choke around her cock, naturally trying to pull away, only to be shoved insistently towards her crotch, your nose buried in her sheathfolds.");
	else output("\n\nHer [enemy.cockHead 0] inflates, and you’re ripped from your entranced state by a sudden loss of breathing. You choke around her cock, naturally trying to pull away, only to be shoved insistently towards her crotch, your nose buried in her soupy bellyfur.");
	output(" <i>“Lemme give you a taste of what bein’ pregnant’s like, babe!”</i>");
	
	output("\n\nAs much as you try to cooperate with her, your vision dissolves. Being controlled in such a way has been far more pleasurable than you would have ever given it credit for. You shudder rapturously, ravishing her cock with as many licks and jerks as your brain will allow, gurgling delirious when you realize that her [enemy.cock 0] has ballooned so much in your neck that it has totally sealed your noticeably bulged out throat.");
	output("\n\nCheeks hollowing, you unconsciously suck harder, the puddling preseed making way for the first shot of laquine cream. Heavy nuts bounce and fluctuate against your chin; quivering hips fighting to slide deeper towards your stomach. Cum shoots into your body without warning, the strain it causes to her spunk-vein making you whine and sag, so close to passing out.");
	if (pc.isChestExposed()) output(" Your belly bloats several inches per shot");
	else output(" Your clothes make room for your expanding belly");
	output(", until the underside of your navel touches down on the deck.");
	
	output("\n\nIt’s easy to think of your filling as a dream with the ease at which she pumps you full of herm-goo. The eruptions of her rod are visceral and legendary. Fresh, tube-clogging ropes plop into your stomach, their impacts making you flinch the more space they occupy inside. High-pitched shrieks and cute groans fill your [pc.ears], comforting you as you choke on laquine cock and drown in excess sperm. Cummy strands spill your nostrils with nowhere else to go, the corners of your mouth stretched so thin that only tiny droplets make it through.");
	output("\n\nIt’s no surprise that you climax with the Jumper, either. You’re thrashing now, spraying [pc.girlCumNoun] from");
	if (pc.vaginaTotal() > 1) output(" each of your holes");
	else output(" your hole");
	output(", but the two hands on either side of your temple hold you steady, making sure that for each shudder you offer you’re presented with another batch. Once you begin to pleasure-seize, she finally relents, much-needed air flowing back into your lungs through the collected jizz-funnel.");
	
	output("\n\nBut she’s still cumming, and those copious expulsions are splattering on your head");
	if (pc.hasHair()) output(", mixing into your [pc.hair],");
	output(" and bathing you in endless orgasm. You fall forwards, all the laquine load outside your stomach pouring out in a white pillar. Allotted only five coughs, two hands grab you by the shoulders and push you to your back");
	if (!pc.isCrotchExposed()) output(", tearing you from your clothes on the way");
	output(". ");
	output("\n\nShe cups your [pc.pussyNoun " + pc.findEmptyPregnancySlot(1) + "] and squeezes, your juices fountaining into her paws. <i>“Now, let’s get some kids in there, ‘kay?”</i>");
	
	processTime(10 + rand(10));
	pc.loadInMouth(enemy);
	pc.applyCumSoaked();
	pc.orgasm();
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestSneakBBNext2,jumperType);
}

public function boredJumperPregEncounterGoWithRestSneakBBNext2(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	
	var hole:int = pc.findEmptyPregnancySlot(1);
	
	if (pc.isBimbo()) 
	{
		output("‘Kay!");
		output("\n\n");
	}
	output("The musky laquine licks her lips, twinkling [enemy.eyeColor] eyes boring a hole through your crotch. As it is, she’s parting the lips of [pc.eachPussy] through mental willpower. The bunny’s brain lights up with every secretion");
	if (pc.isNaga()) output(" from your quim");
	else output(" between your hiked up [pc.legsNoun]");
	
	output(", both floppy ears wobbling");
	if (pc.balls > 0) output(" as she moves your [pc.sack] out of the way -- it was like a silly hat obscuring her prize");
	output(".");
	
	output("\n\nSmooth, vaginal skin glistens, beginning to flood the longer it’s stared at. Ambrosial, feminine girlspunk puddles");
	if (pc.isNaga()) output(" on the floor.");
	else output(" in the crack of your [pc.ass].");
	
	output(" [pc.VaginaColor] flesh ripples fascinatingly, bracing itself in the presence of her [enemy.cock 0], all but begging for a boiling kiss. From the incredibly warm position you’re lying in, she seems frozen in time. Your bare, dewy mound");
	if (pc.vaginaTotal() > 1) output("s");
	output(" dribble sweat and femlube in supplication, quelling her once-rapacious urges.");
	if (pc.vaginaTotal() > 1) output("\n\nDeep down, however, you know that they’re only <i>aggravating them.</i>");
	else output("\n\nDeep down, however, you know that it’s only <i>aggravating them.</i>");
	
	output("\n\nHer paw lands on your vaginal hood again, stroking those pretty nerves, swirling around [pc.oneClit]");
	if (pc.vaginaTotal() > 1) output(" and then the rest");
	output(". Solid yanks force out");
	if (pc.girlCumQ() >= 1000) output(" waves");
	else output(" small shots");
	output(" of sapphic [pc.girlCumNoun]. Her furry digit is swimming through your slick cuntlips, wandering your hypnotic folds. The she-rabbit hyperventilates, breaths coming out rapid, savoring the moment before she dives into your sweet and supple femininit");
	if (pc.vaginaTotal() > 1) output("ies.");
	else output("y.");
	
	output("\n\n<i>“Please...!”</i> You can’t help yourself.");
	output("\n\nWide-eyed with hunger, the cunt-captivated pirate swoons at the heady, fertile combination of sweat and pussy. Her paws fall to your");
	if (pc.isNaga()) output(" outer thighs, holding tight");
	else output(" inner thighs, spreading wide");
	output(" until your muscles burn. Her tongue lolls from her mouth, flicking at the air and tasting like a snake; her soaking-wet muzzle lowers tentatively... then, she lunges.");
	
	output("\n\nPowerful lapine cheek-muscles spread and hollow around your [pc.pussyNoun " + hole + "], her hungry tongue worming its way in from the bottom of your leaking honeypot. Sprawled out, you can do nothing to control the pleasure, only ride out the lurid motions of your fuck-drunk partner");
	if (pc.hasCock()) output(" while your [pc.cocksLight] throb uselessly");
	output(". Whiskers tickle your");
	if (pc.vaginas[hole].type == GLOBAL.TYPE_EQUINE || pc.vaginalPuffiness(hole) >= 2) output(" puffed");
	output(" vulva, knocking your muscles upwards to trap her face in your sodden box");
	if (pc.vaginaCanSting(hole)) output(", her intruding organ being stung by every tendril it disturbs until she’s as wet as your overaroused passage");
	output(".");
	
	if (pc.vaginas[hole].type == GLOBAL.TYPE_EQUINE || pc.vaginalPuffiness(hole) >= 2)
	{
		output("\n\nYour chubby vaginal exterior gives the parched bunny plenty to work with. Her hands glide down, coming to rest at either side of her muzzle, thumbs rubbing insistently at your thick pussylips. As fat, swollen, and plumped as your shimmery delta is, her face is easily lost in its slick and juicy embrace. There’s too much engorged animality for the Jumper to adore! Her tongue undulates in small, stimulating circles, and the shuddering in her body makes you think she’s on the verge of geysering.");
		output("\n\nIf she did, you’d be shooting first anyway.");
	}
	
	output("\n\nPaws winding around your waist now, the flexible futanari is shouldering your legs so that she can submerge herself in your delicate nethers. Fluffy cottontail fluttering in joy, her tongue coils, slides, licks, and laps, beating on");
	if (pc.vaginaTotal() > 1) output(" all");
	output(" your [pc.clits] like an expert drummer. Daggers of pleasure have you arching upwards by the center of your superheated loins again, perfectly counterbalanced by her moisture-seeking maw. You moan with her, cooing praises as your crotch goes from hot and gushy to cold and begging for touch when she comes up hissing for air.");
	
	if (pc.clitLength >= 1) output("\n\nThe abnormal size of your girlboner provides the laquine ample opportunity to practice her clitoral fellatio. Sweet suckles begin at the tip, old heat rising to make way for all new aching arousal. Gushy wetness splatters her chin in a fine sheen of lady-like excitement as her [enemy.lipColor] lips their way down your too-large pleasure-pole. When she pulls back, the raw sensation of your spit-shined clitty changing temperatures overwhelms you.");
	if (pc.clitLength >= 4) output("\n\nAnd then, she’s diving back down, deepthroating herself with your distended pussyflesh. Her tongue swiftly adapts to the shape of your dangling, comically inflated clit, sliding around the underside in dizzying sensuality, suckling mouth pursing and pulling tighter. You cum again, fearing for a second that with how badly it aches and throbs, you might ejaculate through it.");
		
	output("\n\n<i>“Yessss,”</i> she moans, wiping her face left and right on your [pc.pussies] like a mop. Her cheek-fur absorbs all of your discharged girlmusk like a sponge, until the excess flows off her slutty face.");
	if (pc.hasTits() && pc.hasCock()) 
	{
		output("\n\nIf you can’t affect her, you can provide corporate attentions to your [pc.breasts] and [pc.cocksLight]. It’s understandable that you have to jerk yourself, maul yourself");
		if (boredJumperBreastFeedOK()) output(", sprinkle [pc.milk] all over your chest until you’re painted [pc.milkColor]");
		output(", because the roiled rabbit only has one target in mind. Desperate strokes and numbness-inducing nipple-tweaks have you moaning at greater volume, dribbling [pc.cumColor] pre all over your dick and the hapless hare’s hair.");
	}
	else if (pc.hasTits())
	{
		output("\n\nAll you can hope to affect are your [pc.breasts] and the shining nipples capping them. Your fingers " + (pc.hasErectNipples() ? "curl around the stiff [pc.nippleColor] nubs" : "pinch at the engorged [pc.nippleColor] organs"));
		if (boredJumperBreastFeedOK()) output(" dripping with [pc.milk]");
		output(", squeezing them upwards in alternating yanks that change their malleable shape in pleasant ways");
		if (boredJumperBreastFeedOK()) output(" and shooting thin arcs of [pc.milkVisc] mammary-meal into the air");
		output(".");
	}
	else if (pc.hasCock())
	{
		output("\n\nThere’s nothing you can do but jerk your [pc.cocksLight]. Numbness prevents you from doing much other than map out the rigid veins along the length");
		if (pc.cockTotal() > 1) output("s");
		output(" of dick you have. Your [pc.arms] tense up to keep your freely dribbling member");
		if (pc.cockTotal() > 1) output("s");
		output(" gripped, fingers coiling and stroking around [pc.eachCockHead]. Desperate strokes induce a numbness that makes you moan louder, closing in on a messy, [pc.cumColor] release that will coat you more than her in this position.");
		output("\n\nYou’d do anything for that exact scenario.");
	}
	output("\n\nForceful ejaculations tsunami out from your sloven slit. Quakes ripple through your [pc.pussies]. On the edge of dreamy release, your whole body quivers on the verge of happiness. She’s so focused on your vagina that you mentally beg for rougher and rougher treatment. Twitchy nose sockets deep inside your honeypot, and when that searingly hot appendage collides with your contracting interior, you cry out in overwhelmingly erotic release.");
	output("\n\nThe Jumper holds you in place, not the other way around. You cum and you cum, a powerful squirting climax milking into her slobbering maw. Breeding mode doesn’t help her keep up with your sheer output, though she at least avoids drowning");
	if (silly) output("- good work, Raiden... -");
	output(" before your output reduces to a few mouth-filling drizzles. In the wake of such a powerful orgasm, you writhe helpless in the aftershocks as the laquine mounts you");
	if (pc.isNaga()) output(" fingers digging into your midsection.");
	else output(" forcing your [pc.legsNoun] over your head.");
	
	output("\n\n<i>“Can’t stop there, babe!”</i> she sings, flopping her titanium tool on your [pc.belly]. <i>“Mmmm, fuck! I’ve got the hardest boner in the galaxy right now. Could probably beat a robot to death with this thing!”</i> She lifts it up and lets the proverbial hammer fall on your navel. You can’t come up with any reasonable disagreement to her comparisons. <i>“Probably knock a planet out of orbit with this cock. My head’s kinda clearin’ up... but not before I show you not to fuck with a pirate-bunny!”</i>");
	output("\n\nBlooming across your face is a lopsided smile. You look up to the [enemy.furColor] Jumper, fingers curling.");
	if (pc.isBimbo()) output(" <i>“You call yourself a bunny, and you’re clearing up just from a blowjob? Please!”</i> you playfully taunt.");
	else if (pc.isBro()) output(" <i>“You haven’t started and you’re already tiring?”</i> you smirk playfully.");
	else if (pc.isNice()) output(" <i>“Really? Clearing up before you’ve shown me my place?”</i> you smile impishly.");
	else if (pc.isMischievous()) output(" <i>“Hard to believe that after all that you’re giving up! C’mon, you can’t be losing all your strength!”</i> you laugh.");
	else output(" <i>“Guess those kids are too heavy for you. Guess you won’t be knocking me up properly,”</i> you say cold enough to sting.");
	
	processTime(10 + rand(10));
	enemy.girlCumInMouth(pc);
	pc.orgasm();
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestSneakBBNext3,[jumperType,hole]);
}
public function boredJumperPregEncounterGoWithRestSneakBBNext3(arg:Array):void
{
	var jumperType:int = arg[0];
	var hole:int = arg[1];
	
	clearOutput();
	showPregBoredJumper(true, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var virgin:Boolean = pc.vaginas[hole].hymen;
	var hole2:int = -1;
	var hole3:int = -1;
	
	output("<i>“That’s where you’re wrong, sweetness!”</i> she grins happily, eyes crossed with lust. The rutting rabbit withdraws and aligns her [enemy.cockHead 0] with your [pc.pussyNoun " + hole + "], drenching it in your bucket-filling fluids. With all the braced energy of a stallion, the Jumper lunges into your [pc.pussyNoun " + hole + "]. <i>Lunge</i> is an inadequate description for what really happened: you were ferally skewered by a laquine at the top of her sex game.");
	
	pc.cuntChange(hole, enemy.cockVolume(0), true, true, false);
	
	output("\n\nPerception drains from your world, the fleeting moments of time taking too long to catch up to your mind. You didn’t even feel it, and then suddenly you did, and suddenly, you feel her <i>everywhere</i> inside.");
	if (pc.vaginas[hole].looseness() >= 3)
	{
		output(" Although you’re no stranger to great insertions, your inherent looseness does little to dull the pain");
		if (silly) output(" of having what amounts to a tree trunk shoved in your snatch.");
		else output(" of your feminine space being filled so unexpectedly.");
	}
	else output(" A grimace twists your face, all your tight muscles struggling to right themselves around the [enemy.cock 0] inhabiting every free inch.");
	
	output("\n\nWhen cummy pre squirts against your cervix, your brain does a hard reset.");
	if (pc.isNaga()) output(" Your [pc.leg] bounces and slumps under its weight, naturally slithering around her exerting ankles and holding tight.");
	else output(" Your [pc.legs] launch into the air on powerful spasms, naturally locking around the gravid mate who holds you by the");
	if (pc.hasTits()) output(" [pc.breasts].");
	else output(" [pc.hips].");
	output(" <i>“Wanna try giving me some lip again?”</i> The pulsing in her bitch-claiming cock is timed to your blinking.");
	
	output("\n\nAll you manage is a shake, the upper half of your body completely unresponsive beneath her pheromones and visage of traditional masculinity.");
	if (pc.vaginaCanSting(hole)) output(" A shake, and a tiny laugh when her overwhelmingly erect member is stung by your lust-bearing cilia.");
	
	output(" <i>“Reeaallly?”</i> The Jumper pulls back slightly");
	if (pc.vaginaCanSting(hole)) output(", wincing,");
	output(" then drives forward, falling down face-first into your");
	if (pc.tallness >= 73) output(" [pc.chest].");
	else output(" neck.");
	output(" <i>“F-fuck!”</i> Her fingers dig into your [pc.skinFurScalesNoun], and she pushes up, a huge [enemy.cockHead 0] outlined against your abdominals. Delirious and aroused to dangerous levels, you’re left shrieking when she pulls back from your abused cunt, biologically despising the fact your rightful mate isn’t cumming so hard her balls shrivel up.");
	
	if (virgin) 
	{
		output("\n\nA moment of whimpering breaks through to her, and then she looks down");
		if (pc.hasCock()) output(" past your [pc.cocksLight]");
		output(", a line of blood trickling down her shaft. <i>“You’re kidding me...”</i> she shakes her head, laughing good-naturedly as sweat droplets fall and sizzle from her lapine features. <i>“First time? One hell of a way to have a first time!”</i> Licking her lips, she withdraws until only her cumslit is inside. <i>“Yeahhh... this day just keeps getting better.”</i>");
	}
	output("\n\nYour tunnel seals up in orgasm, and she batters her way through the constricting flesh. Her hips carry her [enemy.cock 0] the way they were meant to. There’s no gentleness in the way she humps, savoring you in the way you savor every inch of her. The oversexed animal claps into your creaming cunny, her fuzzy apples spraying moisture in humid, blissful coronas on every collision of breeder’s crotches.");
	output("\n\nThe bunny-woman thrusts all the way in, grunting loudly until she growls monotone, putting so much weight in her ass and cock that she’s lurching you along the ground. Her heavy, baby-burdened stomach drags over your navel and");
	if (pc.hasTits()) output(" into the underside of your [pc.breasts]");
	else output(" [pc.chest]");
	output(", overlaying you with the heavy knowledge of what you’ll become when she’s through. A long whine flows from her lips as she hoists you up, doing whatever she can to squeeze her cock even if she has to use you like a ragdoll.");
	
	output("\n\n<i>“I can’t deal with this tightneeeessss!!”</i> she howls, scratching into the skin of your [pc.ass]. Those paws, no, <i>arms</i> wrap around the small of your back until you’re bent painfully backwards like a blundering dance partner, barely off the ground and completely at her weighted mercy. Her pussy-bound dick flattens your nerves with its throbs, feeling like it grows larger, swelling to handle her hyped up output.");
	output("\n\nSlow, deliberate outstrokes herald rapid, womb-beating rams, lasting until her feet firmly plant and she can rail you with all the speed her libido requires. Sultry breaths wash over your chest, your cheek, nothing but fire in her eyes. It’s something you can identify with on a very deep level, on a organically primitive one. <i>She wants you this bad. She’s fucking you this hard for the sole purpose of ensuring her bloodline, her race.</i>");
	output("\n\nSumptuous clenching and an <i>even hotter</i> sensation completely overwhelm you, and you wail in another brain-draining orgasm. She’s cumming, and filling your [pc.pussyNoun " + hole + "]. <i>“No! It’s not enough!”</i>");
	output("\n\nWhat?");
	output("\n\nShe swivels up and over you, clambering with her spunk-bloated dick pneumatically inflating your poor pussy. Your cervix dilates until it’s practically yawning, opening itself wide to receive its conqueror’s seed. You can feel her creamy spooge forcing its way into your vulnerable core, opened so wide it yawns. Bunny-batter plasters the inside of your deepest and most sacred place, trickling down into the ovaries that’ll commence the oldest and most important process in the whole known universe");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(", sealed in as well as it can be; her beefy cock’s flare acts as a bulwark against what might backwash");
	output(".");
	output("\n\nToo many thoughts strike at once, leave you only half aware of being the recipient of a mating press, one that is halting the formation of your deserved cum-gut by squirting it all back out. The slut-bun’s shoving you into the deck so insistently that her balls could pop inside and act as surrogate knots, keeping all <i>her</i> cum right where it belongs. Torrents of sperm-packed spooge floods your body, surging towards your core.");
	output("\n\nYour ovaries are totally drowned in thick, brutal loads of laquine cum. Heavy ropes pool and trickle down through every inch of birth-tubing you have available. Not a single nook and cranny is left unpuddled, and even while your muscles are bathed in an creamy, alien deluge of undoubtable virility. Every shot reaffirms your place here, it erases entire continents of concern and worry.");
	output("\n\nClinging tight to her, petting her, cumming around her as she cums in you, you only think about how wonderful it is that you’re going to be pregnant with her children. Every pussy-packing pulse of release is addictive, and you moan for more. When you can’t moan, you scratch the back of her head faster, pull a little tighter, using your last breaths to cry in joy.");
	output("\n\nHer animalistic whines drown out your own, so husky that she doesn’t even sound like the bubbly, dopey bunny-girl whose cock is currently seeding your fertile field, thumping you so messily that the place where you’re connected looks like destroyed plumbing. Your pocket is lined with so much jizz that it explodes and implodes on her jerky, wolfish thrusts. The sensual sway of her spherical tummy is utterly soothing, inducing a soporific trance; there’s a tiny thump... her children kicking.");
	output("\n\nRivers of alabaster slough down, soon the only audible noises besides the squeaking of her sweat-matted fur against you. Left with no other recourse but to enjoy your last few moments awake as Zheng Shi’s premiere cum-dumpster");
	if (pc.hasHair()) output(", [pc.hair] noodling over your face");
	output(", you yank on the Jumper’s ears, bringing her weight down to the point it feels like you’re trapped under a collapsed building.");
	
	pc.loadInCunt(enemy, hole);
	
	if (pc.vaginaTotal() > 1)
	{
		if (hole == 0) hole2 = 1;
		else hole2 = 0;
		
		output("\n\nIt takes the stubborn rabbit strength to pull back, her effluence-soaked [enemy.cockNoun 0] twitching angrily and spurting gumballs of jism on to your middle. Wordlessly, her body aims and plunges into your other [pc.pussy " + hole2 + "], long since ignored. The squirt of relenting orgasm lubricates her passage through a depraved canal so slick it must be latex.");
		output("\n\nAnd then she’s cumming again, inelegantly and like the savage beast she’s become, but surprising you (and more), she fucks you right through the mutual orgasm, thrusting inside so hard that her [enemy.cockHead 0] penetrates your womb and inflates it with the unending load of her overfull cumbag.");
	
		pc.loadInCunt(enemy, hole2);
	}
	if (pc.vaginaTotal() > 2)
	{
		if (hole == 2) hole3 = 1;
		else hole3 = 2;
		
		output("\n\nThird verse, same as the other two... or whatever. You don’t even feel that third and absolutely warranted penetration, quenching the exploding need in your third pheromone mitten. Her rent, swollen, and totally sore cock is plowing your third hole with all the ferociousness the last two faced, and it’s spreading and jizzing to her frenzied desires. Long has the real world ceased making any amount of sense.");
		output("\n\nAfter all, the only sensation that matters is the third cream filling you’re getting, the completionist pirate thoroughly breeding you, claiming you as her own.");
		
		pc.loadInCunt(enemy, hole3);
	}
	output("\n\nHer [enemy.cock 0] glistens in the air, unrecognizable beneath its many layers of jizz. [pc.GirlCumColor], her own white seed");
	if (pc.hasCock()) output("; your helpless cock-gasm doesn’t do much to affect the hue with its [pc.cumColor]");
	output("... and enough femslime to create a slip ‘n slide. In the back of your mind you realize and understand that you’ve been dominated, made a mother. There’s no doubt about it: you’re going to be pregnant.");
	
	output("\n\nBut the vestiges of your rationality aren’t prepared for that debauched pirate sinking back into your");
	if (pc.vaginaTotal() > 1) output(" first");
	output(" cunt, through all of the excess spilling from its gaped lips.");
	output("\n\n<i>“Couldn’t hurt just to be sure, ‘ya know?”</i>");
	output("\n\nNah. It couldn’t.");
	
	processTime(15 + rand(10));
	pc.orgasm();
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",boredJumperPregEncounterGoWithRestSneakBBNext4,jumperType);
}
public function boredJumperPregEncounterGoWithRestSneakBBNext4(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var firstName:Boolean = boredJumperSetSteelesName(jumperType);
	
	output("You awaken, the very definition of a sputtering fool, coughing, hacking, and groaning. Before your eyes tell your brain where you are, for all it knows you could be in some fetid swamp on a backwater marsh-world. The dodge deck is well and truly tainted by a tryst dedicated to siring new life, and neither of you would have it any other way.");
	output("\n\nThe [enemy.furColor] Jumper is face down unconscious on your body, leaned sideways for the sake of her rounded gut. Yours is only half as big, and you’re intimately aware of the titanic seepage. <i>“Mmmffffffhhhhhhhh,”</i> the horse-bunny groans to life, ears lurching, arms sparking. <i>“I can’t feeel anythiiiiiiing!!”</i>");
	output("\n\nHer whines make you laugh. You feel great!");
	output("\n\nWhen she awakens, she plants a slobbery kiss on your lips and tries to stand, only tumbling off of you to her bubbly ass, her softened prick sliding free of your spunk-stretched slit. <i>“Oww,”</i> she groans, stroking her vulnerable");
	if (jumperType == GLOBAL.TYPE_EQUINE) output(" sheath tenderly.");
	else output(" shaft tenderly.");
	
	if (pc.isBimbo()) output("\n\n<i>“Awww, too much for ‘ya?”</i> you quip, poking her cheek.");
	else if (pc.isBro()) output("\n\n<i>“Too hard?”</i> you ask, rubbing her shoulder.");
	else if (pc.isNice()) output("\n\n<i>“Feeling better?”</i> You smile, patting her head.");
	else if (pc.isMischievous()) output("\n\n<i>“There, you shouldn’t be wanting to fuck for at least... mmm, a day now. Right?”</i> She giggles with you, nuzzling back into your face.");
	else output("\n\n<i>“There there,”</i> you say somewhat backhandedly, <i>“...you’ll be ready in a few days.”</i> She scoffs, smiling impishly at you.");
	
	output("\n\nWhen you sit up, the crunch on your gut forces out a few more more streams of lubricant or jism. Wires of sticky runoff cling to your [pc.skinFurScalesNoun] when you stand, noting that your womb");
	if (pc.vaginaTotal() > 1) output("s");
	output(" are visibly bulky, and that you’re still leaking. It amuses your [enemy.furColor]-furred lover to no end while you try to deal with the flow");
	if (pc.isNude()) output(" and collect your things.");
	else output(", collect your things, and look proper.");
	
	if (firstName)
	{
		output("\n\nPerked up and able to walk on her feet again, the Jumper waddles up behind you, leaned down and squinting. <i>“Heyy, so... I have a question, before you go. If it’s alright with you, if we do this again - and let’s be honest, we totally are, cutie - would it be alright if I knew your name? Just something to call you, since we’re bearing kids and all...”</i>");
		
		output("\n\nYou respond to her shy request, <i>“[pc.name].”</i>");
		output("\n\n<i>“[pc.name]!”</i> she hops a bit, only to crunch and wince. <i>“R-right, anyway, you should get going. Don’t want to get too attached right? You’re the fucking best. I loved everything about that, so don’t be a stranger. And... don’t let my kids stay on Zheng Shi too long. After what you told me, well...”</i>");
		output("\n\nA stroke to her cheek halts the stress before it can start. After you kiss and go your separate ways, you’re winding down the stairwell with a heavier load than before. By the time you get back to where you were... you’re already beginning to think you were out for a lot longer, considering how bloated you are and still feel...");
	}
	else
	{
		output("\n\n<i>“You should come back soon, [pc.name]. I’m definitely feeling... different. I can probably keep them secret for a while... if you’re not here to take them that is. But please don’t-”</i>");
		output("\n\nYou stroke the Jumper’s cheek, telling her not to worry about anything. You will not allow your kids to stay on this station for longer than absolutely necessary. She strokes your firming tummy and you reciprocate, kissing, and heading your separate ways");
		output("\n\nIt’s obvious at this point it’s taken. You’re carrying a heavier load, there’s just no doubt about it. You run a [pc.hand] across your belly, immediately moaning and sighing, an unnatural happiness floating to the surface.");
		output("\n\nYeah... there’s no way it wouldn’t have worked.");
	}
	
	processTime(60 + rand(60));
	restHeal();
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//pet her
public function boredJumperPregEncounterGoWithRestPetHer(jumperType:int=0):void
{
	clearOutput();
	showPregBoredJumper(false, true,jumperType);
	var sceneNum:int = boredJumperPregScene(jumperType);
	var firstName:Boolean = boredJumperSetSteelesName(jumperType);
	
	//not used in his scene, reset
	if (flags["BJUMPER_TRIED_TO_LEAVE"] == 1) flags["BJUMPER_TRIED_TO_LEAVE"] = 0;
	
	if (pc.isTaur())
	{	
		output("You yank the slut-bun close, and in the haste of it all she becomes too excitable to hold. The sound she makes moaning in disappointment fades when your [pc.hands] slide around her head, scratching behind her inflexible ears. In your current state, you doubt the sex would be easy on either of you, but you were glad for the company all the same. You finish by kissing her on the cheek, and then the lips.");
	}
	else
	{		
		output("The breed-hungry bunny grows excited when you raise your hand, only to moan all sensitive-like when you slide your [pc.hand] across her cheek and toward her ear. <i>“Awww...”</i> she pouts, melting like butter. You sniff again, almost sneezing, finding yourself in total control despite the rampant stench of sex in the air. You’re not entirely interested in having a steamy rendezvous right now, but you’re letting her know one finger’s stroke at a time that you’ll acknowledge her needs in the future.");
		output("\n\nSkillfully avoiding her erogenous zones, you pat the curly haired bunny-woman on her head, slinking under her beret, gathering her [enemy.hairColor] into pigtails that you tug gently. <i>“Not now,”</i> you start");
		if (sceneNum >= 2) output(", standing with some effort");
		output(".");
		if (pc.isBimbo()) output(" <i>“Feels kinda bad to turn ‘ya down, but I’ve got somewhere to be. Maybe next time, honey bun!”</i> you chime, blowing a kiss.");
		else if (pc.isBro()) output(" <i>“I’m afraid I’ve got other plans. Next time, though, we’ll spend some quality time together,”</i> you grin.");
		else if (pc.isNice()) output(" <i>“I hate to leave you, but today’s a little busy. Next time,”</i> you tilt your head, smiling warmly.");
		else if (pc.isMischievous())
		{
			output(" <i>“Later,”</i> you sternly remind. <i>“Later... you and I will have a meeting to remember. Even more than");
			if (sceneNum == 1) output(" that},”</i> you eye her belly proudly.");
			else output(" this,”</i> you eye your belly proudly.");
		}
		else output(" <i>“You’ll have to wait a little longer,”</i> you brush her ear, tugging it as you let go. <i>“Next time, I’ll think about it.”</i>");
	}
	output("\n\n<i>“O-kayyy,”</i> she gropes your [pc.ass], hooding her eyes mischievously. <i>“Next time!”</i>");
	if (firstName)
	{
		output("\n\nShe tugs on your [pc.arm], yelling <i>“Waait!”</i> You turn to her, meeting that shy smile. <i>“You don’t have to give me your full name but... you’re");
		if (sceneNum == 1) output(" the father");
		else if (sceneNum == 2) output(" the mother");
		else output(" a mother");
		output(" of our kids so...”</i>");
		
		output("\n\n<i>“[pc.name],”</i> you say");
		if (pc.isBimbo()) output(" cutely.");
		else if (pc.isBro()) output(" stoically.");
		else if (pc.isNice()) output(" happily.");
		else if (pc.isMischievous()) output(" impishly.");
		else output(" coldly.");
		output("\n\n<i>“[pc.name]... Okay! Don’t worry, it’s just between us, alright?”</i>");
		output("\n\nAnd what about her?");
		output("\n\n<i>“Heh heh... Not while I’m on Zheng Shi. I’ll try to surprise you someday, ‘kay?”</i>");
		output("\n\nSure.");
	}
	
	output("\n\nConsidering the time it took to get up here, it doesn’t take you long to get back to where you were, far away from the ‘dodge deck’ and ready to face down the galaxy once again. Strangely, you can already smell your Jumper again. Guess she’s back to prowling.");

	processTime(10 + rand(10));
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//jumper preg birth scene
public function boredJumperPregEncounterJumperPregBirth():Boolean
{
	clearOutput();
	var jumperType:int = -1;
	if (flags["BJUMPER_PREG_TYPE"] != undefined) jumperType = flags["BJUMPER_PREG_TYPE"];
	showPregBoredJumper(true, true,jumperType);
	var encLocation:int = boredJumperPregLocation();
	
	setEnemy(new JumperBored());
	enemy.furColor = boredJumperFurColor(jumperType);
	enemy.hairColor = boredJumperHairColor(jumperType);
	enemy.eyeColor = boredJumperEyeColor(jumperType);
	enemy.lipColor = boredJumperLipColor(jumperType);
	enemy.nippleColor = boredJumperNippleColor(jumperType);
	
	var timestamp:int = GetGameTimestamp();
	boredJumperBirth(timestamp);
	var numBabies:int = 0;
	var numBoys:int = 0;
	var numGirls:int = 0;
	var numHerms:int = 0;
	var typeCnt: int = 0;
	
	if (flags["BJUMPER_BIRTH_SCENE_BOYS"] != undefined && flags["BJUMPER_BIRTH_SCENE_BOYS"] > 0)
	{
		numBoys = flags["BJUMPER_BIRTH_SCENE_BOYS"];
		typeCnt += 1;
	}
	if (flags["BJUMPER_BIRTH_SCENE_GIRLS"] != undefined && flags["BJUMPER_BIRTH_SCENE_GIRLS"] > 0)
	{
		numGirls = flags["BJUMPER_BIRTH_SCENE_GIRLS"];
		typeCnt += 1;
	}
	if (flags["BJUMPER_BIRTH_SCENE_HERMS"] != undefined && flags["BJUMPER_BIRTH_SCENE_HERMS"] > 0)
	{
		numHerms = flags["BJUMPER_BIRTH_SCENE_HERMS"];
		typeCnt += 1;
	}
	numBabies = numBoys + numGirls + numHerms;
	
	output("What can only be described as pheromonal whiplash hammers you right in the frontal lobe. It strikes you with natural suddenness, and part of you innately recognizes it as the scent of the Jumper you impregnated. Is she squeaking around again? There’s a faint... whimpering? Oh crap, she might be in trouble. How could anyone miss that smell?");
	output("\n\nYou don’t know where you’re going, but the aura gets stronger when you zero in. Your brain is doing the thinking.");
	if (encLocation == 0) output(" It’s winding you through the overheated air of the mines in search of a pregnant bunny.");
	else if (encLocation == 1) output(" It’s carrying you to one of the hangar’s furthest corners in search of a pregnant bunny.");
	else output(" It’s making it easier to forgo caution in search of a pregnant bunny.");
	output(" Fortunately, you don’t have to go far to find the [enemy.furColor]-furred pirate, slumped against a wall and clutching her gut in obvious pain. It’s good that you happened upon her first.");
	output("\n\n<i>“Oh fff - ”</i> she stammers, until she notices your presence. <i>“Ohh, there you are");
	if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name]!");
	else output(", cutie!");
	output("”</i> she cries, looking down. There’s a curiously visible wet spot on the crotch of her suit. <i>“I-I’m... you know...”</i>");
	
	output("\n\nYeah, you do. Before she says anything else, you ask her what the nearest hideaway is, helping her stand and urging her to take you there. <i>“Just this way,”</i> she says. <i>“Was going there... felt it coming but it hit a little sooner than I wanted.”</i>");
	output("\n\nSounds about right. You take turns leading almost, being guided towards");
	if (encLocation == 0) output(" an out of the way closet of sorts. There’s plenty of room, and it’s a lot cooler than expected.");
	else if (encLocation == 1) output(" an unused shack in the hangar. You would prefer your ship, but she doesn’t seem like she can make that distance.");
	else output(" a rather cozy break room. Once inside, you lock the door tight.");
	output(" She finds a spot on the floor to sit, no longer able to stand with her leaper’s legs locked by labor. <i>“Oooh... I hate this feeling!”</i> she whines.");
	
	output("\n\nIt’ll pass, you remind her. What’s childbirth to a big bad pirate? While you banter, you collect anything that might be useful. Scraps of fabric to serve as blankets, a flask of water, whatever looks helpful. Once you bring them to her side, you yank the fastener at her neck and relieve the latex-loving laquine of her tight-fitting getup, spreading her thick thighs and forcing her to lie back.");
	output("\n\nAnother wave of amniotic fluid spills from her black-lipped horse-pussy. There’s little else you can do but keep talking to her, keep her thinking about anything other than her pregnancy. It’s not long before her contractions are bringing the first of her litter to bear.");
	if (rand(2) == 0) output(" Lop");
	else output(" Jutting");
	output(" ears poke through her rubbery lips, and then the head of a " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " laquine emerges slowly.");
	output("\n\n<i>“Push!”</i> you yell, and the pirate-bun screams. You grab her by the hand and hold tight.");
	output("\n\nYour first child together lands in a pile, covered in gore, already squeaking. You’re quick to wipe it down, unable to look closer while the next is coming. A silly smile spreads across your face, anticipating the next, paternal pride welling up inside.");
	if (numBabies == 2) output(" Another pair of ears, and another baby come flopping out into the building pile, though the Jumper’s stomach has already deflated. She’s given birth to twins!");
	else if (numBabies == 3) output(" Again come the pair of ears, and then the next head. You catch the second, hurrying to prepare for the third who flops out seconds later. Your bunny-lover’s belly shrinks, indicating the end of term.");
	else if (numBabies == 4) output(" Two pairs of ears emerge at the same time, and you yourself wince in sympathetic pain for the Jumper’s predicament. Two are born at the same time, closely tailed by the fourth. Once you’ve wiped them all down, you realize that her pregnancy is now over.");
	else if (numBabies == 5) output(" You’re growing a little too excited about the amount of kids she’s pumping out. Three sit in a pile, and two more emerge at roughly the same time. After cleaning their mom off, you note that her pregnancy is over.");
	else if (numBabies == 6) output(" Bright emotions stir inside, shaking you to your fingertips. She’s thrown out two, four... five kids! But there’s still one more coming, and when you catch and wipe that one off, she’s produced six healthy kids, ending her pregnancy.");
	else if (numBabies >= 7) output(" It becomes obvious right away that she’s carrying a full litter. The size of her stomach, and the eye-crossing effect it has on her is too noticeable. You almost feel pain in the Jumper’s stead, but you hold fast, wiping off the kiddos as they emerge. Two, four, six... there’s a seventh.");
	if (numBabies == 8) output(" Before you write it off as over, an eighth kid is expressed into the pile.");
	else output(" Looks like it ends there...");
	
	output("\n\nThe pile of mewling munchkins");
	if (numBabies == 2) output(" remains at two");
	else output(" has swelled to " + num2Text(numBabies));
	
	output(", and you find yourself the proud " + pc.mf("father","‘father’") + " of");
	if (numBabies == 2) output(" twins.");
	else output(" them all.");
	if (numBabies == 2)
	{
		if (numBoys == 2) output(" Two sons");
		else if (numGirls == 2) output(" Two daughters");
		else if (numHerms == 2) output(" Two natural hermaphrodites");
		else if (numBoys == 1 && numGirls == 1) output(" A son and daughter");
		else if (numBoys == 1 && numHerms == 1) output(" A son and natural hermaphrodite");
		else if (numHerms == 1 && numGirls == 1) output(" A daughter and natural hermaphrodite");
		
		output(", only furred at the limbs, bear " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " as their color of pelt, and " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] + " for the strands at their heads.");
	}
	else
	{
		output(" She’s given birth to ");
		if (numBoys > 0)
		{
			if (numBoys == 1) output(" a son");
			else if (numBoys > 1) output(" " + num2Text(numBoys) + " sons");
		}
		if (numGirls > 0)
		{
			if (numBoys > 0 && typeCnt == 2) output(" and");
			else if (typeCnt == 3) output(",");
			if (numGirls == 1) output(" a daughter");
			else if (numGirls > 1) output(" " + num2Text(numGirls) + " daughters");
		}
		if (numHerms > 0)
		{
			if (typeCnt >= 2) output(" and");
			if (numHerms == 1) output(" a hermaphrodite");
			else if (numHerms > 1) output(" " + num2Text(numHerms) + " natural hermaphrodites");
		}
		if (flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] == undefined) output(", each one bearing " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " as their full coats of fur or limb-blanketing pelts.");
		else output(", some bearing " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " and others " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] + " as their full coats of fur or limb-blanketing pelts.");
		if (flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR2"] == undefined) output(" All with " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] + " strands of downy fluff on their heads and in small splotches on their fur.");
		else output(" Their parent’s influence further seen in the mix of " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] + " and " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR2"] + " strands of downy fluff on their heads and in small splotches on their fur.");
		
	}
	output("\n\n<i>“Oh f-f-f... I can’t...”</i> the Jumper whines, unable to so much as sit up. Until she can, you take your time enjoying their first movements. You scoop the " + num2Text(numBabies) + " into your [pc.arms], cradling them to your chest, delighting in their tiny grips and cute squeaks. When your eyes fall to the laquine’s breast, she is finally able to sit up and take in what her kids look like.");
	output("\n\n<i>“T-those are my... our kids...”</i> she murmurs, biting her lip.");
	if (jumperType == GLOBAL.TYPE_EQUINE && flags["BJUMPER_HORSE_TOTAL_KIDS"] == numBabies) output(" <i>“I’m a mom now, huh...”</i>");
	else if (jumperType == GLOBAL.TYPE_CANINE && flags["BJUMPER_DOG_TOTAL_KIDS"] == numBabies) output(" <i>“I’m a mom now, huh...”</i>");
	else if (jumperType == GLOBAL.TYPE_FELINE && flags["BJUMPER_CAT_TOTAL_KIDS"] == numBabies) output(" <i>“I’m a mom now, huh...”</i>");
	else if (jumperType == GLOBAL.TYPE_HUMAN && flags["BJUMPER_TERRAN_TOTAL_KIDS"] == numBabies) output(" <i>“I’m a mom now, huh...”</i>");
	else output(" <i>“I’m a mom all over again...”</i>");
	
	output("\n\nShe extends her arms, ready to receive her babies and begin their feeding. You sit wordlessly by her side, gaze locked on their little mouths and unopened eyes. She brings them to her [enemy.nippleColor] teat, letting them suckle and pinch at her milk-trickling nubs until they tire.");
	if (numBabies == 2) output(" When they’re both satisfied, you sit shoulder-to-shoulder with the mother-bun."); 	
	else output(" When one is satisfied, it is set to the side to rest until the rest have had their fill. Afterward, you snuggle up with the lawless laquine shoulder-to-shoulder.");
	output(" <i>“You really made me a mom.”</i>");
	
	output("\n\nYep.");
	output("\n\n<i>“I guess I’ve got a place to be when I get out of here? Do you really think they’d want me around? Anyone?”</i>");
	output("\n\n<i>“They’re your kids!”</i> you argue, stroking the back of her head.");
	if (pc.isBimbo()) output(" <i>“Our kids, hunny!”</i> you scratch behind one of her ears.");
	else if (pc.isBro()) output(" <i>“You’re good to me, you’d be good to them. When you’re ready,”</i> you say, twirling a lock of her hair around your finger.");
	else if (pc.isNice()) output(" <i>“Don’t wait too long, okay?”</i> you smile, caressing her flush cheek.");
	else if (pc.isMischievous()) output(" <i>“I think I’ll want you somewhere else if you don’t come by sooner or later,”</i> you grin, easing her worries with a pat behind the ear.");
	else output(" <i>“But you better decide someday soon. They won’t be young forever.”</i>");
	
	output("\n\nShe turns down to face them again, lips forming easily into a smile of ecstasy. For the next few minutes you chat idly about the kids in your interlocked arms. You think about names, think about their futures, what they might grow up to be, all in the effort of delaying the inevitable parting.");
	if (!boredJumperKnowsSteelesName(jumperType)) output(" You tell her about the nursery they’ll be sent to, comforting her when she asks how they’ll be taken care of.");
	output(" They begin to stir uncomfortably, and you realize that time has come sooner that you wanted.");
	
	output("\n\nYou’re bidden to stay like this just a bit longer, so you do, comforting the little laquines with the utmost care and caution, not wishing to disturb their needed rest. One of them feeds again, but there’s no crisis. Aside from the need to send them off to your nursery. They cannot stay on Zheng Shi, and you cannot stay shacked up with a bunny for so long, even if she’s the mother of your children.");
	output("\n\n<i>“Guess it’s time.”</i> The Jumper stands with your help. You lead the way back to");
	if (encLocation == 2) output(" your ship");
	else output(" the hangar");
	output(" while she handles the precious cargo snuggled in her lithe arms.");
	
	output(" No matter the distance, you’re on full alert, not wanting any harm to befall your sons and daughters. It’s a stressful yet brisk trip back, one that is uneventful. Even Urbolg isn’t present right now.");
	output("\n\nChiming loudly, your codex signals the imminent arrival of your nursery drones, a fleet of tiny, self-contained shuttlecraft that float towards you through the docking entrance. <i>“Fancy,”</i> the Jumper quips. You carefully load your children into the temperate interiors, sealing them tight for space travel. For a second, you almost think you see her about to cry, sending them off to the unknown. You know where they’ll be, but she sure doesn’t.");
	output("\n\nOnce they hum to life, the high powered taxis whir out into space and away with the valuable life inside. Your [enemy.furColor]-furred lover simply kisses you on the cheek. <i>“If you say they’ll be fine, I believe you.");
	if (boredJumperKnowsSteelesName(jumperType)) output(" Make sure you send me pics sometime!”</i>");
	else output(" Maybe someday I’ll get to meet ‘em.”</i>");
	
	output("\n\nWhen you nod, she fidgets, and hurries off, no doubt glad she doesn’t have to hide from her own crew anymore.");
	output("\n\n...At least, unless you knock her up all over again...");
	output("\n\nNothing left to do but continue your exploration of Zheng Shi, or take a trip back to Tavros. By the time you get there, they’ll certainly be settled in!");
	
	processTime(60 + ((10 + rand(10)) * numBabies));
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", move,"ZS L50");
	return true;
}
//missed jumper birth scene
public function boredJumperPregEncounterMissedBirth():Boolean
{
	//check for if pc missed jumper birth and scene needs to try
	if (flags["BJUMPER_MISSED_BIRTH"] == undefined)
	{
		//if no missed birth scene check for preg jumper encounter
		if (boredJumperPregScene() > 0) return boredJumperPregHangerEncounter();
		else return false;
	}
	
	clearOutput();
	var jumperType:int = -1;
	if (flags["BJUMPER_PREG_TYPE"] != undefined) jumperType = flags["BJUMPER_PREG_TYPE"];
	flags["BJUMPER_PREG_TYPE"] = undefined;
	flags["BJUMPER_MISSED_BIRTH"] = undefined;
	showPregBoredJumper(false, true,jumperType);
	
	setEnemy(new JumperBored());
	enemy.furColor = boredJumperFurColor(jumperType);
	enemy.hairColor = boredJumperHairColor(jumperType);
	enemy.eyeColor = boredJumperEyeColor(jumperType);
	enemy.lipColor = boredJumperLipColor(jumperType);
	enemy.nippleColor = boredJumperNippleColor(jumperType);
	
	var firstMiss:Boolean = true;
	var neverMetPreg:Boolean = true;
	
	if (jumperType == GLOBAL.TYPE_EQUINE) 
	{
		if (flags["BJUMPER_HORSE_PREG_ENC_JUMPER"] > 0) neverMetPreg = false;
		if (flags["BJUMPER_MISSED_BIRTH_CNT_HORSE"] > 0) firstMiss = false;
		IncrementFlag("BJUMPER_MISSED_BIRTH_CNT_HORSE");
	}
	else if (jumperType == GLOBAL.TYPE_CANINE)
	{
		if (flags["BJUMPER_DOG_PREG_ENC_JUMPER"] > 0) neverMetPreg = false;
		if (flags["BJUMPER_MISSED_BIRTH_CNT_DOG"] > 0) firstMiss = false;
		IncrementFlag("BJUMPER_MISSED_BIRTH_CNT_DOG");
	}
	else if (jumperType == GLOBAL.TYPE_FELINE)
	{
		if (flags["BJUMPER_CAT_PREG_ENC_JUMPER"] > 0) neverMetPreg = false;
		if (flags["BJUMPER_MISSED_BIRTH_CNT_CAT"] > 0) firstMiss = false;
		IncrementFlag("BJUMPER_MISSED_BIRTH_CNT_CAT");
	}
	else if (jumperType == GLOBAL.TYPE_HUMAN)
	{
		if (flags["BJUMPER_TERRAN_PREG_ENC_JUMPER"] > 0) neverMetPreg = false;
		if (flags["BJUMPER_MISSED_BIRTH_CNT_TERRAN"] > 0) firstMiss = false;
		IncrementFlag("BJUMPER_MISSED_BIRTH_CNT_TERRAN");
	}
	
	var numBabies:int = 0;
	var numBoys:int = 0;
	var numGirls:int = 0;
	var numHerms:int = 0;
	var typeCnt: int = 0;
	var cap:Boolean = false;
	
	if (flags["BJUMPER_BIRTH_SCENE_BOYS"] != undefined && flags["BJUMPER_BIRTH_SCENE_BOYS"] > 0)
	{
		numBoys = flags["BJUMPER_BIRTH_SCENE_BOYS"];
		typeCnt += 1;
	}
	if (flags["BJUMPER_BIRTH_SCENE_GIRLS"] != undefined && flags["BJUMPER_BIRTH_SCENE_GIRLS"] > 0)
	{
		numGirls = flags["BJUMPER_BIRTH_SCENE_GIRLS"];
		typeCnt += 1;
	}
	if (flags["BJUMPER_BIRTH_SCENE_HERMS"] != undefined && flags["BJUMPER_BIRTH_SCENE_HERMS"] > 0)
	{
		numHerms = flags["BJUMPER_BIRTH_SCENE_HERMS"];
		typeCnt += 1;
	}
	numBabies = numBoys + numGirls + numHerms;
	
	output("<i>“There you are!”</i> A voice calls out, and you’re approached insistently by a very nervous looking [enemy.furColor] laquine, dressed in the skin-tight uniform of her gang. <i>“Thank goodness you’re here now.");
	if (!firstMiss) output(" I had to give birth alone, sorry...”</i> You look down in disappointment. <i>“Don’t worry, [pc.name]! They’re okay, especially now that you’re here.”</i>");
	else if (neverMetPreg) output(" You were the one who got me pregnant... Geez, you never even showed up after that! It was hard keeping that secret, you have no idea!”</i> You remember your tryst all too clearly. You got her pregnant?");
	else if (boredJumperKnowsSteelesName(jumperType)) output(" I got really scared when you didn’t show up, [pc.name], but don’t worry. My kids are okay. I was hoping you could... you know, take them to that nursery you mentioned.”</i>");
	else output(" I was worried when you weren’t around. I had to give birth alone...”</i> You look down, a little disappointed, but suddenly fearful. <i>“Don’t worry... they’re fine for now.”</i>");
	
	output("\n\nShe grabs you by the hand without another word, leading you down the hall to a rather clever hideaway. Inside, you find a box and several blankets. Inside the box... are " + num2Text(numBabies) + " laquine children.");
	if (numBabies == 2)
	{
		output(" Twins,");
		if (numBoys == 2) output(" two boys.");
		else if (numGirls == 2) output(" two girls.");
		else if (numHerms == 2) output(" two hermaphrodites.");
		else if (numBoys == 1 && numGirls == 1) output(" a boy and girl.");
		else if (numBoys == 1 && numHerms == 1) output(" a boy and hermaphrodite.");
		else if (numHerms == 1 && numGirls == 1) output(" a girl and hermaphrodite.");
		
		output(" They have short-haired " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " pelts on their arms and legs.");
	}
	else
	{
		if (numBoys > 0)
		{
			if (numBoys == 1) output(" A boy");
			else if (numBoys > 1) output(" " + num2Text(numBoys,true) + " boys");
		}
		if (numGirls > 0)
		{
			if (numBoys > 0 && typeCnt == 2) output(" and");
			else if (typeCnt == 3) output(",");
			else cap = true;

			if (numGirls == 1) output(" a girl");
			else if (numGirls > 1) output(" " + num2Text(numGirls, cap) + " girls");
			
		}
		if (numHerms > 0)
		{
			cap = false;
			if (typeCnt >= 2) output(" and");
			else cap = true;
			
			if (numHerms == 1) output(" a hermaphrodite");
			else if (numHerms > 1) output(" " + num2Text(numHerms, cap) + " natural hermaphrodites");
		}
		if (rand(numBabies) == 0) output(". One has a full coat of fur,");
		else output(". Some have full coats of fur,");
		output(" others have short-haired pelts on their arms and legs");
		if (flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] == undefined) output(", all " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " in color.");
		else output(", some are " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " while others are " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] + ".");
	}	
	output("\n\nThey’re, without a doubt, yours, mothered by the laquine standing next to you. <i>“I kept them fed as best I could. If you hadn’t show up now... I don’t know what I would have done.");
	if (!boredJumperKnowsSteelesName(jumperType)) output(" Maybe you have somewhere you can take them..?");
	output("”</i>");
	
	output("\n\nYou know what to do here.");
	if (!boredJumperKnowsSteelesName(jumperType)) output(" You carefully explain that you have a nursery fully equipped for your children, and with her permission, you take the box in hand and head back to the hangar, glad that Urbolg isn’t present at the workshop.");
	output(" After tapping away at your codex, a wing of nursery drones are dispatched to your location, shuttling in through the dock and opening up.");
	if (!boredJumperKnowsSteelesName(jumperType)) output(" <i>“Fancy,”</i> the Jumper remarks, helping prepare her kids for space travel.");
	
	output("\n\nWith the utmost caution, you and she have them sleeping soundly inside the high powered taxis in a matter of seconds. She seems filled with sadness that they’re whirring off. You try to keep her mind on where they’re going, reminding her they’ll be taken care of. When the shuttlecraft whirr back into space on a one way trip to safety, you feel a kiss at your cheek. <i>“Thanks. I don’t care if you think badly of me or anything, but they don’t deserve to get picked up by anyone here. Just tell me they’ll do okay, that’s all I wanna hear right now.”</i>");
	output("\n\nYou tell her that");
	if (boredJumperKnowsSteelesName(jumperType)) output(" and more, promising to send pictures when you can");
	output(".");
	
	output("\n\nSatisfied, she nods, fidgets for a bit, then runs off.");
	output("\n\nYou’ve nothing else to do here, unless you want to continue exploring Zheng Shi. If you headed for Tavros though, you’re sure your children will be settled in by the time you arrive!");
	
	boredJumperSetSteelesName(jumperType);
	
	processTime(15);
	setEnemy(null);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
	return true;
}
//email for missing jumper birth
public function boredJumperPregBirthEmail():String
{
	var eText:String = "";
		
	eText+="<b>This message was sent from an unknown source using an unknown and possibly outdated device, so says your Codex. It warns you that you should delete it rather than read it.</b>";
	eText+="\n\nWhere’d you go? I had your kids, and you weren’t on Zheng Shi";
	eText+= "\nPlease come get them before someone finds";
	
	return doParse(eText);
}
//determine email sender name
public function boredJumperPregBirthEmailSender(picEmail:Boolean = false):String
{
	var jumperType:int = flags["BJUMPER_PREG_TYPE"];
	var user:String = "funbun";
	
	if (picEmail) jumperType = flags["BJUMPER_SEND_TYPE"];
	
	if (jumperType == GLOBAL.TYPE_EQUINE) user = "369";
	else if (jumperType == GLOBAL.TYPE_CANINE) user = "no";
	else if (jumperType == GLOBAL.TYPE_FELINE) user = "thismyname";
	else if (jumperType == GLOBAL.TYPE_HUMAN) user = "funbun";
	
	return user;
}
//text for nursery in nursery.as babies
public function boredJumperPregNurserySceneBabies(arg:Array):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("LAQUINE\nINFANTS");
	
	var babyCnt:int = arg[0];
	var kidCnt:int = arg[1];
		
	output("You [pc.walk] towards the nearest crib, looking down to see two of your youngest laquines sharing it, sleeping peacefully together. " + pc.mf("Paternal","Maternal") + " pride bubbles inside, riding up your spine and exploding in your brain. You smile, overcome with too many emotions just looking down and seeing your babies at rest. They’ll no doubt grow fast, so it’s all the more important you take this time to enjoy their most precious years.");
	output("\n\nAlerted by your shadow, they both begin to stir. Noses twitching, they squeak at first, then begin to cry. There’s a moment of embarrassment and concern, but you do what you need to do: pick them up and cradle them in your [pc.arms]. Knowing that they’re secure, their sobbing ends, and they’re back to sleep with sibilant purrs and frail grips. Empathic delight crests in your fluttering heart, and you’re forced to sit down, lost in the overwhelming bliss of parenthood.");
	
	if (kidCnt > 0) output("\n\nSome of your older children come over, eager to see their " + pc.mf("father","mother") + ", saying nothing and merely hugging you. They hop up on the nearby seats to kiss you on the cheek before snuggling, wrapping their small arms around you and providing their sibling presence to the fuzzy gathering.");

	if (boredJumperBreastFeedOK())
	{
		output("\n\nSince you’re here, you see no reason why you can’t indulge them and yourself a bit. You guide one of the infants to your [pc.breasts]");
		if (!pc.isChestExposed()) output(", slipping your [pc.chestCovers] out of the way");
		output(", and encourage them with your " + (pc.hasErectNipples() ? "erect, [pc.milkNoun]-dribbling teat" : "engorged, [pc.milkNoun]-dribbling spout") + ". Sensing the treat, the tiny bunny opens its mouth and begins to suckle, but not too much. The staff must have fed them already, because they’re back to napping rather quickly... but their rest seems much more relaxed, somehow!");
	}
	output("\n\nSadly, you can’t hold them forever. With a heavy heart, you stand and return them to their bed, fitting a blanket tight under their limbs and making sure they’re holding each other tight.");
	if (boredJumperPregKidTotal( -1) > 0)
	{
		output("\n\nYou reach for your Codex and take a quiet pic of the napping duo, firing it off to their missing parent’s provided address. Surprisingly, you get a near instant response from the laquine pirate:");
		output(" <i>“" + RandomInCollection(["Ohhh maaan! That’s sooo cute! I was having such a shit day until you sent that, thank you so much!","Holy shit! That’s the best thing I’ve seen all day. Look at how small they are, it’s so cute! And their paws are interlocked omigod. THANK YOU!","Ooohhh, look at those ears, kinda shimmery from this angle! I’m glad they’ve got a soft looking bed, too. Nobody should have to grow up without one. Thanks, babe, you really brightened my day.","Wooah... that’s great! Sorry I can’t talk now, too many-","They’re growing so fast! They look so healthy. Thanks for the pics!"]) + "”</i>");
	}
	var babyTime:Number = 10 + ((5 + rand(5)) * babyCnt);
	if(babyTime > 300) babyTime = 300;
	processTime(babyTime);
	clearMenu();
	addButton(0, "Next", nurseryVisitLaquine,undefined);
}
//text for nursery in nursery.as kids
public function boredJumperPregNurserySceneKids(arg:Array):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("LAQUINE\nKIDS");
	
	var kidCnt:int = arg[0];
	var maleKids:int = arg[1];
	var femaleKids:int = arg[2];
	var hermKids:int = arg[3];
	var male:Boolean = false;
	var male2:Boolean = false;
	var male3:Boolean = false;
	var kcnt:int = kidCnt;
	var mcnt:int = maleKids;
	
	//pick if kid in scene is male or female/herm
	if (rand(kcnt) < mcnt)
	{
		male = true;
		mcnt -= 1;
	}
	kcnt -= 1;
	if (rand(kcnt) < mcnt)
	{
		male2 = true;
		mcnt -= 1;
	}
	kcnt -= 1;
	if (kcnt > 0)
	{
		if (rand(kcnt) < mcnt) male3 = true;
	}
	
	if (rand(2) == 0)
	{
		output("<i>“Hi, " + pc.mf("dad", "mom") + "!”</i> one of your older laquines runs up, hopping in place on " + (male ? "his" : "her") + " digitigrade feet. <i>“I’ve been good!”</i> You catch the little half-rabbit in " + (male ? "his" : "her") + " lie, rubbing at " + (male ? "his" : "her") + " ears and saying nothing prompted that statement at all. You didn’t believe it for a second.");
		if (kidCnt >= 3) output("\n\nTwo more show up");
		else output("\n\nThe other one shows up");
		output(", asking you to play, so you go with them. Any time you have to enjoy their childhood with them away from the rush is time well spent. The mischievous laquine");
		if (kidCnt >= 3) output(" trio");
		else output(" duo");
		output(" ask you to play hide and seek. You shut your eyes and count to ten... and you immediately find one of them, getting pulled out of a closet by an exasperated staff member. " + (male ? "He complains he got cheated, but you send him on his" : "She complains she got cheated, but you send her on her") + " way.");
		if (kidCnt >= 3) output("\n\nThe next one is easy to find, once again thanks to the staff. " + (male3 ? "He" : "She") + " decided to dart under one of the desks, and the workers couldn’t stop laughing. Besides, you could see " + (male3 ? "his" : "her") + " fluffy little tail wagging behind the corner of the table!");

		output("\n\nSurprisingly the last of your kids puts up a good effort. You can’t find " + (male2 ? "him" : "her") + " anywhere downstairs, and the staff are no help. Well, you’ve not been upstairs yet! On the second floor you check each door on your way, [pc.ears] craning for the sound of playful bunny, until you get to your room. The door’s ajar.");
		output("\n\nInside, you see... nothing out of the ordinary. Until you look to your bed. There’s a giant lump in the sheets. When you [pc.move] to its side, [pc.hands] behind your waist, you huff. " + (male2 ? "He" : "She") + "’s fallen asleep under the covers. You’re not at all interested in winning the game now, but you do mention to the nearest nurse to keep an eye on " + (male2 ? "him" : "her") + " on your way back down.");
	
		processTime(15 + rand(15));
	}
	else
	{
		output("<i>“" + pc.mf("Daaadddd", "Moooommm") + ",”</i> comes a long whine from one of your laquine " + (male ? "sons" : "daughters") + ". <i>“" + RandomInCollection(["I wish you were here every day.", "I missed you!", "Are you okay?"]) + "”</i>");
		output("\n\nYou look down, seeing");
		if (kidCnt >= 3) output(" a few");
		else output(" both");
		output(" of your oldest kids glancing up with big eyes and heart warming smiles. You reassure them in your own way, [pc.walking] to the nearest seat and sitting with them. They ask you how your day was, talk about what they learned in school, what they’ve been reading.");
		output("\n\nBut most importantly, they’re doing it all snuggled up on you.");
		if (kidCnt >= 3) output(" Two rest their heads in your lap, the rest on your shoulders.");
		else output(" Both rest their heads in your lap.");
		output(" They talk about how hard that one lesson was, how annoying a certain staff member can be...");
		output("\n\nYou’re not sure what else to do but encourage them to do their best. They never speak over you, and always look up when you’re talking. You tell them to focus on their studies when they’re expected to, but also to look after each other. They’ll find these things difficulty for a while, but they’ll always have each other to look to for support. When you’re at a loss for any other endearing spiels, you let your kids stay cuddling, clinging tight to your limbs and waist.");
		output("\n\nUnfortunately, they don’t stay long. In some way it surprises you, but on the other, they’re a ");
		if (kidCnt >= 3) output(" bunch");
		else output(" couple");
		output(" of young and very energetic laquines. Before they leave you to your thoughts, they");
		if (kidCnt >= 3) output(" all");
		output(" kiss you on the cheek, hoping loudly and perhaps a bit cheekily that you’ll be back soon.");
		output("\n\nYou promise.");
		
		processTime(15 + rand(10));
	}
	
	clearMenu();
	addButton(0, "Next", nurseryVisitLaquine,undefined);
}
//text for nursery common area in nursery.as
public function boredJumperPregCommonAreaEvents(kidCnt:int=0,maleKids:int=0,femaleKids:int=0,hermKids:int=0,otherKids:Boolean=false):void
{
	var picType:int = 0;
	var male:Boolean = false;
	//pick if kid in scene is male or female/herm
	if (rand(kidCnt) < maleKids) male = true;
	
	if (kidCnt == 2)
	{
		if (rand(2) == 0 )
		{
			picType = 1;
			output("\n\nYour fuzzy laquine twins are sitting at a table together");
			if (otherKids) output(", further from the other children");
			output(", eating a plate of hearty greens under supervision. Comparably quiet, they look rather adorable on their own, if a bit shy. Their ears flex and twitch in response to the sudden noises from other rooms or this one. When they see you, they smile and wave, but seem content to make as little commotion as possible.");
		}
		else
		{
			picType = 2;
			output("\n\nTwo laquine twins are at play");
			if (otherKids) output(" some distance from the other children");
			output(". They’re scribbling away in small notebooks that, from this distance, don’t look like prize winners. But who is at their age? Once they’ve exhausted the fun in it, they’re chasing after each other in an impromptu game of clumsy tag.");
		}
	}
	else if (kidCnt >= 3)
	{
		if (rand(2) == 0)
		{
			picType = 1;
			output("\n\nYour " + num2Text(kidCnt) + " fuzzy laquine children are all sitting at a table in the corner")
			if (otherKids) output(", far from the other children"); 
			output(", enjoying one of their daily meals. Colorful fruits and healthy greens fill their small plates while they interact rather sheepishly with one another. Their faces light up when you enter the room, however, and they wave with bright smiles.");
		}
		else
		{
			picType = 3;
			output("\n\nThe half-rabbits dominate this space");
			if (otherKids) output(" in comparison to the other children");
			output(". They’re rough-housing, bouncing all over the place, playing tag and making a right mess of the commons. Nursery staff are on top of the matter, calmly cleaning up the messes in the wake of those tiny tornados flopping around on deep reserves of lapine energy. One of them falls dramatically and is pinned by their adorable " + (male ? "brother" : "sister") + "; both are laughing so happily that it forces you to as well.");
		}
	}	
	
	if (kidCnt >= 24)
	{
		picType = 4;
		output("\n\nThere’s a distinct lapine edge to this room now");
		if (otherKids) output(", and it drowns out the presence of your other kids at times");
		output(". Many of your laquine children are playing with their food to the staff’s chagrin. Briget seems to be concluding her stern warning, nodding her head to you as she returns to her daily affairs. The leporine tykes, however, perk right back up when they see you in her place, waving and smiling as always.");
	}
	else if (kidCnt >= 16)
	{
		if (rand(2) == 0)
		{
			picType = 3;
			output("\n\nYour laquine children have certainly organized themselves into the little lords and ladies of this room. Of the play that goes on here now, they try to be at the center of it. Hard not to be when there are so many boundless, determined rabbit-boys and rabbit-girls looking for any excuse to run, jump, and fall... then do it over again. When they see you, they all try to tackle you by the [pc.legOrLegs], eager to shower you with pent-up affection.");
		}
		else
		{
			picType = 5;
			output("\n\nThere seems to be a spur of the moment art club in effect. A bunch of your laquine children are arguing back and forth on the quality of three presented art pieces. Your opinion of the displayed canvases are that they’re typical of a child’s quality, but you appreciate the competitive edge two of your bunny-sons are showing. They’re even casting votes!");
		}	
	}
	else if (kidCnt >= 10)
	{
		picType = 4;
		output("\n\nWhile most of your kids probably eat in the cafeteria, your laquine children seem to enjoy feasting at the far corner at their own big table.");
		if (otherKids) output(" Other children are welcome, but most have since had their meal.");
		output(" Echoing squeals and giggles fill the air when they see you. So much positive energy is directed your way when they smile and wave at you.");
	}
	
	if (boredJumperPregKidTotal( -1) > 0) output("\n\nYou could snap a pic of this for their missing parent, show that sweaty Jumper what she’s missing out on.");
	
	flags["BJUMPER_SEND_PICKTYPE"] = picType;
}
//test blurb to send pic to jumper
public function boredJumperPregSendPic():void
{
	clearOutput();
	author("William");
	showBust("");
	showName("SEND\nPIC");
	
	var pickType:int = flags["BJUMPER_SEND_PICKTYPE"];
	
	output("Hoisting up your Codex, you aim it at your children, snapping a perfect image of them");
	if (pickType == 1) output(" sitting together and eating. Their bunny incisors practically glint in the shot.");
	else if (pickType == 2) output(" and the art they’re working on. It’s quite good for beginners!");
	else if (pickType == 3) output(" chasing after each other with the nursery staff in hot pursuit. That’s one for the scrapbook!");
	else if (pickType == 4) output(" sitting together, faces all spread in big, happy smiles. Just thinking about this one’ll keep you warm at night!");
	else if (pickType == 5) output(" having their art vote. It’s much too adorable to have <i>not</i> taken the photo!");
	else output(".");
	
	if (flags["BJUMPER_SEND_PIC"] == 1) output("\n\nYou pull down your list of contacts and find that throwaway-sounding address, attach the pics, and hit send.");
	else
	{
		flags["BJUMPER_SEND_PIC"] = 1;
		output("\n\nYou pull out the note you were given and punch in the information, attaching the image, and sending it.");
	}
	
	output("\n\nHopefully she enjoys that.");
	if (pc.libido() >= 50) output("\n\nAnd hopefully, she’ll enjoy doing it all over again!");
	
	//set timer to randomly send reply email within the next 24 hours
	if (flags["BJUMPER_SEND_TIMER"] == undefined) flags["BJUMPER_SEND_TIMER"] = GetGameTimestamp();
	
	var sel:Array = [];
	var i:int;
	var rn:int;
	
	if (boredJumperPregKidTotal(GLOBAL.TYPE_EQUINE) > 0) sel.push(GLOBAL.TYPE_EQUINE);
	if (boredJumperPregKidTotal(GLOBAL.TYPE_CANINE) > 0) sel.push(GLOBAL.TYPE_CANINE);
	if (boredJumperPregKidTotal(GLOBAL.TYPE_FELINE) > 0) sel.push(GLOBAL.TYPE_FELINE);
	if (boredJumperPregKidTotal(GLOBAL.TYPE_HUMAN) > 0) sel.push(GLOBAL.TYPE_HUMAN);
	
	i = sel.length;
	
	if (i > 0)
	{
		rn = rand(i);
		//set which jumper will respond
		flags["BJUMPER_SEND_TYPE"] = sel [rn];
	}
	else flags["BJUMPER_SEND_TYPE"] = -1;
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//text for return email from jumper
public function boredJumperPregSendPicEmail():String
{
	var eText:String = "";
	var emailTxt:int = rand(12);
	if (emailTxt == 0)
	{
		eText += "Omigod, they’re all together like that already, they sure grow fast!";
		eText += "\n\nSend me more okay?";
		eText += "\n\n<i>Attached is a picture of your Jumper's crotch barely visible beneath a half-opened zipper. You can still clearly see her dick, though.</i>";
	}
	else if (emailTxt == 1)
	{
		eText += "I wonder if they play like that because of you or me.";
		eText += "\n\nDon’t let ‘em go thinking they’re space rangers okay?";
		eText += "\n\nI don’t mind if you yourself want to though. Let’s get together again sometime.";
		eText += "\n\n<i>Attached is a picture of your Jumper's crotch barely visible beneath a half-opened zipper. You can still clearly see her dick, though.</i>";
	}
	else if (emailTxt == 2)
	{
		eText += "Aww, I hope that one on the right makes it as an artist. Don’t tell em I said that.";
		eText += "\n\nThat pic is the best.";
		eText += "\n\n<i>Attached is a picture of your Jumper's crotch barely visible beneath a half-opened zipper. You can still clearly see her dick, though.</i>";
	}
	else if (emailTxt == 3)
	{
		eText += "Yesss, that’s what I wanted to see! Look at all of them.";
		eText += "\n\nI just want to hug them so tight!";
		eText += "\n\nMaybe someday. You take care of them, okay?";
		eText += "\n\n<i>Attached is a picture of your Jumper's crotch barely visible beneath a half-opened zipper. You can still clearly see her dick, though.</i>";
	}
	else if (emailTxt == 4)
	{
		eText += "Hehe, they look like they just got disciplined. I’d know that kinda face anywhere.";
		eText += "\n\nMade it a lot when I was young too. They’ve inherited something bad from me.";
		eText += "\n\nWhy don’t you come by and punish me for that, babe?";
		eText += "\n\n<i>Attached is a picture of your Jumper's crotch barely visible beneath a half-opened zipper. You can still clearly see her dick, though.</i>";
	}
	else if (emailTxt == 5)
	{
		eText += "Oooh, my kids are doing well, huh? Laquines’ll do that, grow fast, do awesome fast...";
		eText += "\n\nHow about we make some more?";
		eText += "\n\n<i>Attached to this email is a picture of your pirate-bun’s cock, in all its rigid, foot-long glory.</i>";
	}
	else if (emailTxt == 6)
	{
		eText += "Thanks, babe. Busy though.";
		eText += "\n\nfuckin’ super cute!";
	}
	else if (emailTxt == 7)
	{
		eText += "hehe, they’re amazing. Oh god I wanna come and hug them so bad!";
		eText += "\n\nbut just send stuff, don’t stop. Make sure to visit them often!";
	}
	else if (emailTxt == 8)
	{
		eText += "Woooahhhhhhh that’s soooo cuuutee!";
		eText += "\n\nBut my head is a little fuzzy... sorry, just make them smile more.";
	}
	else if (emailTxt == 9)
	{
		eText += "Ah shit, you sent that when my boss was near... fuck that coulda been so bad";
		eText += "\n\nim glad they r helthy, bt gota run";
	}
	else if (emailTxt == 10)
	{
		eText += "Nice";
		eText += "\n\n<i>Attached to this email is a photo with a downward facing angle of your furry lover’s perky boobs, sweaty nipples jutting. Looks like you caught the unzipped bun masturbating!</i>";
	}
	else if (emailTxt == 11)
	{
		eText += "Mooreeee! Come show me some love sometime!";
		eText += "\n\nCome back and let’s make another litter!";
	}
	
	return doParse(eText);
}
//text for spend time in nursery common area in nursery.as
public function boredJumperPregSpendTimeCommonArea():void
{
	clearOutput();
	author("William");
	showBust("");
	showName("SPEND\nTIME");
	
	var arg:Array = nurseryAgeCounts(GLOBAL.TYPE_LAPINE,1,10);
	var babyCnt:int = arg[0];
	var kidCnt:int = arg[1];
	var oldCnt:int = arg[2];
	var maleKids:int = arg[3];
	var femaleKids:int = arg[4];
	var hermKids:int = arg[5];
	
	var timeSpent:int = 0;
	var male:Boolean = false;
	//pick if kid in scene is male or female/herm
	if (rand(kidCnt) < maleKids) male = true;
	
	if (rand(2) == 0)
	{
		output("Your kids are abuzz when you seat yourself near them, and they’re pawing over you for hugs, kisses, and an unbeatable desire to share what they’re doing with their " + pc.mf("dad","mom") + ". They sit in a circle with you. Excited beyond belief, it’s almost too hard to get them to settle down long enough to tell you about their day. In the middle of your round table they put all their toys and coloring books, wanting you to see what they have.");
		output("\n\nOf course you smile.");
		if (male) output("\n\nThe tykes throw a variety of stories at you. One talks about the ‘disagreement’ they had with one of the staff that Briget successfully negotiated. Seems like it had such an impact on him that he decided to learn more about talking through things rather than ball up his fists and whine. You’re told that the rambunctious little half-rabbit invoked your name to get his way once, too. For now, you place a firm hand on his head and tell him to rein in the frustration.");
		else output("\n\nThe tykes throw a variety of stories at you. One talks about the ‘disagreement’ they had with one of the staff that Briget successfully negotiated. Seems like it had such an impact on her that she decided to learn more about talking through things rather than ball up her fists and whine. You’re told that the rambunctious little half-rabbit invoked your name to get her way once, too. For now, you place a firm hand on her head and tell her to rein in the frustration.");
		
		output("\n\nThe next story you hear from your rapidly growing litter is a food fight they had in the cafeteria. They can’t speak more than three words without bursting into laughter, talking about the strawberries they tossed at each other. The staff were understandably livid, but it looks like nobody was hurt at least.");
		output("\n\nFor a few minutes more they regale you until all they want to do is play in your vicinity, spending much more time focused on each other’s growth than your inspiring presence.");
	
		if (boredJumperPregKidTotal( -1) > 0) output(" Taking a prime opportunity, you tell them all to smile for your Codex while you snap a pic to send to their missing parent. That pirate-bunny will definitely rethink her ways when she sees their gleaming faces and mischievous rabbit-teeth.");
	
		output("\n\nDeciding it’s time to go, you stand and rub their heads, getting hugged around the [pc.legOrLegs] before you move on. You’ll have to come back soon...");
		
		timeSpent = 15 + ((rand(5) + 2) * kidCnt);
		if (timeSpent > 120) timeSpent = 120;
	}
	else
	{
		output("Since your laquine children have built themselves a rather cozy spot in the corner, you’re not surprised to be the guest of honor. They rally around you if they’re more than a few inches away, bombarding you with simple questions: how your day went, what you’re doing now, why you’re not here all day, that sort of thing.");
		output("\n\nYou answer them as parentally as you can, watching them eat and talk about their day, what they want to do tomorrow, and they’ll get up to when they get a chance to visit the park again. For your part, you’re much too mesmerized in their presence, overwhelmed by the fact they’re growing so fast. Their floppy, twitchy ears trap your gaze the most, their voices drowning out in your focus on their smiles, their eating...");
		output("\n\nIf only you could be here all day, helping to raise them.");
		output("\n\nBut, sadly, you really can’t stay long. When you stand to leave, they about jump over the table to get your attention or say goodbye. You pat them all on the head, making sure those ears get plenty of attention");
			
		if (boredJumperPregKidTotal( -1) > 0) output(" This presents a prime opportunity for a photo, and after they all smile, you fire off another good image to your Jumper lover. Hopefully she’ll get back to you on that...");
		
		output("\n\nOnce all’s said, you’re standing at the entrance to the room, wondering what else to do...");
		
		timeSpent = 10 + ((rand(5) + 1) * kidCnt);
		if (timeSpent > 120) timeSpent = 120;
	}
	
	processTime(timeSpent);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//text for nursery education center in nursery.as
public function boredJumperPregLaquineEducationCenterBlurbs():int
{
	var sceneNum:int = 0;
	
	if (rand(2) == 0)
	{
		output("\n\nHere is where your more self-sufficient laquine children are brought to study and learn. Right now you see a class in session, sitting before a wall-dominating holoscreen playing some sort of historical segment. You’re not quite sure what time period it’s from, but the tall, ladylike");
		if (CodexManager.entryViewed("Saurmorians")) output(" saurmorian");
		else output(" lizard-woman");
		output(" and her two teaching aides are speaking loud and with authority.");
		output("\n\nYour rabbit-eared kids are nose-deep in papers, hastily scrawling down notes.");
		output("\n\nYou could sit in on the class for a bit... see what’s going on. And, of course, keep your kids company!");
		sceneNum = 1;
	}
	else
	{		
		output("\n\nClass is in session, featuring plenty of your older laquine children, whose eyes locked to a stern looking man at the front of class giving a long, long... perhaps too long lecture on something. Even from here you can sense the lapine lethargy. You might consider sitting in on the class and seeing what’s got them so down, and possibly helping them soldier through it.");
		sceneNum = 2;
	}
	
	return sceneNum;
}
//text for spend time in nursery education center in nursery.as
public function boredJumperPregSpendTimeEducationCenter(sceneNum:int=0):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("SPEND\nTIME");
	
	var arg:Array = nurseryAgeCounts(GLOBAL.TYPE_LAPINE,1,10);
	var babyCnt:int = arg[0];
	var kidCnt:int = arg[1];
	var oldCnt:int = arg[2];
	var maleKids:int = arg[3];
	var femaleKids:int = arg[4];
	var hermKids:int = arg[5];
	
	var timeSpent:int = 0;
	var male:Boolean = false;
	var male2:Boolean = false;
	var kcnt:int = kidCnt;
	var mcnt:int = maleKids;
	
	//pick if kid in scene is male or female/herm
	if (rand(kcnt) < mcnt)
	{
		male = true;
		mcnt -= 1;
	}
	kcnt -= 1;
	if (rand(kcnt) < mcnt)
	{
		male2 = true;
	}
	
	if (sceneNum == 1)
	{
		output("You take a seat in the back of the room, the regal, scaly teacher noting you with a big nod that draws attention to you. <i>“Welcome, [pc.mister] Steele. We were in the middle of a lesson on human history, one about a famous economic dispute on Terra from very long ago.”</i> Before there can be any excitement at your arrival, she smacks a ruler to her desk and keeps them on focus. It was enough to shock you back into school for a bit, yourself!");
		output("\n\n<i>“Now, what have you all learned from this piece of Terran history? Hm, anyone?”</i> she asks.");
		output("\n\nThe material she covers is a lot more advanced than you expected. From what you grok, they’re discussing an old mercantile dispute that happened in the pre-U.G.C. days. It’s being used as a relative concept to the lesson in front of them: some sort of all-in-one lesson on mathematics, history, a little bit of law, all intended to give your kids a chance to interpret the world around them.");
		output("\n\nHave your offspring really grown to the point that they’re learning something like this?");
		output("\n\n<i>“Yes, you.”</i>");
		output("\n\nOne of your " + (male ? "sons" : "daughters") + " stands from " + (male ? "his" : "her") + " desk. <i>“Well... both of them were in the right, but the violence was uncalled for. If the Arden family was so worried, they could have called for a mediator.”</i>");
		output("\n\n<i>“True,”</i> the exceedingly well-dressed teacher replies. <i>“But the so-named Buckthorns had a right to that space. Accident though it may have been, the Ardens still trespassed. But, you can see here that they, too, were quick to judge...”</i>");
		output("\n\nThe study continues, a long and rather interesting tale of two rival family-companies that had a bumpy relationship which almost led to all-out war. Each of your children offers their outlook on the matter, their interpretation on what could have been done rather than what the families employed: deceitfulness, briberies... and you realize how well this seems to gauge their burgeoning personalities. The red-skinned");
		if (CodexManager.entryViewed("Saurmorians")) output(" saurmorian");
		else output(" lizard");
		output(" is extremely happy with their progress, awarding them all high grades at the end for that and more.");
		
		output("\n\nWhen you stand to leave, she pulls you aside. <i>“They’re doing well, [pc.mister] Steele. You should keep an eye on those two there,”</i> she points to a taller " + (male ? "boy" : "girl") + " and " + (male2 ? "boy" : "girl") + ", <i>“...they’re the big earners. But I try not to let it go to their heads.”</i>");
	}
	else if (sceneNum == 2)
	{
		output("The whole room ignites when you show up, planting your bottom in the seat of a corner desk. The professor at the front bears a wizened and studied appearance that gives off an expertise earned through years of learning. He lends you a thoughtful nod, in full control of his speech. He can certainly do two things at once!");
		output("\n\n<i>“Now, you see here,”</i> he points to a board, <i>“this is why we refer to Helms’ theory. Many of the galaxy’s races came to technology in their own unique way, but among them all this has stood the test of time as the most ubiquitous, improvable, modifiable...”</i>");
		output("\n\nYou’re tuning out already, and could not be more disinterested. Why on earth are your children learning about theories from electricians this early? Laquines grow fast compared to humans, but damn, this is not what kids this young need.");
		output("\n\nAnd so this professor goes on, and on, droning on about the most mundane of things, taking simply too long to get to his points. You wonder if he even notices that half his class has fallen asleep. You’re halfway there yourself. In fact, you find it far more interesting that your bored jumpers have discovered uncanny ways to feign awareness of what’s going on, keeping their ears up or at least on display while shrinking further and further back.");
		output("\n\nIf that’s what this class is supposed to teach, that closing your eyes is a great way to avoid paying attention, they all deserve straight A’s.");
		output("\n\nMercifully it comes to an end some indeterminable time later. The teacher palms a bell after finishing the talk, and the students leap up and bound from the room as fast they can, discarded papers floating in their wake. Before you have to take responsibility, you’re hurrying out back to the nursery at large.");
	}
	else
	{
		output("");
	}
	
	processTime(30 + rand(30));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//returns total kids from one or all jumpers
public function boredJumperPregKidTotal(jumperType:int =-1):int
{
	var totalKids:int = 0;
	
	if (jumperType == -1)
	{
		if (flags["BJUMPER_HORSE_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_HORSE_TOTAL_KIDS"];
		if (flags["BJUMPER_DOG_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_DOG_TOTAL_KIDS"];
		if (flags["BJUMPER_CAT_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_CAT_TOTAL_KIDS"];
		if (flags["BJUMPER_TERRAN_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_TERRAN_TOTAL_KIDS"];
	}
	else if (jumperType == GLOBAL.TYPE_EQUINE && flags["BJUMPER_HORSE_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_HORSE_TOTAL_KIDS"];
	else if (jumperType == GLOBAL.TYPE_CANINE && flags["BJUMPER_DOG_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_DOG_TOTAL_KIDS"];
	else if (jumperType == GLOBAL.TYPE_FELINE && flags["BJUMPER_CAT_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_CAT_TOTAL_KIDS"];
	else if (jumperType == GLOBAL.TYPE_HUMAN && flags["BJUMPER_TERRAN_TOTAL_KIDS"] != undefined) totalKids += flags["BJUMPER_TERRAN_TOTAL_KIDS"];
	
	return totalKids;
}
//returns color for specific jumper
public function boredJumperHairColor(jumperType:int=0):String
{
	var hairColor:String = "green";
	
	if (jumperType == GLOBAL.TYPE_EQUINE) hairColor = "pink";
	else if (jumperType == GLOBAL.TYPE_CANINE) hairColor = "purple";
	else if (jumperType == GLOBAL.TYPE_FELINE) hairColor = "orange";
	else if (jumperType == GLOBAL.TYPE_HUMAN) hairColor = "green";
	
	return hairColor;
}
public function boredJumperFurColor(jumperType:int=0):String
{
	var furColor:String = "brown";
	
	if (jumperType == GLOBAL.TYPE_EQUINE) furColor = "gray";
	else if (jumperType == GLOBAL.TYPE_CANINE) furColor = "white";
	else if (jumperType == GLOBAL.TYPE_FELINE) furColor = "creamy";
	else if (jumperType == GLOBAL.TYPE_HUMAN) furColor = "brown";
	
	return furColor;
}
public function boredJumperEyeColor(jumperType:int=0):String
{
	var eyeColor:String = "green";
	
	if (jumperType == GLOBAL.TYPE_EQUINE) eyeColor = "purple";
	else if (jumperType == GLOBAL.TYPE_CANINE) eyeColor = "amber";
	else if (jumperType == GLOBAL.TYPE_FELINE) eyeColor = "amber";
	else if (jumperType == GLOBAL.TYPE_HUMAN) eyeColor = "green";

	return eyeColor;
}

public function boredJumperLipColor(jumperType:int=0):String
{
	var lipColor:String = "peach";
	
	if (jumperType == GLOBAL.TYPE_EQUINE) lipColor = "black";
	else if (jumperType == GLOBAL.TYPE_CANINE) lipColor = "pink";
	else if (jumperType == GLOBAL.TYPE_FELINE) lipColor = "pink";
	else if (jumperType == GLOBAL.TYPE_HUMAN) lipColor = "peach";

	return lipColor;
}

public function boredJumperNippleColor(jumperType:int=0):String
{
	var nippleColor:String = "peach";
	
	if (jumperType == GLOBAL.TYPE_EQUINE) nippleColor = "black";
	else if (jumperType == GLOBAL.TYPE_CANINE) nippleColor = "bright pink";
	else if (jumperType == GLOBAL.TYPE_FELINE) nippleColor = "pink";
	else if (jumperType == GLOBAL.TYPE_HUMAN) nippleColor = "peach";

	return nippleColor;
}
//see if steele qualifies for sneak bb scene
public function boredJumperisSneakBBOK(sceneNum:int=0):Boolean
{
	if (pc.hasVagina() && sceneNum == 1 && !pc.isFullyWombPregnant() && pc.hasItemByClass(BreedersBliss, 1)) return true;
	
	return false;
}
//see if steele can do laquine breastfeeding scenes
public function boredJumperBreastFeedOK():Boolean
{
	// Note: edited for consistency, sorry!
	//if (pc.isLactating() && pc.milkType != GLOBAL.FLUID_TYPE_CUM && pc.milkType != GLOBAL.FLUID_TYPE_GIRLCUM && (pc.hasNormalNipples() || pc.hasInvertedNipples())) return true;
	//return false;
	return (pc.isLactating());
}
//has the jumper been told steeles name
public function boredJumperKnowsSteelesName(jumperType:int=0):Boolean
{
	if (jumperType == GLOBAL.TYPE_EQUINE && flags["BJUMPER_HORSE_PREG_NAME"] == 1)
	{
		return true;
	}
	if (jumperType == GLOBAL.TYPE_CANINE && flags["BJUMPER_DOG_PREG_NAME"] == 1)
	{
		return true;
	}
	if (jumperType == GLOBAL.TYPE_FELINE && flags["BJUMPER_CAT_PREG_NAME"] == 1)
	{
		return true;
	}
	if (jumperType == GLOBAL.TYPE_HUMAN && flags["BJUMPER_TERRAN_PREG_NAME"] == 1)
	{
		return true;
	}
	return false;
}
//set the flag for telling steeles name if applicable
public function boredJumperSetSteelesName(jumperType:int=0):Boolean
{
	if (jumperType == GLOBAL.TYPE_EQUINE && flags["BJUMPER_HORSE_PREG_NAME"] != 1)
	{
		flags["BJUMPER_HORSE_PREG_NAME"] = 1;
		return true;
	}
	if (jumperType == GLOBAL.TYPE_CANINE && flags["BJUMPER_DOG_PREG_NAME"] != 1)
	{
		flags["BJUMPER_DOG_PREG_NAME"] = 1;
		return true;
	}
	if (jumperType == GLOBAL.TYPE_FELINE && flags["BJUMPER_CAT_PREG_NAME"] != 1)
	{
		flags["BJUMPER_CAT_PREG_NAME"] = 1;
		return true;
	}
	if (jumperType == GLOBAL.TYPE_HUMAN && flags["BJUMPER_TERRAN_PREG_NAME"] != 1)
	{
		flags["BJUMPER_TERRAN_PREG_NAME"] = 1;
		return true;
	}
	return false;
}
//where is the scene taking place in zheng shi
//a little hacky but no other way to determine these locations
//-1 error, 0 = mines, 1 = foundry, 2 = hanger
public function boredJumperPregLocation():int
{
	var tRoom:RoomClass = rooms[currentLocation];
	if (tRoom.runOnEnter == zhengMinesEncounterBonus) return 0;
	if (tRoom.runOnEnter == zhengFoundryF1EncounterBonus || tRoom.runOnEnter == zhengFoundryF2EncounterBonus) return 1;
	if (currentLocation == "ZS L46" || currentLocation == "ZS L48" || currentLocation == "ZS L50") return 2;
	
	return -1;
}
//kids currently playing in cafeteria
public function boredJumperPregAreLaquineKidsPlaying():Boolean
{
	if (hours >= 7 && hours <= 19) return true;
	return false;
}
//play preg scene in the zheng shi hanger
public function boredJumperPregHangerEncounter():Boolean
{
	var pregScene:int = boredJumperPregScene();
	var choice:int;
	if (rand(8) == 0)
	{
		if (flags["BJUMPER_BIRTH_SCENE"] == 1)
		{
			return boredJumperPregEncounterJumperPregBirth();
		}
		else
		{
			if (pregScene == 1) return boredJumperPregEncounterJumperPreg();
			if (pregScene == 2) return boredJumperPregEncounterSteelePreg();
			if (pregScene == 3) return boredJumperPregEncounterBothPreg();
			if (pregScene == 4)
			{
				if (rand(2) == 0) return boredJumperPregEncounterJumperPreg();
				else return boredJumperPregEncounterSteelePreg();
			}
			if (pregScene == 5)
			{
				choice = rand(3);
				if (choice == 0) return boredJumperPregEncounterJumperPreg();
				else if (choice == 1) return boredJumperPregEncounterSteelePreg();
				else return boredJumperPregEncounterBothPreg();
			}
		}
	}
	
	return false;
}
//which jumper got pc preg, returns random one if multiple and no preg slot specified
public function boredJumperPregGetPCPregType(pregslot:int =-1):int
{
	var jumperType:int = -1;
	
	if (pregslot == 0)
	{
		if (flags["BJUMPER_PC_PREG_TYPE"] != undefined) jumperType = flags["BJUMPER_PC_PREG_TYPE"];
	}
	else if (pregslot == 1)
	{
		if (flags["BJUMPER_PC_PREG_TYPE1"] != undefined) jumperType = flags["BJUMPER_PC_PREG_TYPE1"];
	}
	else if (pregslot == 2)
	{
		if (flags["BJUMPER_PC_PREG_TYPE2"] != undefined) jumperType = flags["BJUMPER_PC_PREG_TYPE2"];
	}
	else
	{
		var sel:Array = [];
		var i:int;
		var rn:int;
	
		if (flags["BJUMPER_PC_PREG_TYPE"] != undefined) sel.push(flags["BJUMPER_PC_PREG_TYPE"]);
		if (flags["BJUMPER_PC_PREG_TYPE1"] != undefined) sel.push(flags["BJUMPER_PC_PREG_TYPE1"]);
		if (flags["BJUMPER_PC_PREG_TYPE2"] != undefined) sel.push(flags["BJUMPER_PC_PREG_TYPE2"]);
	
		i = sel.length;
	
		if (i > 0)
		{
			rn = rand(i);
			//pick a random daddy
			jumperType = sel[rn];
		}
	}
	
	return jumperType;
}
//steele jumper preg ends (run from the BoredJumperPregHandler)
public function boredJumperPregPregnancyEnds():void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass;
	var numChildren:int = 0;
	//var bRatingContrib:int = se.value2;
	//var pregSlot:int = se.value3;
	//var babym:Boolean = (se.value4 == 1);
	
	var multiPreg:Boolean = false;
	
	var jumperType:int = -1;
	if (flags["BJUMPER_PREG_SCENE_TYPE"] != undefined) jumperType = flags["BJUMPER_PREG_SCENE_TYPE"];
	
	//use this to track number of wombs giving birth
	flags["BJUMPER_PREGHAND_MULTIBIRTH"] = 0;
	
	if (pc.hasStatusEffect("Bored Jumper Pregnancy Ends 0"))
	{
		se = pc.getStatusEffect("Bored Jumper Pregnancy Ends 0");
		numChildren += se.value1;
		pc.removeStatusEffect("Bored Jumper Pregnancy Ends 0");
		IncrementFlag("BJUMPER_PREGHAND_MULTIBIRTH");
	}
	if (pc.hasStatusEffect("Bored Jumper Pregnancy Ends 1"))
	{
		se = pc.getStatusEffect("Bored Jumper Pregnancy Ends 1");
		numChildren += se.value1;
		pc.removeStatusEffect("Bored Jumper Pregnancy Ends 1");
		IncrementFlag("BJUMPER_PREGHAND_MULTIBIRTH");
	}
	if (pc.hasStatusEffect("Bored Jumper Pregnancy Ends 2"))
	{
		se = pc.getStatusEffect("Bored Jumper Pregnancy Ends 2");
		numChildren += se.value1;
		pc.removeStatusEffect("Bored Jumper Pregnancy Ends 2");
		IncrementFlag("BJUMPER_PREGHAND_MULTIBIRTH");
	}		
	
	if (flags["BJUMPER_PREGHAND_MULTIBIRTH"] > 1) multiPreg = true;
	
	var loc:String = getPlanetName().toLowerCase(); //current planet
	
	//special scene for jumper kids if on zheng shi
	if (!InShipInterior() && loc == "zheng shi station")
	{
		var numWombs:int = flags["BJUMPER_PREGHAND_MULTIBIRTH"];
		var smallHips:Boolean = true;
		if (pc.hipRating() >= 14) smallHips = false;
		var encLocation:int = boredJumperPregLocation();
		var dblBirth:Boolean = false;		
		flags["BJUMPER_PREGHAND_MULTIBIRTH"] = undefined;
		
		var numBoys:int = 0;
		var numGirls:int = 0;
		var numHerms:int = 0;
		if (flags["BJUMPER_PC_BIRTH_SCENE_BOYS"] != undefined && flags["BJUMPER_PC_BIRTH_SCENE_BOYS"] > 0) numBoys = flags["BJUMPER_PC_BIRTH_SCENE_BOYS"];
		if (flags["BJUMPER_PC_BIRTH_SCENE_GIRLS"] != undefined && flags["BJUMPER_PC_BIRTH_SCENE_GIRLS"] > 0) numGirls = flags["BJUMPER_PC_BIRTH_SCENE_GIRLS"];
		if (flags["BJUMPER_PC_BIRTH_SCENE_HERMS"] != undefined && flags["BJUMPER_PC_BIRTH_SCENE_HERMS"] > 0) numHerms = flags["BJUMPER_PC_BIRTH_SCENE_HERMS"];
		
		var milk:Number = 200 * numChildren;
		if (milk > pc.milkQ()) milk = pc.milkQ();
		
		var timestamp:int = GetGameTimestamp();
		var numJumperBabies:int = 0;
		var numJumperBoys:int = 0;
		var numJumperGirls:int = 0;
		var numJumperHerms:int = 0;
		var jumperTypeCnt: int = 0;
		
		setEnemy(new JumperBored());
		enemy.furColor = boredJumperFurColor(jumperType);
		enemy.hairColor = boredJumperHairColor(jumperType);
		enemy.eyeColor = boredJumperEyeColor(jumperType);
		enemy.lipColor = boredJumperLipColor(jumperType);
		enemy.nippleColor = boredJumperNippleColor(jumperType);
		
		if (flags["BJUMPER_PREG_TYPE"] != undefined && flags["BJUMPER_PREG_TYPE"] == jumperType && flags["BJUMPER_PREG_TIMER"] >= 177)
		{
			dblBirth = true;
			showPregBoredJumper(true, true,jumperType);
			boredJumperBirth(timestamp);

	
			if (flags["BJUMPER_BIRTH_SCENE_BOYS"] != undefined && flags["BJUMPER_BIRTH_SCENE_BOYS"] > 0)
			{
				numJumperBoys = flags["BJUMPER_BIRTH_SCENE_BOYS"];
				jumperTypeCnt += 1;
			}
			if (flags["BJUMPER_BIRTH_SCENE_GIRLS"] != undefined && flags["BJUMPER_BIRTH_SCENE_GIRLS"] > 0)
			{
				numJumperGirls = flags["BJUMPER_BIRTH_SCENE_GIRLS"];
				jumperTypeCnt += 1;
			}
			if (flags["BJUMPER_BIRTH_SCENE_HERMS"] != undefined && flags["BJUMPER_BIRTH_SCENE_HERMS"] > 0)
			{
				numJumperHerms = flags["BJUMPER_BIRTH_SCENE_HERMS"];
				jumperTypeCnt += 1;
			}
			numJumperBabies = numJumperBoys + numJumperGirls + numJumperHerms;
		}
		else showPregBoredJumper(false, true,jumperType);
		
		var hasAssisted:Boolean = false;
		if (jumperType == GLOBAL.TYPE_EQUINE)
		{
			if (flags["BJUMPER_HORSE_PC_PREG_ASSIST"] != undefined && flags["BJUMPER_HORSE_PC_PREG_ASSIST"] >= 1) hasAssisted = true;
			IncrementFlag("BJUMPER_HORSE_PC_PREG_ASSIST");
		}
		else if (jumperType == GLOBAL.TYPE_CANINE)
		{
			if (flags["BJUMPER_DOG_PC_PREG_ASSIST"] != undefined && flags["BJUMPER_DOG_PC_PREG_ASSIST"] >= 1) hasAssisted = true; 
			IncrementFlag("BJUMPER_DOG_PC_PREG_ASSIST");
		}
		else if (jumperType == GLOBAL.TYPE_FELINE)
		{
			if (flags["BJUMPER_CAT_PC_PREG_ASSIST"] != undefined && flags["BJUMPER_CAT_PC_PREG_ASSIST"] >= 1) hasAssisted = true;
			IncrementFlag("BJUMPER_CAT_PC_PREG_ASSIST");
		}
		else if (jumperType == GLOBAL.TYPE_HUMAN)
		{
			if (flags["BJUMPER_TERRAN_PC_PREG_ASSIST"] != undefined && flags["BJUMPER_TERRAN_PC_PREG_ASSIST"] >= 1) hasAssisted = true;
			IncrementFlag("BJUMPER_TERRAN_PC_PREG_ASSIST");
		}
		
		output("Drenched. Wet. You feel much more soaked than when all this began, and that’s saying something.");
		if (encLocation == 0) output(" The heat makes it easy to feel the tides at your crotch.");
		else if (encLocation == 1) output(" With how on edge you are up here, it’s a shocking kick to the stomach when you feel liquid pressure relieve.");
		else if (encLocation == 2) output(" The coolness of the hangar belies the heat at your [pc.legOrLegs].");
		output(" You look down, stricken with fear. There are suddenly too many kicks at your inner stomach, so many outward hits and slaps.");
		
		output("\n\n<b>Your water just broke.</b> Your babies are coming. Splitting pain arcs across your middle, down through amniotic-washed muscles widening in advance of passing your occupants into the galaxy. Momentarily overwhelmed by the fact you’re still on Zheng Shi, you dart down the hall in the direction of");
		if (encLocation == 2) output(" your ship");
		else output(" the hangar");
		output(", a voice and scent breaking your stress.");
		
		if (dblBirth)
		{
			output("\n\n<i>“Ohhhhh... you too, huh?”</i> a husky, girlish voice is instantly familiar.");
			output("\n\nA rubbery hand wraps around your [pc.fingers]. A buxom, gravid, [enemy.furColor]-pelt rabbit is standing behind you. Somehow there’s a visible wet spot in the pregnant bun’s inflated crotch area. <i>“Hehe, you’re givin’ birth now aren’tcha?”</i> She grunts, looking down. <i>“M-me too..”</i>");
			output("\n\nOh shit.");
			output("\n\n<i>“Better hurry and get somewhere safe. I’m not joking around!”</i> she grimaces, grip tightening. <i>“Us both like this? Easy slaves. And our kids. Don’t gawk,");
			if (boredJumperKnowsSteelesName(jumperType)) output(" [pc.name].</i>");
			else output(" cutie.</i>");
		}
		else
		{			
			output("\n\n<i>“Wait! Stop!”</i> the girlish voice is instantly familiar.");
			output("\n\nA set of gloved fingers curl around your [pc.hand], a buxom, bouncy bunny standing behind. <i>“Hehe, I can smell you anywhere on this station!”</i> the [enemy.furColor] rabbit-woman smiles, nose twitching happily. She looks down meaningfully, <i>“Geez, I was hoping you wouldn’t do this here. Come on, there’s plenty ‘a places to do this. Not ideal places... but I don’t wanna see you helpless!”</i>");
			output("\n\nRefusal doesn’t occur. Her help’s the best thing you’re gonna get.");
			if (flags["BJUMPER_PREG_TYPE"] == jumperType) output(" Of course, now you have to wonder if she’s going to give birth at the same time...");
		}
		
		if (encLocation == 0) output("\n\nShe guides you to an out of the way bend and ‘closet’ of sorts, much cooler than the sweltering mines.");
		else if (encLocation == 2) output("\n\nShe guides you to an unused shack in the hangar. You would prefer your ship, but you can’t make the walk back.");
		else output("\n\nShe guides you to a rather cozy break room, locking the door tight behind herself.");
		output(" <i>“Now, let’s see...”</i>");
		
		if (dblBirth) output("\n\nShe lumbers");
		else output("\n\nShe darts");
		output(" all around the room while you sit and spread your legs, the only easy part of this. Drawers and cabinets are flung open, the Jumper scrounging for anything that’ll help make this a bit easier");
		if (dblBirth) output(" on the both of you");
		output(". Labor aches crawl through you at a body-curling pace, overpowering any kind of pleasant sensation while you lie back. ");
		if (dblBirth) output(" The heavy");
		else output(" The nimble");
		output(" hare’s at your side, adrenaline spiked alongside yours");
		if (!pc.isCrotchExposed()) output("; she has your clothes off in a jiffy");
		output(".");
		if (dblBirth) output(" Her zipsuit comes off seconds later.");
		
		if (dblBirth)
		{
			output("\n\n<i>“Sorry, I can’t... exactly help you in my position.”</i> She’s sit down next to you, spreading her legs while holding tight to your hand.");
			if (hasAssisted) output(" <i>“Can’t believe we’re doing this again, but whatever. I’m ready this time!”</i>\n\nYou almost snap at her... <i>dumb</i> smile, but you are ready for this. Doing it once has given you some amount of pain adaptation.");
			else output(" <i>“Guess we just push now, huh?”</i>\n\nHer... <i>stupid</i> commentary is still helpful. It annoys you, just like the silly smile on her face. Then you laugh. Those two emotions are a brilliant distraction from the pain you’re both about to go through.");
		}
		else
		{
			output("\n\n<i>“Alright, umm,”</i> she smiles shyly, placing a scrap of fabric");
			if (pc.isNaga()) output(" in front of your crotch, ready to catch the kids.");
			else output(" between your [pc.legOrLegs], ready to catch the kids.");
			if (hasAssisted) output(" <i>“You know what to do. I’m ready this time!”</i>\n\nReady for what? You frown at her, as frustrated as last time, but ironically amused. Her enthusiastic manner makes it easy to get started.");
			else output(" <i>“Push?”</i>\n\nHer lack of experience in the matter is helpful, in its own way. It annoys you, for starters, and it kind of makes you laugh. Both of those emotions are a welcome distraction from the pain.");
		}
		
		output("\n\nYou’re on autopilot by this point, the burbling in your too-bloated stomach and the sharp aches that follow expedite the flow of grunts and curses. Her hand claps over your mouth; your bunny-lover reminds you not to draw attention. She shakes her head, looking a bit nervous while your cervix softens and dilates, the process of childbirth beginning in earnest.");
		output("\n\nHer palm eats the brunt of your growl before she pulls away");
		if (dblBirth) output(", belabored by her own contractions"); 		
		output(". The strain on your birthing canal is indescribable; your pelvic structure is forced to make room for however many kids might be coming out.");
		if (pc.gapestVaginaLooseness() >= 4)
		{
			output(" Although you’ve been loosened up by more than one sexual thrill, it only improves the expressing of your fuzzy litter through");
			if (multiPreg)
			{
				output(" one lubricated tunnel, and then the other");
				if (numWombs) output("s");
			}
			else output(" your lubricated tunnel");
			output(".");
		}
		else
		{
			output(" Your innate vaginal tightness only makes this worse, and those lubricated walls are no match for the fuzzy boulders making their way through");
			if (multiPreg)
			{
				output(" one tunnel, and then the other");
				if (numWombs) output("s");
			}
			else output(" your tunnel");
			output(".");
		}
		if (smallHips) output(" This all has the side effect of stretching your [pc.hips] out into a permanent, more appropriate shape for a mother.");
		
		output("\n\nYou push, and push some more; a cold sweat");
		if (pc.hasScales()) output(" washes over your scales.");
		else if (pc.hasFur()) output(" washes over your furs.");
		else output(" overlays your skin.");
		
		output(" Head thrown back, you feel and half-see the first pair of floppy ears emerging from snug and moist confines. The first of your kids squirms and flops out");
		if (dblBirth) output(" onto the makeshift blankets, one kid emerging from your lover at the same time.");
		else output(" into the waiting hands of his or her ‘dad’, who wraps the mewling munchkin in a thin blanket.");
		
		if (numChildren == 2)
		{			
			output("\n\nWhen that second rabbit pops free, your tribulations end there in curious fashion. You’re not complaining, though, now that the spasms are fading. Faint squeals have your heart aflutter, and when you finally rise, you see");
			if (dblBirth) output(" your two bundles of joy sniffling and squeaking.");
			else output(" the latex-bound Jumper clutching tight two bundles of joy.");
			output(" One has lop ears, and the other upraised ears, and they’re both curtained head to toe in " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + " fur.");
			if (dblBirth) output(" <i>“Aw, you’re already done?”</i>");
			else output(" <i>“Geez, this is...”</i>");
			
			output("\n\nSqueakily");
			if (dblBirth) output(" shuffling closer");
			else output(" sitting herself next");
			output(" to you, she is at a total loss for words when taking in your newborn <b>");
			if (numBoys == 2) output(" sons");
			else if (numGirls == 2) output(" girls");
			else if (numHerms == 2) output(" hermaphrodites");
			else if (numBoys == 1 && numGirls == 1) output(" son and daughter");
			else if (numBoys == 1 && numHerms == 1) output(" hermaphrodite and son");
			else if (numHerms == 1 && numGirls == 1) output(" hermaphrodite and daughter");
			output(".</b> There’s a certain happiness coursing through her");
			if (dblBirth) output(" pained");
			output(" veins, one that you share intimately in.");
			if (hasAssisted) output(" <i>“I’ll never get used to this. So... they’ll be with the others?”</i>");
			else output(" <i>“These are really my kids, huh?”</i>");
			
			output("\n\n<i>“Yes.”</i> That’s all you can say");
			if (dblBirth)
			{
				output(", reminding her that she’s still not done herself!");
				boredJumperPregDoubleBirthJumperText(numJumperBabies, numJumperBoys, numJumperGirls, numJumperHerms, jumperTypeCnt, numChildren);
			}
			else output(".");
			
			
			if (boredJumperBreastFeedOK())
			{
				output("\n\n<i>“Ah, but you’ve gotta give ‘em their meal, sweet-stuff!”</i>");
				if (dblBirth) output(" You gather up your kids while she nurses her own.");
				else output(" The Jumper hands them off to you with all the care and tenderness she’s physically capable of.");
				output(" The squeaking bunny-babies are guided to your [pc.milkyNipples], quieting down the moment their frail lips seal around the trickling " + (pc.hasErectNipples() ? "nubs" : "spouts") + ". [pc.MilkVisc] nourishment flows in small amounts, suckled by little ones who need it most.");
			
				pc.milked(milk,true);
			}
			else
			{
				if (dblBirth) output("\n\n<i>“Guess it’s all on me,”</i> she says while you hand her the children, bringing them to her [enemy.nippleColor] and dribbling nipples. The bunny-mom lets them suckle until it dribbles into wastedness, then bringing the next one in line to a meal.");
				else output("\n\n<i>“Too bad you’ve got no milk... but don’t worry, I thought of that. Managed to get this from... errr, nevermind, that’s not important.”</i> She produces a plastic bottle, filled to the cap with creamy white treat. You have a few ideas where its milky contents came from, but what’s important is that your children are being fed.");
			}
			output("\n\nOnce their immediate needs are taken care of, you and the lawless laquine can finally breathe. She");
			if (dblBirth) output(" cradles her own much like you do.");
			else output(" leaves the twitching twins in your arms.");
			
			output("\n\nYour heart leaps when they cutely grip at your [pc.fingers]. Vivacious empathy rises all throughout your head when you look down, stroking the tops of their heads, wiping the tiny bit of ‘you’ away. The Jumper is content to say nothing, merely sit stock still, spellbound by the two small, rumbling miracles you made possible. Once or twice she asks about their possible names, what they’ll do when they’re growing up... but that can come later.");
		}
		else if (numChildren >= 3 && numChildren <= 8)
		{
			output("\n\nOut goes another, bringing relief that’s kicked aside by the next one to take its place. The process gets easier, although your voice has lost all of its depth.");
			if (numChildren >= 7)
			{
				output(" All the strain makes the truth crystal clear: you’re carrying a full litter of laquine babies. You’re enveloped in some twisted form of euphoria feeling them all pushing through your overstretching tunnel. The ears, the hands, the feet, you can’t keep track of what emerges first. All that you can know is that your screams (and your Jumper’s encouragements) are carrying them one by one through");
				if (multiPreg) output(" your separate holes");
				else output(" the pussy that’ll never be the same afterward");
				output(", until they’ve all flopped out into a weighty pile of mewling bunnies.");
			}
			else if (numChildren == 6)
			{
				output(" Once you’ve passed four children, your sore belly noticeably compresses - not all the way. Unsurprising, considering you’re giving birth to damn near a full litter. You’ve passed the worst of it though, and when the fifth and six are born");
				if (multiPreg) output(" simultaneously from opposing caverns");
				else output(" one after the other");
				output(", your head finally clears.");
			}
			else if (numChildren == 5)
			{
				output(" The cramps somehow get worse at this point. Three sprogs have sprung out, covered in gore, and the last two arrive at the same moment, overwhelming you with the sensation of your poor hole");
				if (multiPreg) output("s");
				output(" being stretched to truly obscene levels.");
			}
			else if (numChildren == 4) output(" Another bunny-eared munchkin closely tails the third, flopping out into the world, part of a pile of mewling critters."); 
			else output(" Only one more rabbit comes, however. The cottontail laquine slips out with a noticeable ‘pop’, landing next to its siblings.");
			
			output("\n\n<i>“Wow...”</i> the lop-eared pirate coos delightedly, eyes alight with so many joyful emotions. <i>“They’re... They’re soooo cute!”</i>");
			output("\n\nYour pain finally clears up, endorphins and adrenaline ushering out the aches like biological bouncers. The hormonal weight on your mind lifts, leaving you feeling cold... but <i>brutally</i> content. The faint squeaks of your children, waiting for their first meal, are heard loud and clear now");
			if (dblBirth) output(", snuggled together, vibrating against each other with tiny purrs.");
			else output(", cradled in the slick and squeaky arms of your lapine lover.");
			
			output("\n\n<i>“This is sooo awesome!”</i> she squeals");
			if (dblBirth) output(", fingers balling into fists during a particularly hurtful convulsion. <i>“Those are my kids!");
			else output(", rolling from her toes to the balls of her feet. <i>“These are my kids!");
			if (hasAssisted) output(" Their brothers and sisters are gonna be soo happy!");
			output("”</i>");
			
			if (dblBirth)
			{
				output("\n\nThey will be, once she finishes having hers!");
				boredJumperPregDoubleBirthJumperText(numJumperBabies, numJumperBoys, numJumperGirls, numJumperHerms, jumperTypeCnt, numChildren);
				output("\n\nYou’ve birthed");
			}
			else
			{
				output("\n\nShe holds in her arms " + num2Text(numChildren) + " laquines,");
			}
			
			output(" a variety of");
			if (numGirls + numJumperGirls > 0) output(" girls");
			if (numBoys + numJumperBoys > 0)
			{
				if (numGirls + numJumperGirls > 0 && numHerms + numJumperHerms > 0) output(", ");
				else if (numGirls + numJumperGirls > 0) output(" and");
				output(" boys");
			}
			if (numHerms + numJumperHerms > 0)
			{
				if (numGirls + numJumperGirls > 0 || numBoys + numJumperBoys > 0) output(" and");
				output(" natural hermaphrodites");
			}
			output(". Among them they have a variety of contrasting colors,");
			
			if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" the majority is " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + " fur while others are " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] + ".");
			else output(" the majority is " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + " fur.");
			if (flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR2"] != undefined) output(" Some are wholly coated in it, but others are identifiably halfbreed rabbits. You can see a little of " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1"] + " and " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR2"] + " in there.");
			else output(" Some are wholly coated in it, but others are identifiably halfbreed rabbits. You can see a little of " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1"] + " in there.");
			
			output("\n\nIn the limpid moment, all you can feel is pure joy. ");
			
			if (boredJumperBreastFeedOK())
			{
				output("\n\n<i>“Now, you’ve got some work to do, </i>mom!<i>”</i> the Jumper snerks,");
				if (dblBirth) output(" playfully urging you to feed your kids while she handles her own.");
				else output(" leaning down to bring the many babies to their meal.");
				
				output(" Before you’ve even guided the first of them to your [pc.milkyNipples], there’s a light sting of protest in your [pc.breasts]. One pair of lips seal around a nipple, another... so forth. While you feed your children, the enthralled Jumper’s gaze is locked unerringly to them. She says nothing, simply thrilled to be near her kids");
				if (dblBirth) output(", and to feed them");
				output(".");
				
				pc.milked(milk,true);
			}
			else
			{
				if (dblBirth) output("\n\n<i>“Do I really have to feed all of them? Eesh...”</i> she grumbles, but you can tell she doesn’t mind. The bunny-mom brings your combined litters to her [enemy.nippleColor] nipples, letting them suckle until they tire. Once the snoozing children are put down, she brings up the next one in line to her bosom.");
				else output("\n\n<i>“Can’t believe you’ve got no milk for your kids!”</i> the Jumper grouses, sitting noisily near you. <i>“Don’t worry, was prepared just in case you gave birth to a bunch!”</i> She produces a few plastic bottles filled with creamy white milk. You can venture a few guesses as to where they came from, but you’d also rather not. All that matters is the kids are getting their first meal.");
			}
			output("\n\nOnce your babies have fed, they fall fast asleep. You and your lawless lover can finally relax, finally breathe. The hardest part of all of this is over, and now you can spend the time together petting, stroking, caressing, and chatting about the lovely miracles you’ve made possible. Rich feelings of happiness and ecstatic fantasies fill your mind, thinking about what they’ll be like grown up, who they might become, what they might do...");
		}
		else if (numChildren >= 9 && numChildren <= 16)
		{
			output("\n\nThis is going to be a real fight. That fact is made clear by your superlative stomach, a perfect hill in its own right, slowly shrinking as your children begin to work their way out. Multiple laquines squish and squash against one another, vying for space in your stretching canals. Lop and upright ears protrude comically from your straining slits, your pushes and bodily contractions almost not enough to make their appearances possible");
			output("\n\n<i>“Oh fuck... Umm,”</i> the Jumper grips your");
			if (dblBirth) output(" hand");
			else output(" hips");
			output(", squeezing tightly. <i>“Don’t stop, okay? Just push push push! You uh... You can do it!”</i> She bites her lip, tiny amounts of tension draining when she sees one kid, then two, shirk your body’s protection. It’s working, and while you cry yourself hoarse, several more children pop out, followed by more and more... and more...");
			
			output("\n\nThe only reason you’re still conscious is because you distract your mind with fantasies. Marred by pain, they’re nonetheless all you’ve got. <i>It’ll be over soon,</i> you say to yourself. <i>They’re going to be healthy kids! You’re gonna raise them right, have a big, happy family!</i> The mix of adrenaline and endorphins have your stomach deflating one neonate laquine at a time, their tiny squeaks giving you all the hope a mom needs.");
			if (numChildren >= 13) output(" The considerable litter you’ve birthed continues to swell in size, so many little hungry, fuzzy babies huddling together with twitching noses and soft squeals. On the verge of passing out, the last one is finally pushed out.");
			else output(" A large and awe-inspiring litter of little paws and ears rests at the front of your crotch, huddling together, carping for their meal.");
			
			output("\n\nWhilst you pant and heave, the ecstatic Jumper");
			if (dblBirth) output(" urges you to rise");
			else output(" helps you to sit up");
			
			output(", excited to have you feast your eyes on a pile of kids that seems more like a beacon of overpowering light. " + num2Text(numChildren, true) + " laquines are snuggled together at your front.");
			if (numGirls > 0) output(" Girls");
			if (numBoys > 0)
			{
				if (numGirls > 0 && numHerms > 0) output(", boys");
				else if (numGirls > 0) output(" and boys");
				else output(" Boys");
			}
			if (numHerms > 0)
			{
				if (numGirls > 0 || numBoys > 0) output(" and natural hermaphrodites");
				else output(" Natural hermaphrodites");
			}
			output("... damn, you’ve given birth to just about every combination of space-rabbit there is! Their furs are shimmery, though reddened with your innards. Some have full coats, others only half.");
			
			if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" Their short-haired pelts are <b>a pleasing contrast of " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + " and " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] + ".</b>");
			else output(" Their short-haired pelts are " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + ".");
			if (flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR2"] != undefined) output(" What hair you can see is " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1"] + " or " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR2"] + ".");
			else output(" What hair you can see is " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1"] + ".");
			
			if (dblBirth)
			{
				output("\n\nIt’s not over yet...");
				boredJumperPregDoubleBirthJumperText(numJumperBabies, numJumperBoys, numJumperGirls, numJumperHerms, jumperTypeCnt, numChildren);
			}
			output("\n\nSlumping forward, you let out a soft huff, the passionate pirate next to you hardly in control of her emotions. <i>“There’s sooo many! You’re so awesome !”</i> She lays on all her praises thick, so much that you forget where you are. <i>“It’s soo cool");
			if (boredJumperKnowsSteelesName()) output(" [pc.name]");
			else output(" cutie");
			output("...!”</i> Seeing them is one thing... but holding them, holy shit. You scoop as many of the twitchy kids into your [pc.arms] as possible, the Jumper taking the rest. Inner jubilation dominates your soul. This is a delight you hope will never end.");
			
			if (boredJumperBreastFeedOK())
			{
				output("\n\nBut they’re hungry. Wasting no time, you give the first of many their time at your [pc.milkyNipples], letting them suckle their fill until they stop and let it dribble. Then, you bring the rest in, the Jumper taking care of those who are still waiting their turn. The warm, [pc.milkVisc] treat helps them fall asleep easily enough.");
			
				pc.milked(milk,true);
			}			
			else
			{				
				if (dblBirth) output("\n\n<i>“F-fuck, you’re kidding me... I’m gonna diieeee feeding all of them!”</i> The [enemy.furColor] Jumper pouts, but she knows what must be done. You helpfully hold the kids in a line, waiting for two to suckle themselves into a nap before handing her the next. While she feeds them, you can’t help but notice the biggest smile on her face, never showing signs of fading.");
				else output("\n\n<i>“I can’t believe you don’t have milk... but I should have enough. I didn’t expect so many!”</i> she chirps, producing three plastic bottles filled with milk. In your place she feeds them each no more than nine mouthfuls of cream, rationing it out among your children. If one gets loud, she’s quick to give them a little more. By the time they’re satisfied, she’s got them sleeping soundly on a supply run dry.");
			}
			output("\n\nSnuggled up together, you and your sweaty bunny happily while away the minutes, maybe hours (who even knows) talking about the huge family you’ve started. She’s caressing you all over, kissing you and your kids, all too eager to question you on the names you’re thinking of, what you think they’ll be like growing up... But there are some things you have to stop her at.");
			output("\n\nYou can answer that and more when she decides to leave this life behind.");
		}
		else if ((!pc.isTaur() && numChildren >= 17) || (numChildren >= 17 && numChildren <= 24))
		{
			output("\n\nExcruciating <b><i>pain</i></b> becomes your only sensation. Giving birth from one vagina is standard, what everyone else does... but you’ve got three. Not one. Not <i>two.</i> You have <b>three</b> wombs, packed to the brim with Jumper babies. There’s no word that could ever hope to adequately explain or fundamentally state the unfathomable strain on your body. <i>It fucking hurts!</i>");
			output("\n\nIt’s worth it. There’s not a part of you that thinks it’s not, because one, two, three little laquines are wiggling their way down your snug passages.");
			if (dblBirth) output(" Emotionally ignited, you are rendered almost incapable by the amount of kids you’re pushing out.");
			else output(" The emotionally ignited pirate-bun nearby is responsible for all of them, incapable of dealing with the amount of kids you’re pushing out.");
			output(" It’s understandable, only an equipped clinic could hope to manage this many, but her efforts are admirable. You could not be happier... or in any more agony. Certainly nothing in your life is ever going to compare to birthing three litters of space-rabbit.");
			
			output("\n\nBeing anesthetized would be a cowardly way out of this. You wouldn’t be able to hear them, hear the cajoling of your lop lover. The barely audible squeaks keep you <i>alive,</i> hopeful. You can’t pass out -- you <i>will not</i> pass out. You are their mother, and need to be there for them. Gritting your teeth, you play back every silly memory from your childhood. The weird gifts you got for your birthday that one time, the joke you played on a colleague...");
			output("\n\nYou’re inhaling so hard that your ribcage shows. It only makes your mountainous stomach more obvious. Your vaginal trio strains and spreads wide, and color drains from your lips. You have no idea how many kids you’re bringing into this galaxy, what the count is. Hoarseness claimed your voice long ago. At some point you can’t even keep your legs spread on your own.");
			output("\n\nThe rapidly squirming bundles are aimed into a vast and growing pile of fuzzy bunny babies. The more get added, the louder their collective whispers get. From where you’re lying, you can only make out a layer of big, floppy ears; the leporine heath is only disturbed when another one of their adorable number flops out into life.");
			output("\n\nIt ends, unceremoniously and quietly. The last exit didn’t even trigger a response in your body. Tiny lurches in your [pc.fingers] confirm you’re still conscious, that your brain hasn’t fried itself. Although your belly’s shrunken to an acceptable state, you end up inflating it back to that shape all over again with the breaths you’re now taking. Sitting up is exceedingly difficult, especially with your squeaky lover so busy. You can understand why...");
			output("\n\n...Because you’ve given birth to " + num2Text(numChildren) + " laquines, three whole litters. Your heart doesn’t just leap or flutter... it tries to escape on feathery wings, to float away to Heaven. What you see is so moving that it blurs your vision with tears of immaculate glee. Your many, <i>many</i> children are huddled together in a large, mirthful pile, each covered in a little bit of you, all sharing body heat. It’s no surprise you’ve spawned every conceivable combination of laquine there is: boys, girls, hermaphrodites, lop-ears, upraised ears, totally furry, some limb fur...");
			
			if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" Despite your internal sheen marring their aesthetically gorgeous, contrasting pelts, you can see <b>" + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + "</b> fighting for space with <b>" + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] + ".</b>");
			else output(" Despite your internal sheen marring their aesthetically gorgeous, contrasting pelts, you can see <b>" + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + "</b> fur.");

			if (dblBirth)
			{
				output("\n\nAnd your perky lover’s still working on her own!");
				boredJumperPregDoubleBirthJumperText(numJumperBabies, numJumperBoys, numJumperGirls, numJumperHerms, jumperTypeCnt, numChildren);
			}
			
			output("\n\nYou and your perky bunny babe can’t hope to hold all these rabbits. You just don’t have enough arms for it, so your legs have to handle the rest. Your laps, rather! The maternal and paternal feelings the two of you broadcast are soaring. Pride wells within you, no idea where your attentions should be centered, how anything should be metered out right now.");
			
			if (boredJumperBreastFeedOK())
			{
				output("\n\nBut that’s just part of being a parent, and there’s one immediate concern you can solve now. Your [pc.breasts] are crying out to a deafened god at the prospect of feeding this many children, but feed them they must. Lips lock to [pc.milkyNipples], suckle, and cease. When [pc.milkNoun] dribbles down your [pc.skinFurScalesNoun], that’s when you bring then next in, the next...");
				if (pc.breastRows.length > 1) output(" This is exactly why you grew those extra breasts. How else could a dedicated broodmother like yourself hope to handle the little ones?");
				
				pc.milked(milk,true);
			}			
			else
			{				
				if (dblBirth) output("\n\n<i>“Noooo....”</i> she whines. <i>“You have to be kidding me! I don’t think my tits have enough for all of them!”</i> She’s going to have to try. Resigned to her fate of receiving a hundred suckles, you bring the huge litter to her side. They drink in tiny sucks until they drift off to a nap, then the others get their turn... and then the rest. With this many, it takes quite a while, but the smile writ on her muzzle hasn’t abated for even a second.");
				else output("\n\n<i>“Shit, I don’t know if I’ve got enough milk for this many... you’re way too fertile, babe!”</i> the Jumper whines. <i>“Gotta be really careful, they all look super hungry!”</i> She produces three plastic bottles, filled to the brim with milk. It’s carefully rationed out, each child getting ten suckles of cream before they’re set aside. Some cry out, and they’re given enough to quiet down. It amazes you that she still has any left by the end of it...");
			}
			output("\n\nNow that it’s over, you cradle as many of the furry cherubs to your breast as you can, the Jumper doing the same. You’re resting on each other’s shoulders, whispering about their future, names... the things parents talk about. But you’re not living under the same roof, really, and she’s not going to be able to come by for a long time... if ever. The conversation trails off to give you both the quality time together you’ll need before things go back to the way they were.");
		}
		else if (pc.isTaur() && numChildren >= 25)
		{
			
			output("\n\n<i>“Damn babe, you know I was just joking when I thought you’d have like thirty kids!”</i> the shameless rabbit quips. <i>“But looks like you might be carrying that much, just look at the size of you!”</i> She’s not wrong. Your body was designed by nature to bear creatures of similar size: large, powerful, and much bigger than the average humanoid rabbit.");
			output("\n\nBut in this case, the horny laquine to your side is the one who claimed your womb <i>and</i> stuck you with a fertility drug. You’re bearing a bunny-slut’s kids, and you’re going to be pushing out <i>a lot</i> of them. The sheer weight of your bulked up belly is undeniable. <i>Only a litter of nearly three dozen rabbits could have been such a burden on you,</i> and only that many could impugn the balance of [pc.aRaceShort].");
			output("\n\nStill, there’s a major advantage to this form, and this position, one that’s not going unnoticed. You can sit down! There’s feeling your [pc.legs]! Still, you must clutch tight to your human stomach, the churning births at your undercarriage forcing out a few gurgles and groans. That bloated womb works its inhabitants out into the galaxy, cervix softening and dilating, vaginal walls beginning to stretch, easily making room for a smaller creature.");
			
			output("\n\nRegardless of how");
			if (pc.gapestVaginaLooseness() >= 4) output(" loose");
			else output(" tight");
			output(" you are, the wriggling load you’re carrying barely cause pain. If you were any smaller, this would be a potentially dangerous event, one that you’d need the very best medicine to see through. You’d like to see a non-taur laying... how many is it now?");
			
			output("\n\nLungs sore, the contractions have nonetheless given you pause. During the deepest inhalations your bones show. The Jumper is keeping you apprised, doing her damndest to corral them and clean them off. You’re not giving birth one at a time: multiple bunnies flop out from your vaginal cavern simultaneously. The volume of the squealing pile grows exponentially, and you shut your eyes to focus on that.");
			output("\n\nYour amniotic-coated mound splits for the ears and spreads for the heads. It’s gone on for so long with no end in sight, but you’re sure there’s been at least fifteen. Yet more come, more flop out, and the volume of mewling increases. You can’t see anything about them yet. The pain is only half as bad as it could be, and the moments of deepest agony get much easier to handle as it goes on. Though you can’t see them being born, you can certain <i>feel</i> it when they are.");
			output("\n\nAt last, it comes to an end, and the adrenaline soothes your lasting aches. Endorphins shuffle off the hormonal weight. You can finally hear over your own moans, you can even hear yourself think! You lift your rump and try to turn, something harder than it should be, eager to see rather than hear for the first time.");
			output("\n\nIt was worth the wait. There’s a giant pile of rabbit-eared kids... " + num2Text(numChildren, true) + " of them to be precise.");
			output("\n\nYou’ve really given birth to over thirty of them... Every combination of laquine that evolution decided was possible is there. Full furry bodies, furry limbs, boys, girls, hermaphrodites, they’re all there, huddled for warmth and squeaking for cream.");
			output("\n\nOnce the shock of your passed litter passes, elation takes its place, smothering you in the happiness and joy of being a mother. These are your kids! The Jumper is speechless, totally unable to handle that many at once. You remind her not to bite so hard, lest her lips start bleeding. They’re definitely her kids, though.");

			if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" Their short-haired pelts are <b>a pleasing contrast of " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + " and " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] + ".</b>");
			else output(" Their short-haired pelts are " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + ".");
			if (flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR2"] != undefined) output(" What hair you can see is " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1"] + " or " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR2"] + ".");
			else output(" What hair you can see is " + flags["BJUMPER_PC_BIRTH_SCENE_HAIRCOLOR1"] + ".");
			
			if (boredJumperBreastFeedOK())
			{
				output("\n\nYou can’t waste any time. You’ve got " + num2Text(numChildren) + " kids to feed, and your [pc.milk] belongs in their needy bellies. They all get their turns, ten, twelve... however many suckles they desire, all until it dribbles wasted and the next are given their chance at your milk-" + (pc.hasErectNipples() ? "nubs" : "spouts") + ".");
				if (pc.breastRows.length > 1) output(" Right now, your multiple rows of breasts are getting used to their fullest. Right now, you look like the galaxy’s happiest broodmother.");
				output(" Slumber rabbits are packed into a softly rumbling pile.");
				
				pc.milked(milk,true);
			}			
			else
			{
				output("\n\n<i>“I don’t know... babe... shit... That’s a lot. I don’t know if I can feed all this...”</i> She produces four plastic bottles, filled to the caps with milk. A few ideas of where she got them come to mind, but she has to take your place as their feeder now. It’s rationed out carefully and with sensitivity. Any who whine are given just enough to quiet them. It shocks you that she even has a droplet left in the last bottle by the time the last is fed and packed into the softly rumbling pile.");
			}
			output("\n\nSitting on your side, the Jumper settles herself at your underbelly, close to your human half, sharing the fuzzy burden with you. They’re all nestled into your body, warmed in her embrace or yours. For a time you chat about their futures and banter about their names. You remind the heat-loving bunny that she need only find you if she wants to leave her life of crime behind, but then there’s that fear that surfaces in her again. For the time being, you spend quality time together in the company of your kids, awaiting the inevitable parting...");
		}
		else
		{
			output("\n\nYou had " + num2Text(numChildren) + " kids!");
			if (dblBirth) output("\n\nThe jumper had " + num2Text(numJumperBabies) + " kids!");
		}
		output("\n\nWhiskers tickle your bare [pc.skinFurScalesNoun]. Craning ears tap and twitch against your body. Tiny tongues and little fingers tap or grip at you. They have no words to speak, but they’re all talking just fine. It nearly brings you to tears thinking about getting up, having to jostle them, having to bother your lover... <b>having to say goodbye.</b>");
		output("\n\nBut it must be done.");
		output("\n\n<i>“Is it really time? Yeah, guess they can’t stay that long. Well, umm, where do we take them?”</i> she asks nervously. <i>“I’m not even a pilot I-”</i>");
		output("\n\nYou raise a hand and stop her, explaining that you just need to get them back to");
		if (encLocation == 2) output(" your ship");
		else output(" the hangar");
		
		output(", and that you’ll have them sent");
		if (boredJumperKnowsSteelesName()) output(" to the nursery you told her about.");
		else output(" to a nursery -- you quickly describe the purpose it serves.");
		if (numChildren + numJumperBabies >= 9)
		{
			if (ratsPCIsGood()) 
			{
				output("\n\nThat’s a good question, one you’re not sure has an answer right this second. You briefly scan the vicinity, looking for anything useful, but it’s all broken tools or useless gadgets. Telling her to wait, you step outside, looking around for anything portable that you can stick those kids in for just a few minutes.");
				output("\n\nYou don’t find anything of the sort, but something does catch your eye. A faint blue glow you’re all too familiar with. Their black armor may help them hide in the shadows, but <b>those rats aren’t the brightest on Zheng Shi.</b> <i>“A-ha, [pc.mister] CEO!”</i> the pink-furred rodenian hops out, tail weaving, blush bright on her light snout. It’s cute how they’re pretending you didn’t see them.");
				output("\n\nYou raise your hands, and beckon them forward. They of course dart at you, unarmed, mistaking your gesture for an expression of affection. Alright, you’ve got no problem with that. Besides, scritching behind their round ears will make them far more compliant to your request! ");
				
				if (pc.isBimbo()) output("\n\n<i>“Mmm, can you three help me out?”</i> you purr, tapping the tan mouse-boy’s cheek provocatively. <i>“You three are good at moving stuff! Come help me carry my kids to my ship, and maybe we’ll take care of each other later...”</i>");
				else if (pc.isBro()) output("\n\nYou stroke the white-haired girl’s cheek and the rodenian’s chin. <i>“I need your help moving something valuable. Come.”</i>");
				else if (pc.isNice()) output("\n\n<i>“We need your help. There are children who need to be moved off the station, and we can’t do it alone. Will you help us?”</i> you ask genuinely, but deep down you know what their answer will be.");
				else if (pc.isMischievous()) output("\n\nYou run your [pc.fingers] across each of their little heads. <i>“You three are always around I feel. You’re good at handling precious things, so I need your help right now. Come on.”</i>");
				else output("\n\n<i>“Come, you three owe me, and I’m calling on one of </i>many<i> favors.”</i> You tap the rodenian girl’s cheek for effect.");
	
				
				output("\n\n<i>“Of course, [pc.mister] CEO!”</i> they squeal in unison. <i>“Just show us! We’ll help you with anything, any time!”</i>");
				output("\n\nThe latex-clad bunny is naturally surprised by your return with three members of another gang in tow, but they don’t ask questions, nor does she. <i>“Wow! You gave birth? On Zheng Shi?”</i> the excitable rodent squeals, hopping. <i>“[pc.Mister] CEO, that’s dangerous! Don’t you know-”</i>");
				output("\n\nThe half-rat girl smacks her on the head. <i>“Stooop.”</i>");
				output("\n\nOnce their scuffle ends, they do help you, scooping up the arrayed laquine children into their arms. With every one of your kids in good (debatable) company, the five you make the trip back to where you docked, hoping that nothing will get in the way of your trip.");
			}
			else
			{
				output("\n\nThat’s a fairly daunting goal, considering you can’t even hold them all in your sets of arms. You can’t exactly rely on the rest of her gang");
				if (crew(true,false) > 0) output(", and you don’t want to risk getting your crew to help");
				output(". The light bulb goes off over your head when you scan the vicinity, finding a");
				if (encLocation == 0) output(" metal");
				output(" box, covered in soot and full of bent or broken tools. You dump the contents, realizing what a horrid condition it is to put your kids in, but if you want to carry in bulk it’s your best option.");
				
				output("\n\nAfter packing your bunnies into");
				if (numChildren + numJumperBabies >= 17) output(" two boxes");
				else output(" the box");
				output(", covering them in two thin sheets, you and the bunny make your way back to the hangar, extra alert for any other roving pirates.");
			}
		}
		else
		{
			output("\n\nThat’s a simple enough goal, considering you’ve only got " + num2Text(numChildren + numJumperBabies) + " children to worry about. After carefully bringing them into your [pc.arms], the two of you shuffle out like a pair of sneak thieves, hoping nobody’ll be there on your way.");
		}
		if (encLocation == 0 || encLocation == 2) output("\n\nIt’s a short");
		else output("\n\nIt’s a stressful");
		output(" walk back through Zheng Shi, but one that is thankfully uneventful. Urbolg isn’t present at the workshop outside your ship, either. Your codex begins to beep, signaling the imminent arrival of your nursery’s probes. Floating right through the way you came, a fleet of tiny, self-contained shuttlecraft float towards you. <i>“Fancy,”</i> the [enemy.furColor] bunny remarks, reacting when its door hisses open.");
		output("\n\nWith the utmost caution, you");
		if (ratsPCIsGood()) output(", she, and the rats");
		else output(" and she");
		output(" load your children one by one into the security of these high powered taxis. It fills you with some sadness. You know where they’re going, you trust them fully, but it doesn’t allay the small creeping fears in the back of your mind. When the drones are filled, they hum and whirl back into space on a one way trip back to the nursery.");
		
		output("\n\n<i>“T-they’ll be okay, right?”</i>");
		output("\n\nYou reassure your Jumper with a kiss, nodding.");
		output("\n\n<i>“O - okay...");
		if (boredJumperKnowsSteelesName()) output(" Make sure you send me some pics soon, [pc.name]!”</i>");
		else output(" I really hope I’ll get to see them again someday. Hey, you be careful okay? You’re the only one they’ll have...”</i>");
		
		output("\n\nWhen you nod, she fidgets a bit before running off.");
		if (ratsPCIsGood()) output(" The rodenian and her posse look rather pleased with themselves. <i>“See you later, [pc.mister] CEO! If you need us, you know where to find us!”</i>");
		
		output("\n\nNothing left to do but continue your exploration of Zheng Shi... or go back to the nursery and see how they’re doing. No doubt they’ll be settled in when you arrive!");
		
		setEnemy(null);
	
		//increase hipsize
		if (smallHips) pc.hipRating(numWombs);
		processTime(60 + ((rand(15) + 5) * numChildren));
		clearMenu();
		addButton(0, "Next", move,"ZS L50");
	}
	//if not special scene play intro then go to birth scene
	else
	{
		output("You’ve gotten wetter since this all started, but something’s just happened that redefines your concept of being drenched. You place a protective hand to your belly, and note for the first time that the distension has begun to abate. You’re flooding between the legs... Oh shit...");
		output("\n\n<i>Your water just broke.</i> Your babies are coming. Pain and agony bursts across your middle like arcs of lightning. The ");
		if (multiPreg) output("kicks in your wombs are");
		else output("kicking in your womb is");
		output(" undeniable. Stricken with fear, you let your instincts take over. Your body knows what it needs to do . All you need do is find a place to let it handle this... ");
	
		if (InShipInterior()) output("\n\nAt least you’re safe on your ship. You’d like to have the support of a doctor, but it’s just not possible right now.");
		else if (InRoomWithFlag(GLOBAL.HAZARD)) output("\n\nYou’re afraid and angry, suddenly realizing that you’re nowhere near professional medical care. There’s no helping it... you must give birth alone.");
		else
		{
			output("\n\nAt least you won’t be giving birth unassisted. Perhaps rationality, in the end, won out against the thought-depriving effects of your changed biology?");
			if (silly) output(" Some part of you really hopes you don’t get cited for littering.");
		}
		clearMenu();
		addButton(0, "Next", boredJumperPregSteeleBirth,numChildren);
	}
	
}
//preg steele birth scene for jumper preg
public function boredJumperPregSteeleBirth(numChildren:int = 2):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var loc:String = getPlanetName().toLowerCase(); //current planet
	var smallHips:Boolean = true;
	if (pc.hipRating() >= 14) smallHips = false;
	var locType:int = 0;
	var multiPreg:Boolean = false;
	var numWombs:int = flags["BJUMPER_PREGHAND_MULTIBIRTH"];
	if (numWombs > 1) multiPreg = true;
	flags["BJUMPER_PREGHAND_MULTIBIRTH"] = undefined;
	
	//on ship 1
	if (InShipInterior())
	{
		output("Finding the medkit takes precedence. You rummage through your storage and clutch it tight to your chest, staggering to your room, the contractions down below hammering a painful reminder, <i>“It’s time!”</i> into you with every step. You can find no words, only huffs and whimpers while you");
		if (!pc.isCrotchExposed()) (" strip down and");
		output(" lie on your bed, ready to let your body work.");
		locType = 1;
	}
	//tavros station 2
	else if (loc == "tavros station")
	{
		output("The moment you scream, everyone nearby turns to you, rushing over to see what they can do to help. You needn’t explain yourself to the peacekeepers in the group, they’re already acting on training. Emergency responders are on the scene in less than a minute, escorting you to their vehicle and hauling you off to the station’s hospital amid an applause filled with congratulatory smiles.");
		if (!pc.isCrotchExposed()) (" The medics relieve you of your clothes en-route.");
		moveTo("NURSERYE14");
		locType = 2;
	}
	//mhenga zil village 3
	else if (loc == "mhen'ga" && flags["PQ_RESOLUTION"] != -1 && (currentLocation == "11. Zil Village Outskirts" || currentLocation == "12. Zil Village Winnar" || currentLocation == "ZIL FESTIVAL VILLAGE" || currentLocation == "ZIL FESTIVAL YURT"))
	{
		output("Zil are no strangers to procreation, and when they notice you in the throes of childbirth, you are rushed to the healer’s hut. As an honored guest of Quinn’s, all possible anodynes are made available, including the soft hands that tend you at your weakest. The gentle handmaidens");
		if (!pc.isCrotchExposed()) output(" disrobe you and");
		output(" begin to guide you through the arduous process to come.");
		locType = 3;
	}
	//mhenga in civ 4
	else if (loc == "mhen'ga" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("When you slump to your knees, the nearest rusher, a brawny");
		if (CodexManager.entryViewed("Saurmorians")) output(" saurmorian");
		else output(" lizard-man");
		output(" charges over. Your pants and groans, and your swollen belly, tell him all he needs to know. You’re scooped up into the giant dino-man’s warm arms - belly facing skyward - and rushed to the local clinic. Once inside, a doctor is all over you by the bedside with a squawking V-Ko droid opposite him");
		if (!pc.isCrotchExposed()) output(" removing your clothes");
		output(".");
		moveTo("ESBETH MEDICAL OFFICE");
		locType = 4;
	}
	//mhenga tarkus in civ 5
	else if (loc == "tarkus" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("Novahome being what it is, you don’t expect there to be a med-station quite up to galactic standards, but there should be plenty of quiet places and even more breed-hungry raskvel to aid you. Sure enough, when you double over and show the tell-tale signs of birthing, a large group of wide-hipped kobold-bunnies usher you to safety, drawing you into a nice little hideaway much quieter than imagined.");
		if (!pc.isCrotchExposed()) output(" They have your clothes off in a jiffy.");
		moveTo("207");
		locType = 5;
	}
	else if (loc == "myrellion")
	{
		var inKressia:Boolean = false;
		if (isNaN(parseInt(currentLocation)))
		{
			if (currentLocation == "LIEVE BUNKER" || currentLocation == "FAZIAN_RESCUE_ROOM" || currentLocation == "KRESSIA MEDICAL") inKressia = true;
		}
		else 
		{
			if (parseInt(currentLocation) >= 800 && parseInt(currentLocation) <= 899) inKressia = true;
		}
		
		//myrellion red myr 6
		if (inKressia) 
		{
			output("A duo of red myr soldiers discover your peril. Sensing your distress they rush you to the Kressia medical center as quickly as they can, delivering you into the capable arms of their CMO, Anzhela. The red doctor");
			if (!pc.isCrotchExposed()) output(" disrobes you and");
			output(" gets you to the cleanest bed she can find, well away from other patients. You hope that she and her staff are familiar with non-myr birthing procedure.");
			moveTo("KRESSIA MEDICAL");
			locType = 6;
		}
		//taivra 7
		else if (currentLocation == "2E11" || currentLocation == "2E13" || currentLocation == "2G13" || currentLocation == "2G15" || currentLocation == "2G17" || currentLocation == "2E17" || currentLocation == "2C11" || currentLocation == "2C13" || currentLocation == "2C15" || currentLocation == "2C09" || currentLocation == "2A09")
		{
			if (flags["KING_NYREA"] == 1 && flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) output("Being the subjugator of");
			else if (flags["KING_NYREA"] == 1) output("Being the " + pc.mf(" husband"," wife") + " to");
			output(" an alien royalty has its perks. Namely, being able to command the assistance of the resident nyreans and their queen on your final step through pregnancy. You’re taken to Taivra’s bedchamber and afforded all the care you could possibly need to make this birthing much less painful than it needs to be. All the water and blankets they can find are brought to your bedside");
			if (!pc.isCrotchExposed()) output(", clothes are finally removed");
			output(".");
			moveTo("2C15");
			locType = 7;
		}
		//myrellion gold myr 8
		else
		{
			if (InRoomWithFlag(GLOBAL.HAZARD))
			{
				output("A few rushers cross your path. You explain what’s going on before they anxiously hurry you to the great elevator and down to the gold myr city where help awaits.");
			}
			else
			{
				output("To your delight, a gold myr squad on patrol are at your side when you cry out for help.");
			}
			output(" The sprawling Gildenmere hospital welcomes you immediately, and a team of professionals is assigned right away to your imminent birthing. A cozy bed is prepared and all possible amenities are provided");
			if (!pc.isCrotchExposed()) output(" as soon as your clothes are off");
			output(".");
			moveTo("741");
			locType = 8;
		}
	}
	//uveto kryms camp 9
	else if (loc == "uveto vii" && currentLocation == "UVGR M4")
	{
		output("It could be worse. For instance, you could be somewhere far away from this insulated bunker and the fierce warrior lady who resides within. <i>“Steele... you’re not...”</i> she starts, <i>“You’re giving birth, here!?”</i> Krym looks flabbergasted, but wastes no time bringing you in from the cold and straight to her bed. She’s storming around the cozy little hideaway for anything that might be useful");
		if (!pc.isCrotchExposed()) output(" while you undress");
		output(", soon returning with water and extra blankets.");
		locType = 9;
	}
	//uveto korgii hold 10
	else if (loc == "uveto vii" && currentLocation.search("KORGII") >= 0)
	{
		output("Hand on the wall you call out for any one of the fluffy korgonne to help you to safety. To your imminent relief, two of the Hold’s guards are hefting you to the communal nursery, a breeding room and birthing room all in one filled with a number of mothers, expecting and otherwise. You’re given the last bed and left in the capable hands of the tribe’s healer");
		if (!pc.isCrotchExposed()) output(", those hands already seeing to your clothes");
		output(".");
		locType = 10;
	}
	//uveto town 11
	else if (loc == "uveto vii" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("The worst possible thing to be right now is cold, and the chill of Uveto is biting deeply. Fortunately, Irestead is home to many people, and those many hardy folk are already at your side, helping you to your feet and barking orders at others while they carry you to safety. Inside a local care center you’re waited on by two doctors who get you into the warmest corner they can find before");
		if (!pc.isCrotchExposed()) output(" disrobing you and");
		output(" prepping you for birth.");
		locType = 11;
	}
	//new texas 12
	else if (loc == "new texas")
	{
		output("Pain consumes you almost immediately, and on a libertine paradise like New Texas nobody could miss your discomfort. Certainly, wherever two very bubbly cowgirls are hustling you now will be a safe enough place to give birth to your kids, far away from the easily excitable bulls that have cocked their heads in your direction. The two bosomy babes get you settled in their home,");
		if (!pc.isCrotchExposed()) output(" disrobing you and");
		output(" grabbing whatever they could possibly need for your babies.");
		locType = 12;
	}
	//gastigoth 13
	else if (loc == "gastigoth station")
	{
		output("The well-trained guards on a maximum security prison-station like Gastigoth recognize your plight immediately. The station’s facilities are used typically for impregnated inmates, but they’ll have you as a special guest today.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 13;
	}
	//breedwell 14
	else if (loc == "breedwell centre")
	{
		output("For a place named Breedwell, it comes as no surprise they’re equipped to handle a " + pc.mf("childbearer","mother") + " in need, and you’re rushed to the first available bed.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 14;
	}
	//canadia 15
	else if (loc == "canadia station")
	{
		output("A nurse on vacation introduces herself rather eloquently and helps you to her rented room in the station’s lodgings.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 15;
	}
	//uveto station 16
	else if (loc == "uveto station")
	{
		output("A flock of toves and a few other employees - Steele Tech scientists - have your back the second you collapse, ushering you into the station’s medbay and leaving you in the hands of trained caregivers.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 16;
	}
	//zheng shi rat friends 17
	else if (loc == "zheng shi station" && ratsPCIsGood() && (boredJumperPregLocation() == 0 || boredJumperPregLocation() == 1))
	{
		if (boredJumperPregLocation() == 0) output("The heat of the mines mixes with your weakness, makes the gush of cream at your loins all the more noticeable. A cold rush of adrenaline flows when you hear hasty footsteps.");
		else if (boredJumperPregLocation() == 1) output("Whilst you search for a safe place, a cold rush of adrenaline flows when the rapid ‘taptaptap’ of footsteps catches you off guard.");
		output("You brace yourself for the worst, until three rats, decked out in their usual gear, stop short of you with worried looks on their faces. <i>“[pc.Mister] CEO! What are you doing walking around like that? You can’t stay here! Come on, we know all the good hiding spots!”</i>");
		output("\n\nThe pink-furred rodenian and her entourage take you by the arms, lending you their oh-so small shoulders as they usher you into a maintenance room of sorts. It’s surprisingly cool and spacious; it’s perfect for your needs. The rascals set about scooping up whatever they could need to help, finding cloths, fabrics, water, anything that might help.");
		if (!pc.isCrotchExposed()) output(" The last thing they do is help you out of your gear.");
		locType = 17;
	}
	//zheng shi mines 18
	else if (loc == "zheng shi station" && boredJumperPregLocation() == 0)
	{
		output("Fuck... This is perhaps the worst possible place you can bring a child into the galaxy, but you won’t make the walk back to the hangar. Fortunately, there are a few dead ends in these mines that the pirates have long lost interest in. They’ll have to do. At least it’s a little cooler here than the network at large.");
		locType = 18;
	}
	//zheng shi foundry 19
	else if (loc == "zheng shi station" && boredJumperPregLocation() == 1)
	{
		output("You keep your voice down lest any pirates on patrol catch wind of it. There are plenty of unused, prefab extensions to this floor, perfect for hiding away. On the way to such a secluded room, you’re at least able to find a crummy looking medkit with the barest essentials inside. It’ll have to do.");
		locType = 19;
	}
	//generic civ 20
	else if (loc != "zheng shi station" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("A local " + RandomInCollection(["man","woman"]) + " comes running at your distress. When the adrenaline runs its course, they have you in the hands of medical staff on your way to the local clinic. Once there, you’re given the coziest bed and prepared for birthing");
		if (!pc.isCrotchExposed()) output(", your clothes having been removed on the way");
		output(".");
		locType = 20;
	}
	//default 0
	else
	{
		output("It takes much too long to find a place safe enough, but you do. It’s going to hurt like hell, of that you have no doubt, but you remind yourself that these are the kinds of conditions people in history endured. If they can do it, why can’t you with all of today’s advancements marking you as a product of your time? You try to keep your mind off the dangers, breathing in rhythm, ready to go through this");
		if (!pc.isCrotchExposed()) output(" after shucking your kit");
		output(".");
		locType = 0;
	}
		
	output("\n\nSpreading your legs is the only easy part of this tribulation. Labor aches tear through your body, overwriting all unpained nerves with the sensation before surging downward to your vagina");
	if (numWombs > 1) output("s");
	output(".");
	if (numWombs == 3) output(" You’re on autopilot; your triumvirate of wombs soften and your cervixes dilate as your bundles of joy enter the galaxy.");
	else if (numWombs == 2) output(" You’re on autopilot; your gemini of wombs soften and your cervixes dilate as your bundles of joy enter the galaxy.");
	else output(" You’re on autopilot; your womb softens and your cervix dilates as your bundles of joy enter the galaxy.");
	output(" You can feel the weight, the width, the diameter, the <i>everything</i> of the first little munchkin spreading your straining birthing canal wide between your body’s organ-clenching contractions.");
	if (pc.gapestVaginaLooseness() >= 4)
	{
		output(" Considering how loose you are, it could be much worse");
		if (smallHips) output(", particularly as your pelvic structure widens to handle the process");
		output(".");
	}
	else
	{
		output(" Your tightness only makes this harder");
		if (smallHips) output(", not to mention it’s a pain on top of your reshaping pelvic structure");
		output(".");
	}
	
	output("\n\nThe first laquine’s head emerges from your snug tunnel. Or rather, the <b>" + RandomInCollection("upraised ears","lop ears") + "</b> do. You push, screaming with tears in your eyes until your first laquine baby pops out unceremoniously. You can’t focus on it at all, head thrown back in dissipating agony as the next one moves through. Another pair of floppy ears emerges, and another small rabbit squirms out");
	
	if (locType == 3) output(" to be wrapped up and cleaned by the quiet zil maidens.");
	else if (locType == 5) output(" to be wrapped up and cleaned by the attending raskvel.");
	else if (locType == 10) output(" to be wrapped up and cleaned by the healer-pup.");
	else if (locType == 12) output(" to be wrapped up and cleaned by the humming cowgirl.");
	else if (locType == 15) output(" to be wrapped up and cleaned by the red-headed nurse.");
	else if (locType == 17) output(" to be wrapped up and cleaned by the rodenian and her friends. <i>“Ohh, you’re doing fine, [pc.mister] CEO!”</i> she chirps");
	else if (locType == 2 || locType == 4 || locType == 6 || locType == 7 || locType == 8 || locType == 9 || locType == 11 || locType == 13 || locType == 14 || locType == 16 || locType == 20) output(" to be wrapped up and cleaned by the nurses at your side.");
	else output(".");
	
	if (numChildren == 2)
	{
		var numBoys:int = 0;
		var numGirls:int = 0;
		var numHerms:int = 0;
		if (flags["BJUMPER_PC_BIRTH_SCENE_BOYS"] != undefined && flags["BJUMPER_PC_BIRTH_SCENE_BOYS"] > 0) numBoys = flags["BJUMPER_PC_BIRTH_SCENE_BOYS"];
		if (flags["BJUMPER_PC_BIRTH_SCENE_GIRLS"] != undefined && flags["BJUMPER_PC_BIRTH_SCENE_GIRLS"] > 0) numGirls = flags["BJUMPER_PC_BIRTH_SCENE_GIRLS"];
		if (flags["BJUMPER_PC_BIRTH_SCENE_HERMS"] != undefined && flags["BJUMPER_PC_BIRTH_SCENE_HERMS"] > 0) numHerms = flags["BJUMPER_PC_BIRTH_SCENE_HERMS"];

		output("\n\nCuriously, it ends there. The hormonal weight on your mind lifts, and a cold sweat washes over your body between the fading spasmic pains. There are faint little squeals that bring your brain back to reality between the waves of endorphins. The reality being that you’ve safely given birth to <b>two laquines,</b>");
		if (numBoys == 2) output(" two boys");
		else if (numGirls == 2) output(" two girls");
		else if (numHerms == 2) output(" two hermaphrodites");
		else if (numBoys == 1 && numGirls == 1) output(" a boy and a girl");
		else if (numBoys == 1 && numHerms == 1) output(" a hermaphrodite and a boy");
		else if (numHerms == 1 && numGirls == 1) output(" hermaphrodite and a girl");
		output(" with " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"] + " fur.");
		
		output("\n\nYou lean over and scoop the twins into your [pc.arms], gently wiping the ‘you’ off of their faces while their tiny hands reach out for their mother. You just want to hold them close forever, to always remember how wonderful this moment right here, right now, is, and will always be. A warmth as fuzzy as your offspring dominates your recovering form...");
	}
	else if (numChildren > 2 && numChildren <= 8)
	{	
		output("\n\nYou’ve got more coming, but it does get noticeably easier. Your neck muscles dry up as your grunts and moans dissolve into gravelly rasps of relenting anguish.");
		if (numChildren == 3) output(" One more rabbit falls from your hole, landing next to its siblings.");
		else if (numChildren == 4) output(" Another rabbit falls out closely tailed by another, flopping into the world next to their siblings.");
		else if (numChildren == 5)
		{
			output(" It’s hard to believe, but you can feel three rabbits in your hole");
			if (numWombs > 1) output("s");
			output(" right now, emerging at roughly the same time from your capable body and flopping out next to their siblings.");
		}
		else if (numChildren == 6)
		{
			output(" Your bloated belly noticeable compresses when two rabbits flop out in front of you, followed closely by two others from");
			if (numWombs > 1) output(" separate holes.");
			else output(" the same hole.");
		}
		else if (numChildren >= 7)
		{
			output(" Undoubtedly, you’re carrying a full litter; you loose an animalistic growl, immersed in some twisted gestalt of euphoria as you feel all of them pushing through your stretching tunnel. Ears, hands, and digitigrade feet emerge from your overstretched cavern; your last screams carry them the rest of the way through");
			if (numWombs > 1) output(" separate holes");
			else output(" the same hole");
			output(" until they’re all flopping out into a pile of weighty, mewling bunnies, some with little fur and others totally coated.");
		}
		
		output("\n\nThe pain clears up; endorphins and adrenaline are chucking through your system at record levels. A weight on your mind eases and vanishes, leaving you feeling cold and relieved -- sucking for air is the most you manage. You can now clearly hear the squeals of your children, waiting for their first meal. Once your vision realigns, you take in their features, leaning up and over to bring them into your [pc.arms].");
		output("\n\nYou’ve given birth to " + num2Text(numChildren) + " laquines, a variety of girls, boys, and natural hermaphrodites. Each one is painted with varying amounts of " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"]);
		if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" and " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"]);
		output(" fur.");
		output("\n\nScooping them up into your arms is one of the most enjoyable things you can say you’ve ever done. Joyfulness buzzes throughout your body with a rich, creamy texture. There’s something all too intoxicating about the way they grasp cutely at your [pc.skinFurScalesNoun]. Brief, ecstatic fantasies about who and what they might become fill your mind too.");
	}
	else if (numChildren > 9 && numChildren <= 16)
	{	
		output("\n\nIf you thought it was going to get any easier, you were dead wrong -- ");
		if (numWombs == 3) output("all");
		else output("both");
		output(" of your holes stretch and squirm against each other with the weight and form of multiple laquines squishing through them. Lop and upright ears poke through your widening slits, the contractions not enough to push them out, needing your aid to do it. And provide it you do, squealing yourself hoarse as several children pop out, followed by more, more...");
		output("\n\nDistracting yourself with idle, pain-fragmented fantasies is the best you can do. <i>It’ll be over soon,</i> you think to yourself; <i>your kids sound and look so healthy!</i> you mentally utter. Sure, you only caught the briefest glimpse before another hip-extending contraction slipped another laquine through, but the growing volume of hungry babies tells you that you’re doing just fine");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(", the encouragements of your attendants notwithstanding");
		output(".");
		
		output("\n\nAdrenaline, endorphins, and a little serotonin have you slowly deflating your stomach one neonate critter at a time.");
		if (numChildren >= 13) output(" Your sizeable litter continues to swell in size. So many yous, unable to open their eyes, are huddling together with twitching noses and soft squeals. The final bun flops out into the galaxy when you’re on the verge of slipping into unconsciousness.");
		else output(" You’ve given birth to a sizeable litter, and to your great relief, the pain begins to fade away when the last little bun flops out into the galaxy.");
		
		output("\n\nYou pant, heave, and pant some more, finally able to sit up and take stock of your children. " + num2Text(numChildren, true) + " laquines are huddled in a pile. Girls, boys, natural hermaphrodites, you’ve given birth to just about every combination of space-rabbit there is. Their furs are shimmery, if a little reddened with your innards. Some have full coats, others only have it on their limbs. The colors are all similar though;");
		output(" they’re curtained with " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"]);
		if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" and " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"]);
		output(" fuzz.");
		output("\n\nYou let out a soft huff as you slump forward, bringing the first few into your [pc.arms]. There’s something undeniably magical about the act. Seeing them is one thing, but holding them... the inner jubilation you feel is a delight you wish never to end. Your mind drifts to thoughts of their futures, gleefully imagining them as happy as you are right now.");
	}
	else if ((!pc.isTaur() && numChildren >= 17) || (numChildren >= 17 && numChildren <= 24))
	{	
		output("\n\nThe sheer amount of pain you’re in is indescribable. Excruciating is the understatement of the year, the century, <b>the fucking millennium.</b> <i>It hurts.</i> And it’s all worth it just to feel one, two, three little critters all wiggling their way down your snug passages. You were filled to the brim with a laquine’s seed, and now you’re bearing the fruits of coitus with a gifted breeder. You could not be happier, but you could not be in any more agony than you are. Certainly, nothing will ever compare to this, mothering three litters all at once. ");
		output("\n\nSaving your strength for your rippling loins somehow keeps you conscious during this ordeal. Were you ranting or grousing, you might not have as much a hold on reality as you do. Indeed, some part of you thinks that being anesthetized for this would be a cowardly way out...");
		output("\n\nFantasies of how they will look, the sounds they make when they add themselves to the fuzzy pile of newborn runts, it all keeps you going. You can’t pass out. <i>You must not pass out.</i> You’re the mother of three entire laquine litters. They need you, and you need to be there for them. And so, you push. You scream yourself into hoarseness, barely keeping your thighs down and spread, making sure your distending waistline aims the rapidly squirming bundles next to their siblings.");
		output("\n\nEvery time you feel a pair of lips spread and a fuzzy boulder pass, another takes its place, and then two more beside it. You grit your teeth and play back in your mind whatever you think might help. A funny movie you watched in your younger years. A book you read a dozen times. That weird gift you got during a holiday. It doesn’t matter, just... you just need something to hold on to.");
		output("\n\nYou’re inhaling so hard that your ribcage shows through your [pc.skinFurScales]. Color drains from your cheeks and lips, spread wide and strained just as badly as your vaginal trio. Lop and upraised ears both stick out then flip over adorably, more, more... you have no idea what the count is, only that you’re a mother who’s bringing so many kids into this galaxy.");
		output("\n\nAnd then... it just ends. You didn’t even feel the last one shirk your internal protection, only the relieving weight of adrenaline and endorphins beginning the slow cleanse of your body. There’s only a tiny lurch in your [pc.fingers], a little thrum in your [pc.legsNoun]. There’s a hollow gasp before you can finally sit up, an exceedingly difficult thing to do. But so, so worth it...");
		output("\n\nWhen you look down to the mound of squeals and twitching ears, your heart flutters. It feels so light that it might just be floating away to heaven, enraptured by the sight. Your " + num2Text(numChildren) + " children all huddle together for warmth, each covered in a little bit of you. It’s no surprise you’ve just spawned every conceivable combination of laquine there is: boys, girls, hermaphrodites, lop-ears, upraised ears, furry limbs, totally furry, there’s almost too much to take in. Despite being marred by a little internal sheen,");
		output(" they wear their " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"]);
		if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" and " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"]);
		output(" fur adorably.");
		
		output("\n\nScooping up the first of your sons and daughters for the first time is a feeling utterly indescribable. They’re your kids. You made this possible. You gave them life. You’re overcome with empathy and happiness, feeling like all that matters is right here, right now. The maternal feelings running through your mind are dominant, suppressing all other thoughts and emotions to allow you this hypnotic reprieve.");
	}
	else if (pc.isTaur() && numChildren > 25)
	{	
		output("\n\nYour hindquarters were designed by nature to bear mighty centaur-like creatures into the galaxy, but as it is, your womb was claimed and bred by an ultra virile laquine who also stuck you with a fertility drug. You’re bearing the kids of a pirate, and you’re bearing <i>a lot</i> of them. Considering the sheer weight you’ve carried around, you’ve no doubt that her estimate must be at least close to true. <i>Only a litter of nearly three dozen bunnies could have been such a burden,</i> and only that many little rabbits could have the weight of a single [pc.raceShort].");
		output("\n\nThere’s a distinct advantage to giving birth in this position. At least you can sit down, and you have feeling in your [pc.legs]. You clutch tight to your stomach, the beginnings of birth in your tunnel sending shocks of pain throughout your backside. Your bloated underbelly gurgles, your body working its inhabitants out and into the galaxy. Cervix softened and dilated, your vaginal walls begin to stretch, easily making room for the first laquine.");
		output("\n\nWell, two advantages, in fact! Your hole was made for something larger than a horse-bunny, so");
		if (pc.gapestVaginaLooseness() >= 4) output(" even if you were not so loose");
		else output(" even though you’re a bit tight");
		output(", this wouldn’t hurt nearly as much as it would for someone smaller!");
		
		output("\n\nStill, you’re groaning, and your lungs are sore. You haven’t been able to catch your breath between the contractions, and your bones begin to show during deep inhalations. You can’t even see those little fuzz-bundles flopping into the galaxy from how you’re sitting, but you can easily tell <i>when</i> they do. The pain you’re in is only half as excruciating as it might otherwise be");
		if (smallHips) output(", though your [pc.hips] are still stretching from the act");
		output(". Your children come out in bunches, not simply one at a time, and those moments of deep agony are easier to handle as it goes on.");
		
		output("\n\nAdrenaline soothes the aches; endorphins lift the hormonal weight. You shut your eyes, feeling your mound split for the ears and spread for the heads. The volume of the squealing pile increases as more are added to the group. You’re panting, heaving, and panting just a bit more. It’s gone on for so long with no end in sight, but you’re sure there’s been at least twenty births");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(", something your bedside assistant confirms");
		output(".");
		output("\n\nAt last, it comes to an end. You can finally hear over your own voice, your own flaring thoughts. You lift your rump, eager to see your kids. All you’ve heard are their soft squeals and hums so far.");
		output("\n\nAnd what a sight it is. You’ve given birth to over thirty kids, " + num2Text(numChildren) + " to be exact! There’s a positively giant pile of rabbit-eared munchkins, in every combination of laquine evolution decided was possible. Furry limbs... whole, furry bodies... boys, girls, hermaphrodites, they’re all there waiting for their first meal.");
		output("\n\nTurning around takes more effort than you expected, but it’s worth it. You don’t know where to look or what to really think or say. Elation overwhelms you, filling you with happiness and joy: these are your kids! They wear the");
		output(" " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR1"]);
		if (flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" and " + flags["BJUMPER_PC_BIRTH_SCENE_FURCOLOR2"]);
		output(" beautifully. A delightful moment of relief dominates your mind when you lean down, submerging your head in that pile, trying to take as many of them into your [pc.arms] as is possible.");
	}
	else
	{
		output("\n\nYou give birth to " + num2Text(numChildren) + " kids!");
	}

	//increase hipsize
	if (smallHips) pc.hipRating(numWombs);
	
	clearMenu();
	addButton(0, "Next", boredJumperPregSteeleBirthNext, [numChildren, locType]);
}
public function boredJumperPregSteeleBirthNext(arg:Array):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var numberChildren:int = arg[0];
	var locType:int = arg[1];
	
	var milk:Number = 200 * numChildren;
	if (milk > pc.milkQ()) milk = pc.milkQ();
	
	if (boredJumperBreastFeedOK())
	{
		output("You can feel your [pc.breasts]");
		if (pc.milkQ() >= 2000) output(" straining");
		else output(" sloshing");
		if (numChildren >= 6) output(" at the idea of feeding this many children, but feed them you must.");
		else output(" at the idea of feeding your children.");
		output(" A little wince and grunt is nothing compared to the weeks you’ve endured, and as you get yourself ready you let out a happy, bubbly sigh.");
		
		if (numChildren == 2) output("\n\nThe twins feed from each [pc.milkNoun] dripping nipple while you cradle their heads with profound gentleness.");
		else
		{
			output("\n\nYou guide the mouths of your newborns to your [pc.milkNoun] dripping nipples");
			if (pc.breastRows.length > 1) output(", glad that you have extra jugs to satisfy a litter of this size");
			output(".");

		}
		output(" Soft wet noises are all you hear");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(" between the congratulating coos of your bedside assistant");
		output(".");
		
		if (numChildren / 2 > pc.breastRows.length)
		{
			output(" When the quiet suckles stop, you bring the next hungry mouth");
			if (numberChildren % 2 == 0) output("s");
			output(" to your chest");
		}
		else output(" When the quiet suckles stop, you set the two siblings down and hold them close to your neck");
		
		output(". Relief floods through you with the same unceasingness your [pc.milkyNipples] dribble their rich treat, as eager for its recipients as they are for it.");
		
		pc.milked(milk,true);
	}
	else
	{
		output("You don’t have any milk, not in you or on you, and that thought brings you some amount of discomfort. They’re expecting their first meal, but you can’t provide.");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) 
		{
			output(" Fortunately, your bedside attendant has things covered.");
			if (locType == 12) output(" What kind of universe would you be living in if there wasn’t any milk on New Texas?");
		}
		else output(" There’s nothing for it but to keep your kids safe while waiting for their taxi to come by.");
	}	
		
	output("\n\nFor your part, all you do is lie there in total relaxation, delighting in the feel of twitching whiskers against your [pc.skinFurScales]. When you focus hard enough, their tiny lungs and the little airs they breathe can be heard. Craning ears pulse against your body, a much more pleasant sensation than a kick to your placenta! You curl into a fetal position yourself; whatever keeps the fuzzy pile of rabbits close to you, that’s what you’re doing. Their shared body heat and the low vibrations in their bodies keep you company.");
	output("\n\nYou would drift off to a nap, but you can’t. You know better than anyone that you can’t leave them here, and you can’t stay like this. There’ll be time for enjoying their company later, but their safety and needs cannot be guaranteed in this place.");
	
	if (locType == 2)
	{
		output(" Your kids belong in your nursery, and you alert the medical staff to that fact. Once you tell them your name, you need not say anything more.");
		output("\n\nWhen you can finally stand again, thanks in part to the wonders of medical science, you help the doctors prepare your kids for transfer. Once they’re all safe, you watch with some amount of discomfort as they’re taken away. Sure, you know where they’re going, and you trust them fully... but something about it fills you with sadness.");
		output("\n\nThat sadness, however, will evaporate when you go and visit them later!");
	}
	else
	{
		output(" A mechanical chirp from your codex alerts you to the incoming nursery probes.");
		if (numberChildren > 2)
		{
			if (numberChildren > 8) output("\n\nThe retrieval shuttles zero in on your location, and there are many of them. Good thing your codex is on top of things!");
			else output("\n\nThe retrieval shuttles zero in on your location.");
		}
		else output("\n\nThe retrieval shuttle zeroes in on your location.");
		
		output(" Shaken but not stirred, you rise to your feet and, with the utmost caution, load your children into its warm confines");
		if (numberChildren > 8) output(", one after the other");
		output(". When they’re all filled, you watch the humming taxis whirl back into space on a one way trip to your nursery. You can’t help but think about something going wrong, about never seeing one or all of your kids again.");
		
		output("\n\nMost of all, you simply feel sad letting them all go. Still, that sadness evaporates when you think about visiting them as soon as possible. Yeah. They’ll be there when you get there, and they’ll all be fine!");
		output("\n\nFor now, though, it’s time to get going...");
	}	
	
	processTime(60 + ((rand(15) + 5) * numChildren));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//text blurbs if assisting jumper is also preg
public function boredJumperPregDoubleBirthJumperText(numJumperBabies:int=2,numJumperBoys:int=0,numJumperGirls:int=0,numJumperHerms:int=0,jumperTypeCnt:int=0,numChildren:int=0):void
{
	output("\n\nShe’s hitting notes that you didn’t think possible. With your burdens survived, she’s working her way through her own. She’s only got one in front of her still, and that belly’s looking rather full.");
	if (numJumperBabies >= 7)
	{
		output(" She’s giving birth to a full litter. You doubt she’s regretting any of it the way she holds on to you.");
		output(" Two, four, and the last rabbit proves troublesome. A final push produces a seventh");
		if (numJumperBabies == 8) output(", then an eighth");
		output(", ending her pregnancy.");
	}
	else if (numJumperBabies == 6) output(" Comforting her as best you can, you watch the Jumper squirm and scream, pushing out two, three, and then two more.");
	else if (numJumperBabies == 5) output(" From her overstretched cavern come one, two and three more. You think it might be over, but then one more slips out.");
	else if (numJumperBabies == 4) output(" Twins resting at the front of her crotch, two more come out, landing in a small pile together.");
	else if (numJumperBabies == 3) output(" Two rabbits end up in the pile, closely followed by a third that ends her term.");
	else
	{
		output(" To your surprise, she only pushes out another before deflating");
		if (numChildren == 2) output(", having a pair of twins herself!");
		else output(".");
	}
	output("\n\nWhen you take stock of your floppy mate’s offspring, you find that there");
			
	if (numJumperBabies == 2)
	{
		output(" is a set of twins:");
		if (numJumperBoys == 2) output(" two boys");
		else if (numJumperGirls == 2) output(" two girls");
		else if (numJumperHerms == 2) output(" two hermaphrodites");
		else if (numJumperBoys == 1 && numJumperGirls == 1) output(" one boy, one girl");
		else if (numJumperBoys == 1 && numJumperHerms == 1) output(" one hermaphrodite, one son");
		else if (numJumperHerms == 1 && numJumperGirls == 1) output(" one hermaphrodite, one daughter");
		output(". They have " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " fur and " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] + " hair.");
	}
	else
	{
		if (numJumperBoys > 0)
		{
			if (numJumperBoys == 1) output(" is a boy");
			else if (numJumperBoys > 1) output(" are " + num2Text(numJumperBoys) + " boys");
		}
		if (numJumperGirls > 0)
		{
			if (numJumperBoys > 0 && jumperTypeCnt == 2) output(" and");
			else if (jumperTypeCnt == 3) output(",");

			if (numJumperGirls == 1)
			{
				if (numJumperBoys < 1) output(" is");
				output(" a girl");
			}
			else if (numJumperGirls > 1)
			{
				if (numJumperBoys < 1) output(" are");
				output(" " + num2Text(numJumperGirls) + " girls");
			}
		}
		if (numJumperHerms > 0)
		{
			if (jumperTypeCnt >= 2) output(" and");
				
			if (numJumperHerms == 1)
			{
				if (jumperTypeCnt == 1) output(" is");
				output(" a hermaphrodite");
			}
			else if (numJumperHerms > 1)
			{
				if (jumperTypeCnt == 1) output(" are");
				output(" " + num2Text(numJumperHerms) + " natural hermaphrodites");
			}
		}
		if (flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] != undefined) output(" Some have " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " fur and others have " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR2"] + ",");
		else output(" They have " + flags["BJUMPER_BIRTH_SCENE_FURCOLOR1"] + " fur,");
		if (flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR2"] != undefined) output(" with a mix of " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] + " and " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR2"] + " hair.");
		else output(" with " + flags["BJUMPER_BIRTH_SCENE_HAIRCOLOR1"] + " hair.");
	}
}
//for LaquinePregnancyHandler, this is generic laquine preg
public function laquinePregnancyEnds():void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass;
	var numChildren:int = 0;
	//var bRatingContrib:int = se.value2;
	//var pregSlot:int = se.value3;
	//var babym:Boolean = (se.value4 == 1);
	
	var multiPreg:Boolean = false;
		
	//use this to track number of wombs giving birth
	flags["LAQUINE_PREGHAND_MULTIBIRTH"] = 0;
	
	if (pc.hasStatusEffect("Laquine Pregnancy Ends 0"))
	{
		se = pc.getStatusEffect("Laquine Pregnancy Ends 0");
		numChildren += se.value1;
		pc.removeStatusEffect("Laquine Pregnancy Ends 0");
		IncrementFlag("LAQUINE_PREGHAND_MULTIBIRTH");
	}
	if (pc.hasStatusEffect("Laquine Pregnancy Ends 1"))
	{
		se = pc.getStatusEffect("Laquine Pregnancy Ends 1");
		numChildren += se.value1;
		pc.removeStatusEffect("Laquine Pregnancy Ends 1");
		IncrementFlag("LAQUINE_PREGHAND_MULTIBIRTH");
	}
	if (pc.hasStatusEffect("Laquine Pregnancy Ends 2"))
	{
		se = pc.getStatusEffect("Laquine Pregnancy Ends 2");
		numChildren += se.value1;
		pc.removeStatusEffect("Laquine Pregnancy Ends 2");
		IncrementFlag("LAQUINE_PREGHAND_MULTIBIRTH");
	}		
	
	if (flags["LAQUINE_PREGHAND_MULTIBIRTH"] > 1) multiPreg = true;
	
	var loc:String = getPlanetName().toLowerCase(); //current planet
	
	output("You’ve gotten wetter since this all started, but something’s just happened that redefines your concept of being drenched. You place a protective hand to your belly, and note for the first time that the distension has begun to abate. You’re flooding between the legs... Oh shit...");
	output("\n\n<i>Your water just broke.</i> Your babies are coming. Pain and agony bursts across your middle like arcs of lightning. The ");
	if (multiPreg) output("kicks in your wombs are");
	else output("kicking in your womb is");
	output(" undeniable. Stricken with fear, you let your instincts take over. Your body knows what it needs to do . All you need do is find a place to let it handle this... ");
	
	if (InShipInterior()) output("\n\nAt least you’re safe on your ship. You’d like to have the support of a doctor, but it’s just not possible right now.");
	else if (InRoomWithFlag(GLOBAL.HAZARD)) output("\n\nYou’re afraid and angry, suddenly realizing that you’re nowhere near professional medical care. There’s no helping it... you must give birth alone.");
	else
	{
		output("\n\nAt least you won’t be giving birth unassisted. Perhaps rationality, in the end, won out against the thought-depriving effects of your changed biology?");
		if (silly) output(" Some part of you really hopes you don’t get cited for littering.");
	}
	clearMenu();
	
	addButton(0, "Next", laquineSteeleBirth,numChildren);
}
//for LaquinePregnancyHandler, this is generic laquine preg
public function laquineSteeleBirth(numChildren:int = 2):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var loc:String = getPlanetName().toLowerCase(); //current planet
	var smallHips:Boolean = true;
	if (pc.hipRating() >= 14) smallHips = false;
	var locType:int = 0;
	var multiPreg:Boolean = false;
	var numWombs:int = flags["LAQUINE_PREGHAND_MULTIBIRTH"];
	if (numWombs > 1) multiPreg = true;
	flags["LAQUINE_PREGHAND_MULTIBIRTH"] = undefined;
	
	//on ship 1
	if (InShipInterior())
	{
		output("Finding the medkit takes precedence. You rummage through your storage and clutch it tight to your chest, staggering to your room, the contractions down below hammering a painful reminder, <i>“It’s time!”</i> into you with every step. You can find no words, only huffs and whimpers while you");
		if (!pc.isCrotchExposed()) (" strip down and");
		output(" lie on your bed, ready to let your body work.");
		locType = 1;
	}
	//tavros station 2
	else if (loc == "tavros station")
	{
		output("The moment you scream, everyone nearby turns to you, rushing over to see what they can do to help. You needn’t explain yourself to the peacekeepers in the group, they’re already acting on training. Emergency responders are on the scene in less than a minute, escorting you to their vehicle and hauling you off to the station’s hospital amid an applause filled with congratulatory smiles.");
		if (!pc.isCrotchExposed()) (" The medics relieve you of your clothes en-route.");
		moveTo("NURSERYE14");
		locType = 2;
	}
	//mhenga zil village 3
	else if (loc == "mhen'ga" && flags["PQ_RESOLUTION"] != -1 && (currentLocation == "11. Zil Village Outskirts" || currentLocation == "12. Zil Village Winnar" || currentLocation == "ZIL FESTIVAL VILLAGE" || currentLocation == "ZIL FESTIVAL YURT"))
	{
		output("Zil are no strangers to procreation, and when they notice you in the throes of childbirth, you are rushed to the healer’s hut. As an honored guest of Quinn’s, all possible anodynes are made available, including the soft hands that tend you at your weakest. The gentle handmaidens");
		if (!pc.isCrotchExposed()) output(" disrobe you and");
		output(" begin to guide you through the arduous process to come.");
		locType = 3;
	}
	//mhenga in civ 4
	else if (loc == "mhen'ga" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("When you slump to your knees, the nearest rusher, a brawny");
		if (CodexManager.entryViewed("Saurmorians")) output(" saurmorian");
		else output(" lizard-man");
		output(" charges over. Your pants and groans, and your swollen belly, tell him all he needs to know. You’re scooped up into the giant dino-man’s warm arms - belly facing skyward - and rushed to the local clinic. Once inside, a doctor is all over you by the bedside with a squawking V-Ko droid opposite him");
		if (!pc.isCrotchExposed()) output(" removing your clothes");
		output(".");
		moveTo("ESBETH MEDICAL OFFICE");
		locType = 4;
	}
	//mhenga tarkus in civ 5
	else if (loc == "tarkus" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("Novahome being what it is, you don’t expect there to be a med-station quite up to galactic standards, but there should be plenty of quiet places and even more breed-hungry raskvel to aid you. Sure enough, when you double over and show the tell-tale signs of birthing, a large group of wide-hipped kobold-bunnies usher you to safety, drawing you into a nice little hideaway much quieter than imagined.");
		if (!pc.isCrotchExposed()) output(" They have your clothes off in a jiffy.");
		moveTo("207");
		locType = 5;
	}
	else if (loc == "myrellion")
	{
		var inKressia:Boolean = false;
		if (isNaN(parseInt(currentLocation)))
		{
			if (currentLocation == "LIEVE BUNKER" || currentLocation == "FAZIAN_RESCUE_ROOM" || currentLocation == "KRESSIA MEDICAL") inKressia = true;
		}
		else 
		{
			if (parseInt(currentLocation) >= 800 && parseInt(currentLocation) <= 899) inKressia = true;
		}
		
		//myrellion red myr 6
		if (inKressia) 
		{
			output("A duo of red myr soldiers discover your peril. Sensing your distress they rush you to the Kressia medical center as quickly as they can, delivering you into the capable arms of their CMO, Anzhela. The red doctor");
			if (!pc.isCrotchExposed()) output(" disrobes you and");
			output(" gets you to the cleanest bed she can find, well away from other patients. You hope that she and her staff are familiar with non-myr birthing procedure.");
			moveTo("KRESSIA MEDICAL");
			locType = 6;
		}
		//taivra 7
		else if (currentLocation == "2E11" || currentLocation == "2E13" || currentLocation == "2G13" || currentLocation == "2G15" || currentLocation == "2G17" || currentLocation == "2E17" || currentLocation == "2C11" || currentLocation == "2C13" || currentLocation == "2C15" || currentLocation == "2C09" || currentLocation == "2A09")
		{
			if (flags["KING_NYREA"] == 1 && flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) output("Being the subjugator of");
			else if (flags["KING_NYREA"] == 1) output("Being the " + pc.mf(" husband"," wife") + " to");
			output(" an alien royalty has its perks. Namely, being able to command the assistance of the resident nyreans and their queen on your final step through pregnancy. You’re taken to Taivra’s bedchamber and afforded all the care you could possibly need to make this birthing much less painful than it needs to be. All the water and blankets they can find are brought to your bedside");
			if (!pc.isCrotchExposed()) output(", clothes are finally removed");
			output(".");
			moveTo("2C15");
			locType = 7;
		}
		//myrellion gold myr 8
		else
		{
			if (InRoomWithFlag(GLOBAL.HAZARD))
			{
				output("A few rushers cross your path. You explain what’s going on before they anxiously hurry you to the great elevator and down to the gold myr city where help awaits.");
			}
			else
			{
				output("To your delight, a gold myr squad on patrol are at your side when you cry out for help.");
			}
			output(" The sprawling Gildenmere hospital welcomes you immediately, and a team of professionals is assigned right away to your imminent birthing. A cozy bed is prepared and all possible amenities are provided");
			if (!pc.isCrotchExposed()) output(" as soon as your clothes are off");
			output(".");
			moveTo("741");
			locType = 8;
		}
	}
	//uveto kryms camp 9
	else if (loc == "uveto vii" && currentLocation == "UVGR M4")
	{
		output("It could be worse. For instance, you could be somewhere far away from this insulated bunker and the fierce warrior lady who resides within. <i>“Steele... you’re not...”</i> she starts, <i>“You’re giving birth, here!?”</i> Krym looks flabbergasted, but wastes no time bringing you in from the cold and straight to her bed. She’s storming around the cozy little hideaway for anything that might be useful");
		if (!pc.isCrotchExposed()) output(" while you undress");
		output(", soon returning with water and extra blankets.");
		locType = 9;
	}
	//uveto korgii hold 10
	else if (loc == "uveto vii" && currentLocation.search("KORGII") >= 0)
	{
		output("Hand on the wall you call out for any one of the fluffy korgonne to help you to safety. To your imminent relief, two of the Hold’s guards are hefting you to the communal nursery, a breeding room and birthing room all in one filled with a number of mothers, expecting and otherwise. You’re given the last bed and left in the capable hands of the tribe’s healer");
		if (!pc.isCrotchExposed()) output(", those hands already seeing to your clothes");
		output(".");
		locType = 10;
	}
	//uveto town 11
	else if (loc == "uveto vii" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("The worst possible thing to be right now is cold, and the chill of Uveto is biting deeply. Fortunately, Irestead is home to many people, and those many hardy folk are already at your side, helping you to your feet and barking orders at others while they carry you to safety. Inside a local care center you’re waited on by two doctors who get you into the warmest corner they can find before");
		if (!pc.isCrotchExposed()) output(" disrobing you and");
		output(" prepping you for birth.");
		locType = 11;
	}
	//new texas 12
	else if (loc == "new texas")
	{
		output("Pain consumes you almost immediately, and on a libertine paradise like New Texas nobody could miss your discomfort. Certainly, wherever two very bubbly cowgirls are hustling you now will be a safe enough place to give birth to your kids, far away from the easily excitable bulls that have cocked their heads in your direction. The two bosomy babes get you settled in their home,");
		if (!pc.isCrotchExposed()) output(" disrobing you and");
		output(" grabbing whatever they could possibly need for your babies.");
		locType = 12;
	}
	//gastigoth 13
	else if (loc == "gastigoth station")
	{
		output("The well-trained guards on a maximum security prison-station like Gastigoth recognize your plight immediately. The station’s facilities are used typically for impregnated inmates, but they’ll have you as a special guest today.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 13;
	}
	//breedwell 14
	else if (loc == "breedwell centre")
	{
		output("For a place named Breedwell, it comes as no surprise they’re equipped to handle a " + pc.mf("childbearer","mother") + " in need, and you’re rushed to the first available bed.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 14;
	}
	//canadia 15
	else if (loc == "canadia station")
	{
		output("A nurse on vacation introduces herself rather eloquently and helps you to her rented room in the station’s lodgings.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 15;
	}
	//uveto station 16
	else if (loc == "uveto station")
	{
		output("A flock of toves and a few other employees - Steele Tech scientists - have your back the second you collapse, ushering you into the station’s medbay and leaving you in the hands of trained caregivers.");
		output(" Once your vitals are checked");
		if (!pc.isCrotchExposed()) output(" and your clothes are ditched");
		output(", you’re prepared to give birth on a rather comfy bed.");
		locType = 16;
	}
	//zheng shi rat friends 17
	else if (loc == "zheng shi station" && ratsPCIsGood() && (boredJumperPregLocation() == 0 || boredJumperPregLocation() == 1))
	{
		if (boredJumperPregLocation() == 0) output("The heat of the mines mixes with your weakness, makes the gush of cream at your loins all the more noticeable. A cold rush of adrenaline flows when you hear hasty footsteps.");
		else if (boredJumperPregLocation() == 1) output("Whilst you search for a safe place, a cold rush of adrenaline flows when the rapid ‘taptaptap’ of footsteps catches you off guard.");
		output("You brace yourself for the worst, until three rats, decked out in their usual gear, stop short of you with worried looks on their faces. <i>“[pc.Mister] CEO! What are you doing walking around like that? You can’t stay here! Come on, we know all the good hiding spots!”</i>");
		output("\n\nThe pink-furred rodenian and her entourage take you by the arms, lending you their oh-so small shoulders as they usher you into a maintenance room of sorts. It’s surprisingly cool and spacious; it’s perfect for your needs. The rascals set about scooping up whatever they could need to help, finding cloths, fabrics, water, anything that might help.");
		if (!pc.isCrotchExposed()) output(" The last thing they do is help you out of your gear.");
		locType = 17;
	}
	//zheng shi mines 18
	else if (loc == "zheng shi station" && boredJumperPregLocation() == 0)
	{
		output("Fuck... This is perhaps the worst possible place you can bring a child into the galaxy, but you won’t make the walk back to the hangar. Fortunately, there are a few dead ends in these mines that the pirates have long lost interest in. They’ll have to do. At least it’s a little cooler here than the network at large.");
		locType = 18;
	}
	//zheng shi foundry 19
	else if (loc == "zheng shi station" && boredJumperPregLocation() == 1)
	{
		output("You keep your voice down lest any pirates on patrol catch wind of it. There are plenty of unused, prefab extensions to this floor, perfect for hiding away. On the way to such a secluded room, you’re at least able to find a crummy looking medkit with the barest essentials inside. It’ll have to do.");
		locType = 19;
	}
	//generic civ 20
	else if (loc != "zheng shi station" && !InRoomWithFlag(GLOBAL.HAZARD))
	{
		output("A local " + RandomInCollection(["man","woman"]) + " comes running at your distress. When the adrenaline runs its course, they have you in the hands of medical staff on your way to the local clinic. Once there, you’re given the coziest bed and prepared for birthing");
		if (!pc.isCrotchExposed()) output(", your clothes having been removed on the way");
		output(".");
		locType = 20;
	}
	//default 0
	else
	{
		output("It takes much too long to find a place safe enough, but you do. It’s going to hurt like hell, of that you have no doubt, but you remind yourself that these are the kinds of conditions people in history endured. If they can do it, why can’t you with all of today’s advancements marking you as a product of your time? You try to keep your mind off the dangers, breathing in rhythm, ready to go through this");
		if (!pc.isCrotchExposed()) output(" after shucking your kit");
		output(".");
		locType = 0;
	}
		
	output("\n\nSpreading your legs is the only easy part of this tribulation. Labor aches tear through your body, overwriting all unpained nerves with the sensation before surging downward to your vagina");
	if (numWombs > 1) output("s");
	output(".");
	if (numWombs == 3) output(" You’re on autopilot; your triumvirate of wombs soften and your cervixes dilate as your bundles of joy enter the galaxy.");
	else if (numWombs == 2) output(" You’re on autopilot; your gemini of wombs soften and your cervixes dilate as your bundles of joy enter the galaxy.");
	else output(" You’re on autopilot; your womb softens and your cervix dilates as your bundles of joy enter the galaxy.");
	output(" You can feel the weight, the width, the diameter, the <i>everything</i> of the first little munchkin spreading your straining birthing canal wide between your body’s organ-clenching contractions.");
	if (pc.gapestVaginaLooseness() >= 4)
	{
		output(" Considering how loose you are, it could be much worse");
		if (smallHips) output(", particularly as your pelvic structure widens to handle the process");
		output(".");
	}
	else
	{
		output(" Your tightness only makes this harder");
		if (smallHips) output(", not to mention it’s a pain on top of your reshaping pelvic structure");
		output(".");
	}
	
	output("\n\nThe first laquine’s head emerges from your snug tunnel. Or rather, the <b>" + RandomInCollection("upraised ears","lop ears") + "</b> do. You push, screaming with tears in your eyes until your first laquine baby pops out unceremoniously. You can’t focus on it at all, head thrown back in dissipating agony as the next one moves through. Another pair of floppy ears emerges, and another small rabbit squirms out");
	
	if (locType == 3) output(" to be wrapped up and cleaned by the quiet zil maidens.");
	else if (locType == 5) output(" to be wrapped up and cleaned by the attending raskvel.");
	else if (locType == 10) output(" to be wrapped up and cleaned by the healer-pup.");
	else if (locType == 12) output(" to be wrapped up and cleaned by the humming cowgirl.");
	else if (locType == 15) output(" to be wrapped up and cleaned by the red-headed nurse.");
	else if (locType == 17) output(" to be wrapped up and cleaned by the rodenian and her friends. <i>“Ohh, you’re doing fine, [pc.mister] CEO!”</i> she chirps");
	else if (locType == 2 || locType == 4 || locType == 6 || locType == 7 || locType == 8 || locType == 9 || locType == 11 || locType == 13 || locType == 14 || locType == 16 || locType == 20) output(" to be wrapped up and cleaned by the nurses at your side.");
	else output(".");
	
	if (numChildren == 2)
	{
		output("\n\nCuriously, it ends there. The hormonal weight on your mind lifts, and a cold sweat washes over your body between the fading spasmic pains. There are faint little squeals that bring your brain back to reality between the waves of endorphins. The reality being that you’ve safely given birth to <b>two laquines,</b>");
		output(" with mixed colors, one part of the palette containing <b>your [pc.hairColor] hair</b> for fur up and down their tiny sizes.");
		
		output("\n\nYou lean over and scoop the twins into your [pc.arms], gently wiping the ‘you’ off of their faces while their tiny hands reach out for their mother. You just want to hold them close forever, to always remember how wonderful this moment right here, right now, is, and will always be. A warmth as fuzzy as your offspring dominates your recovering form...");
	}
	else if (numChildren > 2 && numChildren <= 8)
	{	
		output("\n\nYou’ve got more coming, but it does get noticeably easier. Your neck muscles dry up as your grunts and moans dissolve into gravelly rasps of relenting anguish.");
		if (numChildren == 3) output(" One more rabbit falls from your hole, landing next to its siblings.");
		else if (numChildren == 4) output(" Another rabbit falls out closely tailed by another, flopping into the world next to their siblings.");
		else if (numChildren == 5)
		{
			output(" It’s hard to believe, but you can feel three rabbits in your hole");
			if (numWombs > 1) output("s");
			output(" right now, emerging at roughly the same time from your capable body and flopping out next to their siblings.");
		}
		else if (numChildren == 6)
		{
			output(" Your bloated belly noticeable compresses when two rabbits flop out in front of you, followed closely by two others from");
			if (numWombs > 1) output(" separate holes.");
			else output(" the same hole.");
		}
		else if (numChildren >= 7)
		{
			output(" Undoubtedly, you’re carrying a full litter; you loose an animalistic growl, immersed in some twisted gestalt of euphoria as you feel all of them pushing through your stretching tunnel. Ears, hands, and digitigrade feet emerge from your overstretched cavern; your last screams carry them the rest of the way through");
			if (numWombs > 1) output(" separate holes");
			else output(" the same hole");
			output(" until they’re all flopping out into a pile of weighty, mewling bunnies, some with little fur and others totally coated.");
		}
		
		output("\n\nThe pain clears up; endorphins and adrenaline are chucking through your system at record levels. A weight on your mind eases and vanishes, leaving you feeling cold and relieved -- sucking for air is the most you manage. You can now clearly hear the squeals of your children, waiting for their first meal. Once your vision realigns, you take in their features, leaning up and over to bring them into your [pc.arms].");
		output("\n\nYou’ve given birth to " + num2Text(numChildren) + " laquines, a variety of girls, boys, and natural hermaphrodites. Each one is painted with varying amounts of fur, pelts of mixed colors including <b>your [pc.hairColor] hair!</b>");
		output("\n\nScooping them up into your arms is one of the most enjoyable things you can say you’ve ever done. Joyfulness buzzes throughout your body with a rich, creamy texture. There’s something all too intoxicating about the way they grasp cutely at your [pc.skinFurScalesNoun]. Brief, ecstatic fantasies about who and what they might become fill your mind too.");
	}
	else if (numChildren > 9 && numChildren <= 16)
	{	
		output("\n\nIf you thought it was going to get any easier, you were dead wrong -- ");
		if (numWombs == 3) output("all");
		else output("both");
		output(" of your holes stretch and squirm against each other with the weight and form of multiple laquines squishing through them. Lop and upright ears poke through your widening slits, the contractions not enough to push them out, needing your aid to do it. And provide it you do, squealing yourself hoarse as several children pop out, followed by more, more...");
		output("\n\nDistracting yourself with idle, pain-fragmented fantasies is the best you can do. <i>It’ll be over soon,</i> you think to yourself; <i>your kids sound and look so healthy!</i> you mentally utter. Sure, you only caught the briefest glimpse before another hip-extending contraction slipped another laquine through, but the growing volume of hungry babies tells you that you’re doing just fine");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(", the encouragements of your attendants notwithstanding");
		output(".");
		
		output("\n\nAdrenaline, endorphins, and a little serotonin have you slowly deflating your stomach one neonate critter at a time.");
		if (numChildren >= 13) output(" Your sizeable litter continues to swell in size. So many yous, unable to open their eyes, are huddling together with twitching noses and soft squeals. The final bun flops out into the galaxy when you’re on the verge of slipping into unconsciousness.");
		else output(" You’ve given birth to a sizeable litter, and to your great relief, the pain begins to fade away when the last little bun flops out into the galaxy.");
		
		output("\n\nYou pant, heave, and pant some more, finally able to sit up and take stock of your children. " + num2Text(numChildren, true) + " laquines are huddled in a pile. Girls, boys, natural hermaphrodites, you’ve given birth to just about every combination of space-rabbit there is. Their furs are shimmery, if a little reddened with your innards. Some have full coats, others only have it on their limbs. The colors are all similar though;");
		output(" they have wildly contrasting colors, the majority of the palette containing your [pc.hairColor]!</b>");
		output("\n\nYou let out a soft huff as you slump forward, bringing the first few into your [pc.arms]. There’s something undeniably magical about the act. Seeing them is one thing, but holding them... the inner jubilation you feel is a delight you wish never to end. Your mind drifts to thoughts of their futures, gleefully imagining them as happy as you are right now.");
	}
	else if (numChildren >= 17)
	{	
		output("\n\nThe sheer amount of pain you’re in is indescribable. Excruciating is the understatement of the year, the century, <b>the fucking millennium.</b> <i>It hurts.</i> And it’s all worth it just to feel one, two, three little critters all wiggling their way down your snug passages. You were filled to the brim with a laquine’s seed, and now you’re bearing the fruits of coitus with a gifted breeder. You could not be happier, but you could not be in any more agony than you are. Certainly, nothing will ever compare to this, mothering three litters all at once. ");
		output("\n\nSaving your strength for your rippling loins somehow keeps you conscious during this ordeal. Were you ranting or grousing, you might not have as much a hold on reality as you do. Indeed, some part of you thinks that being anesthetized for this would be a cowardly way out...");
		output("\n\nFantasies of how they will look, the sounds they make when they add themselves to the fuzzy pile of newborn runts, it all keeps you going. You can’t pass out. <i>You must not pass out.</i> You’re the mother of three entire laquine litters. They need you, and you need to be there for them. And so, you push. You scream yourself into hoarseness, barely keeping your thighs down and spread, making sure your distending waistline aims the rapidly squirming bundles next to their siblings.");
		output("\n\nEvery time you feel a pair of lips spread and a fuzzy boulder pass, another takes its place, and then two more beside it. You grit your teeth and play back in your mind whatever you think might help. A funny movie you watched in your younger years. A book you read a dozen times. That weird gift you got during a holiday. It doesn’t matter, just... you just need something to hold on to.");
		output("\n\nYou’re inhaling so hard that your ribcage shows through your [pc.skinFurScales]. Color drains from your cheeks and lips, spread wide and strained just as badly as your vaginal trio. Lop and upraised ears both stick out then flip over adorably, more, more... you have no idea what the count is, only that you’re a mother who’s bringing so many kids into this galaxy.");
		output("\n\nAnd then... it just ends. You didn’t even feel the last one shirk your internal protection, only the relieving weight of adrenaline and endorphins beginning the slow cleanse of your body. There’s only a tiny lurch in your [pc.fingers], a little thrum in your [pc.legsNoun]. There’s a hollow gasp before you can finally sit up, an exceedingly difficult thing to do. But so, so worth it...");
		output("\n\nWhen you look down to the mound of squeals and twitching ears, your heart flutters. It feels so light that it might just be floating away to heaven, enraptured by the sight. Your " + num2Text(numChildren) + " children all huddle together for warmth, each covered in a little bit of you. It’s no surprise you’ve just spawned every conceivable combination of laquine there is: boys, girls, hermaphrodites, lop-ears, upraised ears, furry limbs, totally furry, there’s almost too much to take in. Despite being marred by a little internal sheen,");
		output(" the contrasting colors of their pelts - the majority of it being your [pc.hairColor] - is beautiful.");
		
		output("\n\nScooping up the first of your sons and daughters for the first time is a feeling utterly indescribable. They’re your kids. You made this possible. You gave them life. You’re overcome with empathy and happiness, feeling like all that matters is right here, right now. The maternal feelings running through your mind are dominant, suppressing all other thoughts and emotions to allow you this hypnotic reprieve.");
	}
	else
	{
		output("\n\nYou give birth to " + num2Text(numChildren) + " kids!");
	}

	//increase hipsize
	if (smallHips) pc.hipRating(numWombs);
	
	clearMenu();
	addButton(0, "Next", laquineSteeleBirthNext, [numChildren, locType]);
}
//for LaquinePregnancyHandler, this is generic laquine preg
public function laquineSteeleBirthNext(arg:Array):void
{
	clearOutput();
	author("William");
	showBust("");
	showName("\nBIRTHING!");
	
	var numberChildren:int = arg[0];
	var locType:int = arg[1];
	
	var milk:Number = 200 * numChildren;
	if (milk > pc.milkQ()) milk = pc.milkQ();
	
	if (boredJumperBreastFeedOK())
	{
		output("You can feel your [pc.breasts]");
		if (pc.milkQ() >= 2000) output(" straining");
		else output(" sloshing");
		if (numChildren >= 6) output(" at the idea of feeding this many children, but feed them you must.");
		else output(" at the idea of feeding your children.");
		output(" A little wince and grunt is nothing compared to the weeks you’ve endured, and as you get yourself ready you let out a happy, bubbly sigh.");
		
		if (numChildren == 2) output("\n\nThe twins feed from each [pc.milkNoun] dripping nipple while you cradle their heads with profound gentleness.");
		else
		{
			output("\n\nYou guide the mouths of your newborns to your [pc.milkNoun] dripping nipples");
			if (pc.breastRows.length > 1) output(", glad that you have extra jugs to satisfy a litter of this size");
			output(".");

		}
		output(" Soft wet noises are all you hear");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) output(" between the congratulating coos of your bedside assistant");
		output(".");
		
		if (numChildren / 2 > pc.breastRows.length)
		{
			output(" When the quiet suckles stop, you bring the next hungry mouth");
			if (numberChildren % 2 == 0) output("s");
			output(" to your chest");
		}
		else output(" When the quiet suckles stop, you set the two siblings down and hold them close to your neck");
		
		output(". Relief floods through you with the same unceasingness your [pc.milkyNipples] dribble their rich treat, as eager for its recipients as they are for it.");
		
		pc.milked(milk,true);
	}
	else
	{
		output("You don’t have any milk, not in you or on you, and that thought brings you some amount of discomfort. They’re expecting their first meal, but you can’t provide.");
		if (locType != 0 && locType != 1 && locType != 18 && locType != 19) 
		{
			output(" Fortunately, your bedside attendant has things covered.");
			if (locType == 12) output(" What kind of universe would you be living in if there wasn’t any milk on New Texas?");
		}
		else output(" There’s nothing for it but to keep your kids safe while waiting for their taxi to come by.");
	}	
		
	output("\n\nFor your part, all you do is lie there in total relaxation, delighting in the feel of twitching whiskers against your [pc.skinFurScales]. When you focus hard enough, their tiny lungs and the little airs they breathe can be heard. Craning ears pulse against your body, a much more pleasant sensation than a kick to your placenta! You curl into a fetal position yourself; whatever keeps the fuzzy pile of rabbits close to you, that’s what you’re doing. Their shared body heat and the low vibrations in their bodies keep you company.");
	output("\n\nYou would drift off to a nap, but you can’t. You know better than anyone that you can’t leave them here, and you can’t stay like this. There’ll be time for enjoying their company later, but their safety and needs cannot be guaranteed in this place.");
	
	if (locType == 2)
	{
		output(" Your kids belong in your nursery, and you alert the medical staff to that fact. Once you tell them your name, you need not say anything more.");
		output("\n\nWhen you can finally stand again, thanks in part to the wonders of medical science, you help the doctors prepare your kids for transfer. Once they’re all safe, you watch with some amount of discomfort as they’re taken away. Sure, you know where they’re going, and you trust them fully... but something about it fills you with sadness.");
		output("\n\nThat sadness, however, will evaporate when you go and visit them later!");
	}
	else
	{
		output(" A mechanical chirp from your codex alerts you to the incoming nursery probes.");
		if (numberChildren > 2)
		{
			if (numberChildren > 8) output("\n\nThe retrieval shuttles zero in on your location, and there are many of them. Good thing your codex is on top of things!");
			else output("\n\nThe retrieval shuttles zero in on your location.");
		}
		else output("\n\nThe retrieval shuttle zeroes in on your location.");
		
		output(" Shaken but not stirred, you rise to your feet and, with the utmost caution, load your children into its warm confines");
		if (numberChildren > 8) output(", one after the other");
		output(". When they’re all filled, you watch the humming taxis whirl back into space on a one way trip to your nursery. You can’t help but think about something going wrong, about never seeing one or all of your kids again.");
		
		output("\n\nMost of all, you simply feel sad letting them all go. Still, that sadness evaporates when you think about visiting them as soon as possible. Yeah. They’ll be there when you get there, and they’ll all be fine!");
		output("\n\nFor now, though, it’s time to get going...");
	}	
	
	processTime(60 + ((rand(15) + 5) * numChildren));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
