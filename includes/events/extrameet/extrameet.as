/**
 * ExtraMeet, aka Space Tinder https://docs.google.com/document/d/1bg6ghHmFqxh-WAqBvDslo1zXhFigxjOLvNNZpDqQU3o/edit
 * @author DrunkZombie
 *
 * this class contains the core logic for the extrameet site (login, swiping, set up date, etc...), extrameetProfiles.as contains the individual profile stuff
 */
//flags
//EXTRAMEET_SIGNUP undefined = not signed up, 1 = profile created
//
//counters
//EXTRAMEET_DATE 		The number of extrameet dates you have had (incremented in extrameetSetMeet())
//EXTRAMEET_BAIL 		The number of times you have bailed on a date (incremented in extrameetBailScene())
//EXTRAMEET_DOH 		The number of times your date has bailed on you (must be incremented in the date scene if appropriate)
//all these below need to be incremented in the sex scenes as appropriate
//EXTRAMEET_SEX  		The number of dates that have ended in sex
//EXTRAMEET_ORAL_GIVE  	The number of dates you gave oral on
//EXTRAMEET_ORAL_RCVD 	The number of dates you rcvd oral on
//EXTRAMEET_CUNT_GIVE	The number of dates that you fucked a cunt
//EXTRAMEET_CUNT_RCVD	The number of dates that your cunt was fucked
//EXTRAMEET_ASS_GIVE	The number of dates that you fucked an ass
//EXTRAMEET_ASS_RCVD	The number of dates that your ass was fucked
//EXTRAMEET_BOOBS_GIVE	The number of dates that your sucked on some boobies
//EXTRAMEET_BOOBS_RCVD	The number of dates that your titties got sucked on
//EXTRAMEET_FAP_GIVE	The number of dates that you masturbated someone
//EXTRAMEET_FAP_RCVD	The number of dates that you were masturbated
//
//timestamps to track reset after 30 days
//EXTRAMEET_TAVROS timestamp
//EXTRAMEET_MHENGA timestamp
//EXTRAMEET_TARKUS timestamp
//EXTRAMEET_MYRELLION timestamp
//EXTRAMEET_UVETO timestamp
//EXTRAMEET_NEWTEXAS timestamp
//
//profile flag  undefined or 0 = available, 1 = rejected or unavailable, 2 = match
//see extrameetProfiles.as for profile flags used
//
//to add new profiles there are 6 steps that need to be done in this class, start in extrameetGetProfiles than the functions that follow

// Smut check, based on hasSmutOptions() in atha_lets_fapper.as but being in ship interior not required
public function extrameetSmutAvail():Boolean
{
	if(MailManager.isEntryViewed("lets_fap_unlock")) return true;
	if(MailManager.isEntryViewed("steph_on_demand")) return true;
	if(MailManager.isEntryViewed("syri_video")) return true;
	if(flags["KHORGAN_PREGSTURBATE"] != undefined) return true;
	if(MailManager.isEntryViewed("kiroandkallyholomail")) return true;
	return false;
}

//text for email sent to invite player to join
public function extrameetInviteText():String
{
	var eText:String = "";

	eText+="[pc.name],";
	eText+="\n\nThe galaxy can be a dark, lonely place. There are trillions of souls, and infinite possibilities. Why not try and make a connection?";
	eText+="\n\n-The ExtraMeet Team";
	eText+="\n\nA site address has been included below.";
	eText+="\n\n<b>(ExtraMeet has been added to the Smut menu in your ship’s Masturbate option.)</b>";
	
	return ParseText(eText);
}

//first page of the site
public function extrameetStartPage():void
{
	clearOutput();
	clearMenu();
	showName("\nEXTRAMEET");
	author("Fr0sty");
	
	//set planet timestamp and check for reset
	extrameetCheckReset();
	
	if (flags["EXTRAMEET_SIGNUP"] != undefined)
	{
		output("You bring up ExtraMeet and log in. Taking a moment, you update your profile and your current location.");
		output("\n\nWelcome back to ExtraMeet!");
		output("\n\nYour current location is: " + getPlanetName());
		output("\n\nWhy not try and make a connection?");
	
		addButton(0,"Start Swiping",extrameetStartSwipe,undefined,"Start Swiping","Look at profiles of local singles");
		addButton(1,"Review Match",extrameetReview,undefined,"Review Your Matches","Look at matches you haven’t dated yet");
		addButton(14,"Back",smutFapMenu);
	}
	else
	{
		output("You punch in the address from the E-mail.");
		output("\n\nWelcome to ExtraMeet!");
		output("\n\nSign up today and meet local singles in your area!");
		output("\n\nWhy not try and make a connection?");
		addButton(0,"Sign Up",extrameetSignup,undefined,"Sign Up","Create an account");
		addButton(14,"Back",smutFapMenu);
	}
}
	
//text for signup button
public function extrameetSignup():void
{
	clearOutput();
	clearMenu();
	showName("\nEXTRAMEET");
	author("Fr0sty");
	
	output("You press sign up.");
	output("\n\nThe site prompts you to fill in several blocks of information, including details about your race, sex, age, and a small bio section. You fill it all in to the best of your ability and submit it.");
	output("\n\nWelcome [pc.name] Steele!");
	output("\n\nYour current location is: " + getPlanetName());
	output("\n\nWould you like to begin?");
	
	flags["EXTRAMEET_SIGNUP"] = 1;
	
	addButton(0,"Start Swiping",extrameetStartSwipe,undefined,"Start Swiping","Look at profiles of local singles");
	addButton(14,"Back",smutFapMenu);
}

//page to display a random profile and swipe left or right
public function extrameetStartSwipe():void
{
	clearOutput();
	clearMenu();
	showName("\nEXTRAMEET");
	author("Fr0sty");
	
	var pospro:Array = [];  //possible profiles
	var len:int = 0;  //curr profile array length
	var rn:int = 0;  //random profile number
	
	pospro = extrameetGetProfiles(0);
	
	len = pospro.length;
	//show a random profile
	if (len > 0)
	{
		rn = rand(len);
		extrameetDisplayProfile(pospro[rn]);
		addButton(0,"Swipe Left",extrameetSwipeLeft,pospro[rn],"Swipe Left","Reject the current profile");
		addButton(1,"Swipe Right",extrameetSwipeRight,pospro[rn],"Swipe Right","Gimme! Gimme!");
	}
	else
	{
		output("You currently have no available connections. Please try again later.");
	}
	addButton(14,"Back",extrameetStartPage);
}

//page to review any current matches to set up a date
public function extrameetReview():void
{
	clearOutput();
	clearMenu();
	showName("\nEXTRAMEET");
	author("Fr0sty");
	
	var pospro:Array = [];  //possible profiles
	var len:int = 0;  //curr profile array length
	var i:int = 0;  //for loop counter
	var user:String = "";  //curr profile username
	
	pospro = extrameetGetProfiles(2);
	
	len = pospro.length;
	
	//limit matched profiles to 14 as a safety measure, pagination logic needs to be added if there ever is the possibility of over 14 matches on a single planet
	if (len > 14) len = 14;
	
	if (len > 0)
	{
		for(i = 0; i < len; i++)
		{
			if(i > 0) output("\n\n\n");
			user = extrameetGetUserName(pospro[i]);
			output("<b>" + user + "</b>\n");
			extrameetDisplayProfile(pospro[i]);
			addButton(i, user, extrameetSetMeet, pospro[i], user, "Set up a date with " + user);
		}
	}
	else
	{
		output("You currently have no available matches.");
	}
	addButton(14,"Back",extrameetStartPage);
}

//swipe right
public function extrameetSwipeRight(prof:String):void
{					
	pc.lust(5);
	if (extrameetCheckMatch(prof))
	{
		clearOutput();
		clearMenu();
		showName("\nEXTRAMEET");
		author("Fr0sty");
		
		flags[prof] = 2;
		output("It’s a match!");
		output("\n\nYou and " + extrameetGetUserName(prof) + " have formed a connection!");
		output("\n\nWant to set a Meet?");
		
		addButton(1,"Set a Meet",extrameetSetMeet,prof,"Set a Meet","Codex and chill");
		addButton(0,"Keep Swiping",extrameetStartSwipe,undefined,"Keep Swiping","Look at some more profiles");
	}
	else
	{
		flags[prof] = 1;
		extrameetStartSwipe();
	}
}

//swipe left
public function extrameetSwipeLeft(prof:String):void
{			
	flags[prof] = 1;
	extrameetStartSwipe();
}

//loads an array with profiles: parameter num controls which ones: 0 = available, 1= unavailable 2 = matched
//Add logic here for new profile: step 1
//add an IF statement under the correct planet to check the status of the profile flag to push a value to make it available
//use the same text for both the flag and the pushed value
public function extrameetGetProfiles(num:int):Array
{
	var pospro:Array = [];  //possible profiles profile function names
	var loc:String = getPlanetName().toLowerCase();  //current planet
	
	trace("location: " + loc);
	if (loc == "tavros station")
	{
		if (extrameetProfileStatus("EXTRAMEET_SAVINGGRACE04") == num) pospro.push("EXTRAMEET_SAVINGGRACE04");
		if (extrameetProfileStatus("EXTRAMEET_MRFOX") == num) pospro.push("EXTRAMEET_MRFOX");
		if (extrameetProfileStatus("EXTRAMEET_LADYGLAMOR") == num) pospro.push("EXTRAMEET_LADYGLAMOR");
		if (extrameetProfileStatus("EXTRAMEET_REDD") == num) pospro.push("EXTRAMEET_REDD");
		if (extrameetProfileStatus("EXTRAMEET_HAWTSTUFF") == num) pospro.push("EXTRAMEET_HAWTSTUFF");
		if (extrameetProfileStatus("EXTRAMEET_THROBBIN34") == num) pospro.push("EXTRAMEET_THROBBIN34");
		if (extrameetProfileStatus("EXTRAMEET_MYNAMEISJON") == num) pospro.push("EXTRAMEET_MYNAMEISJON");
		if (extrameetProfileStatus("EXTRAMEET_CATBOOBS") == num) pospro.push("EXTRAMEET_CATBOOBS");
		if (extrameetProfileStatus("EXTRAMEET_DARKANGEL01") == num) pospro.push("EXTRAMEET_DARKANGEL01");
		if (extrameetProfileStatus("EXTRAMEET_BRAZENBITCH") == num) pospro.push("EXTRAMEET_BRAZENBITCH");
		if (extrameetProfileStatus("EXTRAMEET_CASUALD") == num) pospro.push("EXTRAMEET_CASUALD");
		if (extrameetProfileStatus("EXTRAMEET_LETHALLADY") == num) pospro.push("EXTRAMEET_LETHALLADY");
		if (extrameetProfileStatus("EXTRAMEET_ROCKHARDFORYOU") == num) pospro.push("EXTRAMEET_ROCKHARDFORYOU");
		if (extrameetProfileStatus("EXTRAMEET_MOONLESSNIGHTS") == num) pospro.push("EXTRAMEET_MOONLESSNIGHTS");
		if (extrameetProfileStatus("EXTRAMEET_ALPHAWOLF") == num) pospro.push("EXTRAMEET_ALPHAWOLF");
	}
	else if (loc == "mhen'ga")
	{
		if (extrameetProfileStatus("EXTRAMEET_HUGGATREE") == num) pospro.push("EXTRAMEET_HUGGATREE");
		if (extrameetProfileStatus("EXTRAMEET_HONEYPOTT") == num) pospro.push("EXTRAMEET_HONEYPOTT");
		if (extrameetProfileStatus("EXTRAMEET_BOUNTIFULBOTANY") == num) pospro.push("EXTRAMEET_BOUNTIFULBOTANY");
		if (extrameetProfileStatus("EXTRAMEET_SNEAKYSNEK") == num) pospro.push("EXTRAMEET_SNEAKYSNEK");
		if (extrameetProfileStatus("EXTRAMEET_ENCHANTINGFAE") == num) pospro.push("EXTRAMEET_ENCHANTINGFAE");
		if (extrameetProfileStatus("EXTRAMEET_BIGDAWG") == num) pospro.push("EXTRAMEET_BIGDAWG");
		if (extrameetProfileStatus("EXTRAMEET_NYMPHO69") == num) pospro.push("EXTRAMEET_NYMPHO69");
		if (extrameetProfileStatus("EXTRAMEET_SHOWYOURS2ME") == num) pospro.push("EXTRAMEET_SHOWYOURS2ME");
		if (extrameetProfileStatus("EXTRAMEET_AWKWARDSOUL") == num) pospro.push("EXTRAMEET_AWKWARDSOUL");
		if (extrameetProfileStatus("EXTRAMEET_GLITTERCUNT") == num) pospro.push("EXTRAMEET_GLITTERCUNT");
		if (extrameetProfileStatus("EXTRAMEET_HOGWASH") == num) pospro.push("EXTRAMEET_HOGWASH");
		if (extrameetProfileStatus("EXTRAMEET_DIRTYGUR114") == num) pospro.push("EXTRAMEET_DIRTYGUR114");
		if (extrameetProfileStatus("EXTRAMEET_LOOKING4A3RD") == num) pospro.push("EXTRAMEET_LOOKING4A3RD");
		if (extrameetProfileStatus("EXTRAMEET_DIGBICK") == num) pospro.push("EXTRAMEET_DIGBICK");
		if (extrameetProfileStatus("EXTRAMEET_BIRDY") == num) pospro.push("EXTRAMEET_BIRDY");
	}
	else if (loc == "tarkus")
	{
		if (extrameetProfileStatus("EXTRAMEET_WANTSUMJUNK") == num) pospro.push("EXTRAMEET_WANTSUMJUNK");
		if (extrameetProfileStatus("EXTRAMEET_XXTHRASHERCATXX") == num) pospro.push("EXTRAMEET_XXTHRASHERCATXX");
		if (extrameetProfileStatus("EXTRAMEET_SWEETNLOW") == num) pospro.push("EXTRAMEET_SWEETNLOW");
		if (extrameetProfileStatus("EXTRAMEET_MIDNIGHTXROSE") == num) pospro.push("EXTRAMEET_MIDNIGHTXROSE");
		if (extrameetProfileStatus("EXTRAMEET_TRUEPOWER69") == num) pospro.push("EXTRAMEET_TRUEPOWER69");
		if (extrameetProfileStatus("EXTRAMEET_R4X0121") == num) pospro.push("EXTRAMEET_R4X0121");
		if (extrameetProfileStatus("EXTRAMEET_BEBOPBOSS") == num) pospro.push("EXTRAMEET_BEBOPBOSS");
		if (extrameetProfileStatus("EXTRAMEET_SEXPLOSIVE") == num) pospro.push("EXTRAMEET_SEXPLOSIVE");
		if (extrameetProfileStatus("EXTRAMEET_BIGGYZ") == num) pospro.push("EXTRAMEET_BIGGYZ");
		if (extrameetProfileStatus("EXTRAMEET_POWERLOVERS2") == num) pospro.push("EXTRAMEET_POWERLOVERS2");
		if (extrameetProfileStatus("EXTRAMEET_DIRTYHABITZ") == num) pospro.push("EXTRAMEET_DIRTYHABITZ");
		if (extrameetProfileStatus("EXTRAMEET_AVRICE56") == num) pospro.push("EXTRAMEET_AVRICE56");
		if (extrameetProfileStatus("EXTRAMEET_TWISTED") == num) pospro.push("EXTRAMEET_TWISTED");
		if (extrameetProfileStatus("EXTRAMEET_SLAVEBOI") == num) pospro.push("EXTRAMEET_SLAVEBOI");
		if (extrameetProfileStatus("EXTRAMEET_HAWTSHOT") == num) pospro.push("EXTRAMEET_HAWTSHOT");
	}
	else if (loc == "myrellion")
	{
		if (extrameetProfileStatus("EXTRAMEET_DOGGE") == num) pospro.push("EXTRAMEET_DOGGE");
		if (extrameetProfileStatus("EXTRAMEET_DAREGULATOR") == num) pospro.push("EXTRAMEET_DAREGULATOR");
		if (extrameetProfileStatus("EXTRAMEET_HUNTRESS") == num) pospro.push("EXTRAMEET_HUNTRESS");
		if (extrameetProfileStatus("EXTRAMEET_MISTRESSVENOM") == num) pospro.push("EXTRAMEET_MISTRESSVENOM");
		if (extrameetProfileStatus("EXTRAMEET_REBEL23") == num) pospro.push("EXTRAMEET_REBEL23");
		if (extrameetProfileStatus("EXTRAMEET_SWEETHEART") == num) pospro.push("EXTRAMEET_SWEETHEART");
		if (extrameetProfileStatus("EXTRAMEET_RDY4PLY") == num) pospro.push("EXTRAMEET_RDY4PLY");
		if (extrameetProfileStatus("EXTRAMEET_AL") == num) pospro.push("EXTRAMEET_AL");
		if (extrameetProfileStatus("EXTRAMEET_DEVIANTSHEEPDOG") == num) pospro.push("EXTRAMEET_DEVIANTSHEEPDOG");
		if (extrameetProfileStatus("EXTRAMEET_NAUGHTY232") == num) pospro.push("EXTRAMEET_NAUGHTY232");
		if (extrameetProfileStatus("EXTRAMEET_SIRENSONG") == num) pospro.push("EXTRAMEET_SIRENSONG");
		if (extrameetProfileStatus("EXTRAMEET_KINKDADDY") == num) pospro.push("EXTRAMEET_KINKDADDY");
		if (extrameetProfileStatus("EXTRAMEET_ALLYOURS12") == num) pospro.push("EXTRAMEET_ALLYOURS12");
		if (extrameetProfileStatus("EXTRAMEET_PURPLEBOWTIE") == num) pospro.push("EXTRAMEET_PURPLEBOWTIE");
		if (extrameetProfileStatus("EXTRAMEET_LEMMESMASH") == num) pospro.push("EXTRAMEET_LEMMESMASH");
	}
	else if (loc == "uveto station")
	{
		if (extrameetProfileStatus("EXTRAMEET_THEPROFESSOR") == num) pospro.push("EXTRAMEET_THEPROFESSOR");
		if (extrameetProfileStatus("EXTRAMEET_FUKA") == num) pospro.push("EXTRAMEET_FUKA");
		if (extrameetProfileStatus("EXTRAMEET_SCIENCERULEZ41") == num) pospro.push("EXTRAMEET_SCIENCERULEZ41");
		if (extrameetProfileStatus("EXTRAMEET_RIPPED4YOURPLEASURE") == num) pospro.push("EXTRAMEET_RIPPED4YOURPLEASURE");
		if (extrameetProfileStatus("EXTRAMEET_STORMDRAGON") == num) pospro.push("EXTRAMEET_STORMDRAGON");
		if (extrameetProfileStatus("EXTRAMEET_LOVEBELOW0") == num) pospro.push("EXTRAMEET_LOVEBELOW0");
		if (extrameetProfileStatus("EXTRAMEET_ASSBLASTER") == num) pospro.push("EXTRAMEET_ASSBLASTER");
		if (extrameetProfileStatus("EXTRAMEET_GRANITE75") == num) pospro.push("EXTRAMEET_GRANITE75");
		if (extrameetProfileStatus("EXTRAMEET_SUPAXSTAR") == num) pospro.push("EXTRAMEET_SUPAXSTAR");
		if (extrameetProfileStatus("EXTRAMEET_HALL9001") == num) pospro.push("EXTRAMEET_HALL9001");
		if (extrameetProfileStatus("EXTRAMEET_HELLOIMPAUL") == num) pospro.push("EXTRAMEET_HELLOIMPAUL");
		if (extrameetProfileStatus("EXTRAMEET_LONELY1") == num) pospro.push("EXTRAMEET_LONELY1");
		if (extrameetProfileStatus("EXTRAMEET_HANSI") == num) pospro.push("EXTRAMEET_HANSI");
		if (extrameetProfileStatus("EXTRAMEET_DOMME90") == num) pospro.push("EXTRAMEET_DOMME90");
		if (extrameetProfileStatus("EXTRAMEET_BIGDICKRICK") == num) pospro.push("EXTRAMEET_BIGDICKRICK");
	}
	else if (loc == "new texas")
	{
		if (extrameetProfileStatus("EXTRAMEET_FRANKMOLLY") == num) pospro.push("EXTRAMEET_FRANKMOLLY");
		if (extrameetProfileStatus("EXTRAMEET_PONYLUVER") == num) pospro.push("EXTRAMEET_PONYLUVER");
		if (extrameetProfileStatus("EXTRAMEET_MISSYMAY") == num) pospro.push("EXTRAMEET_MISSYMAY");
		if (extrameetProfileStatus("EXTRAMEET_VKO") == num) pospro.push("EXTRAMEET_VKO");
		if (extrameetProfileStatus("EXTRAMEET_SEXYYDADDYY") == num) pospro.push("EXTRAMEET_SEXYYDADDYY");
		if (extrameetProfileStatus("EXTRAMEET_FUNNYBOI1") == num) pospro.push("EXTRAMEET_FUNNYBOI1");
		if (extrameetProfileStatus("EXTRAMEET_MYLITTLEFUNBOX") == num) pospro.push("EXTRAMEET_MYLITTLEFUNBOX");
		if (extrameetProfileStatus("EXTRAMEET_YOURMOMMY") == num) pospro.push("EXTRAMEET_YOURMOMMY");
		if (extrameetProfileStatus("EXTRAMEET_BRATTYKITTEN") == num) pospro.push("EXTRAMEET_BRATTYKITTEN");
		if (extrameetProfileStatus("EXTRAMEET_EVERYTHINGDIES") == num) pospro.push("EXTRAMEET_EVERYTHINGDIES");
		if (extrameetProfileStatus("EXTRAMEET_THICKLOADZ") == num) pospro.push("EXTRAMEET_THICKLOADZ");
		if (extrameetProfileStatus("EXTRAMEET_STROKE4ME") == num) pospro.push("EXTRAMEET_STROKE4ME");
		if (extrameetProfileStatus("EXTRAMEET_LAUGHINGDRAGON") == num) pospro.push("EXTRAMEET_LAUGHINGDRAGON");
		if (extrameetProfileStatus("EXTRAMEET_THEBIGGESTHORSE") == num) pospro.push("EXTRAMEET_THEBIGGESTHORSE");
		if (extrameetProfileStatus("EXTRAMEET_CUMSNUGGLE") == num) pospro.push("EXTRAMEET_CUMSNUGGLE");
	}
	else
	{
		//no content for location
		trace("extrameetGetProfiles, no logic for " + loc);
	}
	return pospro;
}

//will display the current profile
//Add logic here for new profile: step 2
//create an IF statement using the profile flag text and call the function that will show the profile info you want
public function extrameetDisplayProfile(prof:String):void
{
	var loc:String = getPlanetName().toLowerCase();  //current planet
	
	if (loc == "tavros station")
	{
		if (prof == "EXTRAMEET_SAVINGGRACE04") extrameetSavingGrace04Profile();
		else if (prof == "EXTRAMEET_MRFOX") extrameetMrFoxProfile();
		else if (prof == "EXTRAMEET_LADYGLAMOR") extrameetLadyGlamorProfile();
		else if (prof == "EXTRAMEET_REDD") extrameetReddProfile();
		else if (prof == "EXTRAMEET_HAWTSTUFF") extrameetHawtstuffProfile();
		else if (prof == "EXTRAMEET_THROBBIN34") extrameetThrobbin34Profile();
		else if (prof == "EXTRAMEET_MYNAMEISJON") extrameetMynameisjonProfile();
		else if (prof == "EXTRAMEET_CATBOOBS") extrameetCatBoobsProfile();
		else if (prof == "EXTRAMEET_DARKANGEL01") extrameetDarkAngel01Profile();
		else if (prof == "EXTRAMEET_BRAZENBITCH") extrameetBrazenBitchProfile();
		else if (prof == "EXTRAMEET_CASUALD") extrameetCasualDProfile();
		else if (prof == "EXTRAMEET_LETHALLADY") extrameetLethalLadyProfile();
		else if (prof == "EXTRAMEET_ROCKHARDFORYOU") extrameetRockhardforyouProfile();
		else if (prof == "EXTRAMEET_MOONLESSNIGHTS") extrameetMoonlessNightsProfile();
		else if (prof == "EXTRAMEET_ALPHAWOLF") extrameetAlphaWolfProfile();
		else output("Profile not found!");
	}
	else if (loc == "mhen'ga")
	{
		if (prof == "EXTRAMEET_HUGGATREE") extrameetHuggATreeProfile();
		else if (prof == "EXTRAMEET_HONEYPOTT") extrameetHoneypottProfile();
		else if (prof == "EXTRAMEET_BOUNTIFULBOTANY") extrameetBountifulBotanyProfile();
		else if (prof == "EXTRAMEET_SNEAKYSNEK") extrameetSneakySnekProfile();
		else if (prof == "EXTRAMEET_ENCHANTINGFAE") extrameetEnchantingFaeProfile();
		else if (prof == "EXTRAMEET_BIGDAWG") extrameetBigDawgProfile();
		else if (prof == "EXTRAMEET_NYMPHO69") extrameetNympho69Profile();
		else if (prof == "EXTRAMEET_SHOWYOURS2ME") extrameetShowYours2MeProfile();
		else if (prof == "EXTRAMEET_AWKWARDSOUL") extrameetAwkwardSoulProfile();
		else if (prof == "EXTRAMEET_GLITTERCUNT") extrameetGlitterCuntProfile();
		else if (prof == "EXTRAMEET_HOGWASH") extrameetHogwashProfile();
		else if (prof == "EXTRAMEET_DIRTYGUR114") extrameetDirtyGurl14Profile();
		else if (prof == "EXTRAMEET_LOOKING4A3RD") extrameetLooking4a3rdProfile();
		else if (prof == "EXTRAMEET_DIGBICK") extrameetDigBickProfile();
		else if (prof == "EXTRAMEET_BIRDY") extrameetBirdyProfile();
		else output("Profile not found!");
		
	}
	else if (loc == "tarkus")
	{
		if (prof == "EXTRAMEET_WANTSUMJUNK") extrameetWantSumJunkProfile();
		else if (prof == "EXTRAMEET_XXTHRASHERCATXX") extrameetXxThrasherCatxXProfile();
		else if (prof == "EXTRAMEET_SWEETNLOW") extrameetSweetNLowProfile();
		else if (prof == "EXTRAMEET_MIDNIGHTXROSE") extrameetMidnightXRoseProfile();
		else if (prof == "EXTRAMEET_TRUEPOWER69") extrameetTruePower69Profile();
		else if (prof == "EXTRAMEET_R4X0121") extrameetR4X0121Profile();
		else if (prof == "EXTRAMEET_BEBOPBOSS") extrameetBeBopBossProfile();
		else if (prof == "EXTRAMEET_SEXPLOSIVE") extrameetSexplosiveProfile();
		else if (prof == "EXTRAMEET_BIGGYZ") extrameetBiggyzProfile();
		else if (prof == "EXTRAMEET_POWERLOVERS2") extrameetPowerLovers2Profile();
		else if (prof == "EXTRAMEET_DIRTYHABITZ") extrameetDirtyHabitzProfile();
		else if (prof == "EXTRAMEET_AVRICE56") extrameetAvarice56Profile();
		else if (prof == "EXTRAMEET_TWISTED") extrameetTwistedProfile();
		else if (prof == "EXTRAMEET_SLAVEBOI") extrameetSlaveBoiProfile();
		else if (prof == "EXTRAMEET_HAWTSHOT") extrameetHawtShotProfile();
		else output("Profile not found!");
		
	}
	else if (loc == "myrellion")
	{
		if (prof == "EXTRAMEET_DOGGE") extrameetDoggeProfile();
		else if (prof == "EXTRAMEET_DAREGULATOR") extrameetDaRegulatorProfile();
		else if (prof == "EXTRAMEET_HUNTRESS") extrameetHuntressProfile();
		else if (prof == "EXTRAMEET_MISTRESSVENOM") extrameetMistressVenomProfile();
		else if (prof == "EXTRAMEET_REBEL23") extrameetRebel23Profile();
		else if (prof == "EXTRAMEET_SWEETHEART") extrameetSweetheartProfile();
		else if (prof == "EXTRAMEET_RDY4PLY") extrameetRdy4plyProfile();
		else if (prof == "EXTRAMEET_AL") extrameetAlProfile();
		else if (prof == "EXTRAMEET_DEVIANTSHEEPDOG") extrameetDeviantSheepdogProfile();
		else if (prof == "EXTRAMEET_NAUGHTY232") extrameetNaughty232Profile();
		else if (prof == "EXTRAMEET_SIRENSONG") extrameetSirenSongProfile();
		else if (prof == "EXTRAMEET_KINKDADDY") extrameetKinkDaddyProfile();
		else if (prof == "EXTRAMEET_ALLYOURS12") extrameetAllYours12Profile();
		else if (prof == "EXTRAMEET_PURPLEBOWTIE") extrameetPurpleBowtieProfile();
		else if (prof == "EXTRAMEET_LEMMESMASH") extrameetLemmeSmashProfile();
		else output("Profile not found!");
		
	}
	else if (loc == "uveto station")
	{
		if (prof == "EXTRAMEET_THEPROFESSOR") extrameetTheProfessorProfile();
		else if (prof == "EXTRAMEET_FUKA") extrameetFukaProfile();
		else if (prof == "EXTRAMEET_SCIENCERULEZ41") extrameetScienceRulez41Profile();
		else if (prof == "EXTRAMEET_RIPPED4YOURPLEASURE") extrameetRipped4YourPleasureProfile();
		else if (prof == "EXTRAMEET_STORMDRAGON") extrameetStormDragonProfile();
		else if (prof == "EXTRAMEET_LOVEBELOW0") extrameetLoveBelow0Profile();
		else if (prof == "EXTRAMEET_ASSBLASTER") extrameetAssblasterProfile();
		else if (prof == "EXTRAMEET_GRANITE75") extrameetGranite75Profile();
		else if (prof == "EXTRAMEET_SUPAXSTAR") extrameetSupaXstarProfile();
		else if (prof == "EXTRAMEET_HALL9001") extrameetHall9001Profile();
		else if (prof == "EXTRAMEET_HELLOIMPAUL") extrameetHelloImPaulProfile();
		else if (prof == "EXTRAMEET_LONELY1") extrameetLonely1Profile();
		else if (prof == "EXTRAMEET_HANSI") extrameetHansiProfile();
		else if (prof == "EXTRAMEET_DOMME90") extrameetDomme90Profile();
		else if (prof == "EXTRAMEET_BIGDICKRICK") extrameetBigDickRickProfile();
		else output("Profile not found!");
		
	}
	else if (loc == "new texas")
	{
		if (prof == "EXTRAMEET_FRANKMOLLY") extrameetFrankMollyProfile();
		else if (prof == "EXTRAMEET_PONYLUVER") extrameetPonyLuverProfile();
		else if (prof == "EXTRAMEET_MISSYMAY") extrameetMissyMayProfile();
		else if (prof == "EXTRAMEET_VKO") extrameetVKOProfile();
		else if (prof == "EXTRAMEET_SEXYYDADDYY") extrameetSexyyDaddyyProfile();
		else if (prof == "EXTRAMEET_FUNNYBOI1") extrameetFunnyboi1Profile();
		else if (prof == "EXTRAMEET_MYLITTLEFUNBOX") extrameetMylittlefunboxProfile();
		else if (prof == "EXTRAMEET_YOURMOMMY") extrameetYourMommyProfile();
		else if (prof == "EXTRAMEET_BRATTYKITTEN") extrameetBrattyKittenProfile();
		else if (prof == "EXTRAMEET_EVERYTHINGDIES") extrameetEverythingdiesProfile();
		else if (prof == "EXTRAMEET_THICKLOADZ") extrameetThickLoadzProfile();
		else if (prof == "EXTRAMEET_STROKE4ME") extrameetStroke4MeProfile();
		else if (prof == "EXTRAMEET_LAUGHINGDRAGON") extrameetLaughingDragonProfile();
		else if (prof == "EXTRAMEET_THEBIGGESTHORSE") extrameetTheBiggestHorseProfile();
		else if (prof == "EXTRAMEET_CUMSNUGGLE") extrameetCumsnuggleProfile();
		else output("Profile not found!");
		
	}
	else
	{
		//no content for location
		trace("extrameetDisplayProfile, no logic for " + loc);
	}
}

//check if the pc meets the current profiles match criteria
//Add logic here for new profile: step 3
//create an IF statement using the profile flag text and call the function that will check thes profile match requirement
public function extrameetCheckMatch(prof:String):Boolean
{
	var loc:String = getPlanetName().toLowerCase();  //current planet
	var match:Boolean = false;
	
	if (loc == "tavros station")
	{
		if (prof == "EXTRAMEET_SAVINGGRACE04") match = extrameetSavingGrace04CheckMatch();
		else if (prof == "EXTRAMEET_MRFOX") match = extrameetMrFoxCheckMatch();
		else if (prof == "EXTRAMEET_LADYGLAMOR") match = extrameetLadyGlamorCheckMatch();
		else if (prof == "EXTRAMEET_REDD") match = extrameetReddCheckMatch();
		else if (prof == "EXTRAMEET_HAWTSTUFF") match = extrameetHawtstuffCheckMatch();
		else if (prof == "EXTRAMEET_THROBBIN34") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_MYNAMEISJON") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_CATBOOBS") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_DARKANGEL01") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_BRAZENBITCH") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_CASUALD") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_LETHALLADY") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_ROCKHARDFORYOU") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_MOONLESSNIGHTS") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_ALPHAWOLF") match = extrameetFlavorCheckMatch();
	}
	else if (loc == "mhen'ga")
	{
		if (prof == "EXTRAMEET_HUGGATREE") match = extrameetHuggATreeCheckMatch();
		else if (prof == "EXTRAMEET_HONEYPOTT") match = extrameetHoneypottCheckMatch();
		else if (prof == "EXTRAMEET_BOUNTIFULBOTANY") match = extrameetBountifulBotanyCheckMatch();
		else if (prof == "EXTRAMEET_SNEAKYSNEK") match = extrameetSneakySnekCheckMatch();
		else if (prof == "EXTRAMEET_ENCHANTINGFAE") match = extrameetEnchantingFaeCheckMatch();
		else if (prof == "EXTRAMEET_BIGDAWG") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_NYMPHO69") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_SHOWYOURS2ME") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_AWKWARDSOUL") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_GLITTERCUNT") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_HOGWASH") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_DIRTYGUR114") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_LOOKING4A3RD") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_DIGBICK") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_BIRDY") match = extrameetFlavorCheckMatch();
		
	}
	else if (loc == "tarkus")
	{
		if (prof == "EXTRAMEET_WANTSUMJUNK") match = extrameetWantSumJunkCheckMatch();
		else if (prof == "EXTRAMEET_XXTHRASHERCATXX") match = extrameetXxThrasherCatxXCheckMatch();
		else if (prof == "EXTRAMEET_SWEETNLOW") match = extrameetSweetNLowCheckMatch();
		else if (prof == "EXTRAMEET_MIDNIGHTXROSE") match = extrameetMidnightXRoseCheckMatch();
		else if (prof == "EXTRAMEET_TRUEPOWER69") match = extrameetTruePower69CheckMatch();
		else if (prof == "EXTRAMEET_R4X0121") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_BEBOPBOSS") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_SEXPLOSIVE") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_BIGGYZ") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_POWERLOVERS2") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_DIRTYHABITZ") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_AVRICE56") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_TWISTED") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_SLAVEBOI") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_HAWTSHOT") match = extrameetFlavorCheckMatch();
	}
	else if (loc == "myrellion")
	{
		if (prof == "EXTRAMEET_DOGGE") match = extrameetDoggeCheckMatch();
		else if (prof == "EXTRAMEET_DAREGULATOR") match = extrameetDaRegulatorCheckMatch();
		else if (prof == "EXTRAMEET_HUNTRESS") match = extrameetHuntressCheckMatch();
		else if (prof == "EXTRAMEET_MISTRESSVENOM") match = extrameetMistressVenomCheckMatch();
		else if (prof == "EXTRAMEET_REBEL23") match = extrameetRebel23CheckMatch();
		else if (prof == "EXTRAMEET_SWEETHEART") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_RDY4PLY") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_AL") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_DEVIANTSHEEPDOG") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_NAUGHTY232") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_SIRENSONG") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_KINKDADDY") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_ALLYOURS12") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_PURPLEBOWTIE") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_LEMMESMASH") match = extrameetFlavorCheckMatch();
		
	}
	else if (loc == "uveto station")
	{
		if (prof == "EXTRAMEET_THEPROFESSOR") match = extrameetTheProfessorCheckMatch();
		else if (prof == "EXTRAMEET_FUKA") match = extrameetFukaCheckMatch();
		else if (prof == "EXTRAMEET_SCIENCERULEZ41") match = extrameetScienceRulez41CheckMatch();
		else if (prof == "EXTRAMEET_RIPPED4YOURPLEASURE") match = extrameetRipped4YourPleasureCheckMatch();
		else if (prof == "EXTRAMEET_STORMDRAGON") match = extrameetStormDragonCheckMatch();
		else if (prof == "EXTRAMEET_LOVEBELOW0") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_ASSBLASTER") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_GRANITE75") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_SUPAXSTAR") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_HALL9001") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_HELLOIMPAUL") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_LONELY1") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_HANSI") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_DOMME90") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_BIGDICKRICK") match = extrameetFlavorCheckMatch();
		
	}
	else if (loc == "new texas")
	{
		if (prof == "EXTRAMEET_FRANKMOLLY") match = extrameetFrankMollyCheckMatch();
		else if (prof == "EXTRAMEET_PONYLUVER") match = extrameetPonyLuverCheckMatch();
		else if (prof == "EXTRAMEET_MISSYMAY") match = extrameetMissyMayCheckMatch();
		else if (prof == "EXTRAMEET_VKO") match = extrameetVKOCheckMatch();
		else if (prof == "EXTRAMEET_SEXYYDADDYY") match = extrameetSexyyDaddyyCheckMatch();
		else if (prof == "EXTRAMEET_FUNNYBOI1") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_MYLITTLEFUNBOX") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_YOURMOMMY") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_BRATTYKITTEN") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_EVERYTHINGDIES") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_THICKLOADZ") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_STROKE4ME") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_LAUGHINGDRAGON") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_THEBIGGESTHORSE") match = extrameetFlavorCheckMatch();
		else if (prof == "EXTRAMEET_CUMSNUGGLE") match = extrameetFlavorCheckMatch();
		
	}
	else
	{
		//no content for location
		trace("extrameetCheckMatch, no logic for " + loc);
	}
	return match;
}

//go on a date
//Add logic here for new profile: step 4
//create an IF statement using the profile flag text and call the function that will start the date
//(skip this step if the profile is just flavor and will never match)
public function extrameetSetMeet(prof:String):void
{
	clearOutput();
	clearMenu();
	//set showName and author inside date scene
	//showName("\nEXTRAMEET");
	//author("Fr0sty");
	output("You log off and pull yourself to you feet. You’ve got a hot date now, so you get yourself ready and head out to the bar to meet your match.");
	processTime(20 + rand(15));
	flags[prof] = 1;
	var loc:String = getPlanetName().toLowerCase();  //current planet
	
	IncrementFlag("EXTRAMEET_DATE");
	
	if (loc == "tavros station")
	{
		if (prof == "EXTRAMEET_SAVINGGRACE04") extrameetSavingGrace04Date();
		else if (prof == "EXTRAMEET_MRFOX") extrameetMrFoxDate();
		else if (prof == "EXTRAMEET_LADYGLAMOR") extrameetLadyGlamorDate();
		else if (prof == "EXTRAMEET_REDD") extrameetReddDate();
		else if (prof == "EXTRAMEET_HAWTSTUFF") extrameetHawtstuffDate();
		else
		{
			output("\n\nError finding date");
			addButton(14,"Bail",extrameetBailScene);
		}
	}
	else if (loc == "mhen'ga")
	{
		if (prof == "EXTRAMEET_HUGGATREE") extrameetHuggATreeDate();
		else if (prof == "EXTRAMEET_HONEYPOTT") extrameetHoneypottDate();
		else if (prof == "EXTRAMEET_BOUNTIFULBOTANY") extrameetBountifulBotanyDate();
		else if (prof == "EXTRAMEET_SNEAKYSNEK") extrameetSneakySnekDate();
		else if (prof == "EXTRAMEET_ENCHANTINGFAE") extrameetEnchantingFaeDate();
		else
		{
			output("\n\nError finding date");
			addButton(14,"Bail",extrameetBailScene);
		}
	}
	else if (loc == "tarkus")
	{
		if (prof == "EXTRAMEET_WANTSUMJUNK") extrameetWantSumJunkDate();
		else if (prof == "EXTRAMEET_XXTHRASHERCATXX") extrameetXxThrasherCatxXDate();
		else if (prof == "EXTRAMEET_SWEETNLOW") extrameetSweetNLowDate();
		else if (prof == "EXTRAMEET_MIDNIGHTXROSE") extrameetMidnightXRoseDate();
		else if (prof == "EXTRAMEET_TRUEPOWER69") extrameetTruePower69Date();
		else
		{
			output("\n\nError finding date");
			addButton(14,"Bail",extrameetBailScene);
		}
		
	}
	else if (loc == "myrellion")
	{
		if (prof == "EXTRAMEET_DOGGE") extrameetDoggeDate();
		else if (prof == "EXTRAMEET_DAREGULATOR") extrameetDaRegulatorDate();
		else if (prof == "EXTRAMEET_HUNTRESS") extrameetHuntressDate();
		else if (prof == "EXTRAMEET_MISTRESSVENOM") extrameetMistressVenomDate();
		else if (prof == "EXTRAMEET_REBEL23") extrameetRebel23Date();
		else
		{
			output("\n\nError finding date");
			addButton(14,"Bail",extrameetBailScene);
		}
		
	}
	else if (loc == "uveto station")
	{
		if (prof == "EXTRAMEET_THEPROFESSOR") extrameetTheProfessorDate();
		else if (prof == "EXTRAMEET_FUKA") extrameetFukaDate();
		else if (prof == "EXTRAMEET_SCIENCERULEZ41") extrameetScienceRulez41Date();
		else if (prof == "EXTRAMEET_RIPPED4YOURPLEASURE") extrameetRipped4YourPleasureDate();
		else if (prof == "EXTRAMEET_STORMDRAGON") extrameetStormDragonDate();
		else
		{
			output("\n\nError finding date");
			addButton(14,"Bail",extrameetBailScene);
		}
	}
	else if (loc == "new texas")
	{
		//disarm pc if not already
		if(!pc.hasStatusEffect("Disarmed")) 
		{
			flags["REFUSED_TEXAN_DISARM"] = undefined;
			pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","You’ve checked all forms of weaponry at New Texas’ customs.",false,0,0xFF0000);
			flags["CHECKED_GEAR_AT_OGGY"] = (pc.hasEquippedWeapon() ? 1 : 0);
		}
		if (prof == "EXTRAMEET_FRANKMOLLY") extrameetFrankMollyDate();
		else if (prof == "EXTRAMEET_PONYLUVER") extrameetPonyLuverDate();
		else if (prof == "EXTRAMEET_MISSYMAY") extrameetMissyMayDate();
		else if (prof == "EXTRAMEET_VKO") extrameetVKODate();
		else if (prof == "EXTRAMEET_SEXYYDADDYY") extrameetSexyyDaddyyDate();
		else
		{
			output("\n\nError finding date");
			addButton(14,"Bail",extrameetBailScene);
		}
	}
	else
	{
		//no content for location
		trace("extrameetSetMeet, no logic for " + loc);
	}
}

//get the current profiles username
//Add logic here for new profile: step 5
//create an IF statement using the profile flag text and return the profiles username
//(skip this step if the profile is just flavor and will never match)
public function extrameetGetUserName(prof:String):String
{
	var loc:String = getPlanetName().toLowerCase();  //current planet
	
	if (loc == "tavros station")
	{
		if (prof == "EXTRAMEET_SAVINGGRACE04") return "Saving_Grace04";
		if (prof == "EXTRAMEET_MRFOX") return "_Mr.Fox_";
		if (prof == "EXTRAMEET_LADYGLAMOR") return "LadyGlamor";
		if (prof == "EXTRAMEET_REDD") return "ReDD";
		if (prof == "EXTRAMEET_HAWTSTUFF") return "Hawtstuff";
	}
	else if (loc == "mhen'ga")
	{
		if (prof == "EXTRAMEET_HUGGATREE") return "HuggATree";
		if (prof == "EXTRAMEET_HONEYPOTT") return "The_Honeypott";
		if (prof == "EXTRAMEET_BOUNTIFULBOTANY") return "Bountiful_Botany";
		if (prof == "EXTRAMEET_SNEAKYSNEK") return "SneakySnek";
		if (prof == "EXTRAMEET_ENCHANTINGFAE") return "EnchantingFae";
		
	}
	else if (loc == "tarkus")
	{
		if (prof == "EXTRAMEET_WANTSUMJUNK") return "WantSumJunk?";
		if (prof == "EXTRAMEET_XXTHRASHERCATXX") return "XxThrasherCatxX";
		if (prof == "EXTRAMEET_SWEETNLOW") return "Sweet_N’_Low";
		if (prof == "EXTRAMEET_MIDNIGHTXROSE") return "MidnightXRose";
		if (prof == "EXTRAMEET_TRUEPOWER69") return "True_Power69";
		
	}
	else if (loc == "myrellion")
	{
		if (prof == "EXTRAMEET_DOGGE") return "_Dogge_";
		if (prof == "EXTRAMEET_DAREGULATOR") return "DaRegulator";
		if (prof == "EXTRAMEET_HUNTRESS") return "#1Huntress";
		if (prof == "EXTRAMEET_MISTRESSVENOM") return "Mistress_Venom";
		if (prof == "EXTRAMEET_REBEL23") return "Rebel23";
		
	}
	else if (loc == "uveto station")
	{
		if (prof == "EXTRAMEET_THEPROFESSOR") return "TheProfessor";
		if (prof == "EXTRAMEET_FUKA") return "Fuka";
		if (prof == "EXTRAMEET_SCIENCERULEZ41") return "ScienceRulez41";
		if (prof == "EXTRAMEET_RIPPED4YOURPLEASURE") return "Ripped4YourPleasure";
		if (prof == "EXTRAMEET_STORMDRAGON") return "Storm_Dragon";
		
	}
	else if (loc == "new texas")
	{
		if (prof == "EXTRAMEET_FRANKMOLLY") return "Frank&Molly";
		if (prof == "EXTRAMEET_PONYLUVER") return "Pony_Luver";
		if (prof == "EXTRAMEET_MISSYMAY") return "0MissyMay0";
		if (prof == "EXTRAMEET_VKO") return "V-KO#1221341";
		if (prof == "EXTRAMEET_SEXYYDADDYY") return "SexyyDaddyy";
		
	}
	else
	{
		//no content for location
		trace("extrameetGetUserName, no logic for " + loc);
	}	
	return "unknown";
}

//this is called in extrameetStartPage to see if 30 days have passed to reset all profile statuses
//Add logic here for new profile: step 6
//add a line to set the flag to 0 under the appropriate planet
public function extrameetCheckReset():void
{
	var loc:String = getPlanetName().toLowerCase();  //current planet
	var resetminutes:int = 43200;  //30 days in minutes
	
	if (loc == "tavros station")
	{
		if (flags["EXTRAMEET_TAVROS"] == undefined) flags["EXTRAMEET_TAVROS"] = GetGameTimestamp();
		
		if (GetGameTimestamp() - flags["EXTRAMEET_TAVROS"] >= resetminutes)
		{
			flags["EXTRAMEET_TAVROS"] = GetGameTimestamp();
			flags["EXTRAMEET_SAVINGGRACE04"] = 0;
			flags["EXTRAMEET_MRFOX"] = 0;
			flags["EXTRAMEET_LADYGLAMOR"] = 0;
			flags["EXTRAMEET_REDD"] = 0;
			flags["EXTRAMEET_HAWTSTUFF"] = 0;
			flags["EXTRAMEET_THROBBIN34"] = 0;
			flags["EXTRAMEET_MYNAMEISJON"] = 0;
			flags["EXTRAMEET_CATBOOBS"] = 0;
			flags["EXTRAMEET_DARKANGEL01"] = 0;
			flags["EXTRAMEET_BRAZENBITCH"] = 0;
			flags["EXTRAMEET_CASUALD"] = 0;
			flags["EXTRAMEET_LETHALLADY"] = 0;
			flags["EXTRAMEET_ROCKHARDFORYOU"] = 0;
			flags["EXTRAMEET_MOONLESSNIGHTS"] = 0;
			flags["EXTRAMEET_ALPHAWOLF"] = 0;
		}
	}
	else if (loc == "mhen'ga")
	{			 
		if (flags["EXTRAMEET_MHENGA"] == undefined) flags["EXTRAMEET_MHENGA"] = GetGameTimestamp();
		
		if (GetGameTimestamp() - flags["EXTRAMEET_MHENGA"] >= resetminutes)
		{
			flags["EXTRAMEET_MHENGA"] = GetGameTimestamp();
			flags["EXTRAMEET_HUGGATREE"] = 0;
			flags["EXTRAMEET_HONEYPOTT"] = 0;
			flags["EXTRAMEET_BOUNTIFULBOTANY"] = 0;
			flags["EXTRAMEET_SNEAKYSNEK"] = 0;
			flags["EXTRAMEET_ENCHANTINGFAE"] = 0;
			flags["EXTRAMEET_BIGDAWG"] = 0;
			flags["EXTRAMEET_NYMPHO69"] = 0;
			flags["EXTRAMEET_SHOWYOURS2ME"] = 0;
			flags["EXTRAMEET_AWKWARDSOUL"] = 0;
			flags["EXTRAMEET_GLITTERCUNT"] = 0;
			flags["EXTRAMEET_HOGWASH"] = 0;
			flags["EXTRAMEET_DIRTYGUR114"] = 0;
			flags["EXTRAMEET_LOOKING4A3RD"] = 0;
			flags["EXTRAMEET_DIGBICK"] = 0;
			flags["EXTRAMEET_BIRDY"] = 0;
		}
	}
	else if (loc == "tarkus")
	{
		if (flags["EXTRAMEET_TARKUS"] == undefined) flags["EXTRAMEET_TARKUS"] = GetGameTimestamp();
		
		if (GetGameTimestamp() - flags["EXTRAMEET_TARKUS"] >= resetminutes)
		{
			flags["EXTRAMEET_TARKUS"] = GetGameTimestamp();
			flags["EXTRAMEET_WANTSUMJUNK"] = 0;
			flags["EXTRAMEET_XXTHRASHERCATXX"] = 0;
			flags["EXTRAMEET_SWEETNLOW"] = 0;
			flags["EXTRAMEET_MIDNIGHTXROSE"] = 0;
			flags["EXTRAMEET_TRUEPOWER69"] = 0;
			flags["EXTRAMEET_R4X0121"] = 0;
			flags["EXTRAMEET_BEBOPBOSS"] = 0;
			flags["EXTRAMEET_SEXPLOSIVE"] = 0;
			flags["EXTRAMEET_BIGGYZ"] = 0;
			flags["EXTRAMEET_POWERLOVERS2"] = 0;
			flags["EXTRAMEET_DIRTYHABITZ"] = 0;
			flags["EXTRAMEET_AVRICE56"] = 0;
			flags["EXTRAMEET_TWISTED"] = 0;
			flags["EXTRAMEET_SLAVEBOI"] = 0;
			flags["EXTRAMEET_HAWTSHOT"] = 0;
		}
	}
	else if (loc == "myrellion")
	{
		if (flags["EXTRAMEET_MYRELLION"] == undefined) flags["EXTRAMEET_MYRELLION"] = GetGameTimestamp();
		
		if (GetGameTimestamp() - flags["EXTRAMEET_MYRELLION"] >= resetminutes)
		{				
			flags["EXTRAMEET_MYRELLION"] = GetGameTimestamp();
			flags["EXTRAMEET_DOGGE"] = 0;
			flags["EXTRAMEET_DAREGULATOR"] = 0;
			flags["EXTRAMEET_HUNTRESS"] = 0;
			flags["EXTRAMEET_MISTRESSVENOM"] = 0;
			flags["EXTRAMEET_REBEL23"] = 0;
			flags["EXTRAMEET_SWEETHEART"] = 0;
			flags["EXTRAMEET_RDY4PLY"] = 0;
			flags["EXTRAMEET_AL"] = 0;
			flags["EXTRAMEET_DEVIANTSHEEPDOG"] = 0;
			flags["EXTRAMEET_NAUGHTY232"] = 0;
			flags["EXTRAMEET_SIRENSONG"] = 0;
			flags["EXTRAMEET_KINKDADDY"] = 0;
			flags["EXTRAMEET_ALLYOURS12"] = 0;
			flags["EXTRAMEET_PURPLEBOWTIE"] = 0;
			flags["EXTRAMEET_LEMMESMASH"] = 0;
		}
	}
	else if (loc == "uveto station")
	{
		if (flags["EXTRAMEET_UVETO"] == undefined) flags["EXTRAMEET_UVETO"] = GetGameTimestamp();
		
		if (GetGameTimestamp() - flags["EXTRAMEET_UVETO"] >= resetminutes)
		{
			flags["EXTRAMEET_UVETO"] = GetGameTimestamp();
			flags["EXTRAMEET_THEPROFESSOR"] = 0;
			flags["EXTRAMEET_FUKA"] = 0;
			flags["EXTRAMEET_SCIENCERULEZ41"] = 0;
			flags["EXTRAMEET_RIPPED4YOURPLEASURE"] = 0;
			flags["EXTRAMEET_STORMDRAGON"] = 0;
			flags["EXTRAMEET_LOVEBELOW0"] = 0;
			flags["EXTRAMEET_ASSBLASTER"] = 0;
			flags["EXTRAMEET_GRANITE75"] = 0;
			flags["EXTRAMEET_SUPAXSTAR"] = 0;
			flags["EXTRAMEET_HALL9001"] = 0;
			flags["EXTRAMEET_HELLOIMPAUL"] = 0;
			flags["EXTRAMEET_LONELY1"] = 0;
			flags["EXTRAMEET_HANSI"] = 0;
			flags["EXTRAMEET_DOMME90"] = 0;
			flags["EXTRAMEET_BIGDICKRICK"] = 0;
			
		}
	}
	else if (loc == "new texas")
	{
		if (flags["EXTRAMEET_NEWTEXAS"] == undefined) flags["EXTRAMEET_NEWTEXAS"] = GetGameTimestamp();
		
		if (GetGameTimestamp() - flags["EXTRAMEET_NEWTEXAS"] >= resetminutes)
		{				
			flags["EXTRAMEET_NEWTEXAS"] = GetGameTimestamp();
			flags["EXTRAMEET_FRANKMOLLY"] = 0;
			flags["EXTRAMEET_PONYLUVER"] = 0;
			flags["EXTRAMEET_MISSYMAY"] = 0;
			flags["EXTRAMEET_VKO"] = 0;
			flags["EXTRAMEET_SEXYYDADDYY"] = 0;
			flags["EXTRAMEET_FUNNYBOI1"] = 0;
			flags["EXTRAMEET_MYLITTLEFUNBOX"] = 0;
			flags["EXTRAMEET_YOURMOMMY"] = 0;
			flags["EXTRAMEET_BRATTYKITTEN"] = 0;
			flags["EXTRAMEET_EVERYTHINGDIES"] = 0;
			flags["EXTRAMEET_THICKLOADZ"] = 0;
			flags["EXTRAMEET_STROKE4ME"] = 0;
			flags["EXTRAMEET_LAUGHINGDRAGON"] = 0;
			flags["EXTRAMEET_THEBIGGESTHORSE"] = 0;
			flags["EXTRAMEET_CUMSNUGGLE"] = 0;
		}
	}
	else
	{
		//no content for location
		trace("extrameetCheckReset, no logic for " + loc);
	}
}

//this will return the current status of a profile as well as recheck the match requirements
public function extrameetProfileStatus(prof:String):int
{
	//available
	if (flags[prof] == undefined || flags[prof] == 0)
	{
		return 0;
	}
	//rejected or unavailable
	if (flags[prof] == 1)
	{
		return 1;
	}
	//match
	if (flags[prof] == 2)
	{
		//recheck match status in case conditions have changed
		if (extrameetCheckMatch(prof))
		{
			return 2;
		}
		else
		{
			flags[prof] = 1;
			return 1;
		}
	}
	//error
	trace("extrameetProfileStatus return -1");
	return -1;
}

//call this in the date scene to bail and return to the ship
public function extrameetBailScene():void
{
	clearOutput();
	clearMenu();
	showName("\nEXTRAMEET");
	author("Fr0sty");
	output("You tell your date you just need to step away for a moment to get some fresh air. You get up and slowly walk away from the table. Once you are out of line of sight you start walking faster, exiting the bar and returning to your ship as quickly as possible.");
	IncrementFlag("EXTRAMEET_BAIL");
	processTime(10);
	moveTo("SHIP INTERIOR");
	addButton(0,"Next",mainGameMenu);
}
//generic function for flavor profiles to return false to check for a match
public function extrameetFlavorCheckMatch():Boolean
{
	//flavor only, will never match
	return false;
}
