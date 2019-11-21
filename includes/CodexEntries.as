// This is the simplest method I can think of hooking up the codex functions into the tree structure for display
// It's janky as fuck, but it does work, at it means the actual codex "body" content can be done almost exactly
// like regular scenes are now.

public function configureCodex():void
{
	// Complex path tree entries DO work, but until we actually NEED to organise the data
	// (and I implement some kind of path folding), I don't think we should actually USE them more than say 1 deep (because the way addEntry works
	// requires at least a "root" path of some sort
	// At the very least, the "tree" view down the side of the UI supports scrolling, so its not a HUGE issue and it
	// can wait until we're at a point it needs to be fixed.
	
	// Other types of entries -- these are categorised under separate headings
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Arty", testPersonEntryA);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_EVENT, "Test Events", "Buttsunder", testEventEntryA);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Some/Complex/Path/To", "Tentatool", testLocationEntryA);
	
	// This is how I'm proposing we split things up for now -- stuff things into a root category of the relevant system they belong too -- "Organic" etc might be a better long-term solution, but there'll be a lot
	// of categories that likely won't be very full for a LONG time going down that route

	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Planets", "Panara", panaraCodex);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Anatae", anataeCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Ausar", ausarCodexEntry, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Cundarians", cundarianCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Daynar", daynarCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Dzaan", dzaanCodex,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Fanfir", fanfirCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Galotians", galotianCodexEntry, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Gryvain", gryvainCodexEntry, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Humans", humanTerranCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Kaithrit", kaithritCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Kalabast/Fhan’i", kalabastFhaniCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Kui-Tan", kuitanCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Laquines", laquineCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Leithans", leithanCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Matisar", matisarCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Mothrine", mothrineCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Ovir", ovirCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Rahn", rahnCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Rodenians", rodenianCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Roehm", roehmCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Saeri", saeriCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Saurmorians",saurmorianCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Siel", sielCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Simii", simiiCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Slyverens",slyverenCodex);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Sionach", sionachCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Spinarrans", spinarranCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Suulas", suulaCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Tarratch", tarratchCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Thraggen", thraggenCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Toves", toveCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Varmints", varmintCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Vildarii", vildariiCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Vulkrimi", vulkrimiCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Core Worlds", "Xhelarfog", xhelarfogCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Cunt Snakes", cuntSnakeCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Kerokoras",kerokorasCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Mimbranes", mimbraneCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Naleen", naleenCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Vanae", vanaeCodexEntry);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Vanae: History", vanaeHistoryCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Venus Pitchers", venusPitcherCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MHENGA, "Mhen'ga", "Zil", zilCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_TARKUS, "Tarkus", "Sand Worms", buttBugsCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_TARKUS, "Tarkus", "Gabilani", gabilaniCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_TARKUS, "Tarkus", "Gray Goos", grayGooCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_TARKUS, "Tarkus", "Lapinara", lapinaraCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_TARKUS, "Tarkus", "Raskvel", raskVelCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_TARKUS, "Tarkus", "Sydians", sydianCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Bothrioc", bothriocCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Cockvines", cockvinesCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Ganrael", crystalGooCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Gold Myr", goldMyrmedionCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Myr Fungus", myrFungusCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Nyrea", nyreaCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_MYRELLION, "Myrellion", "Red Myr", redMyrmedionCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_UVETO, "Uveto", "Essyras", essyraCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_UVETO, "Uveto", "Frostwyrm", frostwyrmCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_UVETO, "Uveto", "Korgonne", korgonneCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_UVETO, "Uveto", "Lurelings", lurelingsCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_UVETO, "Uveto", "Milodan", milodanCodexEntry);
	
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_XAMDAM, "Xamdam", "Divrani", divraniCodexEntry);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE_XAMDAM, "Xamdam", "Hyraxxi", hyraxxiCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ROBOT, "Androids", "V-Ko", VKoCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ROBOT, "Androids", "V-Ko IVs", VKoIVsCodex);
	
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Public Figures", "Bran Flazingan", branFlazinganCodex);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Aegis", aegisShipyardsCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "BI/G", bellIsleGrunmannCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Camarilla", camarillaCodex);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Envyoidics", envyoidicsCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Humphard Inc.", humphardIncCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "J’ejune", jejuneCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "JoyCo", joyCoCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "KihaCorp", kihaCorpCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Nova Securities", novaSecuritiesCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Pyrite", pyriteCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Reaper", reaperCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "RhenWorld", rhenWorldCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "SagiTom", sagiTomCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Snugglé", snuggleCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Steele Tech", steeleTechCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Corporations", "Xenogen", xenogenCodex, true);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Factions", "Black Void", blackVoidCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Factions", "J.A.F.", jointAusarFederationCodex, true);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Factions", "Gilden Republic", gildenRepublicCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Factions", "Scarlet Federation", scarletFederationCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Factions", "T.S.C.", terranSpaceCoalitionCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Factions", "U.G.C.", unitedGalacticConfederacyCodex, true);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ORGANIZATION, "Religions", "Stormguard", stormguardCodex);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Illegal Items", "Dumbfuck", dumbfuckCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Illegal Items", "Gush", gushCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Illegal Items", "Soak", soakCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Illegal Items", "Tentatool", tentacoolCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Illegal Items", "Throbb", throbbCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Illegal Items", "The Treatment", treatmentCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "BionaHoles", bionaholeCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Bubble Buddy", bubbBuddyCodex);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Capraphorm", capraphormCodex);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Chill Pill", chillPillCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "ClearYu", clearYuCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "FizzyFix", fizzyfixCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Grav Cuffs", gravCuffsCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Holodom", holodomCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Muffstick", muffstickCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Rubber-Made", rubberMadeCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "Suma Cream", sumaCreamCodex);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Legal Items", "SynthSheath", synthSheathCodex);
	
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Ships", "9999", shipNameCodex);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Technology", "AI Systems", AISystemsCodexEntry, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Technology", "Item Mechanics", mechanicsCodex, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_ITEM, "Technology", "Maia Series AI", Bess13CodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_MEDICAL, "General Knowledge", "Taint", taintCodexEntry,true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_MEDICAL, "SSTDs", "Furpies", furpiesCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_MEDICAL, "SSTDs", "Locofever", locofeverCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_MEDICAL, "SSTDs", "Sneezing Tits", sneezingTitsCodexEntry);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "||||||||", eightClicksStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Assistant", assistantStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Becoming One...", becomingOneOfTheGirlsStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Breeding Sylvie", sylvieBreedingByGardeford);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Bull’s Strength", bullsStrength, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "BXBI: I", bxbiChapter1Story);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "BXBI: II", bxbiChapter2Story);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Captured...", capturedByTheDemons);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Cow Stuff", cowStuffStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Diverting Jokes", DivertingTarkusJokesAndJests);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Dildo Snakes", dildoSnakes, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Dragon’s Hoard", dragonsHordeCodexStory, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Fuck the System", fuckTheSystem);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Go Jackals!", goJackals);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Hellhound Gangbang", hellhoundGangbang);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Leather Club", leatherClub);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Monster Threesome!", monsterThreesome);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "My First Story", myFirstStoryStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "My Romantic Encounter", myRomanticEncounter);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Satyr Slave", satyrSlaveStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Stolen Goods", stolenGoodsStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Succubus in Love", succubusInLove);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Tentacles & Tanukis", tentacleTroubleForTurnedOnTanukis);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Tower of Trials",towerOfTrialsStory);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Wolf Breeding", wolfBreeding);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_STORY, "Fiction", "Worshipping The Anubis Queen", worshippingTheAnubisQueen);
}

public function codexHomeFunction():void
{
	// Written in style of technical documentation because why not.
	clearOutputCodex();
	clearBust();
	outputCodex("Welcome to the Steele Industries® Computerized Observational Directory of Environmental eXposure® (CODEX™), version 12b.");
	outputCodex("\n\nThe Steele Industries® CODEX™ system has been designed to provide emergency-level informative warnings of Class 4 environmental and Class M biological hazards to a designated user of the device and will notify the user should the CODEX™ device detect such a hazard within a defined unsafe radius.");
	outputCodex("\n\nSystem usability has been designed for rapid dissemination of information to the designated user when facing potentially life threatening situations. The following QuickStart™ documentation is always available from the CODEX™ root menu:");
	
	outputCodex("\n\nThe buttons displayed along the bottom edge of the CODEX™ display access the core information stores offered as part of the CODEX™ devices databases.");

	outputCodex("\n\nA more detailed menu for each of the core databases is displayed to the right of the main display. Each header acts as a button to filter available records according to type.");

	outputCodex("\n\nAll displayed elements are color coded for ease of use and to ensure that the CODEX™ devices designated user can locate the information they require in a timely fashion.");
	outputCodex("\n\t<span class='new'>\\\[New Entries\\\]</span> are yellow.");
	outputCodex("\n\t<span class='viewed'>\\\[Viewed Entries\\\]</span> are white.");
	outputCodex("\n\t<span class='locked'>\\\[Missing Entries\\\]</span> are red.");
	outputCodex("\n\t<span class='active'>\\\[Active Entries\\\]</span> are blue.");

	outputCodex("\n\nSteele Industries® would like to thank [pc.name] for additionally equipping this CODEX™ device with the following optional modules:");
	outputCodex("\n\tSteele Industries® Resource Acquisition System™ (RAS™)");
	outputCodex("\n\tSteele Industries® Automated Fringe Classifier™ (ScanNow™)");
	outputCodex("\n\tSteele Industries® Biosign Monitor Alerting™ (MedSign™)");
	outputCodex("\n\tSteele Industries® LIDAR Positioning System™ (L3P™)");
	if (flags["CODEX_UVETO_TRACKER"] != undefined) outputCodex("\n\tSteele Industries® Emergency Positional Relay Beacon™ (SOS X5™)");

	outputCodex("\n\nOptional module documentation has been provided and loaded into the CODEX™ documentation databases. For more information, please review the optional module documentation at your earliest convenience.");
	outputCodex("\n\nCODEX-12b ready for user input.");

	userInterface.outputCodex();
}


/* Core Worlds */

public function humanTerranCodex():void
{
	clearOutputCodex();
	var randBust:Array = ["BORING_MISTRESS","BURT","CARL","DELILAH","GEOFF","STEPH"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Humans"));
	outputCodex("<i>What does it mean to be human?</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Human");
	outputCodex("\n<b>Sexes:</b> Male and female.");
	outputCodex("\n<b>Height:</b> Fully matured humans commonly range from five feet to just over six, though rare exceptions exist on both sides of the spectrum.");
	outputCodex("\n<b>Weight:</b> Adult humans commonly weigh between 140 and 180 pounds, with males being 20 to 30 pounds heavier than females on average.");
	outputCodex("\n<b>Average Lifespan:</b> Most humans have a natural lifespan between 80 and 90 years without the assistance of modern medicine, though particularly healthy humans may live upwards of a century.");
	outputCodex("\n<b>Skin:</b> Humans are covered in a soft, supple skin which is largely furless save for at the hair on the top of their head. Vestigial fur remains on their forearms and lower legs which is used for temperature regulation, though some humans may have this hair removed. Color variation of the skin ranges from a fair, peach-like tone to a very dark brown. Lighter shades of human skin will often become temporarily darker when exposed to sunlight.");
	outputCodex("\n<b>Hair:</b> Color varies, with brown, blonde, and black as the three most common colors, though auburn and red hair also exist. Growth of pubic and facial hair are markers of age. As a human ages extensively, individual strands may grow white, causing the hair to become gray or entirely white. Balding is common for males of the species at certain ages.");
	outputCodex("\n<b>Eyes:</b> Human eyes are circular, with a colored iris surrounding a black pupil that may dilate under dark conditions or when focusing on an object of interest, though this dilation is not especially pronounced relative to many other species. Naturally, blue, green, brown and hazel are the most common eye colors.");
	outputCodex("\n<b>Ears:</b> Human ears are mounted on either side of their head, having a largely ovoid shape. The organ is used for detecting sound and aiding with maintaining balance while moving. Human ears are compact compared to many other races, though their quality of hearing is quite good. The audible range for human ears is between 20 to 20,000 Hz on average.");
	outputCodex("\n<b>Homeworld:</b> Terra");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("There isn’t much to say about human appearances that aren’t covered in the briefs above. Their overall biomass can be quite small or quite large, depending on diet and exercise. Their genitals are relatively unremarkable by galactic standards, sharing features with a great many other species, admittedly with their own terran twist. The defining characteristics of the male anatomy is a mushroom like glans and excess skin which protects the organ when not aroused. Males also have two testes, used to regulate sex hormones and produce reproductive material. They also bear vestigial breasts and nipples. Though these organs are undersized and unused, it is possible to stimulate lactation with sufficient effort, allowing for a modicum of natural growth.");
	outputCodex("\n\nFemales have larger breasts than males that are able to lactate far more readily than their male counterparts. They also lack a penis or testes, instead having a vaginal slit positioned between their legs. This slit is self-lubricating, like most galactic species’, allowing for vigorous sexual intercourse. Once fertilized, females typically spend nine months incubating a single young, though in rare cases two or three fetuses can be produced at once.");
	outputCodex("\n\nMedical records spanning two millenia indicate that human genitalia and breast size has steadily climbed with the availability of genetic modification, resulting in typical male endowments to be seven to eight inches long and females with more easily lubricated vaginas and larger breasts. Given humans below average libidos, it is considered something of an oddity that they place such emphasis on the function of their sexual characteristics.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Human reproduction normally takes a few minutes when done quickly, though many humans prefer to go for longer. While long-term sexual monogamy is common among humans, they’re also known for being quite libidinous, and some members of the species may be as sexually forward as any ausar or even more so.");
	outputCodex("\n\nHuman pregnancy generally lasts nine months and usually bears only one child at a time, though instances of multiple births are not uncommon, especially among the more fertile. Human infants can see at birth and mature to adulthood biologically at 10-12 years for females and 12-14 years for males, but recognized legally at 18 years of age. Though newborns consist of primarily females and males, there have been rare cases of natural hermaphrodites.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("While lacking significant natural biological defenses compared to other species, humans nonetheless bear a number of useful traits, with hands capable of balling into primitive clubs and a bite that carries all manner of infectious agents. Humans have also developed many styles of martial arts focused on landing hits with their fists or legs which are remarkably effective. With the rise of technology, they have also developed large arrays of deadly weapons and armors, even going so far as to devise weapons capable of driving their own race to an early extinction. Galactic opinion is still varied on whether or not surviving that stage of their development was a good thing.");
	outputCodex("\n\nThe sword is the most culturally iconic human weapon, and swords continue to be made today, from simple to elaborate metal blades, even to the more technologically-driven weaponry.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("Humans are capable of colonizing a wide variety of environments, though the vast majority of the land-based species are preferably drawn to temperate or tropical climates with at least some atmospheric moisture. Terra itself displays both of these climates along with colder regions at the far north and south of the planet’s axis.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Human society on the galactic scale is somewhat fragmented. The largest and most well-known human society is the Terran-Space Coalition, consisting of the human homeworld and various member planets. However, despite the T.S.C.’s efforts to appear hegemonic, there are many other confederations and independent human-dominated worlds which are not a part of it.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Humans have managed to maintain extensive records deep into their history such that it would be impossible to properly describe the entirety of their development in this short summary. Two traits have remained constants - exploration and conflict. Nearly every major advancement has come as a result of one of these two. Humans are a race that easily throws themselves to war, falling back on tribal instincts that lead them to obliterate or dominate others. Additionally, they will recklessly throw themselves at the unknown, determined to go to difficult locations for no other reason than to be the first.");
	outputCodex("\n\nBoth these instincts have been reigned in over the years, but one need only look at the early human wars with their own colonies to see how quickly they will jump to violence, even with their own people.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Mostly harmless.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Humans");
}
public function ausarCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["ANNO","DANE","SYRI"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Ausar"));
	outputCodex("<i>Man’s best fuckbuddy.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Ausar");
	outputCodex("\n<b>Sexes:</b> Male and female.");
	outputCodex("\n<b>Height:</b> Varies, usually similar to humans; they commonly range from five feet to just over six, with rare specimens reaching around seven feet in height.");
	outputCodex("\n<b>Weight:</b> Ausar are lithely built, weighing less than a human -- often from just over 100 lbs, and rarely over 200.");
	outputCodex("\n<b>Hair:</b> Color varies, with gray, black, and a dark gold being the most common. Some rare specimens have snow-white hair, or a fiery red mane.");
	outputCodex("\n<b>Eyes:</b> Ausar eyes are primarily white, with darkly colored irises formed as a vertical slit across the middle of the eye. Coloration ranges from dark blue or green to black.");
	outputCodex("\n<b>Ears:</b> The race’s most distinguishing feature are a pair of tall, perky wolf-like ears that extend from eight to twelve inches above the head, and are often quite bushy. They are extremely sensitive, able to hear well outside the human range, which makes ausar both keen hunters and acutely vulnerable to sonic attacks.");
	outputCodex("\n<b>Tails:</b> Ausar have long, bushy tails of an exceptionally pleasant, soft fur. These tails usually display their emotional state, wagging when happy or tucking when sad -- though their owners have some measure of control over the tail’s movements. They often brush it against those they hold in great affection.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Ausar naturally have a soft, velvety fur covering their arms and legs, though this serves as poor protection against anything besides the environment. As such, the race has strongly invested in personal shield technology, producing some of the most advanced in the galaxy. Due to their high physical agility, most Ausar shun heavier armors such as that worn by human Marines, instead relying on linked shields across fighting formations to guard against attacks. The staff was, in ancient times, the primary weapon of their race, and remains the basis for their current weapons technology, with both shock-pikes and crook-shaped railguns being their favored armaments of the day.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Gender Differences"));
	outputCodex("Ausar genders are largely divided as in humans, with males having broader chests and shoulders while females have wider hips and milk-producing breasts. Male Ausar are known to possess knotted phalluses, which can sometimes cause copulation to take hours once it’s lodged in a lover. To compensate, females of the race have exceptionally well lubricated, often quite elastic vaginas, which also helps during the birthing of litters.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("The Ausar homeworld is a vast, arid desert spotted with great shimmering oases and vast temple-cities dedicated to the god-kings of old. Most of the world is uninhabited, occupied by deadly scorpion-like creatures the size of a horse as well as huge worms which have been the race’s primary source of food for aeons. After taking to the stars roughly 1000 years before contact with humans, the Ausar have come to adapt to many different environs, though most worlds they terraform retain the hot, dry desert conditions of their homeworld.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("As mentioned above, Ausar copulation is often an hours-long affair thanks to the male knot, and rapid recovery periods on both sides. Though not overly libidinous, the race is known for being more sexually forward than humans, as marriage and long-term sexual relationships are rarer among the race, though by no means unheard of. Once impregnated, an Ausar female will carry a “litter” of up to six children for a period of six months before giving birth. Ausar are born blind for the first few weeks and need a mother’s milk, but naturally grow and mature somewhat faster than humans, reaching adulthood at fifteen years.");
	outputCodex("\n\nDue to the long standing friendship between Ausar and Mankind, the two are perhaps the most common of xeno-romantic entanglements. Halfbreeds resulting from Ausar-Human relationships are typically somewhat taller and heavier than the average Ausar, often losing arm and leg fur, though they tend to retain the tails of their alien parent, and have smaller, floppier and less sensitive wolf ears. Half-ausar are usually born in pairs, can see at birth, and come of age as humans do. Being one of the most common hybrid races in the galaxy, half-ausar have recently become a primary option in the U.G.C. census, rather than being filled under “Other/Hybrid race.”");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Unlike most modern civilizations, the Ausar have not unified under a central government. Instead, their planets are ruled by independent kings and queens, who convene to decide matters related to their race. It wasn't until humanity’s gift of quantum communication that the fragmented Ausar society, spread across the stars, tightened to present a strong, united front in the galaxy. However, the local kings are still relatively free to act as they choose. Amongst them, the King of Ausaril (the Ausar homeworld) is considered the “King of Kings”, is generally deferred to by lesser despots and holds the only post able to call the entire Ausar to war or countermand planetary kings (in large part thanks to a crushingly huge fleet and more advanced technology produced on the homeworld). In times of trouble or war, the Joint Ausar Fleet can be called on, with each world in the federation contracted to supply a certain number of ships and soldiers to the joint defense each decade.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Relationships"));
	outputCodex("The Ausar are known to be an exceptionally friendly and peaceful race. They are slow to anger, though they are quite territorial, and have rarely warred with other races. When interacting with humans, the Ausar are known to be outgoing and affectionate, readily making friendships that last a lifetime. Some have commented that most Ausar get along better with humans than even their own kind, and thanks to their wolf-like appearance, they are occasionally called “Man’s best friend among the stars.” As humanity’s first contact with alien life, and longest and staunchest ally, this saying has thus far rung true.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("The Ausar invented the Warp Gates, and therefore firmly placed themselves at the forefront of galactic technology. While they have yet to field an invention to overshadow the gates, the Ausar are still renowned as brilliant scientists, especially in regards to interstellar travel and ships. Ausar shields are second to none, and their ships are exceptionally quick, equipped with advanced LightDrive engines (a refinement on the human invention). However, their technology, being exceptionally complex and prone to gaps in electronic defenses, is well-known to be vulnerable to security breaches. More than once, powerful Ausar fleets or financial institutes have become victims of skilled hackers.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Ausar");
}
public function kaithritCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["KAITHRIT_SCOUT","TAMTAM"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Kaithrit"));
	outputCodex("<i>Cat-girls with two tails? What’s not to love? ...what do you mean they have males?</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Kaithrit");
	outputCodex("\n<b>Sexes:</b> Female, Male, statistically significant occurrence of hermaphroditism.");
	outputCodex("\n<b>Height:</b> Males range from 5\' to 6\' 2\" tall. Females and hermaphrodites range from 5\' 6\" to 7\' 3\".");
	outputCodex("\n<b>Hair:</b> Nominally, kaithrit only feature hair on their head and a fine layer of soft fur on their tails and ears. Fur and hair coloration is highly diverse; every color and hue seen on terran felines has been reported, but some have stranger colors.");
	outputCodex("\n<b>Eyes:</b> Kaithrit have two eyes in the normal humanoid position. These eyes are typically colored amber, hazel, brown, blue, green, gray, yellow, orange, black, yellow-green, blue-green, violet, copper or gold. Kaithrit have a slightly higher predisposition towards heterochromia than other races. They possess slitted feline pupils which give them much keener low-light vision than humans.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Kaithrit have the normal structure of bipedal humanoids, with two arms and two legs as well as a single head, and fundamentally human-like faces. The hands and feet feature long, sharp-tipped nails that are capable of extending slightly to form dagger-like claws, adept at slashing and piercing, though these are hardly ideal weapons against most modern forms of armor. They have a single pair of large, feline-like triangular ears atop their heads, which are capable of swiveling and moving just like those of a terran cat. Combine this with the fact that they have two tails sprouting from their rear that are also reminiscent of a terran cat, and it’s no wonder that many humans consider them to be “space catgirls”.");
	outputCodex("\n\nThe strangest aspect of kaithrit is that they all appear, to a casual glance, female. Even males - or perhaps especially males - have a feminine appearance, being dainty, fine-boned and curvaceous. Females and hermaphrodites are naturally taller than the average male, and more voluptuous - they have larger breasts and buttocks as well as wider hips - but males are easily mistaken for females unless they deliberately flaunt their masculinity. Male genitalia tends to be small, with scrotums that hold themselves snugly against the groin in tight pouches, only furthering the confusion.");
	outputCodex("\n\nMale kaithrit sexual organs are typically 5\" to 7\" long and 1\" thick, and are feline in nature, presenting a shaft covered in small nodules of flesh that provide a tantalizingly soft, bristly texture. However, some kaithrit instead have bristly-textured but ultimately canine phalluses, though this is a distinct minority - this is believed to be due to traces of ausar genetics.");
	outputCodex("\n\nBreast size varies depending on sex; males never grow larger than an A-cup and are normally flat chested, despite their feminine physique, with lactating males swelling to a B-cup or, at the largest, a C. Females average between a C and an F-Cup.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("Although a widely scattered race that can be encountered across much of the known galaxy, with the existence of nomadic space-faring clans and families that happily establish themselves in human or ausar-created colonies alike being reliably documented, kaithrit do in fact have a homeworld. Known as Rosha, it is a lush, verdant orb that sits just slightly closer to its sun than Earth, resulting in an overall tropical and sub-tropical climate. Much of Rosha is grassland or open scrub forests, with dense jungles towards the cooler polar regions, vast mangrove swamps along the coastlines and a dense strip of arid savannas and bushland across the equators. Only at the very poles themselves do tundras and taigas form.");
	outputCodex("\n\nAs a consequence, kaithrit are most comfortable in similar environments; the jungle-rich world of Mhen’gha is expected to see many of these aliens coming to settle, with its wild, lawless frontier world status sure to act as a magnet for this bold, brash species. However, Kaithrit have been seen all over the galaxy. Some of the more daring have succumbed to their wanderlust and taken to traveling through space, often in clan crews, to colonize and seek their fortune abroad.");
	outputCodex("\n\nDespite the fact that many kaithrit enjoy traveling through space, the great majority of them are traditionalists unwilling to leave their home planet, even if they do take trips to stations and other planets. After the Great Exodus, an event that marked the beginning of a new age, not many Kaithrit born on their homeworld choose to leave it.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Kaithrit reproduce in fundamentally normal mammalian style, with males impregnating females who then give birth to live young that are suckled on milk from their mammary glands. Furthering the gender confusion are males who remain in close, constant proximity to an expectant female. Pregnant kaithrit emit a steady wave of hormonal musk which can trigger a lactation response in males, swelling his breasts and allowing mother and father alike to nurse. Kaithrit pregnancy lasts approximately eight months after conception, and results in one to three kittens, though incidents of multiple births are quite low -- most pregnancies result in a single healthy child. Male hormonal balance tends to return to equilibrium faster than females, allowing them to recover from the effects of a female’s pregnancy and return to their normal chest size quickly.");
	outputCodex("\n\nConfirmed kaithrit crossbreeding has been documented with both humans and ausar. Human/kaithrit hybrids tend to have more human-like facial features and typically only one tail. Ausar/kaithrit crossbreeds are most distinctive from purebred kaithrit because males and hermaphrodites typically have ausar-like phalluses, albeit usually with the typical kaithrit texturing.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The kaithrit are believed to have a rather human-like evolutionary story, beginning as tree-dwellers who, as the trees gave way to grassland, evolved towards a bipedal frame. As one may expect, the kaithrit’s most distant ancestor was more feline than primate. Perhaps because of this, gender roles also evolved differently to humans; unlike human precursors, these proto-kaithrit were a matriarchal species. The females were, as they are today, bigger and stronger than the males, responsible for hunting and warring with other prides, while the males cared for the offspring. This inversion of human gender roles shows through in many aspects of kaithrit society; it is far more common for a female kaithrit to initiate a relationship than it is for the males, for instance.");
	outputCodex("\n\nHigher intelligence developed in-line with other observed evolution; with bipedal locomotion freeing the hands for other uses, sapience soon followed, the kaithrit becoming masters of tools and molders of their environment. While many aspects of their feral past were discarded on the road to civilization, others remained, and one of these is the social dominance of female over male. Male kaithrit are seen as creators, shapers, builders and caretakers, while females are seen as warriors, pioneers, adventurers and explorers. Men are kept to the background by society, due to the belief in their passivity and frailness; while things are not quite so bad that men are ‘househusbands’ with no greater role in life than to get married, father daughters and look after the house while the woman earns money to support, they are encouraged to take up more intellectual or otherwise passive roles.");
	outputCodex("\n\nIndeed, kaithrit society is in many ways stunningly sexist. Male kaithrit are forbidden to uphold matters of state or assume political roles, because it is believed they are too weak and inept to make hard, necessary decisions - indeed, this same belief holds them away from any position of power or control over others, especially over women. Society coddles them in many ways; males who commit crimes receive weaker punishment than females do, goods crafted by males attract more money, and they receive better service in restaurants and stores. Indeed, it’s surprising just how much they are favored - some xenobiologists and historians point to a significant difference in population ratios between males and females as the reason for these differences, with males being relatively less common than females. In some colony worlds, the lower occurrence of male births can be cause for a great deal of concern, and result in even more stringent constraints on male activity.");
	outputCodex("\n\nThis is not to say that there is not a division between viewpoints on these aspects. While a distinct number of males are accepting of the impositions against their gender due to the privileges they receive, still others resent it and wish to bring their culture more in line with that of many others of the U.G.C., with true equality between the genders. This viewpoint became more popular amongst males, and even began gaining ground amongst the females after contact with other species was established, but it was the Great Exodus that caused the viewpoint to become the simmering underground faction that it is today.");
	outputCodex("\n\nThe Great Exodus was the period immediately following the kaithrit’s contact with the U.G.C. The idea of other planets, people, and other societies fascinated the kaithrit, and as a result the more daring females jumped at the chance to get a license and fly a starship to the great beyond. This was a time of great frustration for males; they were denied the rights to take the test for a license as they were deemed too frail to handle a spaceship. While this didn’t stop some males from stowing aboard visiting ships or even stealing ships for themselves, their restriction from starflight became a matter of great debate, and finally brought to light the fight for equality.");
	outputCodex("\n\nOf course, it must be noted that this patronizing attitude towards males predominantly applies to the kaithrit of Rosha; offworlders, especially those who have many generations removed from the homeworld, are far less traditional.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Hermaphrodites are an uncertainty in the kaithrit viewpoint of the world, and reactions can vary wildly from settlement to settlement. Perhaps as a response, hermaphroditic kaithrit have always been inclined towards nomadic behaviors.");
	outputCodex("\n\nAs noted above, kaithrits have feline-like tails, with two to a specimen. These tails are functionally prehensile, if too weak in most cases to use for wielding weapons. An entire social strata exists within kaithrit society involving them; tail body-language is an important part of understanding kaithrits and how they communicate with each other. Motions and positioning, these can all speak volumes to another kaithrit or a trained observer. Contact with a tail is a social language in its own right. Who a kaithrit touches, how, when, and where, are all bound by distinctive aspects of kaithrit propriety. For example, a simple looping of one tail tip around another kaithrit’s tail-tip signifies a friendly acquaintance and is a polite greeting, whilst doing the same with both tails on the same side is a gesture of sibling affection and doing it with one tail on either side, so that both Kaithrits must be facing each other, is a romantic gesture similar to a cuddle. More intimate tail-touches are supposed to be kept private or to the bedroom, but may be seen as an expression of dominance in a social context.");
	outputCodex("\n\nWhen dealing with aliens, a kaithrit’s tail-touching often serves as an indicator of social interest; they prefer to stroke the alien’s tail, if they have one, but the buttocks and thighs will suffice. A side effect of this, though, is that most tail-touching gestures they can perform are signifiers of lust or camaraderie - the equivalent of a friendly spank on the ass, for example.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Kaithrit");
}
public function leithanCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["ELLIE","TANIS"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Leithans"));
	outputCodex("<i>The centaur people are otherworldly, but as peaceful and friendly as they come.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Leithan");
	outputCodex("\n<b>Sexes:</b> Male and Female");
	outputCodex("\n<b>Height:</b> Leithans can range from 8\' 6\" to 10\' tall, with females usually slightly shorter and lighter than males. Their tauric frames are roughly 5\' at the shoulders, with their humanoid halves ranging from three and a half to five additional feet.");
	outputCodex("\n<b>Hair:</b> Most Leithans have dark, stringy hair. Black, dark yellow, and shades of gray and brown are all common.");
	outputCodex("\n<b>Eyes:</b> Leithan eyes have bright, universally blue irises, with white storm patterns surrounding their twin pupils. Leithans have exceptional eyesight, and a secondary eyelid allows them to see even in extreme brightness, as is common on their homeworld, without sacrificing their low-light vision.");
	outputCodex("\n<b>Ears:</b> Leithans have two large, sensitive ears which grow from the center of their brows, roughly two inches apart. Their ears are alert, but are soft and frequently flop back against their heads at high speeds or in emotive response. A secondary pair of ears are located where human ears are, on the sides of the head. While larger than a human’s and gently tapered (some describe them as “elfin”), the secondary ears are for all intents and purposes without special function.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Unlike many advanced species through the galaxy, the Leithans began as prey creatures on their homeworld, and have over the millennia developed several defensive adaptations to ward off the very large, unintelligent predators that attacked them. The first feature most people notice about a Leithan is their natural armor: while the tauric lower body is completely covered with thick, leathery scales (befitting the species’ reptilian origin), the flanks, arms, legs, and tail are protected by a chitinous secondary layer. Leithan armor is thick enough to stop most low-caliber bullets, and even deflect low-grade laser fire at range; more importantly for the species, however, it is capable of withstanding the enormous pressure of most titanic predators’ crushing maws, giving Leithans some defense against their native hunters.");
	outputCodex("\n\nSecond, the Leithans have developed six powerful legs, allowing them unparalleled running speeds over short bursts. Leithan endurance is not above average, but their speed is usually enough to avoid or outrun danger before exhaustion sets in.");
	outputCodex("\n\nThird, Leithans have adapted bright warning signs on their armor plates. These yellow, bioluminescent patterns are unique to each Leithan, and serve to frighten off some larger predators, especially at night. The coloration of their warning lights has become iconic in Leithan culture, and many Leithans choose to dye their hair or decorate themselves with gold stripes and swirls, adding to the effect of their natural defense. The bioluminescent stripes have a variable brightness, controlled subconsciously by their owner: in times of extreme emotion or distress, they flare brighter, while when calm and relaxed, the lights are almost completely dimmed.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("The Leithan homeworld, a small planet orbiting Alpha Centauri (hence the common nickname for the species, Centaurins) is a vast, cold-weather desert and shrubland for the most part, punctuated by several dozen small seas, but no proper oceans. The atmosphere is naturally very dense and humid, with a water content much higher than that of Terra or Ausaril.");
	outputCodex("\n\nThe most notable feature of the world are several species of truly titanic, flesh-consuming predators. Ranging from overly large, rudimentarily-intelligent humanoid reptiles standing six stories high to flying creatures vaguely reminiscent of mythological dragons whose wingspan can extend twenty yards in the largest cases, the Leithans arose on a world quite hostile to them, where they were regarded as little more than prey for the titan-class predators. Due to the inherent hostility of their world, many Leithans take the first flight out they can catch, and as such, the Leithan race has become one of the most widespread transplant or immigrant races throughout the galactic core. Relatively few choose to migrate to the fringe, especially during the Planet Rushes, as the Leithans are inherently skittish about danger and violence, and the rough-and-tumble nature of the frontier ill suits them.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("The Leithans propagate their race much as many reptilian species do. At certain times of the year (usually twice per year), the female will enter heat, and her body will begin producing a powerful attractive pheromone. This will cause nearby males to seek her out: due to the relative mortality of their race, most Leithan females will accept most if not all suitors to help ensure pregnancy. After a brief gestation period of about one month, she will lay a clutch of eggs, usually in her home or that of a trusted friend and caretaker. An average clutch is between four and six eggs, each of which is nearly two feet long. Eggs hatch after another month-long period, during which the mother will become highly defensive and easily agitated as her maternal instincts insist that she defend her “nest.”");
	outputCodex("\n\nAfter the U.G.C. “uplifted” the Leithan race during the early stages of the Planet Rush scheme, the race’s reproductive habits have changed somewhat -- especially among those living away from the homeworld. With a dramatically higher survival rate off-world, Leithan males and females have become more comfortable in being selective with their partners, and recreational sex drive has become much higher. While Leithans still have a difficult time with the concept of monogamy, and most freely move between several partners, the idea of a female allowing any male to approach her in her “heat” period is nearly nonexistent now.");
	outputCodex("\n\nUnlike many sapient species, Leithans have a nearly 0% fertility rate when coupling with other species. Halfbreed Leithans are nearly unheard of, and almost always the result of genetic manipulation and non-natural fertilization. Because of this, and the higher sex drive among offworld Leithans, many Leithans of both sexes find themselves to be easy “swingers,” and eagerly skip the courting and dating process to open themselves up to several attractive partners of other species, since their couplings are virtually no-risk.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture & Society"));
	outputCodex("Before being uplifted, the Leithans existed as a nomadic species, desperately clinging to their precarious existence in the shadows of titanic predators. Divided into small tribes scattered across the desert, Leithans bands wandered from water source to water source. Over time, their technology advanced in small but important bursts: they discovered methods of water collection from the atmosphere fairly early on, and made great strides to domesticate smaller reptilian creatures which were able to aid them in hunting and alert them against impending attack.");
	outputCodex("\n\nSome Leithans attempted to protect themselves in high-walled cities, and because of this protection and stability, were marginally more successful and advanced than their roaming cousins when First Contact happened. Many of the walled cities had developed primitive flintlock-era firearms and cannons, with which they were able to fend off predator attacks -- one city even created primitive rockets to guard against aerial attacks. Since their uplifting by the U.G.C. in the Third Great Planet Rush, Leithan cities have become veritable fortresses against their one-time predators, and the race has eagerly adapted to the advanced technology the Confederacy brought with it. They have adapted so well, in fact, that in the modern day Leithans are valued as exceptional engineers and technicians, especially in regards to machine maintenance and robotic tech. Many top of the line drones, turrets, and unmanned vehicles are produced in Alpha Centauri or on Leithan colonies.");
	outputCodex("\n\nSocietally, Leithans are regarded as being very open, friendly, and cooperative. When teamwork and group loyalty are the biggest defense you have against being eaten by a six-story tall monster, it pays to be easy to work with. Most Leithans are highly empathetic, making them keenly aware of others’ emotive states, and are most comfortable in small, close-knit groups of friends. Solitary Leithans are almost unheard of, and most revel in social activity - especially in the core words, where Leithans are constant features of nightclubs, dance halls, and just about any party they can find.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Leithans");
}
public function kuitanCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["KIRO","JURO"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Kui-Tan"));
	outputCodex("<i>Tan-tan-tanuki no kintama wa...</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Kui-tan");
	outputCodex("\n<b>Sexes:</b> Evenly split between males and hermaphrodites.");
	outputCodex("\n<b>Height: </b>Most adults are between 4\' 10\" and 5\' 1\" in height with few ever being shorter than 4\' 4\" or taller than 5\' 6\".");
	outputCodex("\n<b>Weight: </b>Similar to terrans despite their thick fur giving them a somewhat pudgy appearance.");
	outputCodex("\n<b>Hair:</b> Hair grows from the top of the scalp with colorations from chocolate hues all the way to oil-black.");
	outputCodex("\n<b>Eyes:</b> Kui-tan have two forward facing eyes situated in their face, in the same manner as humans. Eye color tends towards shades of brown and orange, though gold eyes are possible, if rare.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("The kui-tan are a humanoid species native to Arcysus’s single orbiting moon, Jitafore, who visually call to mind the mythical ‘tanuki’ of Japanese lore. Their bodies are typical of most intelligent humanoids - two legs, a torso, two arms, and a single head atop the torso. Kui-tan faces are strikingly similar to galactic norms, except that nose and jaws grow together and extend into a short but expressive muzzle, containing prominent canines but altogether omnivorous teeth. A single pair of ears, just pointy enough at the top to be oval-shaped rather than circular, sit atop the head with limited mobility.");
	outputCodex("\n\nThough they have five-fingered hands at the ends of their human-like arms, their plantigrade legs end in paw-like, four-toed feet. A single tail sprouts from every kui-tan’s rear, starting at a narrow base and swelling out immensely the closer one comes to the tip. These tails can be almost as long as a kui-tan is tall and as thick around as one’s waist. However, the bulk of a kui-tan’s tail is actually very dense, firmly packed fur, making it surprisingly light despite its bulky shape.");
	outputCodex("\n\nKui-tan grow thick, dense fur that often makes them looking quite pudgy if left ungroomed. Most kui-tan do their best to keep it cut short and form-hugging, both to keep cool and for appearances’ sake. Their fur colors are generally browns with patches of black around the eyes, on the tips of the ears, in rings around the length of the tail, and in the shape of black socks over their feet and thighs. This fur grays in old age. It is not unheard of for kui-tan to dye themselves to suit personal preferences and tastes.");
	outputCodex("\n\nAll kui-tan bear tapered penises thanks to their lack of a female sex. The tips have vaguely heart-shaped crowns formed by two rounded bulges on the underside of the glans at a tip at the tip. During kui-tan mating, the unique shape stimulates the cervix to dilate, allowing the father direct access to a fertile womb. A trio of knots, spaced along the length, swells upon orgasm, locking the lucky father in place. The erect length of a typical kui-tan falls somewhere between six and ten inches and not more than two inches in width, though reports of kui-tan with outsized genitals from mods are common; the race seems to have strong reactions to such items.");
	outputCodex("\n\nThe most unique parts of a kui-tan’s reproductive system are their testes. Their masculine reproductive systems constantly produce sperm and seminal fluid, and their unique gonads are capable of storing it all, swelling up as they do so. A kui-tan who goes without release long enough may find himself immobilized by his own beachball-sized genitalia. Once drained, they’ll usually be about the size of apples.");
	outputCodex("\n\nKui-tan cannot reach such obscene states in short order. It would take a few weeks for most to immobilize themselves. No matter how large (or sensitive!) their prostates, they simply cannot immobilize themselves without a long period of abstinence. Of course, aroused kui-tan produce semen many times faster than normal, and large intakes of food and water can further stimulation such production. Actually ingesting another’s seed is even worse, setting off what some kui-tan have taken to calling a ‘cum-cascade’.");
	outputCodex("\n\nHermaphrodite kui-tan have vaginas designed to clamp tightly, but orientated for fitting girthy pricks over lengthy ones, as they must cope with the series of knots that a given partner will produce. The vagina is often easily hidden due to the testicles obscuring obvious sight, and most commonly kui-tan prefer to be penetrated from behind, vaginally or anally.");
	outputCodex("\n\nHermaphrodite kui-tan typically have breasts a bit below the human averages, ranging from A to C-cups.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("The kui-tan species evolved in lush forests prone to balmy summers and harsh winters. Naturally adept at climbing, the kui-tan still have a fondness for forest environments, and often build their homes into trees when given the choice. As their technology has advanced, more urban cities have sprung forth, though all kui-tan try to at least keep some plants around the home for decoration, if nothing else.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("By preference, most kui-tan form monogamous pairings. There is a tradition of parents taking steps to introduce their children to potential partners, but arranging marriages for political reasons has been illegal for generations.");
	outputCodex("\n\nWhile capable of sexual intercourse at any point in time and also of conceiving on a monthly basis, hermaphrodite kui-tan retain the aspect from their more primitive ancestors of entering a state of heat approximately every six to seven months. During this time, typically about a week long, their hormones surge, giving them a marked increase in libido and a small, but noticeable, boost in passive semen production. This makes them markedly more interested in sex, though not so much so that they can’t resist the urge, as well as making it more likely for them to conceive.");
	outputCodex("\n\nA kui-tan pregnancy typically lasts about six and a half to seven months, and results in the delivery of a single pup. Blind and helpless, the woolly little pup depends heavily on protection from its parents for a significant portion of its early life, and both mother and father traditionally work closely together to keep it cared for.");
	outputCodex("\n\nAs a common sexual fetish, kui-tan are very receptive to testicular stimulation. When particularly swollen, or when orgasming, the skin on their balls becomes extremely sensitive, making touch very effective at further turning them on. As a consequence, most kui-tan greatly enjoy the feeling of semen washing out of their partner or spilling down their balls, and will usually react to oral pleasurings - lickings, kissings, suckings, etc - with the same manner. “It’s not real sex if your balls are still dry when you’re finished,” is a common sexual saying on their planet.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The most interesting event of note in kui-tan history is some 500 years before the present day, when early experiments in bio-modification went disastrously wrong. The Kintama Plague, as it’s now called, began as an experiment in bio-modding intended to create an easily administered virility booster. Instead, the artificial DNA mutated, got loose and began spreading across the planet like a virus. This mutated bio-mod drastically affected the infected males, causing their semen production to surge into overdrive and leaving them requiring near-constant sexual release to be capable of independent motion.");
	outputCodex("\n\nThe initial news of a viral breakout and its effects weren’t necessarily treated as a maximum level priority. Most males had no problem with having to find release more often. This incident only got its due importance when the virus mutated and began to affect the females, making them grow male genitalia of their own. The world’s top researchers were tasked with finding a cure, but the research was too slow. The virus had infected nearly the entire population, and within a few decades females disappeared entirely, replaced by herms.");
	outputCodex("\n\nAs is widely documented in their own planet’s histories, it was shortly after the kui-tan developed powerful radio receivers that they accidentally made contact with the sionach, who had reached a similar stage of development on their own world. It is something of a friendly argument between the two species about who holds the more important role in their mutual histories; the sionach, or the kui-tan, for inventing the first reliable space vessels that made physical contact between their species possible.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Kui-tan of all sexes attempt to keep their balls small and manageable, so they can be tucked away discreetly with some skill. Oversized balls are seen as sexually provocative and crude, a vulgar symbol of the kui-tan’s sexual readiness or desire.");
	outputCodex("\n\nBecause all kui-tan have penises, many kui-tan have come to be bisexual, with no social stigma of any kind given to an individual pleasure the phallus of another with hands, mouth or anus. While most ‘homosexual’ kui-tan males classify more accurately as male-preferring bisexuals, true homosexual males do exist. Whether an individual prefers to catch, pitch or swing generally takes the place of conventional sexuality in kui-tan society.");
	outputCodex("\n\nBecause of the excessive productivity of kui-tan balls, it is a natural thing in their culture to need to release frequently. Restrooms are modified to be capable of handling frequent loads of semen as well as other wastes, and most cities have designated ‘milking stations’ where a pent-up individual can be quickly and efficiently drained, with the mess vacuum-pumped away without hassle.");
	outputCodex("\n\nIt should be noted that in kui-tan culture, oral sex carries different sexual overtones than in human cultures. Since oral achieves release more efficiently than handjobs, it’s quite common for kui-tan to offer blowjobs to others if they need the release; even family members may do so without stigma. However, the expected norm is that, when climax nears, the offering partner will release so the climaxing partner can direct his or or her ejaculate into a storage receptacle.");
	outputCodex("\n\nActually swallowing the semen, though, is regarded as a highly intimate act, perhaps even more so than among humans due to the semen-cascade it sets off in the receiving partner’s balls. Thusly, swallowing has come to symbolically mean that one partner is quite literally taking on the burdens of the other. As a consequence, it’s a great sign of respect or love to do so.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Kui-Tan");
}
public function gryvainCodexEntry():void 
{
	clearOutputCodex();
	var randBust:Array = ["GRYVAIN","GRYVAIN_AGENT"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Gryvain"));
	outputCodex("<i>The dragon women are as beautiful and artistic as they are breed-hungry.</i>\n\n");
	outputCodex("<b>Name:</b> Gryvain (plural and singular)");
	outputCodex("\n<b>Sexes:</b> Hermaphrodites");
	outputCodex("\n<b>Height:</b> 5\' 10\" to 7\' 2\"");
	outputCodex("\n<b>Hair:</b> Gryvain have human-style hair, usually worn long, which varies in color from blue, black, gray, and some shades of dark green.");
	outputCodex("\n<b>Skin Color</b>: From the waist up, gryvain have smooth skin, usually pale pink or a light red in color, though some rare specimens have a lush, almost plant-green or a dark, blood-red skin tone.");
	outputCodex("\n<b>Eyes:</b> Yellow eyes with vertical slits, reptilian in nature.");
	outputCodex("\n<b>Feet & Legs:</b> Gryvain lower bodies are coated in blue, green, or black scales from the waist down, with feet ending in supple, smooth leathery soles. They have five toes, each tipped with a sharp claw (though most gryvain file these down for convenience and comfort). As a race primarily accustomed to flight over walking, the soles and arches of a gryvain’s foot are noted to be a common erogenous zone.");
	outputCodex("\n<b>Wings:</b> Gryvain have four reptilian wings sprouting from their backs, on and just below the shoulders. The thicker-than-normal atmosphere of the gryvain homeworld allowed them to develop true flight, though their wings aren’t capable of supporting them for more than short bursts or flutters in most human-friendly conditions. Many gryvain-crewed vessels have specialized chambers to simulate their homeworld’s atmosphere, allowing them to exercise their wing muscles and relax their legs.");
	outputCodex("\n<b>Lifespan:</b> Gryvain naturally live for 350-400 years, though they achieve adulthood at a brisk 20 years. Modern medicine suggests that their lifespan could easily be expanded to nearly a millennium. Most gryvain currently retain their natural lifespans, commonly citing that they already live far longer than most species, and loneliness and constantly-advancing technology begin to vex them after a few centuries.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Necessary Adaptations"));
	outputCodex("In order to survive in terrestrial atmosphere, all space-going gryvain receive simple genetic modifications that allow them to breathe oxygen. These are provided at no cost by the Gryvain Heartland Republic. Many gryvain also choose to have modification work done to allow them true flight in standard atmospheres or to strengthen their legs to better support themselves for extended durations.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("The gryvain are large reptilian humanoids, standing larger and heavier than humans/ausar on average. Gryvain have scale-covered lower bodies, with upper bodies sporting supple, often-colorful skin. In addition to two pairs of large, leathery wings, each gryvain has a pair of curling horns growing from her brow, and slitted reptilian eyes with brilliant yellow irises. As an all-hermaphrodite race, gryvain are universally feminine in appearance with very large, egg-bearing hips and full breasts. Gryvain have sinuous tails growing from just over their behinds, fully prehensile and tapered to a fine point. Their tails are covered with small, soft scales, and are smooth from tip to base. Gryvain tails help with balance, in flight and on the ground, and can be controlled precisely enough to operate tools and assist in other activities. While the base of the tail is heavily scaled and rather dull, the tapered tip is quite thin and has as much sensitivity as some species’ sex organs.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexuality"));
	outputCodex("A race of hermaphrodites, all gryvain are capable of both bearing and siring children -- and many choose to take both routes during their lifetimes. Gryvain have reptilian-style phalluses, ranging from 8-12 inches in length and are fairly broad for their size, usually mimicking the color of the owner’s scales. Their phalluses have tapered tips and thick, bulbous bases that resemble canid knots, though they lack the same growth and knotting function. They have a set of six large internal testes near where the human prostate would be, three on either side of the anal passage. Because of these extra testes, gryvain seminal fluid production is notably larger and faster-replenishing than most other races.");
	outputCodex("\n\nA gryvain’s phallus grows just over her feminine sex, which is rather unlike its terran or ausar equivalents. While a gryvain’s vagina superficially resembles the galactic norm, with external lips the same color as their scales and a high amount of internal lubrication, gryvain lack clitorises. Instead, they have several concentric rings of small nubs lining the walls of the vagina, each roughly as sensitive as a human clitoris would be. This makes both sexual intercourse and oviposition incredibly pleasurable. Most gryvain repeatedly and extremely intensely orgasm immediately upon penetration, and as their refractory period is nearly non-existent, will often be in a continuous state of climax through the entire penetrated-mating or birthing process.");
	outputCodex("\n\nGryvain vaginas are much larger than their host’s size would suggest, as they bear the duty of laying fairly large eggs; they are usually lipped with thick labia of the same color as the individual’s scales. In order to ease egg-laying, gryvain vaginas are both highly elastic and extraordinarily well-lubricated, which has made them very popular both in the underground ultraporn industry and as mates for leithans and other races with much larger than average male endowments. Due to the incredible sensitivity and orgasmic abilities of their feminine sexes, most gryvain note extremely high satisfaction in both of these roles.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Like many reptilian-origin races, gryvain are infertile except in regular cycles of oestrus lasting about one month out of every year. Gryvain heat cycles are not tied to any particular seasonal or atmospheric condition, and each individual has a different time of the year she will go into heat. Notably, gryvain heat does not end after successful mating: the cycle lasts for the full month. During this period, the gryvain’s sex drive is markedly increased, and both her sexes are in a state of near-constant arousal, preventing her from easily hiding her state from others, and the sensitivity of her entire body increases dramatically. Simple acts such as brushing a tail or groping a breast or buttock can cause immediate ejaculation, and most gryvain at this point find it nearly impossible to resist offers for sex, especially to be bred.");
	outputCodex("\n\nGryvain have a wide variety of reactions to their heat periods. Some, especially those not desirous of children, will resort to medication to suppress their heat, or will isolate themselves and attempt to sate themselves with vigorous and regular masturbation for the duration of their cycle. Others will gleefully attempt to have as much sex with as many partners as possible, virtually ensuring impregnation. The most common reaction is to retreat to home life with a partner (or several, for polyamorous gryvain) and simply mate whenever the urge becomes unbearable, with or without birth control as they choose.");
	outputCodex("\n\nOnce impregnated, a gryvain will quickly begin to lactate a thick, sweet pink-colored milk. Their milk production (as with other sexual fluids) is considerably higher than the galactic average, and gryvain breasts tend to swell by several cup sizes once they start. Unlike many other races, once a gryvain begins to lactate, she will not stop for the duration of her life, and the increase in the size and sensitivity of her breasts is permanent. While the average cup size is roughly a C-cup among non-mothers, the average tends toward E to F-cups among those who have borne children. Multiple pregnancies can sometimes lead to increased milk production, and a commensurate increase in size. The largest recorded natural cup-size for a gryvain was a tremendous L-cup after fifty separate pregnancies, with the mother in question producing many gallons of milk each day and requiring special assistance to move.");
	outputCodex("\n\nAfter successful conception, a pregnant gryvain will have her belly quickly swell with a growing egg until she’s nearly as gravid as a human female in her third trimester. After six weeks of carrying the egg the expectant mother will lay it, after which it must be kept warm and safe for an additional six weeks whereupon the newborn gryvain will hatch. Gryvains are always born singularly, with no instances of multiple births recorded. Newborns are incredibly small and helpless after birth, and rely on their mother to nurse from. They grow much like human children for the next several years, able to fly, walk, and communicate after two to three years, and reaching sexual maturity at 20 years of age.");
	outputCodex("\n\nNotably, gryvain are perfectly capable of inseminating a partner when they themselves are not in heat. Gryvain sex drive is fairly average outside of their heat cycle, and while they are not known to have particularly sharp senses of smell, it is noticeably higher in the presences of a member of any species in heat -- not just their own. Being in the presence of a leithan female in oestrus can be nigh-debilitating to gryvain, at least as much as to the famously-vulnerable ausar.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History & Society"));
	outputCodex("Originally hailing from the hot, humid moon of Vendiko, the gryvain arose in the shadow of a massive blue gas giant, on a world wracked by storms and with an atmosphere so thick that their wings allowed them the natural gift of flight. While predatory carnivores by nature, gryvain eventually domesticated several prey species, and began the long process of growing from small hunter tribes to great cities that spanned their world.");
	outputCodex("\n\nOnce settled, the gryvain proved to have a natural knack for science and discovery. Modern gryvain technology is easily the rival of the ausar and other advanced races, and their culture has adapted to highly prize ingenuity and creativity. Manual labor and violence are seen equally as being “barbaric,” fit for younger races and drones; gryvain are much more strongly inclined towards the arts and sciences, as well as flight and interstellar exploration.");
	outputCodex("\n\nThey achieved spaceflight roughly 1,000 years before humanity did, and within a few centuries set about colonizing their star system under a strong and unified democratic government, the Gryvain Heartland Republic. During this period of exploration and settlement, the gryvain encountered another sapient race in their system, the tauric ehmris, who were still at a tribal level of technology and were quickly put through the gryvain equivalent of the U.G.C.’s Upliftment program that has resulted in the ehmris joining the gryvain in a near-equal status in society and military roles, though they possess little political power in the Republic.");
	outputCodex("\n\nWhile the gryvain were constrained to their home system for over a thousand years after achieving space flight, they nevertheless developed highly advanced starships -- rivaling that of the U.G.C. Fleet -- for use within their territory, though largely of a mercantile or scientific role. When a Warp Gate first arrived in the gryvain’s system, they were given several decades to study the device and prepare their defenses for alien contact: when the first Confederate scouts poured through the gate during the 10th Great Planet Rush, they were met head-on by a fleet of converted warships, as well as a large and heavily militarized space station that had been hastily constructed at the nearest Lagrange point. Thankfully, both the Confederacy and Republic desired peace, and the tense First Contact was resolved through diplomacy rather than force of arms.");
	outputCodex("\n\nThe gryvain were quickly and easily accepted into the Confederacy, and soon joined their interstellar neighbors in a mutually-beneficial cultural exchange. Since first contact, they have greatly expanded their nation’s colonies outside their home system. This, and the gryvain’s relatively strong and unified central government in the form of the G.H.R., has helped the relative new-comer race to gain some foothold in galactic politics.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("The gryvain have advanced starship technology, equal to or slightly better than that of most Confederate member states, as well as highly refined terraforming processes and their own strain of gene-therapy, nanomachine, and cosmetic transformative research that has allowed them to find a strong place economically in the greater galaxy. Gryvain-produced starships are always in high demand, especially among those seeking vessels well-suited to research, high-yield trading, and passenger capacity.");
	outputCodex("\n\nAfter several planet rushes, the G.H.R. has made terraforming a veritable art form, and are notable for having created several beautiful resort and luxury planets from otherwise desolate worlds. The Republic frequently contracts with the Confederacy to sculpt or refine worlds to spec, and their diplomatic corp has become quite adept at making contact with and uplifting native populations. While the gryvain enjoy the image of them spreading civilization and beauty across the galaxy, their rapid perfection of planetary renovation and inhabitation has an entirely selfish cause. Unlike most long-lived races, the gryvain have an exceptionally high birthrate and reproductive drive, which means that new worlds are in constant demand to counteract the growing populace. Thanks to the regular Planet Rushes, the gryvain have been able to relax their previously-stringent governmental population control, instead allowing their expanding generations to inhabit distant stars as colonizers, settlers, and immigrants in equal measure.");
	outputCodex("\n\nDespite their rapid expansion, gryvain military technology is notably lacking. They have fairly advanced plasma and laser weapons, but no standing military to speak of, and much of their green-collar work is privatized to Nova Securities or their home-grown robotics companies. Gryvain security, both on and off-world, is largely handled by drones and A.I.-controlled craft, as unlike most human societies, gryvain appear to have no paranoia about a supposed “robot uprising,” and happily let A.I. control any aspect of their security or infrastructure they themselves cannot be bothered with, especially in remote colonies. Gryvain-made A.I. is generally regarded to be among the most convincingly life-like and emotive, and among the most reliable technologically and personally. It’s no surprise that KihaCorp has a strong presence on their homeworld, and employs a large number of gryvain.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Gryvain");
}
public function ovirCodexEntry():void
{
	clearOutputCodex();
	showBust("ALISS");
	outputCodex(header("Ovir"));
	outputCodex("<i>You know peacocks? Like them. Only reptiles.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Ovir");
	outputCodex("\n<b>Sexes:</b> Male & Female.");
	outputCodex("\n<b>Height:</b> Averages between 4\' 6\" and 6\'.");
	outputCodex("\n<b>Weight:</b> Averages between 90 and 160 lbs.");
	outputCodex("\n<b>Hair:</b> Human-like hair on top of head, can be brown, black, red, blonde, or green.");
	outputCodex("\n<b>Eyes:</b> Two vertically slit, reptilian eyes. No sclera, iris dominates the eye.");
	outputCodex("\n<b>Ears:</b> Two ear holes on each side, no pronounced ears.");
	outputCodex("\n<b>Homeworld:</b> \\\[REDACTED\\\]");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Most of an ovir’s body is covered in thin scales, with bare patches encompassing the face, the crest of the head, and the groin. Hair grows out from the scaleless patch atop the head, and is usually left uncut unless the individual is in an occupation where long hair would prove a hazard. A long tail extends from the back of the body, and the ovir can use it to manipulate objects with near-prehensile facility, limited only by its unwieldy thickness. The anus is sited at the base of the tail, and a cloaca runs from a short way away up to the front of the groin.");
	outputCodex("\n\nEyes are uniform in color, with irises covering the whole of the visible eye and slit pupils that widen in low light. They possess human-like teeth with pronounced canine teeth. The species exhibits strong sexual dimorphism; females are a uniform drab brown or olive green, while male scales can exhibit bright primary colors from purple to green, missing only blue, with combinations of colors and patterns possible.");
	outputCodex("\n\nBoth sexes have pronounced deposits of body fat on the chest, resembling breasts, though these are far more prominent in the males. These ‘breasts’ are used as mating displays, with the males having the largest displays and the brightest colors being generally regarded as most desirable. The ‘breasts’ do not naturally possess nipples or lactate like those of mammals, but since coming into contact with other species, body modification to allow one or both of these features has become common. These, after simple enhancements to increase the size and therefore desirability of an individual’s breasts, are the most frequent cosmetic procedures performed in ovir society.");
	outputCodex("\n\nJuvenile ovir are dull green without exception until their second year after hatching, when they begin to develop their adult color. It is possible to have the baby sexed by a medical professional prior to the emergence of adult colors, though some communities frown on the procedure, choosing to treat all children identically until the children decide on gender roles on their own. ‘Breast’ growth, triggered by the layering of fat deposits, is slow but steady during adolescence, with affluent diet and early development being a predictor of large size. Most ovir will begin developing breasts and other secondary sexual characteristics at 16 years of age, though famine may delay or even prevent this, leaving the individual in an undesirable state of ‘mature childhood’.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Ovir tend to assimilate easily into the greater galactic society, thanks in part to their superficial resemblance to the humans which make up the majority of it and the similarity of their industry and culture to pre-space human society: prior to the introduction of space travel, ovir had achieved manufacturing processes and information technology analogous to late twentieth-century Earth. Males and females are generally equal in social standing, though males tend to be more subtly competitive as an outgrowth of their need to display sexual fitness. Unlike most humans, however, ovir tend to be polyamorous and bisexual, keeping several nonexclusive mates throughout their lives. Single-night partner swaps are frequent and generally considered a sign of a healthy community.");
	outputCodex("\n\nChildren are raised in latchkey fashion, and it’s common to see the child of a couple stay with a neighbor or one of its parent’s lovers when its parents are away from home or otherwise invalidated. As consequence, communities develop a friendly, inclusive ethos and are quite welcoming to all but the most unusual visitors. However, this form of upbringing tends to result in a mild form of intellectual stagnation within homogeneous colonies as most children acquire the opinions and politics of the greater ovir community.");
	outputCodex("\n\nSome colonies in the upper range of wealth have lately been observed deviating from this norm, wherein eccentric groups of males or females will use their affluence to maintain extensive harems of the other sex in luxury and eject or trade away excess children of the unwanted sex, as a sort of return to the dynastic days of the homeworld’s ancient past. The implications of this trend on ovir society and on their image in the U.G.C. as a whole are yet to be seen.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Ovir reproduction is a near-standard affair. When a male is stimulated enough, a penis will emerge from his cloaca, generally extending between 8-11 inches but with extremes ranging from 4 to 14. The penis is uniformly thick along its length and ends in a blunt tip with a slightly raised edge. The male places this penis inside his partner’s cloaca and thrusts until climax, whereupon he ejaculates semen produced by glands within his abdominal cavity. In the case of a male copulating with a female, she may shift into a front-mount or missionary position before ejaculation, in order to allow him to slide his penis all the way past the entrance and up to her uterus, to grant a greater chance of fertilizing a large number of her eggs. To be offered such an opportunity is a sign of great affection. Particularly effeminate males sometimes emulate this behavior during intercourse with other males, though only when being taken anally or with extensive body modification as otherwise the male cloaca is not deep enough.");
	outputCodex("\n\nIn situations where the female does not favor the male, wants multiple sires for her clutch, or does not want to lay at all, she attempts to hold him away and allow him to ejaculate no further than the deepest part of the cloaca; she may force him to pull out entirely. Female ovir tend to ovulate in response to environment and biological cycle equally; adequate diet and warm conditions mean larger and more frequent clutches are possible. In general, a female is able to produce a new clutch every 28 days, though many ovir suppress this with medication.");
	outputCodex("\n\nUpon fertilization, eggs are typically laid within 3 days. Poorer ovir are forced to sit their own eggs, but incubators are the norm in most modern homes, allowing the parents to go about their business during the five month gestation period. Upon hatching, the young hammer their way out of the egg with a calcified spur at the tip of their powerful tails. Though the children are able to eat most adult foods within the day, many ovir parents, enamored with human culture, will use modified breasts to nurse their young with milk. Oddly, males seem to embrace this behavior more than females.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Ovir");
}
public function galotianCodexEntry():void
{
	clearOutputCodex();
	showBust("CELISE");
	outputCodex(header("Galotians"));
	outputCodex("<i>Galotians are voracious protein hunters, but they’re not truly dangerous.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Galotian");
	outputCodex("\n<b>Homeword:</b> Galotia");
	outputCodex("\n<b>Height & Weight:</b> Highly variable");
	outputCodex("\n<b>Coloration:</b> Highly variable, typically matches the local environs for camouflage purposes.");
	outputCodex("\n<b>Lifespan:</b> Indefinite. Galotians show no signs of aging or cellular degeneration.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Galotians were the first species encountered with any true shape-shifting potential. Discovered during the chaotic second Planet Rush, they were originally thought to be hostile predators. Early explorers fought tooth and nail to stop themselves from being enveloped in the horrifying blobs of goo that rolled out of Galotia’s swamps with little success.");
	outputCodex("\n\nThese unfortunate first victims often did not survive the curious creature’s attentions. The galotians did not understand most species’ need to be exposed to gaseous oxygen in order to remain alive. Rather than devour the resulting corpses, the living oozes spat out the lifeless bodies and lumbered away. For no explicable reason, ‘Attacks’ died away almost entirely after the first week of contact with the rest of the galaxy. Plans to declare the planet unfit for colonization were scuttled, and more and more visitors came to the wet, swampy planet, seeking riches amongst the muck.");
	outputCodex("\n\nGalotia was mineral poor, unfit for most kinds of farming, and only rich in diverse, if seemingly useless life. Interest in the planet died down until only a few long-term biological survey teams remained. They observed the native galotians enveloping other creatures, sometimes for hours at a time, then releasing them, seemingly unharmed.");
	outputCodex("\n\nWhile studying this phenomenon, the scientists made little progress. It wasn’t until near the end of the survey that a massive and unexpected breakthrough finally happened.");
	outputCodex("\n\nA galotian, one of the native blob monsters, appeared at the edge of camp in the shape of one of the younger, shapelier researchers. It was an almost perfect simulacrum aside from its monochromatic color scheme and glistening, wet skin. The galotian even molded her body to mimic the appearance of the scientist’s nightclothes.");
	outputCodex("\n\nThen, it spoke in broken ausuri, apologizing for killing an explorer nearly a year ago.");
	outputCodex("\n\nThe expedition was thrown into chaos. No one had thought these seemingly simple creatures could be sapient, and the very idea of one learning a core language unaided rattled every assumption about this planet and its ecosystem.");
	outputCodex("\n\nThat galotian called herself Galos, and her influence paved the way for normalizing interactions between Galotia and the rest of the galaxy. Once galotian feeding habits were understood and the gooey aliens learned how not to kill their “prey”, they became sought-after companions the galaxy over.");
	outputCodex("\n\nThe troubled history of Galotia is held up across the galaxy as the original success story of long-term planetary surveys and as reason enough to continue funding studies on every survivable rush planet.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Feeding Habits"));
	outputCodex("These sentient goo creatures are widely considered some of the most empathic beings in the known galaxy. Rather than devouring plants or flesh, they use their naturally mutable shape to stimulate their prey into releasing copious amounts of sexual fluids. They see it as trading pleasure for sustenance, a kind of self-imposed biological prostitution.");
	outputCodex("\n\nThe concept of rape is something they struggle with as a race. Seeking consent goes against their every base instinct, but with sufficient exposure to galactic culture, they’re more than happy to only feed from willing lovers. Galotians are prized as shipboard companions by many a lonely captain, serving as a source of company and physical intimacy in an immense, dangerous galaxy.");
	outputCodex("\n\nGalotians can subsist on almost anything: protein pastes, meats, plants, or even scraps of bone. They dislike such fare, seeming to desire bringing their food sources to climax almost as much as actually harvesting the resulting fluids.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Biology"));
	outputCodex("Galotians in their natural form appear as amorphous blobs of a single color. Natives are usually pale, muted colors, designed to fit in with their environment and allow them to surprise their aqueous prey for feeding. Those living in the greater galaxy have learned to eschew such subtle thinking, picking brilliant hues from every color of the rainbow to pigment their soupy forms with and shaping themselves into ludicrously endowed female forms, the better to procure semen. Vaginal secretions are far less nutritionally dense, though some galotians have taken on male appearances and demeanors to pursue races with abundant lactation or more useful secretions.");
	outputCodex("\n\nTheir cells are highly conductive multipurpose organs, capable of relaying nervous system messages as easily as shifting nutrition around. These cells are more than ready to alter their purpose on demand, swapping between multiple sets of DNA in order to rebuild themselves for a new purpose. Some older, more experienced galotians are even capable of incredible feats of self-induced bio-engineering, producing chemical and biological cocktails to permanently increase a sexual partner’s usefulness as a food source.");
	outputCodex("\n\nGalotians are as adept at feeding on their own cells as easily as they are at feeding on anything else, causing them to grow or shrink in accordance with their nutritional needs. This is effectively a double-edged sword for these liquid ladies. Since every cell effectively functions as a neuron, a lack of feeding can lead to a loss in intellect. Starving galotians can become as small as a basketball before temporarily losing sapience. Death typically occurs soon after.");
	outputCodex("\n\nOn the other side of the spectrum, extremely well fed galotians can grow as large as elephants. At this size they are at their peak physically, capable of shaping their mass in impressive ways. Oddly, they do not display a marked increase in rational intelligence. The extra processing power afforded by more neuron-like cells seems almost entirely dedicated to bioengineering their own form.");
	outputCodex("\n\nFew galotians ever rise above average intelligence. Most consider them a fairly dim, easily excitable race, unaware of the brilliant bioengineering that they perform at an entirely subconscious level.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Galotians reproduce entirely asexually. Asexual reproduction has many disadvantages, but these ‘goo-girls’ get around most of them by virtue of their own malleability. They only reproduce when they have a large amount of body mass, and it is at this time that they’re best able to alter their own forms, even capable of adjusting the DNA strands in different portions of their bodies.");
	outputCodex("\n\nEvery galotian will spawn a half dozen daughters once she accumulates enough body mass, each with her own hand-tailored, evolutionary adaptations. The young galotians emerge fully formed and, with a portion of their mother’s memories, often retaining abilities like speech and literacy in their entirety. The loss of so much mass will bring the mother down to a few hundred pounds of weight, her daughters each easily a little heavier than the average terran.");
	outputCodex("\n\nKeeping a galotian from reproducing is easy. Simply manage her food intake so that she never grows too large. Of course, the chance to feed a galotian can be difficult to turn down, particularly if one has managed to alter the sexual organs or sex drive of their victim.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Place in the U.G.C."));
	outputCodex("Galotians do not seek traditional jobs or employment. They desire warmth, companionship, and sexual fluids. Invariably, they wind up serving as sexual companions, indentured servants, or sources of cheap genital enhancement. Many serving in long term jobs soon forget about collecting payment so long as suitable living areas and food are present.");
	outputCodex("\n\nNonpayment of a galotian indentured servant has been considered a serious felony after the parliament passed the Galotian Rights Act in response to a rash of mistreated goo-girls.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Backlash"));
	outputCodex("The Church of the One God maintains that galotians, and creatures like them, are demons given flesh to tempt us in this mortal realm. Many marriages have collapsed in response to galotian immigrations. Some worlds ban them from securing residency in order to prevent the disastrous effect they can have on monogamy. Others require troubled trios to enter into counseling together. Such treatments are reported to save 90% of marriages, even if the galotian winds up living with (and servicing) both partners.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Galotians");
}
public function anataeCodexEntry():void
{
	clearOutputCodex();
	showBust("FAZIAN_1");
	outputCodex(header("Anatae"));
	outputCodex("<i>Ad maius bonum.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Anat");
	outputCodex("\n<b>Sexes:</b> Male (85%), Female (15%)");
	outputCodex("\n<b>Height:</b> Both sexes range between 5\' 11\" and 6\' 4\"");
	outputCodex("\n<b>Weight:</b> 160 to 200 lbs");
	outputCodex("\n<b>Hair:</b> Anatae males have a plume of feathers on their crowns, which can reach two feet in length. Both sexes have small tufts of feathers on the outsides of their elbows. These feathers come in many different colors, often artificial.");
	outputCodex("\n<b>Eyes:</b> Almost universally light blue. Anatae generally have exceptionally good eye vision, in clear conditions able to discern activity over 5 kilometers away.");
	outputCodex("\n<b>Ears:</b> In contrast, anatae do not have exterior pinna and whilst their hearing is technically about as good as a human’s, they struggle to pinpoint the source and direction of sounds through that sense alone.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Body Structure"))
	outputCodex("Descended from the flightless avians of Caphist, anatae are digitigrade bipeds with four clawed digits at the end of each of their keratinous limbs. The tough horn that plates their limbs also grows over their faces, forming a flat, white or orange “mask”. These masks come in a variety of shapes and sizes, and are sometimes decorated. Anatae have longer necks than most sentient creatures of a similar size, which combines with a slightly arched back to give them a bird-of-prey-analogous reared hold of the head.");
	outputCodex("\n\nAnatae are oviparous and duly have neither breasts or nipples. Other than that their torsos are similar to that of a toned, athletic human or ausar male - fleshy and tightly muscular. They have a range of skin tones varying from dark blue to rust red.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction & Sexual Dimorphism"));
	outputCodex("Male anatae have feathered crests that in their distant past they used to attract mates; they are a minor erogenous area, similar to an ausar’s ears. Unsurprisingly male anatae generally regard their plumes with a great deal of personal pride. Limp or scruffy feathers in males are usually a sign of sickness or depression. Both sexes feature small tufts of feathers at their elbows. These are major erogenous areas.");
	outputCodex("\n\nAlthough they otherwise physically differ little from males, female anatae have wide hips that allow them to lay large clutches of eggs without difficulty. Although they do not have clitorises, anatae vaginas have multiple lips, some of which are described as just as sensitive. Male anatae penises can reach around ten inches in length. Although thinner than a human or ausar’s member, they feature a large bulb at the top with a few small, blunt tips which supposedly help to induce ovulation. Without significant gene modification anatae cannot interbreed with aliens.");
	outputCodex("\n\nFemale anatae lay around 15-20 eggs per clutch; the babies hatch after a month’s incubation, and reach maturity after about five years. Whether the anatae evolved their gender imbalance as a result of how swiftly they are able to breed or vice versa is a matter of scientific debate. Alien races have been politely asked not to refer to this as a ‘chicken or egg question’.");
	outputCodex("\n\nFemale anatae are instinctively driven to mate with as many suitable males as possible, to widen the genetic range of their prospective children. Between each other anatae relationships rarely last longer than half a year as a result. Children are raised collectively either by the female anat’s larger family, or by the anatae state in “bevies”.");
	outputCodex("\n\nAway from females male anatae usually have very low libidos, only beginning to produce their form of testosterone when in proximity of females. Cases of homosexuality, and male anatae “fooling” their bodies through the use of female garb and the hiding of crests, are well documented. The number one fetish for male anatae is harem-keeping, an impossible decadence for them in normal society; the second is long term relationships, a laughable kink to most aliens but again virtually impossible for an average male anat amongst his own kind.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture"));
	outputCodex("The importance that scarcity awarded females in anatae society meant their culture evolved to naturally centre around them. In traditional anatae society females generally functioned as figurehead leaders and nurses whilst the males functioned as doers at every level. In time females came to symbolize the economic side of an anatae nation, males the military and utility side. Nations would traditionally employ a king and queen analogue, who though rarely mates would sit at the top of their hierarchies and come to decisions of over-reaching importance together.");
	outputCodex("\n\nTheir gender imbalance and the fairly harsh conditions of Caphist catalyzed the anatae to culturally evolve along quite militantly utilitarian means, with everything centred towards the public good. Males were expected to be self-sacrificing to the extreme, females expected to stay firmly within the bounds of home or city and breed. Anatae communities tend to be extremely safe and well run but rather drab to most aliens’ tastes, anatae having come around to the concept of art and the indulgement of creativity quite slowly.");
	outputCodex("\n\nDespite this militancy the concept of the greater good came to take on enough over-reaching importance to the race for them to develop a profound distaste for war and the inflicting of unnecessary casualties. Novice alien historians are often flummoxed by the fact that the most famous and honoured war heroes in anatae history are usually ones who engaged in the shortest battles, or even ones that didn’t fight at all, having prevented war with a piece of decisive diplomacy.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The anatae were the third sentient race discovered by the newly founded U.G.C. At the time the anatae were already experimenting with faster forms of space flight, and were on the road towards global unification. The discovery of other, more advanced forms of life swiftly completed that process as a point of necessity, and the anatae joined humanity and the ausar in colonizing the stars.");
	outputCodex("\n\nAlthough initially delighted to discover other peaceful races willing to share their technology with them, tensions quickly developed between the anatae and other U.G.C. members. The anatae resented what they felt was a united front directed against them from humanity and the ausar, disliked the corporate nature of humanity’s space exploration and found the speedy nature of the ausar’s deployment of warp gates chaotic and reckless. In turn humanity and ausar found both the militancy of anatae culture and the rapidity of their colonization deeply alarming. Matters had reached an almost cold war-like state when the thraggen were discovered.");
	outputCodex("\n\nThe anatae served with distinction during the galactic war, their belief in self-sacrifice leading them to stubbornly hold the front line against the thraggen with a numerically inferior navy, whilst the ausar mustered the decisive counter attack behind lines. Relatively speaking the anatae suffered more casualties than any other U.G.C. race during the war, a badge they wear with a mixture of pride and embarrassment to this day. Although memories of the war have long since faded, ties between the U.G.C. and the Anatae Empire have remained cordial if occasionally strained ever since, largely kept in place by the Galactic Rush Treaty. The anatae retain the largest and most modern land army in the galaxy; if the U.G.C. were ever threatened again, a significant proportion of the ground-side response would come from them.");
	outputCodex("\n\nGalactic Relationships and Colonization: The anatae are one of if not the most active colonizers in the galaxy and this, coupled with their early membership to the U.G.C., has allowed them to spread their influence over large parts of the Milky Way. Their overwhelming, multilateral approach to colonization has earned criticism in some quarters as aggressive and repressive, and has earned them the nickname ‘the annex-y’; the anatae hierarchy maintain that it is lawful, systematic and far more beneficial to the galactic good than comparable efforts in the long run.");
	outputCodex("\n\nOnce a galactic rush has begun the anatae hierarchy sends out scores of scouts through each linked gate, and screen potential planets as candidates for colonization. Unless the situation is urgent the screening process is slow and stringent, with the anatae leadership eager to avoid wasting resources on worlds either without long term benefit or on native populations likely to chafe under their rule. This often loses the anatae time over hastier races, but as they are certain in their ability to apply leverage to alien colonists and concentrated on the long term, this only troubles them if the colonists in question are liable to do damage in the duration it takes them to earmark a planet for annexation.");
	outputCodex("\n\nOnce a planet has been earmarked the empire sends thousands of colonists to it, who employ state-owned companies to build upon it, who in turn are able to aggressively undercut other providers. Military spacecraft are deployed to the system to protect it against piracy; it has been noted that anatae bureaucracy makes it difficult for non-anatae-aligned ships to enter and leave systems under their control on a regular basis. Usually a system has been unofficially under anatae control for some time before it is rubber-stamped through the U.G.C., the anatae-affiliated colonists easily able to outvote any other colonists if it comes to a ballot.");
	outputCodex("\n\nThis multi-level approach is only possible thanks to the militantly organized nature of a huge and overwhelmingly publically-owned society, with even the most powerful human and ausar corporations usually unable to compete with the Anatae Empire once it has set its sights. Unless the prize is particularly great the anatae generally try to avoid coming into conflict with other established colonists however, and it should be noted that races under the aegis of the anatae consistently rate a high approval of their rule, with many anatae-uplifted races serving within their navy and public works. Culturally the anatae express a paternal concern for non-uplifted sentience, and often leave particularly interesting planets they come into possession of virtually untouched, as imperially owned ‘park worlds’.");
	outputCodex("\n\nOn the interstellar stage the anatae are fairly introverted and are rarely seen outside of their planets except in official capacities. During galactic rushes they are much more visible, with frontier stations and colonies sometimes flooded by anatae on shore leave. The preponderance of female or feminine-appearing races in the galaxy means that male anatae retain an ausar-like libido in alien society, and because of the general lack of opportunity on their own planets can be quite sexually aggressive. As a rule the anatae regard the U.G.C. as chaotic and corrupt, but also a useful ‘release valve’, and place great value on the sophisticated creative works that other races can produce, such as art, music and gene-mods. In turn humans and ausar resent the anatae for demeaning wider galactic society in this way, however respect the structure, industry and safety they generally bring with them.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Anatae");
}

public function cundarianCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["STORMGUARD_MALE"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Cundarians"));
	outputCodex("<i>You can’t have space without physically intimidating goats.</i>\n\n");
	outputCodex("<b>Name:</b> Cundarian (Singular) and Cundarians (Plural)");
	outputCodex("\n<b>Sexes:</b> Male & Female split 50/50.");
	outputCodex("\n<b>Height:</b> Males average 6\' 4\" in height. Females average 5\' 11\".");
	outputCodex("\n<b>Weight:</b> 80-115 kilograms.");
	outputCodex("\n<b>Hair:</b> None");
	outputCodex("\n<b>Eyes:</b> One pair, slit-pupiled and generally yellow sclera.");
	outputCodex("\n<b>Skin:</b> Grey, dark blue and mauve are the most common shades.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Cundarians are digitigrade bipeds of slightly above average body mass in comparison to the galactic norm. Their males are taller and bulkier than the females, a dimorphism exaggerated further by the different lives they tend to lead. Cundarians have prominent, defined faces immediately recognisable to humans and ausar, with the average complement of two eyes, a fairly flat nose, a mouth and two fin-shaped ears. They do not grow body hair, however almost all adult males sprout small tentacles from their chin and jaw. These grow slowly over the course of a male cundarian’s life, displaying how old they are. All cundarians grow plated ridges from their brows across the top of their heads, and sometimes long, dreadlock-like tentacles as well. Whether head-tentacles are present, and the size and shape of the ridges, is dependent upon an individual cundarian’s ethnicity.\n\nCundarians have a slightly top-heavy, muscular frame most notable in their males as a result of an evolution spent mostly climbing the mountainous regions of their home world of Samaria. For the same reason they have blunt, balance-imparting tails, and their legs are hoofed; three toed and keratinous, perfect for traversing rocky, vertiginous territory.\n\nProbably the cundarians’ most remarkable bodily feature is their ability to enter a torpor-like state in extreme temperatures. Across most of their body, their skin is smooth but tough, pebble-like. When they enter torpor, the chemical composition of their epidermis changes to further toughen until it enters a rock-like state across the entirety of the cundarian’s frame, virtually impervious to outside conditions. This necessitates the cundarian freeze in place, as well as drastically slowing their body and cognitive functions, but allows them to survive atmospheric conditions that would kill others for days at a time.\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Outwardly, cundarians have a sexual arrangement which is immediately recognisable to most of the rest of the galaxy. Males grow a quartet of testicles and a large, free-hanging, blunt penis; females grow a spacious vagina behind a stony cloaca. The nature of their reproduction however is unique, thanks to the physical qualities of cundarian semen.\n\nImmediately after ejaculation, cundarian semen is a moist, foam-like substance. If allowed to settle, it holds its shape and hardens into a smooth, tough but lightweight solid. After insemination has occurred within a female cundarian’s womb, the semen forms around the fertilised ova, and in a relatively short amount of time becomes a hard-shelled egg that the female can then give birth to. This enables cundarians to lay large ova much faster than they ordinarily would be able to, vital for them given that only one is laid per batch and the high turn-over of their population (see below).\n\nBeing oviparous, female cundarians do not have breasts, but do have large hips and backsides to enable frequent egg-laying. Cundarian penises are muscular and the male’s orgasm particularly powerful in order to ejaculate their semi-solid cum. A popular practice in traditional cundarian relationships is for the male to “seal” the female’s vaginal entrance with a plug of semen, broken only by the egg’s birth. This has the effect of constantly arousing the female via rubbing and stretching, “proving” her chasteness and loyalty to her partner by leaving it unbroken nonetheless.\n\n");
	outputCodex(blockHeader("Culture"));
	outputCodex("The cundarians are a patriarchal society who place great value in honor earned through battle or personal hardship. Their very name is a samarin term meaning “bloodthirsty savage”, subsequently adopted with pride. Although their traditional values have mellowed through exposure to the outside galaxy, it is still rare for non-cundarians to meet female cundarians - they are largely confined to home worlds and colonies, where they are expected to raise children and maintain the social fabric. Male cundarians often express a desire to protect the moral sanctity of their females, a viewpoint they feel is confirmed by the licentiousness of a largely effeminate outside galaxy. This is not to say females wield absolutely no power within cundarian society - owners of property and land as a matter of course, they are traditionally the ultimate arbiters as to whether a male has earned enough honor to breed and hold station or not.\n\nCundarian honor is earned through vanquishing foes in battle or by overcoming intimidating trials of the body or mind. Mere strength or stamina are only one facet - tactical or technical brilliance are celebrated equally, if not more so. Whatever is materially gained from said battles or trials is of distant, secondary importance. Reports abound of cundarian raiders defeating colonial patrols and merchant convoys before simply leaving them without actually taking or killing anyone, the filmed proof of their victory enough. Outside of the anatae navy and military, cundarians usually find employment in mercenary groups and pirate gangs or on particularly hostile worlds, settings in which their mettle can be tested.\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("When the anatae discovered Samaria and uplifted the samarin in the Fifth Planetary Rush, little thought was given to the planet’s other sentient species, who unlike the literary-minded and sophisticated samarin were war-like, barely beyond the Bronze Age and confined mostly to the planet’s mountainous regions. In their early history the cundarians had brutalized the samarin, using their superior strength and aggression to tyrannize them across large tracts of the planet. Eventually, thanks to the samarin’s greater interest in and grasp of technology, they drove the cundarians back into the infertile wastelands of Samaria, where they subsequently lived a backward existence.\n\nUnsurprisingly the samarin had a negative cultural view of the cundarians, and advised the anatae against attempting to uplift them as well. The cundarians’ natural love of adventure however saw them escape their planet anyway - mostly thanks to careless slavers - and eventually the Empire was forced into the difficult process of officially integrating them as well.\n\nHow successful that process was is debated. The anatae have ameliorated but never truly curbed the species’ entrenched traditional values, and cundarian raiders and pirates are a constant menace along new frontiers and poorly policed regions of space, a source of tension between the Empire and the rest of the U.G.C. They have however proved their worth many positive contributions elsewhere. Many of the Empire’s chief military and naval advisors are cundarian, and the first boots on the ground in any imperial intercession are invariably owned by cundarians (many of whom would refuse to serve if that wasn’t the case). Cundarians are also willing to colonize worlds most races would regard as out of the question, making them perfect for crewing mining installations and power plants on planets with hostile climates. The anatae generally view the cundarians as worth their boisterousness, given their willingness to serve at the sharp end of the Empire’s quest to spread its influence to as much of the galaxy as possible.\n");
	CodexManager.viewedEntry("Cundarians");
}

public function daynarCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["LANE_M", "LANE_F"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Daynar"));
	outputCodex("<i>Not all lizards are untrustworthy: Just most.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Daynar");
	outputCodex("\n<b>Sexes:</b> Male & Female");
	outputCodex("\n<b>Height:</b> Males - 5\' 9\", Females - 5\' 7\"");
	outputCodex("\n<b>Weight:</b> Males - 150 lbs, Females - 140 lbs");
	outputCodex("\n<b>Hair:</b> None");
	outputCodex("\n<b>Eyes:</b> Slit, reptilian irises. Sandy brown sclera, but self-controllable iris color.");
	outputCodex("\n<b>Skin:</b> Tough, leathery epidermis, covered in a layer of scales. Varying textures and shades of brown; front is smooth and light, whereas the rear is rougher and darker.")
	outputCodex("\n\n");
	outputCodex(blockHeader("Physical Features"));
	outputCodex("Both male and female daynar have slender, trim, streamlined bodies, and from a glance it’s difficult to tell them apart. A male has a flatter, broader face, while a female’s is more angular; a male is also thicker across the chest while a female is fatter in the waist, but both of these are miniscule differences. Their hands each have four digits and their digitigrade feet each have four toes; on the end of each finger and toe is a short, stubby claw, good for puncturing and not letting go but poor for actually tearing. Each hand and foot is webbed.");
	outputCodex("\n\nThey have elongated faces, their noses reaching roughly 12 cm from their faces, and they are hooked downward and to a point. They have an average sense of smell. They have strong jaws, and unlike the common lizard, their cheeks are elastic, capable of ballooning slightly, like a human’s, to store food. In light of that fact, their side and rear teeth are actually flat whilst their front eight teeth- four on top and four on bottom- are sharp incisors. Their lips are typically thin and colorless, but they do have lips. Their tongues are long and wide, but thin. Their ears are little more than dark holes on the sides of their heads, resting at eye level, but despite that, they have extraordinary hearing.");
	outputCodex("\n\nConnecting their necks to the tips of each of their shoulders is a thin membrane, only about one inch thick. They are commonly referred to as ‘tassels’. It originally came about as an evolutionary advantage; the membranes regulated blood flow from the body to the head and could control the creature’s body temperature depending on the climate, and they could be flared to intimidate predators. Once the Daynar evolved to their more humanoid form and they began living more civilized lives, the tassels lost their defensive purpose, and climate control makes regulating their body temperature easy, but they remain as vestigial evidence of their origins. Many daynar have taken to ‘decorating’ their membranes, painting tattoos and designs on them, and adorning them with all manner of piercings.");
	outputCodex("\n\nThey are a cold-blooded species. A unique feature of the Daynar is that their blood is luminescent: their oxygenized blood glows a healthy red through their skin, and is most easily visible through their tassels. Blood that is not oxygenized glows through their skin as a pale blue. Before they evolved, the blood made it difficult to hide from predators, especially in the night, the strength of the glow was used as an indicator of the individual’s health and fertility/virility, and a specific pulse pattern signified if a female was in heat. The Daynar were hunted for a short stint in their existence for their blood, which was used in mood lights and as a status symbol, until they gained sapience.");
	outputCodex("\n\nA male’s penis averages roughly 21 cm in length (roughly eight inches), and is smooth all over; the penis’s skin is thick all around and conceals all veins. It has a tapered, pointed tip. It has a general width of 7 cm, but as intercourse continues, the width will inflate to an average of 12 cm. Variances occur between individuals, of course. A female’s vagina is narrow and deep, and they do not have clitorises. A male’s penis is most sensitive at the base, and a female’s vagina is most sensitive at the lips and deeper within the body: these were evolutionary incentives to plant the seed as deeply as possible for ensured survival of the species.");
	outputCodex("\n\nTheir sexes are concealed within a vertical genital slit, roughly 7 cm in length and only 2 cm across when unaroused. The genital slit is rough and tight, to protect against the elements, but is easily malleable on arousal. Depending on the asset of the male, the genital slit could bulge with his flaccid penis even when not aroused. The male’s testicles are internal.");
	outputCodex("\n\nThe Daynar have tails reaching from the small of their back to the calf of their legs, and are totally smooth all around, unlike the rest of their bodies. The tails were originally much shorter, but because of their new bipedal stature, they have been evolving to grow longer to assist with balance. Their anus is located at the base of the tail; they have not evolved gluteal muscles, and thus their anus is poorly concealed, save a lowered tail. They also cannot sit on hard surfaces for long because of this.");
	outputCodex("\n\nFemales do not have breasts. Both the male and female form is completely flat and streamlined. Because they are cold-blooded, they also do not have nipples. Thanks to the advances of modern science and medicine, they can have both breasts and nipples, but they’ll be obviously unnatural. That said, the Daynar’s more carnal preferences evolved with their sapience, and breasts of any size on females are considered something of a status symbol – and are more desirable.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Hot, arid, dry environments such as deserts and rocky mountains.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Originally, a Daynar’s sense of self-preservation and survival of the species made it much like any other single-minded beast: eat, breed, and survive as long as possible. When they evolved to have a higher form of thinking, their sexual appetites grew with them: they sought out sex for the pleasure and recreation rather than strictly the procreation. As their species transitioned, they entered an era where they bred continuously, and in as many imaginative ways as possible, regardless of gender, age, and relationship. Social stigmas and taboos didn’t surface until as recently as several hundred years ago, when food became too scarce in their harsh living environments and they resolved to dial back their nonstop breeding.");
	outputCodex("\n\nA mating couple can take any position, though missionary is favorable because of the smoothness of their front scales. A female’s vagina is most sensitive the deeper her mate penetrates her, as well as at the lips of her vagina: the purpose being to want the male’s penis to penetrate as deeply as possible so that there would be a more likely chance of impregnation. Likewise, a male’s penis is most sensitive at the base, so that he would instinctually want to penetrate with his entire length. The male’s penis also engorges during intercourse, in an effort to lock the semen inside the female. Depending on the assets of the male, the female might find this unpleasant. Oral sex is more popular with more ‘gifted’ males.");
	outputCodex("\n\nDaynar lay eggs as opposed to live birth. The eggs are very small (compared to an adult female Daynar), at roughly 11 cm (four inches) across – this is so the mother gains as little mass as possible during gestation. They are spherical. A typical clutch is only between three and five eggs, and even then, a natural birth meant none of them were guaranteed to hatch. As the Daynar improved their quality of life and medicine, the chances of any fertilized egg hatching successfully increased exponentially. In a modern life, it’s very unlikely that a fertilized egg would not hatch – and to combat the sudden, massive boom in population that would occur, JoyCo supplies nearly-free birth control pills for the female Daynar to regulate how many eggs she would lay: anywhere from one to seven, if she wanted.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The Daynar were a lizard-like species on the planet Venar. They were originally a very simple-minded bestial race, with one-track minds and quadruped structures. As the Daynar evolved, so too did their predators, until the lizards had advanced their intellect until they were roughly equivalent to modern Earth dogs. Climate changes in the planet devastated its lush forests and wetlands, reducing most of it to harsh desert, which wiped out the Daynar’s natural predators and gave them a vastly expanded biome to inhabit and explore. Their evolution did not stop until they had the same intellectual capability as any human.");
	outputCodex("\n\nTheir smooth fronts are attributed to the way the Daynar’s ancient ancestors slithered and waddled over the hard, rough stone; and over and under and through the hot, coarse sand, wearing their skin thin, soft and smooth. Their diet consisted of whatever small life (insects or other, smaller, less lucky salamanders, usually) or edible vegetation they could come across; their sense of taste evolved with the rest of them.");
	outputCodex("\n\nMany of the entire species of Daynar still living on Venar are employed by Steele Industrial Technology and Production: Venar isn’t an especially habitable planet, aside from the Daynar and the Venarians. Because the Daynar prefer warmer climates and can easily exist within the scorching crust of the planet, they’re a valuable race for Steele Tech to employ as miners. They’re technically a prosperous and thriving race, but because there isn’t much food on Venar (especially since the Daynar evolved to be much larger and require more food), most of their money is spent importing it and less on luxuries. As a result, they look poorer than they are, and the uneducated tend to turn their noses up at them because of it.");
	outputCodex("\n\nThe Daynar are a very cunning species; although they lagged behind in the evolutionary race compared to the rest of the universe, they are very business savvy and they have no troubles adapting to new systems and customs. They generally pick up new languages easily, thanks to their exceptional hearing sense.");
	outputCodex("\n\nHowever, because they were generally at the bottom of the food chain pre-evolution, they rely on deceit and trickery with their dealings: dealing with a Daynar in business is always a very risky proposition. The harsh landscape they evolved on has also made them very stubborn, and they are prone to tantrums if their schemes fall through or are used against them. They are also aggressive lovers with anyone that is not also a Daynar: the unique sensitivity on their sexual organs makes lovemaking with them a very demanding experience.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Daynar");
}
public function dzaanCodex():void
{
	clearOutputCodex();
	showBust("KASKA");
	outputCodex(header("Dzaan"));
	outputCodex("<i>Dzaan are as beautiful as they are addictive...</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Dzaan");
	outputCodex("\n<b>Sexes:</b> Female (“Beta”) and Hermaphrodite (“Alpha”)");
	outputCodex("\n<b>Height:</b> 6\' 2\" to 8\'");
	outputCodex("\n<b>Weight:</b> 180 to 300 lbs, depending on build.");
	outputCodex("\n<b>Hair:</b> Extremely varied and often colorful.");
	outputCodex("\n<b>Eyes:</b> Extremely varied, usually matching hair color.");
	outputCodex("\n<b>Average Lifespan:</b> 150 Earth years");
	outputCodex("\n<b>Homeworld:</b> Heloith IV\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Despite their heavy presence on the rim in modern times, Dzaan society did not react well to the introduction of the greater galaxy, creating a schism that divides their peoples to this day. One camp, fiercely tribal and independent, avoided contact with the “sky people” and maintained a strictly isolationist worldview. The other, led by curiosity or courage, chose to embrace change, seeing a chance to fulfill prophecies of a promised land that had been unfulfilled for generations.");
	outputCodex("\n\nBoth sides proved to be correct. The isolationists’ viewpoints were reinforced by abductions perpetrated by unscrupulous slavers intent on smuggling sapient cargo. Meanwhile, the explorers integrated well into galactic society, throwing themselves at the edges of the known universe with religious fervor. Pockets were lined with riches, allowing for rich enclaves to be constructed on promising planets.");
	outputCodex("\n\nNow, many of those enclaves have become tourist hotspots, providing fabulous weather, luxurious amenities, and exotic company for those well-off enough to afford the cost. The near endless flows of credits have funded countless expenditures aimed at discovering what they now call “The Wonder World.” Indeed, adventuring dzaan almost always have custom-made craft and top-of-the-line weaponry.");
	outputCodex("\n\nWith the latest rush, many resorts have closed; these strange aliens’ attentions are firmly on the heavens. Only the isolationist tribes on their homeworld continue as they have, avoiding outsiders at all costs.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Dzaan are almost entirely human-like in appearance, leading many exotic races to have difficulty distinguishing the two. Leithans in particular seem to struggle to identify these “two-legs” but significant biological disparities do exist between the two races. First and foremost, dzaan have longer spinal cords than terrans, containing six more vertebrae, giving them a longer torso.");
	outputCodex("\n\nTheir sinuous posture does a good job at concealing the extra size, giving them an outthrust chest and subtly arched behind. Their wide hips and strong, muscular legs give them something of a sensuous gait, always seeming to display their secondary sexual characteristics for maximum effect, and the short tendons in their heels keep them on the balls of their feet.");
	outputCodex("\n\nDark skin colors are the norm for both sexes, a leftover from their tropical homeworld (and preferred climes). The only hair a dzaan will ever grow sprouts from her head, much like a human’s, though alphas typically have less than betas, owing to the keratin protrusions that often form on their foreheads, sometimes even manifesting as rounded horns. Alphas may also have these ridges on their cheeks, shoulders, elbows, knees, and feet. It is uncommon for any one alpha to have growths in all these places; many never get anything more than horns.");
	outputCodex("\n\nBetas lack the keratin protrusions but are ornamented with a variety of spots or stripes, sometimes both in complementary locations. The mechanisms behind their formation were studied for years with only middling success before being abandoned entirely. Why spend tens of millions of credits researching a gene-mod when anyone can get their own markings from a cheap tattoo artist?");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Alpha dzaan, though much rarer than betas, universally take the place of males within their society, using their lengthy phalli to impregnate harems of beta females. Though alphas have functional female genitalia, there is no record of one alpha ever successfully inseminating another, though whether this is due to cultural taboos or a biological quirk is unknown - alphas can be impregnated by humans, ausar, and other similar races, strangely enough.");
	outputCodex("\n\nThanks to their larger torsos, dzaan have much longer vaginal canals than humans, and alphas have grown to fill them. The average alpha’s phallus typically ranges from 9 to 11 inches in length, though rare cases can fall far to either side of the spectrum. Two plump balls power these reproductive powerhouses, manufacturing seed laced with numerous mildly addictive compounds.");
	outputCodex("\n\nIncubation lasts just shy of seven months, culminating in a surprisingly easy birth, owing to the excessively wide hips that many dzaan have. Mothers will lactate just like humans, providing nourishment for their growing young.");
	outputCodex("\n\nAs they grow, they undergo two puberties, the first at age eight to nine and the second around 14 to 15. The first gives them their skin markings or keratin growths as well as increased height and muscle mass. The second brings them to full maturity, enlarging both primary and secondary sexual characteristics, particularly breasts. Alphas’ balls, prostate, seminal vesicles, and penises greatly expand at this point.");
	outputCodex("\n\nThe changes females undergo are much more subdued and internally focused. The only visible one is the growth of the clitoris. It greatly expands, becoming large enough to pop out of its hood at the first hint of arousal. Tribal dzaan attach great significance to their females’ first time “popping their nub.”");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Nearly every alpha has a harem of his or her own, though the ones with the largest balls and most noticeable keratin typically attract the most mates. It does not take long for the beta females to become addicted to their alpha’s sexual fluids, ensuring that couplings are both frequent and binding.");
	outputCodex("\n\nLess successful alphas may only have one or two females to themselves, placing themselves in subservient, supportive roles to the alphas with the largest harem in the settlement. These hierarchical structures are more rigid amongst the traditional isolationists than the space faring explorers. Exposure to the rest of the U.G.C. has allowed a few females to mate outside their race and given rise to a small but vocal crowd of monogamous alphas.");
	outputCodex("\n\nThere is little strife within their leadership structure. Power struggles are virtually unheard of - she with the largest harem is obviously in charge, and should a usurper try to upset the balance, the leading alpha’s harem would simply pin the troublemaker (and her harem) down until they’re thoroughly and completely addicted to the clan leader, creating a larger, even more powerful harem.");
	outputCodex("\n\nActual violence and murder are quite rare, and despite their harshness with their own species, they prize freedom of choice, allowing females to select their own alpha once they come of age. Addicting an outsider is a massive faux pas; forcefully addicting an outsider is a crime worthy of exile. Due to their addictive abilities, lone alphas are generally to be treated with caution. Lone females are even more rare, but much less dangerous.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Addiction"));
	outputCodex("Addiction to the fluids of a dzaan alpha is a serious and difficult to break habit. Few attempt it, and fewer still succeed. Researchers theorize that the cause lies in the effects of the narcotic-like cum. It enhances submissive tendencies, relaxes the imbiber, and promotes general feelings of empathy and euphoria. Tolerance can build up, but the process is slow. More importantly, even the most well-fucked beta will tell you that she still receives a thrill from servicing her mistress.");
	outputCodex("\n\nIndividual alphas have slightly different chemical mixes, but it is possible for a harem member to transition to a new mistress with only a modicum of discomfort as she adapts to her new lady’s particular blend.");
	outputCodex("\n\nBecause of this, many dzaan alphas interested in coupling with members of other races avail themselves of over the counter drugs designed to suppress their semen’s naturally addictive qualities. Whether this is to give their partners peace of mind or to avoid the discussion altogether varies from individual to individual.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Dzaan");
}
public function fanfirCodexEntry():void 
{
	clearOutputCodex();
	showBust("GENE");
	outputCodex(header("Fanfir"));
	outputCodex("<i>Massive, deafening heart-stealers. Don’t touch hoard.</i>\n\n");
	outputCodex("<b>Name:</b> Fanfir");
	outputCodex("\n<b>Sexes:</b> Male and female, equally split.");
	outputCodex("\n<b>Height:</b> About 10\' (3 meters) tall, and roughly 40\' (12 meters) long from head to tail tip on average.");
	outputCodex("\n<b>Weight:</b> 617 lbs (280 kg) on average.");
	outputCodex("\n<b>Hair:</b> On the head and around the groin.");
	outputCodex("\n<b>Skin Color</b>: Many different natural variances between coal black and deep red.");
	outputCodex("\n<b>Eyes:</b> Two, variety of colors.");
	outputCodex("\n<b>Lifespan:</b> 250 years (modern)");
	outputCodex("\n<b>Wings:</b> Bat-like, with two clawed digits and a thumb at the limb extent. May reach about 33’ (10 meters) in span.");
	outputCodex("\n<b>Tails:</b> 2, thin, serpentine and flexible.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Fanfir are vast sentient creatures from the low gravity world of Haerum. They have heavy musculature in their upper bodies and back whilst are slimmer and lithe in their torso region and digitigrade legs, lending them a hunched, looming profile. Capable of flight on their home planet, they are confined to the ground in higher gravities without specialist equipment or gene-mods. On the ground, their size and shape necessitates they walk on all fours, using their tough wing claws as front legs and so proceed with a distinctive, swaggering gait. They are entirely comfortable doing this however, indeed having evolved to spend most of their lives on the ground.");
	outputCodex("\n\nThey have recognisably human facial features - although very broad and defined by human or ausar standards - aside from the horn that plates their lips and chin that acts as a secondary set of teeth. Their skin is smooth and tough, almost scale-like in places but still elastic and porous enough to allow the growth of hair upon their heads, the regulation of body temperature and the stretching necessary to enable flight.");
	outputCodex("\n\nFanfir are almost always found with another set of arms, smaller and nimbler than their wing claws, sometimes gene-modded on but usually taking the form of a cybernetic harness halfway down their torsos. This enables them to perform manual tasks they would otherwise struggle to do comfortably.");
	outputCodex("\n\nRemarkable to the species are their voluminous, highly evolved throats and vocal cords. Not obvious externally beyond the broadness of their necks, fanfir have the ability to make themselves heard over many miles - and to deafen anybody nearby. They can regulate their own hearing with a secondary, flexible tympanic membrane. They also have some limited ability to manipulate thought patterns and hormone release in others through the vibrations they produce whilst talking or singing. This feeds naturally into their aptitude for music (see below).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexuality"));
	outputCodex("Female fanfir are slightly smaller and more lithe than males. Within their genital slits they have fairly typical vaginas, if proportionately much larger than most, replete with a clitoris. Males sport four external testicles and a 14 inch long penis, with a large bulge around two thirds of the way down, housing an over-sized semen gland capable of producing almost a gallon of seed per ejaculation.");
	outputCodex("\n\nFanfir are oviparous and, after one-and-a-half year gestation, females lay 3-4 eggs. After hatching juvenile fanfir take around twenty years to reach adulthood. Fanfir have an average libido in comparison to the rest of the galaxy, and gladly engage in sex with anybody willing and able to do so. They cannot breed with other races however, and because of the timescales and number of large children involved and they are very careful breeders amongst themselves besides.");
	outputCodex("\n\nTheir cultural preponderance towards hoarding (see below) influences fanfir sexuality. The concept of harems was central to many fanfir spoken legends: a sign of a hero’s virility and tact. Nowadays fanfir of both sexes take great pride in maintaining as many lovers as they can, often attempting to persuade each away from polygamy themselves at the same time. This can mean others find fanfir possessive and jealous lovers, however that they should be thought of this way is anathema to the race’s sexual paragon: that is, to have many lovers of many different races, each beholden only to them, all of them fully aware and at ease with each other. That this is virtually impossible only makes it, to the fanfir’s mind, all the more an irresistible, romantic goal.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("By the time Haerum was discovered during the thirteenth planet rush, the fanfir were reaching the end of their stone age, confined mostly to their world’s mountain ranges where they made their aeries. Although they had existed in a sentient state suitable to reach well beyond that for aeons they had struggled to do so, despite concurrently developing a language arguably more sophisticated than the then galactic standard, thanks largely to the difficulty they had, as pseudo-quadrupeds, of developing sophisticated tools. They were a tribal society who warred frequently.");
	outputCodex("\n\nAfter initial attempts to make contact faltered, thanks to the fanfir having no concept of written text and misunderstanding attempts to talk to them as insulting animal screeches, they were largely ignored by early settlers to the planet, who were composed of small scale human and daynar mining concerns interested in the semi-precious metals held within its crust. Taking grave exception to miners inadvertently hitting burial sites and religious proving grounds, a large number of fanfir tribes united in an attempt to drive the extra-terrestrials away. Initially killed in droves by the weaponry deployed against them by the mining companies, they displayed intelligence beyond the estimations made of them by the humans and daynar by changing tactics, fighting a guerrilla war involving sweeping isolated individuals away in hit and run assaults, collapsing dig sites by channelling heavy vibrations into the earth, and terrorizing camps with all-night banshee-like choirs.");
	outputCodex("\n\nWhilst the materiel companies involved could counter each of these individually, together they made the cost of extracting metals and sending workers to Haerum prohibitive, and they withdrew. The planet was on the verge of being declared off-limits when the anatae intervened.");
	outputCodex("\n\nToday the integration of the fanfir into larger galactic civilization is held up as an exemplary case to all anatae first contact parties. At the time, the amount of time and resources they poured into attempting to consolidate a monstrously sized race of primitives that had proven itself to be barbarous and bloodthirsty was ridiculed. The anatae spent years analyzing the vocalizations of the fanfir with remote drones before approaching their nesting sites with offerings of tools and medicine, leaving them in places their research concluded were neutral bartering sites, favouring no tribe more than any other. The breakthrough was made when the imperial researchers finally offered the fanfir something they would come to value more than anything else in the entire galaxy: an additional pair of arms with opposable thumbs. Outfitted with the secondary set of cybernetic arms that would become synonymous with the race, the fanfir were immediately able to manipulate the world in a way that had long been denied them. They became eager recipients of the anatae, who were able to fully integrate them within the next decade, landing their own state mining corps on Haerum at the same time.");
	outputCodex("\n\nToday the fanfir are an integral part of the Anatae Empire, with around twenty official colonies of their own. They are often found working as bankers, merchants and entrepreneurs in the rigidly controlled business sector, go-betweens to the galaxy outside and sources of " + (isAprilFools() ? "dogecoin" : "credit") + ", acting in roles anatae themselves are not given to. Plenty can be found outside the empire, preferring to operate outside of its restrictions; many more are found within its public works and navy.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture and Society"));
	outputCodex("Thanks largely to their size, the fanfir are a highly individualistic race that chafe in crowds, and do not particularly like the company of their own kind for lengths of time. Fanfir instead gather together in one off “flings”, two or three day convocations that usually involve plenty of singing and speech-giving. Such events can satiate a fanfir’s wish to be amongst his or her own kind for years.");
	outputCodex("\n\nFanfir have a penchant for hoarding, seemingly related to their bird-analogous evolution. Their sexual attitudes are mirrored in other walks of life, and a fanfir’s home is usually a treasure trove of items that has been centuries in the collecting, that he or she can spend hours talking about.");
	outputCodex("\n\nTheir incredibly sophisticated and sturdy throats has lead the fanfir to have a natural love of music, singing and speech-giving, and with suitable safety equipment fanfir concerts are a rare treat, made rarer by how infrequently they occur. All travelers are warned that less scrupulous fanfir tend to be extremely persuasive, able to manipulate other’s behavioural patterns through the use of vocalized vibrations - as well as benefiting from an avaricious home culture with a rich history in the art of speech. Their love of wide open spaces and the acquisition of experience and physical treasures means the race are at their most visible and mobile during planet rushes.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Fanfir");
}
public function kalabastFhaniCodex():void
{
	clearOutputCodex();
	showBust("CRUFF", "ESTIE");
	outputCodex(header("Kalabast / Fhan’i"));
	outputCodex("<b>Name:</b> Kalabast (singular & plural); Fhan’i (singular & plural)");
	outputCodex("\n<b>Genders:</b> Biologically, Kalabast 100% male, Fhan’i 100% female. Gene-modded exceptions are uncommon but existent.");
	outputCodex("\n<b>Height:</b> 6\' 2\" Kalabast avg, 5\' 3\" Fhan’i avg.");
	outputCodex("\n<b>Weight:</b> (105 kg) Kalabast avg, (75 kg) Fhan’i avg.");
	outputCodex("\n<b>Hair:</b> Kalabast grow thick amounts of fur from the top of their heads. Fhan’i grow thick, pale tentacles in a hair-like arrangement.");
	outputCodex("\n<b>Skin Color:</b> Kalabast grow short fur all across their bodies, which can be many natural shades from cream to dark brown. Fhan’i are hairless and albino white across their bodies, however their extremities are usually purple, red, orange or pink.");
	outputCodex("\n<b>Ears:</b> Kalabast have large, lynx-like ears. Fhan’i have finned, human-like ears. Although less impressive in appearance, fhan’i have a far superior audial sense to the kalabast.");
	outputCodex("\n<b>Eyes:</b> Kalabast have four eyes, two on either side of their face. The pupil is round but small, and the sclera is usually a rich brown or yellow. The Fhan’i have two black, pupil-less eyes. The fhan’i have poor natural vision whereas the kalabast are capable of perceiving infrared and ultraviolet.");
	outputCodex("\n<b>Lifespan:</b> 100-110 years Kalabast, 70-75 years Fhan’i.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Bodily Structure"));
	outputCodex("The Kalabast are a digitigrade bipedal race with four digits on each limb, as well as a long, short-furred, prehensile tail. They tend towards a heavy musculature in their arms, enabling them to run on all fours over short distances. They have long faces and wide noses which, with their mane-like hair, lends them a profile not dissimilar to the great feline beasts native to Earth and Rosha. They have loose-hanging balls and a single knotted penis around 7 inches in length, with nodules along the shaft.");
	outputCodex("\n\nThe Fhan’i are a plantigrade bipedal race with five webbed digits on each limb, as well as a long, semi-rigid tail. This tail is forked into two thick leaf-like fronds at the tip, and enables a natural expertise at swimming. A number of vestigial tentacles hang around this appendage. They grow large breasts which produce milk naturally; this milk has weak transformative and psychoactive effects on others, engendering arousal universally and testicle growth in those that have them. They have a feminine shape and face immediately recognisable to the galactic norm. Between their thick thighs they have a single vagina, notable for its cilia-lined, penis-milking interior.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Breeding"));
	outputCodex("The Fhan’i naturally produce extremely adaptable ovi, which make them capable of breeding with almost anything with a male sex to produce fhan’i offspring after a six month gestation. The Kalabast are not as able at crossbreeding, but produce dominant sperm which makes kalabast offspring a near-certainty within those couplings they are capable of. Within kalabast/fhan’i pairings, a kalabast offspring is the outcome in about 1 in 4 cases - a fact that has enabled the continuation of both races, and shaped their shared history (see below).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Domestic History"));
	outputCodex("The Kalabast are natives to Denkozenne, a lush world filled with a myriad of biomes. Like most denizens of the planet, they had a roughly equal split of males and females. Before the kalabast had fully evolved sapience, a spacecraft carrying the extinct Fhan’i antecedent race crash-landed in the warm marshes that dominated a large continent of the planet. After a short time these individuals apparently reverted to a primitive state, and came to rely upon captured Denkozennian males to propagate.");
	outputCodex("\n\nThe two reached the Bronze Age at roughly the same time, and quickly came to be the dominant races on the planet. Unsurprisingly the fhan’i’s needs - and predilection to express it in the form of male slave-taking - lead to wars of escalating savagery, with the fhan’i’s numbers and organisation matched by the kalabast’s physical strength and richer territories.");
	outputCodex("\n\nAround the turn of the Digital Age, a fhan’i cabal of extremists invented a solution to finally break the impasse: a genophage that would change the kalabasts’ own DNA to irreversibly stop them producing females. Released secretly into the planet’s atmosphere and seas in fhan’i controlled territories in huge quantities, the virus was horribly effective, removing kalabast females within a generation. Unfortunately for the fhan’i, once the kalabast had understood what had happened they attacked their enemies with a hitherto unknown unity and purpose, brought together by a shared hatred. Within five years, the kalabast had won a thoroughly pyrrhic global victory.");
	outputCodex("\n\nForced into reconciliation, the kalabast adopted the remaining fhan’i into their own society as second class citizens. Slowly but surely a new culture evolved, in which the fhan’i were kept as beloved pets or concubines, and breeding was carefully managed. With this benign form of sexual slavery in place, kalabast/fhan’i society became both peaceful and stagnant, with little to drive scientific endeavour. Many centuries passed by, the norm becoming more and more concrete with each passing generation until both races had come to see themselves as a single, conjoined people. This was the state of affairs when the anatae made landfall in the 10th Planetary Rush.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Galactic History"));
	outputCodex("The Kalabast/Fhan’i represented a remarkably interesting but challenging project to the anatae; how to uplift them both, and dissolve the fhan’i’s slavehood, without upsetting the peaceful equilibrium the two races had managed to find? Around a dozen new worlds were swiftly annexed, with the most promising offered specifically to the kalabast to populate if they agreed to null their fhan’i pets second citizenship; the rest as alternatives. On all twelve worlds, the anatae relocated a slow trickle of alien migrants likely to be able to act as surrogates for one or both races.");
	outputCodex("\n\nBoth races spread quickly throughout Imperial space. Whilst matriarchal fhan’i realms and hardliner kalabast slave kingdoms emerged, by and large the two fell along the lines the anatae were hoping, with open, equal societies under Imperial jurisdiction becoming the norm.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Present Day Culture"));
	outputCodex("Over the years the relationship between the two races has broadly softened, with its former laws now acting as social tropes. Although they both have access to technology that can create female kalabast and male fhan’i, the kalabast regard the fhan’i as their ‘natural’ females, and vice versa. A general, genial patriarchal vibe still abounds; a kalabast is likely to keep 1-3 fhan’i as willing pets, although within U.G.C./Imperial space they will have the same legal rights as him. The kalabast are seen as natural leaders and providers, the fhan’i as muses and entertainers. This is by no means set in concrete; strict matriarchal societies exist, and both races are known to be sexually open-minded.");
	outputCodex("\n\nIn more cultural terms the kalabast are stereotypically a laidback, individualist and pleasure-driven race. Historians and sociologists note that once in complete control of Denkozenne, their scientific advancement stalled completely. In comparison the fhan’i are energetic, inquisitive and selfless, and fit much more comfortably into the anatae way of thinking. They are almost always the liaison officers of their home planets and stations.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Kalabast/Fhan’i");
}
public function laquineCodexEntry():void
{
	clearOutputCodex();
	showBust("KELLY","KELLY_NUDE");
	outputCodex(header("Laquines"));
	outputCodex("<i>They have plumbing built like a horse and mate like horny bunnies during breeding season.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Laquine");
	outputCodex("\n<b>Sexes:</b> 33% Male, 33% Female, 33% Hermaphrodite");
	outputCodex("\n<b>Height:</b> 5\' 6\" to 7\'");
	outputCodex("\n<b>Weight:</b> 132 to 187 lbs (60 to 85 kg)");
	outputCodex("\n<b>Hair:</b> Covered all over in fur, but “hair” grows on the top of the head in the form of especially long, lush fur.");
	outputCodex("\n<b>Eyes:</b> Two eyes in the face, at normal human position. Laquine eyes have a fundamentally human-like structure; a visible sclera (white) surrounding a colored iris, which in turn surrounds a round black pupil. Iris colors documented include brown, varying shades of blue and gray, red and pink.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("<b>Bodily Structure:</b> Laquines have the standard bipedal bodily configuration; a vertically orientated torso mounted atop a single pair of legs, topped with a single head and with two arms at the topmost end of the torso. Their arms are particularly human-like, each ending in a single five-fingered hand. Legs call to mind a giant rabbit’s, with powerfully developed thigh and calf muscles and elongated, paw-like feet. Laquines have an extra joint in the middle of their paws, allowing them to stand equally well on either the heel of their foot or on the ball of their foot, adopting a plantigrade or digitigrade stance at will.");
	outputCodex("\n\nSeated above their buttocks is a tail; this is fundamentally a rabbit-like “puff” of downy fur, but the fur around the edge of the tail is inclined to grow into long, downy strands, meaning an untrimmed tail resembles a horse’s at first glance. Fashion over wearing tail-fur trimmed or untrimmed varies from place to place. Long, luxurious hair grows out from the calves below the knee, with this excessive hair ending just above the ankle. This equine “feathering” can potentially grow as long as the hair on their heads, forming fluffy looking socks that partially obscure their paws, but for practicality’s sake most laquines trim it much shorter.");
	outputCodex("\n\n<b>Facial Structure:</b> As an anthropomorphic species, laquine faces are a weird blend of human traits and a bestial muzzle. Nose and mouth protrude in a short, fundamentally rabbit-like snout, but the muscles are strong enough to pull off all manner of human-like facial expressions - smiling, pouting, frowning, smirking, kissing, etc. Having evolved from herbivores, laquine teeth consist of cropping incisors at the front and molars at the back.");
	outputCodex("\n\nLong rabbit ears rise from the top of the skull; whilst flexible and capable of swiveling in many directions, as with Earth rabbits, these are still stiff enough that they don’t normally bend. However, approximately 1 in 3 laquines is a “lop-eared laquine”, whose ears are soft and flexible enough that they can’t support themselves upright without conscious effort on the part of the laquine and normally “flop” down the back or sides of the head. Despite common folklore, it is a naturally evolved trait amongst some laquines.");
	outputCodex("\n\n<b>Skin & Fur:</b> A laquine’s entire body is covered in a layer of smooth, fine fur, except for the lips, nipples and sexual organs. This fur isn’t especially dense normally, as laquines evolved in warm environments, but does respond to cold conditions by growing denser and thicker in an effort to help preserve warmth. “Woolly laquines”, who naturally grow thicker and lusher fur, are known to exist. Laquine fur tends towards dark colorations - blacks, browns, reds, navy blue, etc - but is often offset by light or even bright colors (creams, oranges, tans, etc), and contrasting patterns are seen as attractive in many laquine sub-cultures. Hair is usually a noticeably contrasting color to fur.");
	outputCodex("\n\n<b>Sexual Organs & Erogenous Zones:</b> Laquines have a fairly standard array of sexual features for humanoids: two nipples, a vaginal orifice, an external phallus, and a pair of external testicles, with combinations as expected for the gender. The nipples, positioned in the “normal” place for humanoids, grow into permanent breasts at puberty. The penis is the most unusual physical trait of laquines, and instantly separates them from “mere” anthropomorphic rabbits. A laquine’s phallus is “free-falling”, like a human’s, and consists of a hairless sheathe of foreskin into which the phallus proper retracts when not aroused. In shape, the exposed phallus physically most closely resembles the phallus of an Earthly horse, complete with the ability to “flare”, or have its edges swell upon climax.");
	outputCodex("\n\nSimilarly, laquines have a “marecunt” to match their “horsedick”; their vagina is very elastic and naturally produces copious amounts of pheromone-laden lubricants. This is believed to be an evolutionary adaptation to cope with the size of the average laquine penis. Average size of penises is a length of 10 to 14 inches and a girth of 2 to 3 inches. Average testes size is golfball to apple sized, and extraordinarily productive beyond that; laquine ejaculate typically measures in terms of litres. Breast size is affected by how many offspring have been produced; upon reaching breeding age, most laquines range from large A-cups to small C-cups upon puberty, though proportions as massive as FF-cups have been reported from dedicated broodmothers.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("Laquines are native to the southern biomes of their home planet, Asherah, making them most comfortable on warm to tropical grassland and forest type environments. Laquines can tolerate aridity, to an extent, but much prefer a lush environment that isn’t too damp. On other planets, laquines are drawn to regions similar to their home environments; they prefer a plentiful supply of vegetation, and so will usually be found in locations that at least have large gardens or parks, if not being well vegetated in general.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Though laquines can - and do - mate all the year around, females only become receptive to pregnancy during their twice-yearly heat-seasons. Occurring every 6 months, and lasting for a period of two weeks, it is during this time that females can conceive and experience the hormonal desire to do so. Medicinal supplements to quell these urges, and to reduce the arousing musk that they produce during this period, are now freely available, but it has had its impact on their social structure.");
	outputCodex("\n\nHermaphrodites do feel heat, like females, but usually in a much weaker fashion. Approximately one fertile week out of every four, however, triggers an even stronger reaction than it does in females, overwhelming the laquine’s mind with the need to father and conceive offspring. In this state, they have even been known to sexually assault others in desperate search of sexual release. Hermaphrodites who feel their “burning” coming on traditionally take alleviating medicine and seek seclusion, emerging only when it is over... assuming they don’t have one or more partners that they choose to sate their lust with, of course.");
	outputCodex("\n\nConception occurs in the ‘typical’ mammalian format, and a litter of two to eight offspring gestate internally for a period of six months before being born alive. As this time period means that offspring from the last breeding season are born during the start of the next, and laquine biologies recover quickly, it is possible for a willing female laquine to be pregnant constantly throughout the year. An infant laquine is a small creature, about the size of a Terran rabbit, and quite helpless, dependent upon its parental figures to care for it for about a decade before reaching adulthood.");
	outputCodex("\n\nWithin the last thirty years, however, this reproductive system has been thrown off. Some unknown, plague-like affliction has spread throughout the species, wreaking havoc upon the laquine reproductive system.");
	outputCodex("\n\nFirstly, it causes the breeding cycle to experience disruptions; sufferers find their cycle occurring out of season, or simply not occurring at all. Disruptions can result in sufferers experiencing only a single heat a year, only once every several years, or even total sterility. Even when heat is entered, breeding success is impacted; stillbirths and miscarriages sometimes occur, but most frequently, only a small number of ova will be fertilized, usually one or two at best. In many cases, even individuals who experience heat find themselves failing to conceive at all, no matter how virile their partner is.");
	outputCodex("\n\nThe effects of this disease are predominantly felt when laquines attempt to mate within their own species. Laquines attempting to crossbreed with other races have markedly greater success, with the primary difficulty being going into heat in the first place.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("A relatively young species as far as the United Galactic Confederacy is concerned, the laquines of Asherah were discovered only towards the end of the last planet rush, when the human exploratory vessel Blue Orion entered a newly revealed solar system and encountered a scientific exploration vessel that had recently reached that same area and was quite surprised to encounter an alien vessel. First contact was tenuous, but swiftly proved successful, despite some diplomatic tension resulting from an incident when one of the laquine crew impregnated a female human scientist, and the laquine captain herself becoming pregnant by Captain Small of the Blue Orion. Peaceful acceptance into the U.G.C. followed quite soon thereafter.");
	outputCodex("\n\nAfterwards, the laquine population in the greater galaxy grew quite swiftly, thanks to the rather explosive breeding rate of the species. Though quick and eager to offer their services as organic crop producers, workers and even sexual operators, the speed with which the laquines colonised new lands outside of their own solar system attracted rumblings of discontent, especially from certain human organisations. Indeed, certain races have been known to openly proclaim the laquines as “pests” or “parasites”.");
	outputCodex("\n\nWithin the last thirty years, however, this accelerated rate of colonisation began to severely die back, as the laquine species found itself assailed by a mysterious plague-like condition that has caused widespread fertility problems. Indeed, the laquines have become increasingly introverted as a species, as more and more attention is being devoted to pursuing possible causes for the sterility plague - and, far more importantly, seeking out potential cures. Despite decades of work, the laquines’ top minds are still trying to unravel the dark secrets of this disease. This extreme and unnatural difficulty in analysis and diagnosis has led to conspiracy theories of it being artificially engineered, which has furthered the general withdrawal of the laquine community from the U.G.C.");
	outputCodex("\n\nMedical experts have established by way of testing and observation that neither mod-transformed laquines, nor the half-breed offspring of laquines and other alien races, seem to be affected by the disease. This fact is carefully hidden from public consumption, in an effort to minimize paranoia, conspiracy and xenophobia amongst an already suspicious and distrustful populace.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Though it is not socially enforced, traditionally, laquine culture falls under a gender-based trichotomy. Females are responsible for roles that revolve around caring for the children and adults, such as being homemakers, chefs or nurses. Males are responsible for tasks that require strength or endurance as a general rule; construction work, farming, manual labor, etcetera. Hermaphrodites, finally, tend to gravitate towards the social power and intelligence-based roles, such as scientists and politicians. As stated, these roles are not socially enforced - no one would force a female laquine to not be a scientist, for example - but they are traditional and thusly stereotyped amongst this species.");
	outputCodex("\n\nDespite, or perhaps because of, the size of their phallic organs, laquines usually associate ejaculate size with virility size instead. Semen quantity boosters are the primary subject of sexual spam amongst laquines, and semen-related mods are fairly common in their culture. Which is not to say that they don’t also tend to take pride in the size of their male members, just that cumshot size is usually more important.");
	outputCodex("\n\nThough rare, it is established fact that priapric and mammarian hyperism conditions have been documented amongst laquines.");
	outputCodex("\n\nLaquines have been confirmed as being capable of successfully crossbreeding with humans, kaithrit, kui-tan and ausars.");
	outputCodex("\n\nBecause they lack multiple nipples, communal nursing is the norm amongst laquines, and the average individual will have been suckled from dozens of willing milk-mothers during her or his youth. It has been theorized that this may have deliberately evolved as a social building mechanic. Perhaps as a result of this, polygamous relationships are not unheard of amongst laquines.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Laquines");
}
public function matisarCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Matisar"));
	outputCodex("<b>Name (Singular & Plural):</b> Matisar");
	outputCodex("\n<b>Sexes:</b> 55% female, 40% male, 5% hermaphrodite.");
	outputCodex("\n<b>Height:</b> 4\' to 6\' for males, 6\' to 8\' for females.");
	outputCodex("\n<b>Hair:</b> Only hair is atop the head. Usually greens and browns, rarely streaked with red, pink or white.");
	outputCodex("\n<b>Eyes:</b> Dark brown sclera, with a wide range of iris colours, from pink, red and yellow, to blue, purple and white. They have a pupil that contracts into a four-pointed star, expanding into a traditional circular shape.");
	outputCodex("\n<b>Chitin:</b> Colours range from dark greens to aqua, or dark greys. Rarely more vibrant colours such as pink, yellow and orange.");
	outputCodex("\n<b>Arms:</b> Covered in thick chitin, spined along the forearm. Hands contain four clawed fingers and a thumb.");
	outputCodex("\n<b>Legs:</b> Chitinous, digitigrade legs that end in four toed feet, three forward, one backward.");
	outputCodex("\n<b>Abdomen:</b> Female abdomen stretches from 6-12” long. In comparison males are only 4-7” long.");
	outputCodex("\n<b>Average Lifespan:</b> Natural lifespan ranges from 40-50 years.");
	outputCodex("\n\n");	
	outputCodex(blockHeader("Features"));
	outputCodex("On top of the arm and leg coverings, they also have chitin across their body, covering the entirety of their torso, with females breasts being exposed. The chitin around the back curls across the neck to terminate around the cheeks, giving a permanent face guard. Also of note is that the females have a thicker chitin than males. This stems from the races traditional hunting methods, where the females act as targets to draw enemy forces or prey in.");	
	outputCodex("\n\nOn their back they have two fan-like appendages that, while at rest, resemble a pair of ridges along their spine. In females these run the full length of their back, and have a curve while open, while the males have much smaller fans that open straight.");	
	outputCodex("\n\n");	
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Females have large, vaginally equipped abdomens, which they usually hold vertically, against their backs. The vaginal cavity contains several rings of strong muscle, and matisar can control these rings individually. Matisar abdomens have three wombs, stretching down the length of their abdomen. The inner two are set underneath the vaginal canal, and only collect semen during intercourse with exceptionally virile individuals, or in cases of multiple mates. Each womb will only ever hold a single egg at a time, allowing for up to three offspring per mating. Matisar vaginas also lack a clitoris, instead the two ‘spare’ wombs have a highly sensitive entrance, the further back of the two being more receptive than the first.");	
	outputCodex("\n\nMales have a single penis, held inside a genital slit. Matisar penis’ have several knots, spaced between three to five inches depending on length, and one which rests atop the tip, similar to a flare. Matisar males hold the testes inside of the abdomen, with between two to four individual gonads resting within. This allows them to store vast amounts of semen, and flood a potential partner to inseminate all three wombs.");	
	outputCodex("\n\nA small percentage of matisar are born with both a vagina and a penis. These are usually smaller than females, but taller than males. They only have one womb, and where the other wombs would be is where the testes rest.");		
	outputCodex("\n\nMatisar cum contains a large amount of fat, allowing them to recycle their seed when food is scarce. It is commonly used among matisar as a staple food during long voyages, and many male matisar donate to an organisation dedicated to the collection and distribution of this matisar food.");	
	outputCodex("\n\nWhen an egg is fertilised it develops in the mother’s womb for three-five weeks, before being laid. The eggs are soft and round, with a solid yellow-orange shell. The eggs hatch after another eight-ten weeks, and offspring take twelve years to reach adulthood.");	
	outputCodex("\n\n");	
	outputCodex(blockHeader("Homeworld"));
	outputCodex("The matisar homeworld is a humid jungle world with regular, low-level volcanic activity and only a few large water bodies, as a good percentage of the planets water comes from seemingly permanent roving storms.");	
	outputCodex("\n\nThe heat and humidity of the world allowed for a large level of biodiversity, leaving a large food chain which the matisar sat happily on top of. While many predators were more than capable of killing the native sapients, the tactics employed by them gave them the upperhand.");
	outputCodex("\n\nThanks to this heated environment they operate well in hot or humid atmospheres, but have a very low tolerance for cold, and even what many races consider a warm day they perceive as chilly.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture"));
	outputCodex("Matisar culture all stems from a small number of ideals. To be a great hunter, to protect one’s Party, and to be worthy of the time you have. These three defining ideals make up what matisar call the Wanderer, their equivalent of a soul. They believe that a part of the Wanderer resides in each of their weapons, and most traditionalist matisar refuse to use any equipment not made by their own race. Some particularly devout matisar won’t even use gear from outside their own Party.");	
	outputCodex("\n\nA Party is the matisar name for families, depending on the family they also have a prefix, such as crafting or hunting. A family consists of a Matriarch and Patriarch, each in charge of their respective gender amongst a party, and their offspring. Cooking is considered a male’s duty among matisar, due to their semen being a large part of a matisar’s diet during food shortages or setup of new settlements.");
	outputCodex("\n\nWhen a matisar obtains a partner, they split off from the party and create their own, with the exception of the last born child, who takes the parties name and accolades, being held in similar regard to human first borns. Naming conventions for creating new parties are meant to describe the tactics employed by such. In the occurrence of settled parties these generally describe what they deal in, whether it be merchants, mechanics or craftsman.");
	outputCodex("\n\nEach party has a Shrine to the Wanderer where skilled members weapons are kept. Some of the oldest tribes shrines are more akin to temples devoted to the weapons of ancient heroes. Each weapon in the shrine is kept with a book, detailing that matisar’s greatest work, whether it be a hunt, rescue or creation. Craftsman keep tools instead of weapons, though still go through the same rites.");
	outputCodex("\n\nA final aspect of matisar culture is their fans. A matisar’s fan pattern is considered a window into their Wanderer, and can be seen as an omen of the matisars chances of living a great life. Should a matisar lose their fans in an accident, or have them damaged, many go through great efforts to restore them, though few are willing to get cyber replacements.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Matisar primarily live frontier lives, with many small permanent settlements that fluctuated between a few dozen to a few hundred in population. The majority of the population roamed the world as hunters and mercenaries. Very few settled down in one place, and even less accepted another’s authority.");	
	outputCodex("\n\nThe result was thousands of small hunting parties, usually consisting of one or two family groups, that travelled between the small settlements, trading supplies for shelter and advanced materials. While they hadn’t yet mastered electricity, gunpowder had been well refined and incorporated into matisar life upon first contact.");
	outputCodex("\n\nWhen first contact was made, and the first rushers landed on the world, the natives were oddly welcoming to the newcomers. Integration of the colonial matisar was quick, though the main population took several generations. Once introduced to space travel, the matisar were quick to make use of it, many setting out and joining in on the very same planet rush they were discovered in.");	
	outputCodex("\n\nOne of the most surprising skills the matisar practice is tailoring. Almost all matisar clothing is made of leather or fur with polished bone accents. This skill proved to be quite popular with early colonists, and clothing was a popular trade item between the locals and the colonists.");
	outputCodex("\n\nEven in modern time the species still has no true government body nor do they have any worlds dominated by them beyond their homeworld, but they do have hundreds of colonies across many systems, and if one begins broadcasting an emergency beacon, they’ll soon be swamped by hunters looking to help.");
	outputCodex("\n\nThough the species quickly became notorious for their disregard of authority, proper procedure and generally undisciplined nature, their natural talents for stealth and love of hunting new and dangerous game made them skilled scouts and bounty hunters. They also have been slow to pick up the credit system, still primarily taking payment in the form of equipment or services.");
	outputCodex("\n\n");	
	CodexManager.viewedEntry("Matisar");
}	
public function mothrineCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Mothrine"));
	outputCodex("<i>Ancient, long dead, and with much to tell us...</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Mothrine");
	outputCodex("\n<b>Sexes:</b> Male, Female, Sexless.");
	outputCodex("\n<b>Height:</b> 6\' to 6\' 7\" for males, 5\' 10\" to 6\' 5\" for females and sexless mothrine.");
	outputCodex("\n<b>Weight:</b> 90 to 150 lbs across all sexes.");
	outputCodex("\n<b>Hair:</b> Extremely varied, white and green being the most common.");
	outputCodex("\n<b>Eyes:</b> Extremely varied but usually one of four colors ‘clan types’; black, cyan, white or gold.");
	outputCodex("\n<b>Ears:</b> Two ear holes on each side, no pronounced ears.");
	outputCodex("\n<b>Average Lifespan:</b> Estimated at 340 Terran years although some sources say far less than that.");
	outputCodex("\n<b>Homeworld:</b> First Cidulfixulu.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The mothrine appeared to have died out as a race at some point within the last seven centuries. What is believed to be their homeworld, First Cidulfixulu, contained some extremely well preserved remains deep within a mountain cavern. Most information has been collated from the settlement uncovered there and some few instances of further habitation along the planet’s surface.");
	outputCodex("\n\nWhat’s known is that they were a society of insectoid, bipedal, moth-like humanoids. Their society had no technological analogue that we’d recognize, even the concept of ‘weapons’ seemed to be lacking if the archeological research is to be understood. It’s surmised that they based their society on bio-mechanics and organic materials rather than regular synthetic construction. This is postulated due to the fact that evidence of extremely detailed architecture exists, yet no known instrument can accurately recreate that ‘mothrine touch’.");
	outputCodex("\n\nWhat’s also known is that something exceedingly powerful wiped out the mothrine within the course of a few days. Evidence of bodies and preserved brain material show heavy psionic scarring, suggesting a virus or energy wave that targeted their psionically latent minds.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("From reconstructions, mothrine remains, and real-time projections through gene-theoritics, the mothrine have shown to be that: Tall, bi-pedal moth-like humanoids.");
	outputCodex("\n\nHumanoid, as it turns out, is mostly a rough guide, as they were most certainly insects first. All mothrine were tall to some degree and taller than the current Terran average. All mothrine had large wings that more than likely gave them the power of flight: To what degree is unknown.Mothrine came in many different and vibrant colors across all their features but evidence suggests that there were four ‘clans’ that flourished with a specific palette for each.");
	outputCodex("\n\nThese four form the majority of the physical remains found.");
	outputCodex("\n\nWhat’s also known is that there were three distinct sexes and there were few physical differences between either aside from genitalia. Sexless mothrine appeared to have a high place in their society as some evidence points to advanced cranial development and activity within such individuals.");
	outputCodex("\n\nMothrine had exoskeletons and endoskeletons, both being lightweight and hollow. They had svelte limbs, well developed tendons and figures that would be considered ‘ultra-thin’ by modern Terran standards.");
	outputCodex("\n\nTheir bodies were covered in a mix of chitin and fuzzy down, similar to some species of Terran moths. Their eyes are posited to be quite large and bulbous although no preserved examples remain. Aside from ‘clan’ markings, colors of each feature would change dramatically between individual mothrine. It’s posited that their gene sequences, being different to Terran gene construction, allowed for more ‘harmless’ if random mutations to develop within color pigments.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Mothrine society has only been hinted at through paleontology and archeology.");
	outputCodex("\n\nWhat’s known is that there was no hierarchy of sexes aside the rare ‘sexless’ individuals. Oftentimes these individuals seemed to display physical and mental ability quite above the mothrine average but the relative scales for both sets of claims are difficult to compare.");
	outputCodex("\n\nAs a flying species, the lush canopy and wide plains of First Cidulfixulu seemed to form a basis for mothrine society, as depictions and architecture showed amazing displays of flight-based migration.");
	outputCodex("\n\nTechnologically speaking, there are no recorded instances of advanced metallurgy. Most uses of metal tended to be in a raw, powdered form for reasons unknown. It’s presumed that mothrine were able to use some sort of biomechanical matter and engineer it at the base level for their needs. Even so, very little evidence for that hypothesis exists. How the four clans interacted with the society remains just hidden and unexplainable.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Through reconstructions and theories, it’s touted that mothrine were very ceremonial. Males and females underwent several rituals and rites of joining, often leading to monogamous and lifelong relationships. How this culture and these traditions developed is unknown.");
	outputCodex("\n\nSexual orientation shows some rare outliers with two recorded cases of high-value couples being F/F pairings.");
	outputCodex("\n\nGiven the lack of physical evidence, it’s unknown how large the mothrine population was or how many offspring were produced in a typical joining.");
	outputCodex("\n\nMothrine sexual habits tended to be complex and draped in ritual, often with displays, dances, and bouts of so called ‘flight-joinings’ being performed before any coitus.");
	outputCodex("\n\nMale mothrine had a large, hardened ovipositor-like penis and lacked a visible scrotum. Female genitals tended to be closer to Terran vaginas but more fitting for tube-like insertions. It’s wildly suggested that intercourse could last from anywhere between seven minutes to seventeen hours. It apparently wasn’t uncommon to sustain injuries given how light and potentially delicate mothrine features were and some more obscure references found in surface sites.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Mothrine");
}
public function rahnCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["FLAHNE", "ZODEE", "VAANDE", "JARDI"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Fuu’Rahn and ‘Rahn"));
	outputCodex("<i>They may just be one cell, but really they’re all heart.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Rahn");
	outputCodex("\n<b>Sexes:</b> Monogendered, usually considered “Female”");
	outputCodex("\n<b>Height:</b> 4\' to 5\' 8\" commonly. Most are shorter, but a rare few can attain heights as tall as six feet.");
	outputCodex("\n<b>Weight:</b> 60 to 140 pounds.");
	outputCodex("\n<b>Hair:</b> Rahn do not have hair in the traditional sense, though most will morph their body to have the appearance of hair after sufficient exposure to haired races.");
	outputCodex("\n<b>Tongue:</b> Long and flexible, rahn tongues can often extend a good six or seven inches out of their mouths. Some subspecies of rahn or particularly well-endowed Rahn can extend their tongues up to a foot.");
	outputCodex("\n<b>Eyes:</b> Vibrantly colored irises with a vertically slit pupil. The pupil, rather than appearing black as a human’s does, appears as a darker hue of the same color as the iris. Their scleras are the same color as the rest of the body (though a bit lighter) owing to their unique physiology.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Physiology"));
	outputCodex("The rahn have a wildly different physiology than most carbon-based lifeforms. Rather than a collection of tiny cells like most creatures, they are an immense, single cell. Their ‘skin’ is a thick, semipermeable membrane, though with a bit of effort they can permanently reshape it to assume certain appearances. They are almost always bipedal and humanoid in appearance, owing the notable advantages in bipedal efficiency, having arms, and having most sensory inputs positioned at the top of their height. Most have further tweaked their appearance to resemble what many races would view as attractive females, as this allows them to sample exotic DNA with greater ease.");
	outputCodex("\n\nRahn bodies have their intelligence spread out in a web of fibrous, neuron-like clusters within their body. The distribution of their intelligence and other core functions renders them functionally immune to concerns of headshots or heart wounds. Severed limbs can be quickly regrown, though it will cause a loss of height and mass. Any wounds will almost instantly seal as the surface is converted into their thick outer membrane.");
	outputCodex("\n\nThey can shapeshift slightly, though it is a slow process, often requiring days to complete any major cosmetic adjustments. Their skin and bodies are ridiculously soft, but they can strengthen their inner membranes to near human-like levels of rigidity, even without a skeleton.");
	outputCodex("\n\nRahn excrete their waste as sexual lubricants from their vagina or ovipositor, depending on preference. Some rahn have adapted to allow themselves to release it via lactation, though this is usually at the request of a close friend or lover.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Subspecies"));
	outputCodex("Rahn have numerous subspecies, most easily identified by the color of their body. The blue and green ones are fuu’rahn: the toughest and quickest to regenerate of the bunch. Red are zel’rahn: able to excrete chemicals from their skin to disable a wide variety of creatures at will. Yellow are the loo’rahn: longer tongues, softer bodies, and better at shape shifting. Purple are the doh’rahn: they exude pheromones that can be rapidly tailored to most races they encounter. White are the go’rahn: the most efficient eaters of the bunch, but only because their orgasms are so voluminous - both from their vaginas and ovipositors. There are other smaller groups as well with less information available upon cursory extranet search.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Rahn are a mono-gendered species. Because of this, they seek biological samples from other creatures before deciding to reproduce. The foreign material is used to help diversify the species, and without it, rahn can only birth clones, something that is greatly frowned upon in their society. Before ascending to prominence in the Thirteenth Planet Rush, they acquired this material from devouring dead animals, but since then, they’ve become far more picky about how they gain biomass, savoring the galaxy’s large variety of sperm sources.");
	outputCodex("\n\nWhen a rahn is both well fed and satisfied with the quality of her biomass sources, she can choose to begin forming eggs. These eggs will grow within her for a month before it is time for birth, during which the selected biological compounds are used to guide and shape the development of the embryo. Once the eggs are ready to be birthed, development will be halted while the rahn tries to find a suitable mother, as it is believed that incubating inside another being will be good for the resulting young.");
	outputCodex("\n\nAll rahn possess an ovipositor that can be pushed out of the rahn’s vagina, some using the clitoris as the tip of it and others surfacing it just above. In either case, the ovipositor could be compared to a clit or penis in sensitivity. They are sometimes considered hermaphrodites because of this, even though the only thing their ovipositors can ejaculate are slippery fluids of the same color as their skin and eggs. Rahn who are ready to “lay” will frequently find their ovipositors extending in the presence of attractive females, be they other rahn or another species entirely. Some grow so enamored of their ovipositors that this behavior happens even when ‘unfertilized’. In this scenario, they will simply ejaculate lubricants and small, quickly dissolving eggs.");
	outputCodex("\n\nOne implanted, the eggs will be ready resume development, hatching and filling their mother’s womb with their rapidly expanding mass over the period of about two weeks. The unborn rahn consume their eggshells and the fluids their mother produces for sustenance, often fooling her body into believing it is pregnant with one of her own (if not a rahn). Birthing is quick and relatively painless for both parties since rahn bodies are so soft and flexible. The young will drink and eat virtually anything given to them and attain full size within another two weeks, and proper sapience not long after.");
	outputCodex("\n\nRahn young appear as a blend of their father, mother, and ‘mother’ in appearance, only rendered out of soft, flexible gel. Most often, their bodily configuration will assume the shape of their ‘mother’s body, while their face will wind up resembling their true mother and father combined. Of course, as they grow they can slowly reshape themselves into whatever they please, though morphing their appearance takes some time.");
	outputCodex("\n\nThough they enjoy nearly every part of breeding and motherhood, rahn will only seek to reproduce when they have time to tend to and raise the results of their passion and the food sources available to feed them. As they do not use traditional DNA systems, inbreeding is of little concern to them, and mothers will not shy away from directing grown daughters after their fathers.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Food"));
	outputCodex("Rahn can consume the same materials that they use to breed, but they can also subsist on plants, water, and meats, even though they are incapable of using most traditional plants as sources of biological matter for reproduction. They prefer ejaculate and sexual fluids, finding them to be tasty, and if a sperm donor or slippery, wet pussy is available, it comes in handy for their reproductive urges.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("Warm, moist climates are favored by the rahn due to their moist, liquid nature. They do not handle cold very well, and cannot survive at all in sub freezing temperatures. Dry climes are not prohibitive, so long as a ready source of water is available.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Despite seeming to be over-sexed and almost nymphomaniacal, for rahn, the act of sex is as common as eating and approached with little fanfare. Once their lust or ardor is satisfied, they will return to whatever task they had embarked upon with gusto. Rahn are not overly violent or technologically inclined, though both rahn warriors and scientists exist. The only planet with a population containing mostly rahn is their homeworld, Geis. They’ve integrated wonderfully into the rest of galactic society, though many who do not know them better assume them to be easy sluts.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Rahn");
}
public function rodenianCodexEntry():void
{
	clearOutputCodex();
	showBust("MABBS");
	outputCodex(header("Rodenians"));
	outputCodex("<i>“Do not refer to a rodenian as a mouse unless you are looking to start a fight, and be wary of calling them ‘cute’. More than one careless spacefarer has parted ways with a finger for daring to compare one to a rat. Basically, just don’t point out that they resemble lowly pests. Definitely don’t point out that their English name was derived from the word ‘rodent’. It remains a sore spot centuries on.”</i>\n\t-The Intergalactic Guide to Manners, Volume VI, Terran Edition\n\n");
	outputCodex("<b>Name:</b> Name: Rodenian (singular), Rodenians (plural) / Ch’squee’ch’chk");
	outputCodex("\n<b>Homeworld:</b> The forest world of Corvus");
	outputCodex("\n<b>Lifespan:</b> 150");
	outputCodex("\n<b>Sexes:</b> 33% Male and 66% Female");
	outputCodex("\n<b>Height:</b> 4\' 2\" to 5\' 3\" (1.26 - 1.6 m)");
	outputCodex("\n<b>Weight:</b> 50 to 170 lbs");
	outputCodex("\n<b>Ears:</b> Large, multifunction ears similar in structure to a terran mouse.");
	outputCodex("\n<b>Fur:</b> Full body - typically white, pink, gray, or black (but often dyed).");
	outputCodex("\n<b>Eyes:</b> Nearly identical to terran/ausar standard. Colored green, red, or blue.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Small and short-furred, rodenians bodies share many visual cues with the rodents of earth. They have large, dish-shaped ears with a small amount of mobility, allowing for superb hearing. Just below, their faces bear short, mouse-like muzzles that lack the oversized teeth one might expect. Their incisors are merely mildly oversized. Their hands and feet have claws extending from their tips for climbing. The legs themselves are plantigrade in structure, though rodenians tend to walk with an upraised heel, owing to slight variations in tendon length and bone structure. A tapered, prehensile tail provides near flawless counterbalance, as well as an additional limb for tool use.");
	outputCodex("\n\nIn short, rodenians look like walking, talking mice, excepting for a few major reproductive differences covered further below.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Rodenians method of reproduction is highly unusual and, to many minds in the greater UGC, perverted. The females’ wombs are located in their breasts rather than their abdomen. Stranger still, those same wombs are accessed for breeding via secondary channels recessed deep in the ear. They do not lubricate during arousal. Instead, the flesh is lined with a friction-denying structure, similar to the nonstick coatings employed in cooking vessels. (Non rodenians have reported them to feel strange but pleasant.) Those passages route through the back of the skull, merge together, then travel down the neck and into the torso to split off into the twin uteruses.");
	outputCodex("\n\nCleverly, a membrane seals the aural entrances as pressure is applied to the reproductive tissues, preventing hearing damage and sealing out any stray fluids. This adaptation is redundant, however, for the holes themselves are positioned so that any drainage naturally flows into ‘ear-ginas,’ allowing for the rodenian’s keen hearing to remain unobstructed.");
	outputCodex("\n\nInsemination is handled by the more traditional males, for while they too have vestigial ear-cunts, their bodies have produced a more typical arrangement of genitalia for impregnation: one phallus between the legs, backed up by two testes, shaped and sized similarly to golf balls. The largeness of their gonads relative to their body size affords them impressive sexual endurance - something they need since there are two females with two wombs each for every rodenian male.");
	outputCodex("\n\nIt’s no surprise then that rodenians mate in threes, with one male joining two females for life. Intercourse happens often, typically at least twice a day for the poor, overworked male, yet fertility rates are quite low. Females only ovulate every year or so, and their eggs have a thicker membrane than a terran’s. Scientists seem convinced that such a change was self-inflicted before UGC contact, a forward-thinking move to counter potential overpopulation.");
	outputCodex("\n\nOnce inseminated, the female’s other womb will begin ovulating, throwing one egg after another out until the mother carries a set of unborn twins. The children grow slowly within her to minimize food stress, but after four to five months, the eggs are large enough to impede the mother’s movement, and birth can begin. It is at this point that she lays them - through her nipples. The first time can be quite painful, as residual membranes must tear, but each successive laying is typically viewed as more pleasant than the last. Some older rodenians even delight in it.");
	outputCodex("\n\nThe mother’s body recovers quickly, her elastic flesh snapping closed in a matter of minutes if not seconds. The vacant womb will shrink, converting excess mass into a nutrient-rich cream over the coming days which the mother will then milk onto her adsorbent egg. This is not necessary for the production of healthy offspring, but those whose mothers took the time to milk-bathe their eggs are 2-3 inches taller on average. Only after all this secondary incubation will a rodenian child emerge, clawing free from his or her shell with quiet squeaks and a sharp birth-tooth.");
	outputCodex("\n\nRodenian children mature rapidly, over 13-14 years, though females’ bodies do not begin to ovulate until late in their twenties, another quirk suspected to be by design rather than happenstance.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture"));
	outputCodex("Rodenian culture has been shaped by a single gland - what has come to be known as the hedonary gland. It grows in the rear of the skull, near the passages used for breeding, and when pressured, it releases a potent chemical cocktail that induces trance-like behavior. The resulting hyper-suggestibility leaves the recipient of nearly any sexual contact utterly at the mental mercy of their mates, an aspect slightly mitigated by their tendency to form romantic entanglements in trios.");
	outputCodex("\n\nInvariably, all three sexual partners find themselves changed, utterly infatuated with each other, their minor irritants smoothed away into unwavering loyalty. Conflict is a thing of the past. Rodenian relationships are tripods of reinforced titanium. There is no weakness within them. Their language has no word for divorce, nor does it need one. The concept is utterly foreign. When one partner dies, the other two either die of grief or bond together all the stronger.");
	outputCodex("\n\nFor this reason, they naturally became xenophobic. Aliens cannot come to love the way they do, cannot submit their very being during sexual congress. Their ears and their hedonary glands are a vulnerability all too easy to exploit, particularly for clever slavers. For this reason, many rodenians have formed closely guarded enclaves, limiting their contact with the outside. Those who do venture into the wider UGC typically do so with some sort of protection for their ears - specially designed headphones are the most common.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Corvus is a planet dominated by forests on its one, large continent, and that is where the Rodenians developed. They had attained access to advanced levels of biosciences before first contact was made, three rushes ago, though they lagged behind in many other disciplines. No atmospheric craft had yet been devised. Self-drawing crossbows were their main form of self-defense. Slug-throwers had not even been invented. Power was siphoned from the roots of certain types of trees, a naturally occurring form of solar power.");
	outputCodex("\n\nAt first, they welcomed outsiders with open arms... until more and more of their people vanished in the night, taken with a whimper and wiggle. The UGC did little to protect them from the dangers of the wider galaxy - pirates, slavers, and criminals - so the rodenians took matters into their own hands. They traded away their expertise in gene-modification for guns - big ones, and threatened to shoot down any ship who landed without their express consent. The crackling reports of their cannons made good on those threats.");
	outputCodex("\n\nThe mouse-people of Corvus had learned a painful lesson about their own vulnerability, one they would not soon forget. With their home relatively secure from unwanted intervention, they allowed themselves to establish colonies on other worlds, but only after arming their colonists with the finest guns and the toughest helmets they could buy. Their caution has limited their influence on the galactic scale, but it has kept them safe for the most part.");
	outputCodex("\n\nPirates prize them as easily programmed pleasure slaves. There is no need for drugs with side effects or expensive neurotherapy. A few slow fucks with a looping audio file playing in the background is all that’s needed to convert a proud rodenian into a simpering slave.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Psychics"));
	outputCodex("In recent years, rodenians have begun displaying a heretofore unforeseen talent for all things psychic. Skills in telepathy and telekinesis are most common, but odd reports of clairvoyants have cropped up as well. Rodenian ambassadors categorically deny any allegations of mass genetic modification of their people, instead claiming it as a natural evolution against predation. Experts in the field suggest that such a change cannot be explained by natural phenomena, but since access to Corvus is tightly restricted, no real investigation has been conducted.");
	outputCodex("\n\nThese frightening powers are rare among most core species, and frequently only a result of surgical implantation or extreme genetic manipulation. That a member race of the UGC would suddenly begin to show widespread psionic talent has caused many to reevaluate their opinion of the oft-ignored rodenians. Some theorize that this is the beginning of their rise to prominence. Others assume it is a destabilizing act that will bring about the big-eared mice’s downfall. Only time will tell.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Rodenians");
}
public function roehmCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Roehm"));
	outputCodex("<i>Whom to where gluttony is not a cardinal sin, but a way of life.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Roehm");
	outputCodex("\n<b>Sexes:</b> 100% Hermaphrodite");
	outputCodex("\n<b>Height:</b> Adults reach 6\' 4\" height, 9\' length avg.");
	outputCodex("\n<b>Weight:</b> 330 lbs (150 kg) avg.");
	outputCodex("\n<b>Hair:</b> None.");
	outputCodex("\n<b>Skin Color:</b> Naturally many different shades, from bright blue and red stripes, to dappled black, to uniform yellow. Different skin color confers no distinct physical traits.");
	outputCodex("\n<b>Eyes:</b> One pair. Conjoined double pupil to accommodate a wide field of vision and six color cones overall.");
	outputCodex("\n<b>Antennae:</b> Roehm have no ears, and are instead reliant on a pair of flexible, seven-inch long antennae that sprout from the top of their heads. These antennae are sensitive to touch, vibration and minor changes in movement, which along with their excellent sense of sight enables the roehm to functionally perceive speech.");
	outputCodex("\n<b>Lifespan:</b> 200 years avg.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("The Roehm are gastropod analogues native to the watery world of Hdar-Roe. They have long, wide, serpentine lower bodies and an upright upper body that supports two arms and a head. Aside from their antennae and lack of ears and hair, roehm have facial features similar to the galactic norm. In voice and feature they appear female. Unmodified, however, they do not have breasts. They instead sport six nipples on the top of their tails, indiscernible from their skin dapples in normal circumstances. When carrying young or sufficiently aroused, these become erect and can produce a milk-like substance.");
	outputCodex("\n\nUnder normal conditions, Roehm sweat a lightly fragrant, oily substance, which facilitates the muscular contractions they use to move and their heightened ability to sense pheromones and other chemical release through their highly porous skin. This gives their coat a noticeable sheen and requires them, unless sufficiently modified, to remain in reasonably humid environments.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction and Sexuality"));
	outputCodex("Roehm spend most of their lives female infertile, only becoming fertile one year out of every ten. They take around five years to reach adulthood, experiencing their first “full year” at the same time. They have a low sexual drive, relatively speaking, outside of their mating cycles; however, they still happily engage in sex for pleasure outside of it, an activity heightened by their cultural preponderance towards pleasure-seeking (see below). Roehm are capable of successfully mating with many other species.");
	outputCodex("\n\nA roehm has two highly reactive sexual organs; one found towards the bottom of her front, the other at the tip of her tail. When not in heat, these are similar in appearance to human or ausar vaginas, aside from the fact the front mounted one appears to sport a clitoris whilst the other, although more spacious and flexible, does not. When in heat, the vulva and clitoris become swollen and its lubrication heightens noticeably. Similarly to leithans, roehm in heat exude pheromones designed to excite nearby males and other roehm, and they themselves become more sexually aggressive.");
	outputCodex("\n\nRoehm clitorises are actually the tips of their penises, which in normal circumstances are kept housed. In the presence of sufficient amounts of female pheromones, roehm can produce 8-inch erections and act as fully-functioning males in coupling. Their penises are slightly soft but muscular and flexible, tentacle-like with small antennae-like sprouts on the head.");
	outputCodex("\n\nRoehm have a single, connected womb, and can effectively couple with both their front and rear vaginas. After a month-long gestation and regardless of where impregnation was achieved, roehm give live birth to 1-3 young from their secondary vagina, located at the tip of their tail and usually kept hidden. Traditionally roehm carry their young on their back, where they can feed, until such time as they can fend for themselves. This is regarded as a quaint practice in modern times, similar to human mothers tying their children to their backs.");
	outputCodex("\n\nThe roehm seem to have developed their reproductive habits as a result of their long, slow-paced lives. Whilst a lack of natural predators and a generous lifespan meant the roehm never felt any great need to breed quickly, once the window of the “full year” opens most feel a great urge to both breed and travel, finding as many different mates as possible. This has carried on into modern times, where many roehm take the opportunity of their fertile cycle to sightsee the galaxy, indulging in as much sex as possible at the same time.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History and Culture"));
	outputCodex("Long-lived and physically incapable of moving fast, the herbivorous roehm are renowned throughout the galaxy as being incredibly, sometimes frustratingly, laidback. Apocryphally, their uplifting during the sixth galactic rush took two decades purely because they saw no need to rush it. Their influence in the larger galaxy unsurprisingly took a while to spread - but they have had many centuries of relative peace to accomplish it. A naturally peaceful and social people, they can be found anywhere their relatively high maintenance bodies allow them to be.");
	outputCodex("\n\nThe roehm are highly sensitive in a literal sense: They are able to see more colors than most, and their antennae and sensitivity to chemical change allow them to perceive shifts in body language, atmosphere and hormonal release that others cannot. Superstitious claims that they can read minds are false, however the roehm do have a highly tuned empathic ability, able to tell things about others nearby that even they themselves may not know.");
	outputCodex("\n\nTheir constant need to take in moisture and nutrients to support their sweat production means the roehm eat and drink a lot more than the norm, particularly in non-humid environments. It is fairly unusual to meet a roehm when she is not munching on something, and they have a long history of producing the finest vegetarian chefs the galaxy has ever known.");
	outputCodex("\n\nA natural bend towards eating, drinking, sensitivity and year-long bouts of sex has led the roehm to develop a pleasure-seeking society, and they are often found at the heart of restaurants, saunas, bars, theatres and drug cartels, preferring to stay well away from official power and more utilitarian concerns. They enjoy gene-mods and often rework their bodies to appear more appealing to others, or to decrease the amount of maintenance they require. An incredibly difficult race to insult, the roehm largely do not mind, indeed sometimes encourage, their fond galactic image as complacent, gluttonous sybarites.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Roehm");
}
public function saeriCodexEntry():void
{
	clearOutputCodex();
	showBust("INESSA_NUDE");
	outputCodex(header("Saeri"));
	outputCodex("<i>Butterfly girls. Second form of caterpillar-like siel.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Saeri");
	outputCodex("\n<b>Taxonym:</b> Saeri");
	outputCodex("\n<b>Sexes:</b> Male, Female");
	outputCodex("\n<b>Height:</b> Fully matured saeri commonly range from five feet to just over six.");
	outputCodex("\n<b>Weight:</b> Saeri are very light for their size, ranging between forty to sixty kilos.");
	outputCodex("\n<b>Hair:</b> Light and dark variations of blue, purple, and pink, as well as black or white.");
	outputCodex("\n<b>Eyes:</b> Intense blues, purples, and pinks.");
	outputCodex("\n<b>Skin Color:</b> Dusky Blue");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Saeri are butterfly-winged humanoid bipeds. They have dusky steel-blue skin and slender, elfin bodies. Two bug-like antennae protrude from their head and they have six fingers per hand.");
	outputCodex("\n\nBesides their wings, the most immediately noticeable trait of a saeri are their distinctive eyes. While their sclera are white—much like a human’s or ausar’s—their irises look like exploding stars; bright flashes exploding in black, thick-rimmed circles.");
	outputCodex("\n\nThe one exception to the rule of saeri slenderness is the female bust, which may range anywhere from an A-cup to DD-cup.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Genitals"));
	outputCodex("Saeri genitals are near identical to siel genitals. Females have labial lips shaped in a Y-shaped fold, with the top of the Y facing toward the navel. Saeri have a great deal of muscular control over their vaginal walls, which are internally segmented.");
	outputCodex("\n\nA saeri male’s penis is segmented and rippled, ending in a small, pink, fleshy tip. They have two meatus (colloquially known as “cock holes”) that ejaculate twin streams of sticky, silk-like semen. Unlike siel males, their penis and testicles are always external.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Species Polymorphism"));
	outputCodex("The saeri is a polymorph of the siel species—a potential form the species may take during their life-cycle.");
	outputCodex("\n\nAt any time after puberty starts to the end of their life-cycle, a siel may feel the urge to undergo the transition from siel to saeri, though they do not need to act on this urge. This calling is characterized by the sudden need to eat excessive amounts of food, a sudden spike in silk production, and the desire to weave a cocoon around one’s body and hide from the world.");
	outputCodex("\n\nShould the siel indulge in this urge, they undergo a process of metamorphosis in which their body breaks down and transforms within the cocoon. When they emerge a month later, they come out as saeri.");
	outputCodex("\n\nWhile ninety percent of siel feel this calling sometime in their lives, only a third of the species acts on it. Not only does the siel lose one set of their genitals, they also lose their large abdomens and silk shooters—both needed to produce weavable silk.");
	outputCodex("\n\nThe transformation is not a total loss. In place of their silk-weaving capacity, the saeri gain the ability to fly. There are many theories as to the evolutionary purpose of this secondary form—colonization, hunting-and-gathering—but nothing xenologists can definitively agree on. What is known is that with the advance of civilization and gene-therapies, this supposed role is now redundant.");
	outputCodex("\n\nThere is currently research being conducted by various corporations into helping siel regain or keep their silk-weaving capacity upon becoming saeri.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Mating and Reproduction"));
	outputCodex("Saeri male and female seminal fluid is extremely sticky. When mating with a partner, this stickiness tugs at the genitals of their partner, heightening sensual pleasure. Unlike the siel, however, this stickiness is not so great as to ‘knot’ their partner.");
	outputCodex("\n\nA saeri phallus shoots copious amounts of this sticky semen, enough to pack an orifice completely full. Along with its clinging qualities, this ensures semen is trapped inside a partner, heightening the chance of impregnation. It is also difficult for rival males to displace this semen with their own, serving an evolutionary purpose.");
	outputCodex("\n\nA saeri female can give birth to anywhere between four to six young at a time, held for three months until birth. Saeri children are typically born as siel. However, there is a small chance of them being born as a ‘pure saeri’—a child born a saeri without having to become a siel first. This chance is significantly increased when mating occurs between two saeri partners.");
	outputCodex("\n\nLike the siel, saeri have a natural lifespan of up to two centuries and show very few external signs of aging. While they are extremely fertile, most take contraceptives that prevent unwanted pregnancies.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History, Culture and Religion"));
	outputCodex("As siel and saeri are different morphs of the same species, their history, culture, and religion is the same. (See the Siel codex entry)");
	outputCodex("\n\n");
	CodexManager.unlockEntry("Siel");
	CodexManager.viewedEntry("Saeri");
}
public function sielCodexEntry():void
{
	clearOutputCodex();
	showBust("XANTHE");
	outputCodex(header("Siel"));
	outputCodex("<i>Kinky, possessive silk-spinners. Be careful you don’t get too wrapped up in them.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Siel");
	outputCodex("\n<b>Sexes:</b> Male, Female, Herm (See Siel Sexes and Genders)");
	outputCodex("\n<b>Height:</b> Generally six feet high with a total body length of twelve feet.");
	outputCodex("\n<b>Weight:</b> Over one hundred kilos (220 lbs).");
	outputCodex("\n<b>Hair:</b> Very dark or very light blue, purple, or pink, as well as black or white. Many siel choose to recolor their hair.");
	outputCodex("\n<b>Eyes:</b> Intense blues, purples, and pinks.");
	outputCodex("\n<b>Skin Coloration:</b> Steel Blue");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Siel are fairly easy to spot in a room, mostly because they take up so much of it. Most humans observe that siel resemble a blue tauric caterpillar. The feeling is mutual, as siel note humans resemble a ‘Yorri’, one of their native humanoid animals.");
	outputCodex("\n\nStarting at the top, siel have a pair of antennae poking out of the front top of their head that sweep backwards. Like the rest of their body, the antennae are a bluish gray. Their hair varies from dark or light blues, purples, or pinks, as well as black or white. It can be of any length.");
	outputCodex("\n\nSiel have incredibly vibrant eyes that easily stand out. The outer ring of their iris is typically black, while the inner portion is a bright blue, purple, or pink. The way the color bleeds out makes their eyes look like eclipsing stars.");
	outputCodex("\n\nAt their necks are thin, horizontal slits. These are a pair of otherwise unassuming gills used for breathing when air to the mouth is cut off.");
	outputCodex("\n\nThe chest portion of a siel is similar to that of humans - breasts on women varying generally from A to D cups, and flat male chests. Their stomachs, however, have segmented muscles much like that of a caterpillar, broken up into square-like sections.");
	outputCodex("\n\nAlong their sides and starting level with the solar plexus are two rows of spikey, single jointed pro-legs, widely spaced apart. When pressed flush to the skin these appear to be small, v-shaped ‘armor chinks’. However, when pulled away they appear similar to the tiny legs of a centipede - an appearance some races find unnerving.");
	outputCodex("\n\nFrom a front angle, siel look as if they have unusually chunky hips, legs, and thighs with knees and two split toes. However, from behind it is obvious that their body continues on into a long caterpillar-like “other half”. This section of their body is very thick, round, and somewhat lumpy with legs underneath. Siel have eight legs in total.");
	outputCodex("\n\nAt the final pair of legs, a siel’s body has a very humanoid rump. They have a foot long caterpillar-like tail. This tail sticks upwards and can swivel in any direction. It is used for squirting their distinctive silk.");
	outputCodex("\n\nSiel have six fingered hands that are incredibly sensitive to touch. When these fingers are pressed to a surface - such as the ground or a person’s chest - they are able to pick up the slightest of vibrations.");
	outputCodex("\n\nSince body modding has long been a part of siel culture, many siel change the hair they are born with and their other attributes.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexes and Genders"));
	outputCodex("Long ago, siel only had a single pair of genitals located between their rearmost legs. However, due to centuries of modding to mate with other galactic citizens and interbreeding, at least half of them are naturally born with front genitalia as well. Those without them tend to get this ‘rectified’ with modding.");
	outputCodex("\n\nAs a consequence, almost all siel have two sets of genitals - one set at the front, and one at the back. Since the set of genitals a siel may naturally or artificially get are not limited, there are many naturally born traps and herms (both male and female), cunt boys, and dick girls. Even so, most siel strongly identify as either male or female instead of a third sex.");
	outputCodex("\n\nSiel female genitals are the same regardless of location. Their outer labial lips form a Y shaped fold with the bottom of the ‘Y’ always facing downwards. The siel have one clit located under the upper fold.");
	outputCodex("\n\nInside these three labial ‘flaps’ is a vaginal orifice that is internally lumpy and segmented, much like a caterpillar’s back turned inward. This resembles and serves as internal cushioning, with each section having its own clenched muscle.");
	outputCodex("\n\nMale siel genitals strongly resemble a caterpillar’s lumpy, segmented outside and ends in a small pink, fleshy tip. This tip is smaller than a human glans. This phallus ranges wildly in size from three to nine inches. They have two meatus (colloquially known as “cock holes”) that ejaculate twin streams of seminal silk.");
	outputCodex("\n\nA siel’s male genitals and testicles are kept within their body, with the former emerging only when they are aroused. The rest of the time this genital region is flat and only features a blue genital slit from which the phallus emerges. Because of this, it is particularly hard to identify siel ‘traps’ unless they are wearing nothing at all.");
	outputCodex("\n\nMany siel are born with or get a small ‘thigh gap’ mod beyond their front thighs to make wearing humanoid garments easier. All siel have an anus located below their tail and above their back genitals.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Siel Silk"));
	outputCodex("Located in a siel’s rump is a large silk producing sac. This makes up a large portion of their body, allowing all siel to produce incredible amounts of “siel silk”. Siel silk is distinctly different from terran silk and possesses incredible tensile strength and toughness.");
	outputCodex("\n\nSiel can produce silk from their tail sac in various forms, varying in stickiness, thickness, and malleability. Using these, the siel can produce tiny or large strings and weave them into whatever they desire. They shoot this silk out of the tip of their tails.");
	outputCodex("\n\nWhile there are many artificially manufactured substances superior to it, siel silk is far easier to make and is very vogue. A shirt made of siel silk is not only fashionable, but also light, flexible, and shock absorbent. In all lines of work, siel outfits offer eye-catching protection at an affordable price.");
	outputCodex("\n\nSiel produce finer, higher quality silk when their back genitals or anus is sexually pleasured, as this helps prime the production of their nearby silk sacs. Pleasuring their front genitals does nothing for silk production.");
	outputCodex("\n\nNo matter how sticky or tough it is, silk cannot get entangled or stuck to their own webs. A siel’s body is covered in microscopic hairs that can microscopically ‘cut’ this silk. Their uniquely sensitive hands have the most of these, allowing the species to use them as natural scissors for their own silk.");
	outputCodex("\n\nWhen weaving silk, siel will often attach silk strings to their claw-like prolegs, using them as makeshift holding hooks.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Siel Mating and Reproduction"));
	outputCodex("A siel’s silk sac is closely tied to their reproduction and culture for several reasons. The first is that a siel’s genitals and anuses are directly tied to their silk sacs.");
	outputCodex("\n\nBoth a siel’s anus and pussy, regardless of location, is lined with their special silk. This is also true for the outside of a siel phallus shortly after emergence, providing natural lubrication.");
	outputCodex("\n\nWhether a male or female siel is engaging in intercourse, the result is the same. Usually halfway through intercourse, an aroused siel secretes a ‘sticking silk’ from the exterior of their phallus, or the inside of their vaginal or anal walls. This is similar to an ausar’s knotting, though it is entirely liquid based. This practice is colloquially known as ‘silk knotting’.");
	outputCodex("\n\nOnce silk knotted, non-siel mate finds themselves stuck and unable to withdraw, trapped by the siel’s sticky, silky genitals. This sticky substance tugs at the partner’s inner walls or sensitive phallus from all directions, intensifying the more they thrust or try to withdraw.");
	outputCodex("\n\nA siel phallus shoots copious amounts of silk-like semen, usually enough to ensure an orifice is totally packed full. Usually after mating with a pussy (and sometimes an anus), a siel will shoot a burst of their normal, sticky silk onto the partner’s entrance. This ensures the semen is trapped inside and acts as both a method of ensuring impregnation and/or ‘claiming’ their partner.");
	outputCodex("\n\nIndividuals who have been mated with and sealed in this fashion are easily identifiable by their bloated abdomens, resembling light or heavy pregnancy depending on a siel’s potency. After the silk dissolves, a large portion of the semen often rushes out and the individual ‘deflates’.");
	outputCodex("\n\nA siel pussy, however, keeps a mate silk knotted until they have utterly flooded the insectile womb with semen, making certain eggs receive proper fertilization. All siel with a front or back pussy have a womb, though it is always located in their caterpillar-like abdomen, as semen travels either back or forward.");
	outputCodex("\n\nAny siel with a womb has a monthly ovulation phase where they produce, hold, and then expel unfertilized eggs through their rearmost or frontmost vagina. If their eggs are fertilized by being washed with semen, they hold these and produce no more eggs until birth six months later.");
	outputCodex("\n\nDuring pregnancy a siel’s insectoid stomach, humanoid breasts and stomach swell. While the insectoid stomach swells because of the growing child, the humanoid stomach swells as this is where residual eggs are pushed during the pregnancy period. A Siel female generally gives birth to a clutch of four to eight young at a time.");
	outputCodex("\n\nMost siel reach the cusp of adulthood in sixteen years, slightly shorter than the human norm. As a species, siel have a natural lifespan of up to two centuries and show very few external signs of aging.");
	outputCodex("\n\nEven though siel are fairly fertile, most take contraceptives that prevent unwanted pregnancies. While unprotected sex frequently results in pregnancy, protected sex rarely does.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History and Culture"));
	outputCodex("Siel have been part of mainstream galactic society for centuries. They hail from the arid world of Xhixia, a planet with sharp, sky touching mountain peaks and deep valleys. Located in the Liliaran Nebulae, it is their birth world and the capital planet of their interstellar empire.");
	outputCodex("\n\nSince the only flat parts of Xhixia besides the oceans are artificial, the siel evolved to heavily rely on their natural silk weaving skills to survive. Siel cities are literally woven out of tightly knit silk and packed together until they become ‘solid’.");
	outputCodex("\n\nFrom their meticulously woven silk cities, siel culture thrived and spread across Xhixia. Later discovered by an Ausar exploratory team, the siel quickly found their niche in galactic society. Not only did they excel at providing their special silk, the Siel were gifted in any area that required fine detail and deft hands.");
	outputCodex("\n\nIn the musical world, siel are incredibly gifted players of plucked string instruments. Due to their extremely sensitive six fingered hands and lifetime of working with string vibration, they are truly unparalleled in this area.");
	outputCodex("\n\nOne of the most well known traits of siel is their culture of tight fitting outfits and bondage activities. Before body modding was introduced to siel society, male siel were strongly predisposed towards erectile disfunction. This led to a culture of bondage where either a female siel would tie up a male’s genitals (or they would tie up their own) to increase blood circulation.");
	outputCodex("\n\nOver time, bondage has become not only part of siel mainstream culture, but an integral part of their culture. Females and males alike displayed their silk-tying process on their own bodies like a peacock plumage, attempting to attract potential mates.");
	outputCodex("\n\nEven after the original problem of erectile dysfunction was solved, siel still consider it ‘lewd’ not to tie up a mate during intercourse. Siel attitudes towards non-bondage are similar to human attitudes towards anal intercourse in the early twenty-first century.");
	outputCodex("\n\nSiel as a species have wholeheartedly embraced body modding. At first, the siel used it to solve their species’s disposition towards erectile disfunction. Since then they have used it to give their species an extra set of genitals between their front legs. When they are not born with them naturally, genital modding is subsidized by most siel planetary governments.");
	outputCodex("\n\nIt is common for a siel to mod their natural hair, eye, and skin color. There are still small sects of conservative siel who traditionally oppose both body modding and having sex without bondage, considering it ‘impure’ and ‘immoral’ behavior.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Religion"));
	outputCodex("Siel have a native monotheistic religion called Zyism, centered around a creator-deity called “Zyi”. The siel believe Zyi created the universe and their life spans, tying them all together in a gigantic invisible web called “the life thread”.");
	outputCodex("\n\nZyi spends their time tugging on the strings of each and every life, though their reasons are unknown. The siel believe Zyi simply does this because they are Zyi, and no other reason. The siel believe Zyi is both female and male and has many arms and legs - as many as there are people in the universe.");
	outputCodex("\n\nThe siel do not worship Zyi as much as recognize them. They believe manipulating Zyi is pointless, and prayer is an attempt at manipulation.");
	outputCodex("\n\nExtremist Zyi worshippers often believe that sex without bondage and body modding is impure and against nature, a byproduct of siel culture being corrupted by mainstream galactic society.");
	outputCodex("\n\nMost Zyi worshippers do not share this belief, however, many non-Zyi worshippers lump them together with these much louder fanatics.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Siel");
}
public function saurmorianCodexEntry():void
{
	clearOutputCodex();
	showBust("CHAURMINE");
	//Author: Aullama
	outputCodex(header("Saurmorians"));
	outputCodex("<i>Hot-blooded dinosaurs from outer space.</i>\n\n");
	outputCodex("<b>Name: </b>Saurmorian (singular), Saurmorians (plural)");
	outputCodex("\n<b>Genders:</b> Male and female");
	outputCodex("\n<b>Height:</b> Females average 6\' to 8\', males average 7\' to 9\'");
	outputCodex("\n<b>Weight:</b> Females average 250 - 300lbs, males average 600-750lbs");
	outputCodex("\n<b>Eyes:</b> Saurmorian eyes have a solidly colored sclera that vary between shades of yellow, green, brown, and some very rare reds or blues. Slim, similarly colored irises envelop their vertically slitted pupils, though they are virtually indistinguishable from the surrounding tissue.");
	outputCodex("\n<b>Scales:</b> Saurmorians have organic metal scales that grow from their bodies. These hard scales are highly resistant to heat and corrosion, and with a metallic-silver color, they are often compared to the elements platinum and titanium. The layering and formation of these scales give the impression of ancient terran style armor, akin to heavy platemail. Though generally identical in appearance, females’ scales are much lighter.\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Male saurmorians are tall, incredibly stout reptilian humanoids with a barrel-chested body. Pulled taut over their bulging muscles is a tough, thick reptilian hide in varying shades of grays, browns, greens, reds, and blacks, though usually quite hard to see under their scales. On top of their hide, males are encased from head to toe in dense, massive metal scales. They are especially dense along the male’s vicious snout, up their skull, broad shoulders, and down the spine to end at the tip of their thick tails. The groin though consists of smaller and much finer scales. The weight of all these scales forces them to have a fairly hunched posture, and for their bulky plantigrade legs to tend toward a constant bend at the knee.");
	outputCodex("\n\nTheir feet are wide, flat, and four toed. Though instead of regular claws or nails, razor-sharp scales grow from the feet in their place. Their hefty arms, slightly longer and thicker than their legs, end in hands just as imposing as the rest of their frame with five digits tipped with scale-claws. Metal horns crown their bestial visage, these horns being described as bovine, demonic, and/or draconic.");
	outputCodex("\n\nFemale saurmorians have lean, slim humanoid bodies, seeming outright delicate next to a male. Their dainty frames, however, can hide strong and lithe muscles.");
	outputCodex("\n\nInstead of the thick hide that the males have, females have incredibly smooth and soft scaly flesh that is seen with brighter shades of colors. Their skin is covered by metallic scales like their male counterparts, though much lighter. The scales also fit their bodies more for physical appeal than protection. While their bestial snout and visage can be intimidating, it manages to maintain a feminine allure, having more elegant angles than a male.");
	outputCodex("\n\nTheir long arms are seemingly as exquisitely covered as the rest of them, the inside of their arms however bare no scales, just as the inside of their lissom legs, commonly flat torso, and groin are without scales. Opposite from the males, females have two prominent nipples adorning their chest in a very mammalian manner.");
	outputCodex("\n\nThough their rather soft, heart shaped asses are not scaled, they may seem to be slightly cupped and caressed by the scales of the hips and thighs of some females. The hands end in five digits tipped with scale-claws. Their slender feet end in 4 toes tipped with scale-claws, and a curved vestigial scale-claw on the heel. Though females aren’t naturally born with horns, it’s not uncommon to see some adorning accessories or modded horns.\n\n");
	outputCodex(blockHeader("Sex and Reproduction"));
	outputCodex("Being reptilian, saurmorians naturally lay clutches of eggs, ranging from 10-15 eggs. A surprisingly large number, given a female’s rather slender hips. Such large clutches require the females to have large, flexible and elastic wombs and vaginas for both incubating and laying. To assist with laying, the walls of the vagina are lined with soft ribbing. Said ribbed walls will also assist with carrying seed to the womb during coitus.The labia are smooth and glossy, though fairly plump, topped off with a petite clitoris. The color of a female’s genitals matches her skin.");
	outputCodex("\n\nDuring incubation, the female’s body always produces an excess of the proteins used in developing both the shells of her eggs and the scales of her young. This abundance of nutrition gathers along her chest to form two breasts, allowing the woman to breastfeed her hatchlings to further help strengthen their scales. The larger clutches produce more excess protein, resulting in the more fruitful and fertile females having larger and larger breasts in order to accommodate their bountiful and more regular pregnancies.");
	outputCodex("\n\nTo complement their mates’ more pliant organs, males have thick penises with a ribbed length leading to a blunt head. The penis averages 10\" to 12\" in length, usually 2\" to 3\" in width, and can be seen in colors of dark red, dark blue, purple, or black. When not aroused, it will be contained in a rather mammalian sheath guarded in the male’s slighter crotch scales. To better inseminate eggs, males have large, incredibly productive and heavy testicles hanging below their members. While still thick, the hide containing these orbs is rather smooth and soft.");
	outputCodex("\n\nWith a rather dainty frame for laying eggs, females often become very rotund and weighed down. Though the number of fertile females is low, those that are fertile often go into estrus four or five times a year, with incubation lasting no more than two months. Male hatchlings mature slightly faster than females, being fully grown roughly after fifteen years. Females however require at least twenty years.");
	outputCodex("\n\nSaurmorians always start with a single name at initial hatching. Then later in life, roughly when they reach maturity, they receive a secondary name befitting their actions or feats. These names bear a similarity to ancient Latin.");
	outputCodex("\n\nSaurmorian young are viciously protected, with primal ferocity from the males in addition to the maternal instincts from the females. Any inquiries about their children are met with guarded silence at best.");
	outputCodex("\n\nWithout extreme actions, bringing up their young seems to be the only circumstance where females show much aggression. Though they mirror the males’ instinctive distrust, they otherwise act with a calm and gentle affection to their presence. Granted, this soft demeanor is often used as a facade to hide incredibly sinister and venomous feelings or thoughts. In contrast, males have no qualms dealing with anything in a bullish or intimidating manner, and are always very forward and blunt. They are surprisingly hard to anger, or to upset emotionally in general. Whether instinctual or taught, males seem to have impressive control over their emotions.\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("On their primal homeworld of Molis, an incredibly mineral rich planet strewn with active volcanos, saurmorians were a reclusive and stationary people; due to a deep seated desire to protect the few fertile females each clan had, and to lay claim to rich mineral veins so they could consume the metals in order to grow healthier scales. Though facing threats from many would-be predators, saurmorians stubbornly remained on top in no small part because of these scales.");
	outputCodex("\n\nEventually this isolated way of life no longer supported the increasingly larger clans, and dividing into smaller families only lead to conflict, so the saurmorians were forced to try a more open and united civilization. This lead to the largest families forming a simple but inevitable oligarchy, usually with the fertile females being the ones in power.");
	outputCodex("\n\nWhen the UGC arrived, they were met with a surprisingly well organized central society on the tail end of their own digital technological era. Though initially united, the saurmorians found themselves divided when faced with the UGC; some wanted to resist the Confederacy that many viewed as fragmented and inefficient, while others saw the advantage of being integrated into galactic society. The latter won out - barely - after a short but devastating civil war shattered the saurmorian capital. The sudden, violent outburst almost cost them what they had fought for though.");
	outputCodex("\n\nThe UGC were on the verge of withdrawing and removing any possibility of uplifting, until they were shown the saurmorians’ proficiency in refining and using the more basic weapons technology - specifically coil and rail weapons - and being adept at surviving in both hot and cold environments.");
	outputCodex("\n\nOnce integrated into galactic society, it became clear that saurmorians, especially the males, fit well as heavy labor in the more hazardous environments. Females are still far less common to see away from large colonies, let alone their home planet.\n\n");
	outputCodex(blockHeader("Culture"));
	outputCodex("For millennia the saurmorians have had a central matriarchy, in which the most fertile females would have the responsibilities of both breeding and leading. Over time though, fertility became less important; connections and political weight taking its place. This lead to the largest families staying in power more easily as their numbers swelled. For a relatively short period, incestual breeding within these political families became common in order to remain in power. It was around this time that the UGC arrived, eventually cutting off any further familial mating as the saurmorians saw the stigma towards these practices throughout most of galactic civilization.");
	outputCodex("\n\nStill maintaining a matriarchy, the saurmorians encourage their matrons to keep their own harems of the more virile males. To keep the blood fresh, males are chosen equally from both high and low-born families; a double edged sword, especially with the lower families, as those connected to a male chosen for a matron’s harem are well cared for. Male hatchlings that are indicated to have this genetic advantage usually become seen as future offerings for a matron.");
	outputCodex("\n\nAfter the devastation suffered by their forces, which effectively disabled any and all martial functions, following first contact the saurmorians attempted to reconstruct what was lost in a bid to keep their people calm. When it became clear the shattered forces couldn’t be salvaged, an infamous saurmorian mercenary company, known then as the ‘Morian Bulwark, sought to take advantage of this chance and offered their services until a solid military could be constructed. Instead, they grew so efficient and effective at not only servicing their own people, but assisting allies in other systems and worlds, that they have become the official saurmorian military. Their guns-for-hire past hardly a concern, the risen Saurmorian Bulwark Command managed to keep themselves separate from the central government; the hope being that having the political and martial powers separate and equal will prevent a repeat of the past.\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("Saurmorian tech has a three word criteria that needs to be met in order for them to use something; it needs to be effective, heavy, and loud. As a result, saurmorians can be seen using a wide variety of equipment, but usually prefer the heavier and clunkier technology throughout the galaxy at the cost of efficiency. Their ships, especially, are known for being very slow but incredibly durable and powerful.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Saurmorians");
}
public function simiiCodex():void
{
	clearOutputCodex();
	showBust("EMBRY_0");
	//Species Codex Entry
	outputCodex(header("Simii"));
	outputCodex("<i>Designed specifically by humanity not to blow anything up.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Simii <i>(From order name Simiiformes / Simians)</i>");
	outputCodex("\n<b>Sexes:</b> Male, Female");
	outputCodex("\n<b>Height, Weight, Hair, And Eyes:</b> As terrans.");
	outputCodex("\n<b>Skin:</b> Fur on their forearms and lower legs, with human-like skin everywhere else.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Simii are very similar in appearance to humans, as they are both part of the primate family. They have long, prehensile, monkey-like tail, and large, rounded ears that sit high on the sides of their head. All simii have a ‘birthmark’ similar to a lined barcode on the back of their neck.");
	outputCodex("\n\nTheir noses are somewhere between a human and a monkey’s nose, slightly darker than the surrounding skin, and more button-like in appearance. Above their upper lip, they have a small monkey-like line traveling vertically upwards, stopping just before their nose.");
	outputCodex("\n\nOn their body, simii typically have soft fur on their forearms and lower legs. Some, but not all simii also have a lighter shade of fur on their upper legs, biceps, and up their sides. Their faces, torso, bellies, and groin area are typically smooth and furless (though the latter does have pubic fur).");
	outputCodex("\n\nAll simii have hand-shaped feet that can be used to grab and manipulate objects, just like terran primates.");
	outputCodex("\n\nSimii have an extremely strong immune system that is both a blessing and a curse. While it kills most known viruses and bacteria upon entering their bodies, it does the same to life-saving medical drugs and transformation treatments before they can take effect.");
	outputCodex("\n\nSimii are extremely resistant to any form of bodily change, for good or for ill, including implants.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Simii are a genetically designed species, based on terran primates. They were designed to act as stand in for humans before efficient, safe interstellar travel was invented. Their bodies were designed to be resistant to radiation damage to DNA in deep space, as well as unknown pathogens at their destination.");
	outputCodex("\n\nWhile many simii still perished between Earth and their final destination, those who survived are the ancestors of the modern simii.");
	outputCodex("\n\nThe long time gap between simii colonization and human arrival gave the engineered species time to gain proper sapience and independence. After many fierce conflicts between terrans and the simii, the Terran-Space Coalition recognized them as a distinct species. Since then, humans have left the simii alone, and their relationship is much the same as with any other alien species.");
	outputCodex("\n\nTo this day, simii are still born with a barcode birthmark on the back of their neck; a holdover from when they were first designed. Since this scanning technology has become obsolete, few know about the mark’s original purpose, even among the simii.");
	outputCodex("\n\nThe simii were not the only genetically altered primate species sent out by humans. These species and the simii are known collectively as ‘primes’.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs and Society"));
	outputCodex("Simii inhabit a number of ‘wild west’ like colonial worlds that share no common government. They are traditional in nature, and very resistant to cultural influence. While simii deal with outsiders and treat guests warmly, they are hesitant to welcome outsiders permanently into their communities.");
	outputCodex("\n\nMost simii cities and towns are scattered across their planets in no particular pattern, governed by local law and nothing else. Family ties run deep, and being a simii outcast is the worst form of punishment barring death.");
	outputCodex("\n\nSimii professions are usually passed down from parent to child, with very strict gender roles. This has lead to a number of dissatisfied simii youths finding their way into galactic society, trying to change their lot in life.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Simii have identical reproductive features to their human cousins, and do not experience the effects of oestrus.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Simii");
}
public function slyverenCodex():void
{
	clearOutputCodex();
	showBust("SLAVEBREAKER_1","SLAVEBREAKER_2");
	outputCodex(header("Slyverens"));
	outputCodex("<i>Snake-woman as voracious for protein as they are engineered for beauty.</i>\n\n");
	outputCodex("\n\n<b>Name:</b> Slyverens (Singular: Slyveren)");
	outputCodex("\n<b>Sex:</b> Hermaphrodites with female characteristics.");
	outputCodex("\n<b>Height:</b> 5\' to 7\' tall. Tallest unaugmented specimen recorded at 8\' 7\".");
	outputCodex("\n<b>Weight:</b> 120 to 270 lbs.");
	outputCodex("\n<b>Eyes:</b> Vertically slit with metallic sclera. Coloration is widely diverse, though gold and bronze colorations are most common.");
	outputCodex("\n<b>Skin:</b> Covered in vestigial scales which long ago lost their rigidity in favor of softened flexibility.");
	outputCodex("\n<b>Ears:</b> Small holes posited deep into their cobra-like “hood.”");
	outputCodex("\n<b>Face:</b> Serpentine muzzle blended with humanoid traits.");
	outputCodex("\n<b>Limbs:</b> Humanoid arms and legs.");
	outputCodex("\n<b>Tail:</b> Thick, long, and muscular, tapered to a narrow tip.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("The reptilian Slyverens are what one might expect to see if you somehow crossbred a snake and a terran: all the hallmarks of humanoid shape and form with all the unique secondary properties of a serpent. Perhaps the only feature they are truly lacking is hair - on the head or body. Instead they bear wide cobra-like hoods from their heads to the napes of their necks, often decorated with intricate tattoo patterns designed to please the eye. Small ear holes lie inside, offering them incredible forward hearing in exchange for near deafness from behind.");
	outputCodex("\n\nSlyveren faces are snout-like, featuring slitted eyes and largely decorative nostrils. Scent is instead communicated through their long, forked tongue, though it is broader and fleshier than one assume from their snake-like appearance. An unusually plump lower lip lends them what many would consider to be an appearance of sensuality, but inside that deceptively squishly, toothless-looking maw are two retractable, needle-like fangs. Fortunately, slyveren maidens have attained excellent control over the associated muscle groups.");
	outputCodex("\n\nThe rest of a slyveren woman’s body is as one might expect. Soft scales bedeck their skin from crown to heels. Five-fingered hands on a pair of humanoid arms allow them compatibility with most forms of galactic weaponry. Plantigrade legs and feet offer them the chance to strut around in the heels popularized by terran fashion. The biggest outliers are their breasts, known to be as weighty as the most well-fed rahn’s, and the prototypical reptilian tail, long enough to trail on the ground behind them and counterbalance their otherwise untenable chestiness.");
	outputCodex("\n\nThese curvaceous snake-girls have taken to the cosmopolitan world of core society with gusto, leaving them as one of the biggest consumers of colorizering body-mods. Glittering golden scales are just as common as flashing bioluminescent hide. DNA analysis hints that they may have once been brown but permanently altered their own genome to the point where bright, flashy colors have become the norm.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Origins & Biological Modification"));
	outputCodex("Slyveren biology is a perfect example of how genetic alteration can allow a cultural dispute to spill over into the creation of a whole new race. The slyverens were originally \\\[REDACTED\\\], but after contact with the UGC, a schism in thought divided the species in two. One side felt their species could survive in greater comfort by feeding off the sexual drives of other species’ males. The other wished to remain as they were and prosper on their own merits, unaltered.");
	outputCodex("\n\nThe former aggressively pursued an initiative to modify themselves to take advantage of too-virile mammalian breeders, like the kui-tan. \\\[REDACTED\\\] venom was refined to be non-toxic and cleanly metabolized. Its effects were made more potent, suppressing voluntary muscle activity and subtly altering brain chemistry to reduce inhibition. New chemicals were introduced to temporarily enhance elasticity, necessary to allow the most-endowed males to flex around the bends in a slyveren throat. Finally, a cellular growth agent was added to rapidly repair the damages caused by injection.");
	outputCodex("\n\nOf course the proto-slyverens did more than modify their venom. They changed their very body shape to be more familiar to their “prey”. Bipedal legs made them seem less alien. Mammalian-style breasts offered something to draw the eye of prospective “seeders,” and with their long tails as counterbalances, they’ve been able to grow some of the biggest chests the galaxy has to offer. These seductive snake-women altered themselves to appeal to the masses, and judging by the popularity of slyveren blowjob holos on the extranet, they succeeded with gusto.");
	outputCodex("\n\nTime has only given the slyverens more opportunities for self-improvement. In modernity, they boast a numbing coating on their fangs, additionally salivary glands along the inside edge of their lower lip, hyper-sensitivity to pheromones, and an aptitude toward psychic ability that left terrans in the dust two generations ago. Fully 50% of their population is considered to have some degree of psychic talent, with projections estimating race-wide telepathic capability in 100 years.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("\n\nSlyverens do not reproduce utilizing penises, like most races. Instead, a slyveren woman will produce a fist-sized egg once a year. When mating, she press her vagina to her lover’s, and specialized muscles will eject the ovum into her mate’s channel. Hard-wired reflexes kick in at this point and draw the egg all the way into womb, pushing the second slyveren’s egg out to trade places with the first’s. This exchange triggers the release of semen from a combination ovary/gonad gland until fertilization occurs.");
	outputCodex("\n\nA full incubation term lasts five months, after which the egg will be roughly melon-sized. Hatching takes four to five months, much longer than the \\\[REDACTED\\\]s they originated from. Slyveren younglings emerge tiny but capable of basic locomotion. Milk, an adaptation stolen from other races, provides sustenance for them well into adolescence. It is only after maturation that they switch to the licentious food-source that has given rise to their fame - and only after lactation stops does a slyveren mother’s body begin to produce eggs once more.");
	outputCodex("\n\nUnfertilized eggs are expelled from the body after a few months. The more debased among high society consider them to be an exquisite delicacy.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Current Intragalactic Relations"));
	outputCodex("Slyveren-controlled space is small, mostly centered around their originating system. Colonization by more aggressive races has found their territories surrounded, and the increasing number of protein hunters in the core has reduced demand for their services to record lows. Shrewdly negotiated trade deals by Galotian-controlled holdings have crippled most local industries to leave the slyverens as a people in crisis.");
	outputCodex("\n\nThe 14th Planet Rush brings with it a chance at untold wealth and riches, and the slyveren government has responded by aggressively subsidizing would-be rushers to colonize primitive, unincorporated planets. Galotian rushers are encouraged to avoid contact with slyverens in the wilds. Males and hermaphrodites should exercise caution. Thirsty slyveren will disregard consent laws in favor of a fresh meal, should they find themselves in the wilds of a rimward planet.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Slyverens");
}

public function sionachCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Sionach"));
	outputCodex("<b>Name (Singular & Plural):</b> Sionach");
	outputCodex("\n<b>Sexes:</b> Male and female");
	outputCodex("\n<b>Height:</b> 4\' 7\" to 5\' 10\"");
	outputCodex("\n<b>Hair:</b> Sionach hair runs the gamut from orange, black, white, gray, browns and silvers of varying shades. In addition to scalp and pubic hair, many sionach of both genders develop what are colloquially referred to as whiskers on the cheek: three bar-like patterns of short, downy hair. In addition, all have slender, shaped patterns of fur across their otherwise hairless bodies which vary from individual to individual. Some have small strips up their legs, others have tufts on knees and elbows, and some have negligee-like patterns around the chest and buttocks. These outcroppings are always very short, barely removed from the skin, and serve more as coloration than protection. ");
	outputCodex("\n<b>Eyes:</b> Two large eyes in the normal humanoid position. Common eye colors include amber, golden, brown, crimson and yellow-green, with rare eye colors including blues, purples and blacks. Pupils are either round or vertical slits, with an equal distribution among the population. ");
	outputCodex("\n\n");
	outputCodex(blockHeader("Physical Features"));
	outputCodex("Sionach are humanoids, slightly smaller and more lithe than a terran. They stand on digitigrade legs with five-toed feet, each toe capped with a talon-like claw rather than a nail. However, most sionach keep said claws filed down to prevent injury and damage. They have a single pair of arms, ending in five-fingered hands that bear short, tough talons firmly fixed to the flesh. These are kept filed down much like the talons on their feet, for the same purpose.");
	outputCodex("\n\nSionach eyes are larger than a humans, and glow with faint luminescence. They have fang-like teeth, larger and sharper than the human norm, clearly evolved for predation. Ears reminiscent of those of a fox, if writ much larger, sit on either side of their head; their mobility makes them important parts of sionach body-language. Atop a sionach’s head sits a pair of horns, made of bone growths. The precise size varies widely from individual to individual; some have only small nubs, easily hidden by their hair, whilst others have much larger and more impressive horns that either grow forward, to the sides, or curl like those of rams. It’s not unheard of for Sionach to file down their horns simply to make them less obvious, but this is less common than it is for the claws.");
	outputCodex("\n\nSionach possess one or more tails sprouting from their rear ends; these look like fox tails, but are considerably longer, with extreme cases growing out nearly as long as their owner is tall. The precise number varies from 1 to 9 in total, and tail number is traditionally a social caste mechanism - the more tails an individual has, the higher in the social hierarchy they are. This has fallen out of favor in recent years, but particularly tail-blessed individuals still enjoy many social privileges. Sionach tails are prehensile, and exceptionally sensitive to the touch, owing to the masses of nerve endings found in them that allow them to be prehensile. These tails are so sensitive in fact, that touching or handling the tails of a sionach who hasn’t expressly given permission is considered a low form of sexual assault -- though, at the same time, tails often find a usage in sex amongst particularly connected lovers. Additionally, though the light they cast is far too meager to call much attention in even normal ambience, all sionach tails have luminescent glands in the tips, causing them to glow gently in the dark.");
	outputCodex("\n\nSimilarly to humans, female sionach possess permanent breasts mounted on their chests. Breast size averages are smaller than current terran or ausar norms, with the norm being between a large B or C-cup; more buxom sionach are quite rare, but command an exotic beauty among their species. Breast growth modifications are quite common since their joining the U.G.C.");
	outputCodex("\n\nMales possess external phalluses, which are normally concealed inside a sheath that hangs above two external testes. Like the vulpines they resemble, sionach cocks are knotted, but they lack the distinctive tapered shape of an actual vulpine phallus; instead, the sionach phallus has a distinctly reptilian shape to it, bulbous on the bottom and tapering out across a curved shafted to a pyramid-tipped head. Male phallus size is abnormally large compared to their body height, with average lengths between ten and eighteen inches.");
	outputCodex("\n\nComplex organs inside of the sionach’s torso produce a strange chemical mixture that becomes luminescent several seconds after being exposed to oxygen, creating a ghostly looking flame. This “firegas” is completely harmless, being a biological phosphorescence - essentially, it’s nothing more than glowing mist, being tasteless, odorless, and having very little heat. It is believed to have evolved as a method for warding off predators, much like a leithan’s bioluminescent plating.");
	outputCodex("\n\nSome chemical quirk means that a sionach’s flames are always the same color and hue as his or her eyes, and it is believed that the luminescent nature of a sionach’s eyes is due to related chemicals being part of their makeup. The luminescence of a sionach’s tail, by comparison, is confirmed as being due to its connection the organs that produce firegas.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"))
	outputCodex("Arcysus is a temperate, oceanic world with relatively little landmass. What land exists is rolling, open plains across several chains of large islands. While they had little landmass to work with, the sionach developed sea travel early, and in more modern times, sea-based construction: several of the largest cities on Arcysus are floating citadels, reaching deep beneath the surface.");
	outputCodex("\n\nWhile the sionach were not the first in their system to develop space travel -- that development went to their lunar neighbors, the kui-tan -- the sionach wholeheartedly embraced the science of spaceflight soon after. This lifestyle has led to the sionach adapting quite well to interplanetary travel, and they are well respected sailors thanks to millennia of naval tradition. They have not colonized far afield, thanks to their races’ small numbers and slow reproduction, but sionach ships are a common sight throughout the galaxy.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Sionach, though capable of engaging in sex whenever they choose, are only capable of reproducing once a year, during a four-week long period during which females enter a state of “heat”. During their heat, female sionach experience a marked increase in libido, and a noticeable swell in the size of the hips and buttocks, signaling their fertility.");
	outputCodex("\n\nSex with a sionach male is quite an experience; their strangely-flared, bulbous phalluses are articulated to the point they can undulate and move inside their partner with an almost tentacle-like sinuousness, granting them a range of motion that approaches prehensility. Penetration is deep and intense due to the sheer size and girth of a sionach penis.");
	outputCodex("\n\nDespite the fact that sionach testes can be fairly large, they are not exceptionally productive. Indeed, the average sionach produces far less semen than the human average. This is the common explanation for the sionachs’ relatively low population, and the reason the species as a whole is quite hesitant to colonize other worlds -- this would spread the species dangerously thin.");
	outputCodex("\n\nDespite their otherwise mammalian physiques, sionach are egg-layers, producing one or more eggs after fertilization. The precise size of a clutch is dependent on the virility of the father; most only have one, or rarely, two at a time.");
	outputCodex("\n\nOnce fertilized, the eggs grow to their full size and are ready to be delivered within four weeks, and will hatch within another eight to nine days of being laid. Infant sionach are highly dependent on their mothers, and actually nurse for an average of four years, but sometimes as long as six years, as part of their development. In a natural population control method, hormones produced by breastfeeding prohibit entering heat; only after her last clutch has been weaned can a sionach bear more clutches.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The sionach exist as part of a small, independent collaboration of races centered on their solar system. The sionach themselves evolved on the planet Arcysus, while a race known as the kui-tan are quite literally their galactic neighbors; the kui-tan homeworld, Jitafore, is actually the largest moon of Arcysus. The third race in their coalition is a cultural offshoot of the kaithrit species, who settled in their system with the permission of the now-spacefaring sionach and kui-tan.");
	outputCodex("\n\nThe sionach are a relatively recent contact for the U.G.C. made in the last planet rush, and are still making a place for themselves, counting themselves more as nominal allies than as actual, full-fledged members. It is possible that, with time, they may unite officially or even become a full part of the U.G.C., but for now they have not expressed interest in that, and they are too small an independent power for most authorities to worry about forcing them to ally or join. As a result, this race is not widely known throughout space just yet, though the continuing presence of sionach ships has grown over recent years.");
	outputCodex("\n\nAll evidence suggests that the sionach cultural evolution was fairly standard for humanoids, with the most unusual aspect being their early contact with other sapient life from beyond their planet. As is widely documented in their own planet’s histories, it was shortly after the sionach developed powerful radio receivers that they accidentally made contact with the kui-tan, who had reached a similar stage of development on their own world.");
	outputCodex("\n\nIt is something of a friendly argument between the two species about who holds the more important role in their mutual histories; the sionach, for inventing the radio transmitters that allowed them to greet their lunar neighbors, or the kui-tan, for inventing the first reliable space-vessels that made physical contact between their species possible.");
	outputCodex("\n\nIt’s possible that it was because of this initially friendly contact with extraterrestrial life, and their own ignorance of greater culture, that the sionach were willing to extend a hand of friendship to a kaithrit colony-fleet that strayed into their system. Damaged and low on supplies due to raids and the disasters that had brought them off-course and to the sionach’s system, these Kaithrit accepted that friendly offer and eventually found themselves welcomed as a third member of the now-coalition of alien species. Ceasing their nomadic wanderings, they have fully settled into the system and become an integrated part of the new culture there.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Sionach");
}
public function suulaCodexEntry():void
{
	clearOutputCodex();
	showBust("AZRA");
	outputCodex(header("Suulas"));
	outputCodex("<i>Colloquially known as “sirens” for their singing voice.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Suula");
	outputCodex("\n<b>Sexes:</b> Male, female, and hermaphrodite (Evenly split between the three.)");
	outputCodex("\n<b>Height:</b> 6\' to 8\'");
	outputCodex("\n<b>Hair:</b> Suula hair is composed of extremely slender, soft feathers. In terms of style and texture, they closely mirror human or ausar hair, while remaining aerodynamic and water resistant.");
	outputCodex("\n<b>Skin:</b> A suula’s skin is composed of a layer of extremely smooth, soft scales. Similar to that of a Terran shark, a suula’s epidermis is highly advantageous for swimming. Common colors range from blue, red and green, to purple, gold and silver. The skin is often marked with stripes, and most suula have a paler coating on their bellies and chests. Their digits are slightly webbed, and their forearms bear a thin coating of vestigial feathers.");
	outputCodex("\n<b>Eyes:</b> A suula’s eyes are black, with vertically slit pupils. Irises come in a variety of colors, predominantly green, gold, blue, and red.");
	outputCodex("\n<b>Feet & Legs:</b> Suula legs are clawed, with four digits and a dew claw on the heel. Their toes are rather dexterous, able to grip and hold objects nearly as well as their hands, though they lack precise motor control of species such as the simii.");
	outputCodex("\n<b>Wings:</b> Each suula is born with a pair of sprawling feathered wings growing from his or her upper back. These wings are strong enough to enable short bouts of flight in Terran-standard conditions, or for extended durations in their native atmosphere on Valdera.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Suulas are tall, powerfully built predators built for hunting both underwater and in the air. Combining a mix of avian and aquatic traits on a humanoid frame, the suula are considered by many to have both a threatening and alluring physiology. Most members of the species are colorfully-skinned, with broad feathery wings and figures best described as voluptuous. However, they also possess angular faces bearing a double row of rending teeth and a foot long prehensile tongue. Suula digits are clawed, and each has a finned tail capable of delivering hammer-like force. Their ears are tall and finned, and their forelimbs are coated from the wrist to near the shoulders with brilliantly-colored feathers.");
	outputCodex("\n\nGiven their dark, predatory eyes and unique markings across their smooth, scaly flesh, it’s no wonder many confuse suula for a very primal race. While this couldn’t be further from the truth, many suula warriors are quite happy to take advantage of their fearsome appearance. Others prefer to sedate such impressions using attractive silk garments, flashy jewels, holo-technology.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexuality & Reproduction"));
	outputCodex("Suulas come in three sexes: males and females, who bear the galactic norm for sexual arrangement, alongside hermaphrodites. All three are fairly feminine in appearance, with males being the physically smallest and slightest of the three—though they also have much larger genitalia than hermaphrodites of the species by some 25% on average. Male suulas also have disproportionately large external testes, often grapefruit sized or larger, attached to masculine endowments of some foot long at average. Of all the sexes, their venomous penile-tendrils are the most potent.");
	outputCodex("\n\nSimilarly, female suulas have considerably larger hips, breasts, and buttocks compared to the other sexes: the average female is quite voluptuous by Terran/Ausar standards, with cup-sizes averaging at F or larger and hips made for rearing large clutches of young. Females are also the largest of the sexes in terms of height and physique, best described as “amazonian” by other races, as they are capable of reaching over eight feet in height and among their own kind were the primary hunters and bread-winners in ancient times, meaning they possess fearsome physical strength.");
	outputCodex("\n\nIn most respects, then, hermaphrodite suulas fall in between their pure-sexed siblings. They are of average height, usually around seven feet, and have roughly human proportions in terms of sexual endowment.");
	outputCodex("\n\nSuula genitalia is positioned in the usual place for a biped, though the shape and contents are comparatively unique. A suula’s vagina is comparatively tight but elastic, and filled with hundreds of small cilia that are constantly in motion during intercourse. The entrance of the womb is surrounded by somewhat larger tentacles that wrap around a penetrating penis and pull it deeper to insure fertilization.");
	outputCodex("\n\nThe masculine organ is long and thick, with a bulbous crown. Tentacles line the penis, each tentacle able to sting their partner with a potent mix of aphrodisiacs and fertility enhancing drugs. At the tip, six smaller, thinner tentacles lay waiting to sting and to help pull open the entrance to a female’s womb. At the base, six larger, longer tentacles wait to tease and stimulate a female inside and out, helping to bring about orgasm and relax her womb’s entrance. These tentacles will even caress and sting a male’s member before sex on instinct, necessitating he reach maximum hardness and sensitivity to help with repeated potent orgasms during sex. Between their tentacles and venom, suula copulation can last hours and dozens of climaxes.");
	outputCodex("\n\nAfter a successful mating, suulas will carry their young for six months before giving birth to live offspring. Birth is comparatively painless for the race thanks to their cilia-lined vaginas, which help to move the offspring out quickly and easily. Most suulas prefer to give birth in shallow water, as this helps to open the newborns’ gills early—as well as easing their own physical burdens due to the pregnancy. Suulas invariably give birth to twinned offspring (so twins, quadruplets and sextuplets are their equivalents of singletons, twins and triplets). Clutches of four are the most common, meaning a mother suula becomes quite gravid during pregnancy.");
	outputCodex("\n\nBecause all suula pregnancies result in multiple births, and the race is quite active in terms of reproduction, so-called “womb siblings” are considered the closest form of relationship (perhaps even stronger a bond than mates or parents), and later in life it is quite common for womb-sisters to share lovers, or even take common mates. Suulas are quite naturally polyamorous, and while most females choose only one “stud” to sire her children, suulas of all sexes commonly enjoy the attentions of several partners. Between womb-siblings’ tendency to share and the race’s naturally high libido, suulas have developed something of a reputation for sexual excess and orgiastic behavior.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History & Society"));
	outputCodex("Suulas hail from the oceanic, mountainous world of Valdera, located within the current borders of the Gryvain Heartland Republic. A thick-atmosphere, stormy world, Valdera has little in the way of solid land—and what there is, is extremely rocky and unforgiving, with little vegetation. Because of this, it’s little wonder the suula evolved from predatory fish (believed to be similar to Terran tiger sharks) before acquiring the means to take to the air.");
	outputCodex("\n\nAs they adapted to sapience, and eventually civilization, suulas primarily constructed coastal settlements, combining underwater segments of their cities with vaulting halls dug into the sides of the mountains and cliffs, protected from their homeworld’s violent storms. From these halls, the suula began to mine for crystals and gemstones—to this day, ornamentations of jewelry is culturally significant, both as status symbols and as ornamentation for mating rituals, friendship bonds, and other cultural touchstones.");
	outputCodex("\n\nValdera was discovered in the 10th Great Planet Rush, during which time the suula were in a roughly medieval state of technology and social development. Their upliftment process was difficult, between the species’ surprising shyness in the face of alien contact, compounded by both a spiritual awakening around a latent psionic who claimed the “power of the crystals” to repel the invaders and a rapidly growing war-like sentiment once rushers began strip-mining certain landmasses. It took several decades for Confederate diplomats (and a small force of Terran-Space Coalition marines) to finally bring the various queens and warlords of the planet to the table and begin the uplifting process in earnest.");
	outputCodex("\n\nNaturally, Valdera’s rich supply of gemstones and precious metals, especially sheradine, has since made the world a fairly profitable destination for trade and mining corporations. Post-First Contact, Steele Tech and Aegis are the primary interests on the planet, with Aegis operating a massive in-atmosphere shipyard on the planet’s watery surface. Hundreds of thousands of suulas are employed by the foundries and yards sprawling across their worlds’ southern ocean.");
	outputCodex("\n\nAs mentioned, Valdera currently resides within the domain of the G.H.R. A very close neighbor of the gryvain homeworld of Vendiko, Valdera’s similar atmosphere and the two races’ similar physiologies suggest a possible shared heritage -- though scientists currently cannot make a certifiable connection that would prove one or both races are descended from a common, terraforming-capable ancestor. Relations between the two species are quite amicable regardless, though each insists that, should there be a shared ancestor, their race was clearly the original. Unsurprisingly, gryvain-suula hybrids are an extremely common occurrence.");
	outputCodex("\n\nSuula themselves are best known throughout the galaxy for their singing voices. They were originally called “sirens” by the spacers that first encountered them for good reason: suulas have haunting, song-bird-like voices that carry an enchanting beauty, and among spacers who work and live with them, their voices have taken on an almost mythic quality. Across the rest of the galaxy, suulas count hundreds of best-selling pop icons, opera singers, and even symphonic metal vocalists among their ranks -- any genre where a soulful woman’s voice can make its mark.");
	outputCodex("\n\nDespite their predatory nature, modern suulas are often described as being quite gentle and fun-loving. Indeed, they are quite famous for a strong romantic streak: most suulas admit to thinking quite frequently about their partners, especially on matters of settling down and raising children. Romantic bonds are exceptionally important to the suula, especially those made with their “mates” (and between a female and her “stud,” or the sire of her children). They are a peaceful race, with no record of major interstellar conflict since their upliftment.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("Modern suula technology is galactic-standard, primarily influenced by gryvain and terran trade. Their dedicated military forces are relatively small, operating a few dozen warships to counteract piracy as part of the planet’s Guardian Force, supplemented by G.H.R. and Confederate Peacekeeper protection for the species’ handful of newer colonies. Like the gryvain, the suulas heavily supplant their military and worker force with V.I. drones. Most suula-made technology is highly decorative (and expensive) but functional, incorporating gold and gemstones liberally into their designs.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Suulas");
}
public function tarratchCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["TARRATCH","TARRATCH_NUDE","TARRATCH_NUDE_ERECT","TARRATCH2","TARRATCH2_NUDE","TARRATCH2_NUDE_ERECT"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Tarratch"));
	outputCodex("<i>Insectoid psionic slavers.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Tarratch");
	outputCodex("\n<b>Sexes:</b> Male & Female, equal split.");
	outputCodex("\n<b>Height:</b> 6\' 1\", average.");
	outputCodex("\n<b>Weight:</b> With half of them capable of flight the tarratch are light for their size, their evolution trading the safety and endurance afforded by dense bone and exoskeleton structure to achieve weights of 80-100 pounds.");
	outputCodex("\n<b>Hair:</b> Head only, naturally almost universally black.");
	outputCodex("\n<b>Eyes:</b> Black, pupil-less.");
	outputCodex("\n<b>Wings:</b> Seasonal, male only. <i>See Reproduction.</i>");
	outputCodex("\n<b>Antenna:</b> Their most recognizable natural feature, tarratch antennae grow in a “ruff” corona around their necks. They have the appearance of short, wide feathers which when vibrated shimmer with hypnotic, kaleidoscopic colors. Aside from being able to sense vibration the ruff apparently lends its wearer a limited ability to sense nearby minds, and can be used to communicate silently with other tarratch.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Evolving from the strange insect analogues of their uncompromising home world of Origaiz, the tarratch are bipedal humanoids with distinct arthropod features. Their delicately featured spearhead-shaped faces and their alabaster skin are immediately recognizable to humans and ausar; their inky eyes, spidery digits and black exoskeleton-clad limbs are not. Their physical similarity to other sentient insect analogues, such as the recently discovered zil and myr, has lent fuel to the fire of galactic divergent evolution or “Seeder Precursor” theories. Setting them apart from other bipedal insect sentience are their ruffs of diaphanous, multi-colored moth-like feathers, which the tarratch can use to hypnotize and, with the aid of their long, butterfly-like tongues, feed psionically upon prey.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Gender Dimorphism, Breeding and Sexuality"));
	outputCodex("Male tarratch naturally have a black, slightly curved prong penis roughly six inches in length. Their testicles are internal. Females have a black, clitoris-less vagina, the inside of which in turn is slightly curved. Tarratch do not ejaculate in quite the same manner as most species do; the tip of the prong penis is porous, and the male seeps its oily, transparent semen throughout intercourse, in this way facilitating penetration with increasing amounts of lubrication. Although lacking a clitoris, tarratch vaginas are self-lubricating and sensitive, and females are more than capable of sexual gratification.");
	outputCodex("\n\nGender dimorphism amongst the tarratch is not large, with both males and females sharing slim frames and androgynous, delicate good looks. Females however have small, ornamental chest bumps and an insect abdomen above their rear, which under regular circumstances is as small as a football. Thanks to the scarcity of resources upon their home planet the tarratch remain sterile for most of their lives, naturally only becoming fertile when their bodies sense there are enough nearby resources available to support children. When this happens, the females abdomens become swollen and the males sometimes sprout diaphanous insect wings; both genders become more sexually aggressive. Once fertilized, the female lays a small clutch of eggs from her abdomen after a short incubation period.");
	outputCodex("\n\nAlthough capable of breeding with other pseudo-insect races (or others sufficiently modded) the tarratch are not particularly driven by the need to procreate. They regard their natural sterility as a boon, allowing them to pursue sex purely for the enjoyment of it and to intensify the sensation of mind feeding. Like humans they enjoy gene splicing themselves to further enhance the pleasures of sex, and encountering tarratch with outlandish appendages and add-ons is common.");
	outputCodex("\n\nTheir equal gender split, the lack of physical differences between sexes and the relative ease with which females can give birth has allowed the tarratch to evolve an egalitarian view towards genders that is fairly rare amongst insectoid races. Encountering males in positions of power or significance is about as likely as finding females - if that difference can even be discerned from a chance meeting. As a result of existing in galaxy full of races with marked sexual differences, tarratch often adopt a playful attitude towards gender, exaggerating their natural androgyny to confuse, discomfort or even entice others.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The planet Origaiz is a small rock with minimal axial tilt, which only just falls within the habitable zone of its white hot sun. One side bakes in merciless heat whilst the other freezes to the core with a rapid turnover. All life upon it has evolved the ability to survive both extreme heat and cold, drawing in energy during the day, dissipating it in the night, invariably burying deep into the planet’s crust to escape the temperature and to access aquifers. With food upon the surface at a premium, the tarratch evolved early on to transfix prey with their shimmering collar displays, forcing thoughts and memories to the surface of their simple minds so that the whereabouts of their nest could be accessed. The hostile and fast-changing conditions of their home meant the tarratch developed a capricious, variegated and ruthless civilization revolving around internecine warfare and slave-taking; with the best resources moving constantly with the band of temperate weather between day and night the idea of lasting societies with long term goals was a complete mystery to them.");
	outputCodex("\n\nThe tarratch were struggling beyond the iron age when they were discovered and uplifted by the ausar during the tenth planet rush. They escaped Origaiz into a galaxy full of biomes which to them felt like a never-ending summer morning. They also discovered a whole range of sentients with excitingly rich minds and interesting bodies, expanding their capacity to take and trade slaves exponentially. The tarratch communicate only partially via their vocal chords; they also transmit thoughts and feelings to each other through their feathers, involving an intricate art of etiquette and bluff. The insect race are therefore culturally disposed to view even those races with biological or artificial psionic capability with a kind of contempt, stunted sentience that is incapable of understanding that its birthright is to be little more than playthings to the tarratch.");
	outputCodex("\n\nImpatient to begin examination and extraction of the mineral resources and strange wildlife of Origaiz, the ausar regretted uplifting the grateful and non-hostile tarratch so readily once the race had become synonymous with frontier piracy and slave-taking. Origaiz has had its U.G.C. membership withdrawn and placed upon probation numerous times in an attempt to force it to get a handle on the problem, with little effect. Origaiz’s distant location and hostile environment deters would-be occupiers, and the fact the race aren’t technically at war with anyone and are perfectly willing to trade minerals, the prized mood-altering glamorflies and of course indentured servants with anyone unscrupulous enough, means the U.G.C. aren’t inclined to chase more hardball tactics with them. They have further buttressed themselves against opprobrium by becoming heavily involved within the galactic financial sector, with many tarratch hierarchies forging profitable partnerships with human and ausar-owned gene mod, real estate and loan companies.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Away from the frontier the tarratch have developed into an urbane, pleasure-seeking society, forever inquisitive as to the next thrill and high that the galaxy can provide them.");
	outputCodex("\n\nThe tarratch are a reasonably technologically sophisticated race, however they have little explicit interest in areas outside modding, pleasure and psionics. Their natural instinct for fast attack and resource seizing has caused them to evolve a lightning approach to warfare; their craft and armaments are designed to shock and overwhelm an enemy immediately, and if that doesn’t work, to retreat as fast as possible. Whilst they prefer the company of their own kind they are willing to work with other races, and can be found throughout the frontier working as mercenaries, traders and splicers. However, the difficulty they have moving throughout the core worlds thanks to their probationary status means that they are almost always found in the lawless hubs of the galaxy. Though they have few official colonies the tarratch have heavy presences on gateway worlds and stations, where intragalactic law is relaxed enough for them to operate freely.");
	outputCodex("\n\nThe tarratch lack any recognizable form of central governance, instead organizing themselves into “hierarchies”. What each is concerned with, how big they are and how they are governed varies wildly, and changes all the time as new partnerships are formed, new groups splinter off and takeovers or coups are performed. The swiftly changing conditions of Origaiz did not readily implant a particular style of governance amongst the tarratch. Indeed, they as a culture express a pride in their adaptability, capriciousness and the difficulty other societies have in pinning them down. If they do express a particular trope culturally it is just that: changeability. Tarratch have little concept of betrayal or treason; if one tarratch loses his position of power as a result of their underlings or comrades working against him, this is considered a result of him simply not being smart or adaptable enough.");
	outputCodex("\n\nSince integration into wider galactic society, many profit-based hierarchies have worked out ways of moderating excessive changeability, in order that they may do business better with non-tarratch. This often takes the form of official “fronts”, usually constructed with the help of aliens, which others may negotiate with, whilst backstage the tarratch can continue practicing a form of politics that is bewildering and unsettling to most outsiders. Business travelers should be aware that tarratch rarely enter deals with only one goal in mind; there may be as many as three dozen reasons why they are attempting to buy or sell a good, most of which will be opaque to the other party, if not without consequence.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Slavery"));
	outputCodex("The only truly stable interest tarratch culture has, aside from a pronounced love of fashion and pleasure, is slavery. Their fast-changing societies on Origaiz has evolved in them a different view of the practice to most; on a world where a dictatorship could become a commune within the same month, tarratch slaves may be presented with plenty of chances to overcome their position, and therefore a slave that stays a slave deserves or desires to do so. This feeds into a wider view amongst tarratch that other races - slow, staid, mostly incapable of pseudo-psionic communication, minds richly nutritious - simply merit enslavement, and that indeed it is a natural state for them to be in. They are perfectly capable of respecting U.G.C. rule of law, however, and scare stories of tarratch cot-robbers and press gangs on space stations are invariably untrue. All official hierarchies confine themselves to indentured servant trading, enslaving outlaws and, during frontier rushes, technically legal poaching of native species.");
	outputCodex("\n\nTarratch-contracted servants are invariably kept for sexual, nutritional and/or ornate purposes. Any need to use slaves for labor purposes died out long ago, and employing them in this capacity is seen as an embarrassing waste. For the purposes of nutrition, tarratch often expose servants to a wide variety of experiences, in order to make their minds richer and therefore more satisfying to feed off. Tarratch interest in gene-modding is a happy coincidence; richer owners will literally change their servants repeatedly, testing out new combinations of mods that will in turn shift the perceptions of the servant and inflict any number of new emotions on them, from extreme pleasure to shock and horror, which can then be tapped and enjoyed. Slaves have prestige value, and trading exotically shaped and minded pieces of property is an extremely popular pastime. Being an indentured servant to the tarratch is generally an eventful but extremely draining occupation.");
	outputCodex("\n\nTarratch-run syndicates often market themselves as “specialist” indentured servant traders, looking to meet the tastes of the most discerning of customers, whilst waging turf wars with their rivals and independent pirates in the frontier. More recently, in order to offset bitter competition they have encountered in the indentured servant trade, some tarratch hierarchies have reportedly expanded into drug running and chemical narcotic experimentation.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Feeding"));
	outputCodex("Aside from the mundane requirement to eat that is understood by most other biological life, the tarratch are driven to feed upon the thoughts and feelings of other beings. This process, still not fully understood by wider galactic society, apparently provides them with the nutrients they need to continue being functionally psionic.");
	outputCodex("\n\nA tarratch looking to feed hypnotizes his or her target with their feather ruff, drawing their most intimate thoughts and memories to the surface, sexually overwhelming them. They then insert their long, hollow tongues into whatever closest resembles a mouth upon the target and feed upon the heady froth of psychic imagery that has formed, usually taking advantage of the aroused state of the victim at the same time. The sensation is described as like receiving long, extremely ruthless mental oral sex.");
	outputCodex("\n\nThe tarratch are capable of reading their victim’s minds to a limited extent this way – particularly clear memories and strong impulses can be discerned – but observably and explicitly prefer the “taste” of raw emotion, usually seeking to drain a strongly perceived feeling from an invaded mind before anything else. Short term effects from being fed upon by a tarratch include memory blanks, sexual arousal backwash and complete loss of one or several emotions; if the victim is given enough time to recover however this recedes and missing thoughts grow back.");
	outputCodex("\n\nHaving spent millennia feeding upon the simple and base emotions of animals, the tarratch found the sentient life of the galaxy an almost impossibly rich banquet which they have spent most of the intervening time gorging upon whilst working out new ways to make it even more delicious. Tarratch will rarely simply attack other beings on gate-worlds and stations, unless suitably desperate – they are much more likely to solicit willing “donations” with money or " + (isAprilFools() ? "dogecoin" : "credit") + ". Sentients encountered on the frontier, or indentured servants the tarratch themselves own, are considered fair game.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Tarratch");
}
public function thraggenCodexEntry():void
{
	clearOutputCodex();
	showBust("CAPTAIN_KHORGAN");
	outputCodex(header("Thraggen"));
	outputCodex("<i>The instigators of the great galactic war, locked away for their - and everyone else’s - good.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Thraggen");
	outputCodex("\n<b>Sexes:</b> Male & Female");
	outputCodex("\n<b>Height:</b> 6\' to 7\' 5\"");
	outputCodex("\n<b>Hair:</b> Naturally, thraggen hair ranges in shades from silvery gray to a vibrant orange or dark red. Warriors often paint their faces and dye their hair in woad-like patterns, passed down by family line, before combat or major ceremonies.");
	outputCodex("\n<b>Eyes:</b> Slitted, predatory eyes, usually brightly colored -- green, blue and red are the most common.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Physical Features"));
	outputCodex("The thraggen are towering humanoids, often standing a foot or more over the human norm. Green-skinned and powerfully built, this alien race arose as apex predators on a hot jungle planet, and have evolved into a brutal warrior culture that teaches pain as pleasure -- and their biology has caught up with them. Be it by scientific error or natural phenomenon, the thraggen’s ability to perceive pain is permanently diminished, and largely replaced by a powerfully sexual pleasure, which grows ever more fearsome as the warrior is injured in battle. Indeed, when a thraggen soldier is bested in battle, she is often begging for sexual release rather than mercy. Which, conveniently, has allowed warring tribes to end blood feuds with an explosion in population rather than massacre, allowing the thraggen race to expand with alarming rapidity.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Though native to the hot, humid jungle world of \\\[REDACTED\\\], the thraggen carved out a stellar empire for themselves by “slow boating” colony ships at near-light speed in their local cluster, establishing a sizable interplanetary presence before the first U.G.C. warp gates arrived. Having no tremendous skill at terraforming, most thraggen worlds remain rugged, untempered worlds with vast uncharted wilderness between sprawling clan holds.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Thraggen reproduction follows much the same course of human breeding, with males inseminating females, usually in the heat after battle. Thraggen females will carry their child for an average of 5 months before birth, and average a single young per pregnancy.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Arising on the jungle world of \\\[REDACTED\\\], the thraggen survived for many millennia as hunter-gatherer tribes, hunting the towering Gryllan beasts rather than attempting agriculture, even into what would, on earth, have been analogous to the middle ages. Formed into closely-knit warrior tribes, the thraggen warred heavily against each other for territory, often resulting in clan feuds that would last for generations, and in some cases, persist to the modern day. Their early space flight was ramshackle at best, with most attempts at extraterrestrial flight merely attempts at weaponizing satellites or rapidly deploying soldiers. However, as the age of technology progressed on \\\[REDACTED\\\], the longer lives granted by advancing technology combined for the thraggen tendency to fuck rather than kill their enemies, began to lead to overpopulation of the homeworld. Hunting grounds became ever more precious, and the first major settlements, or clan holds, were established to secure precious land against rival tribes and upstart bands.");
	outputCodex("\n\nWithout warp gates, however, the options for leaving the homeworld were few: the \\\[REDACTED\\\] system is largely made of gas giants, not terrestrial worlds. The wealthiest tribes were able to hold onto their growing empires, and grew settled; it was the younger tribes who were eventually forced to leave, packing up into primitive colony ships and setting sail for nearby worlds at near the speed of light, on voyages that would take years or decades to complete. On the backs of these young explorers, the thraggen race took to the stars, largely by crashing irrevocably on desert worlds and wasteland planets. The starward clans began to eke out an existence on the new worlds, colonizing and terraforming to the best of their abilities, though even now most thraggen worlds are rugged and deadly wastelands between the few surviving clan holds.");
	outputCodex("\n\nThe thraggen only enter the galactic stage in 227 A.C., when a U.G.C. warp gate flew into orbit around a starward thraggen world, and activated. An element of the Terran’s Coalition Expeditionary Force arrived with it, eager to explore the new world -- and were immediately met with a rampaging horde of towering greenskins, descending upon them like wild animals. The bulk of the Terran force retreated, with several dozen captured and enslaved before the C.E.F. could leave the planet. By the time the Coalition returned with a full fleet to rescue the prisoners, they met -- to their horror and surprise -- an equal fleet of cobbled-together thraggen warships, with several more fleets on the way as the underestimated “brutes” co-opted the Ausar gates to unite their own worlds.");
	outputCodex("\n\nThe war that immediately bloomed turned a dozen U.G.C. worlds into smoky, wasted husks before a proper response could be mustered and a military assembled. With a friendly casualty count in excess of 50 billion, the U.G.C. won. It was not a pleasant victory, nor a clean one. To this day, the surviving thraggen worlds exist in perpetual blockade, closely watched by an army of spy satellites for any signs of hostility.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Thraggen");
}
public function toveCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["ORRYX","TLAKO"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Toves"));
	outputCodex("<i>Fluffy, seemingly asexual merchants.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Tove");
	outputCodex("\n<b>Sexes:</b> Male and female.");
	outputCodex("\n<b>Height:</b> 2\' 10\" to 3\' 5\". Toves are fairly short compared to other races, and often switch to “all fours” (really six) when the occasion calls for speed. In this position, they are rarely higher than 1\' 5\".");
	outputCodex("\n<b>Weight:</b> 30 to 70 lbs. Toves are generally short and stocky, with broad, thick tails.");
	outputCodex("\n<b>Average Lifespan:</b> 170 to 220 years");
	outputCodex("\n<b>Feathers:</b> Toves are covered in a thick covering of downy, fine feathers. These can range from deep maroon-purple, to yellow-ochre, or even greens and blues. In terms of head covering, females have longer plumage, which males often sport crests. Currently, those toves that deal with humanoid races often opt to style their plumage to mimic mammalian head-hair. Their hands and feet are featherless and scaled, looking like pale yellow or orange bird talons. Their beaks often match their talons, though many toves color their beaks with gaudy stripes or patterns.");
	outputCodex("\n<b>Eyes:</b> Toves posses four eyes, set just above their beaks, (two on each side, arranged laterally.) Their eyes are not large, relative to their faces, and have sideways, goat-like pupils. Colors range across the yellow spectrum (green, orange, yellow). Toves can move their eyes independently, though the effect is often disconcerting for other sapients.");
	outputCodex("\n<b>Limbs:</b> Toves look more like stuffed animals than other humanoids. They possess six limbs in total, each typically covered in thick, lush feathers until the first joint, switching into scaley, bird-like talons. Each dextrous talon possesses 3 claws and an opposable thumb. In their natural, aquatic habitat, this allows toves to manipulate a multitude of devices at once, and most tove terminals are engineered with this aesthetic in mind.");
	outputCodex("\n\nOn land, they typically stand on their hind legs, supported by thick haunches, their bellies and tails dragging along the ground.");
	outputCodex("\n\n<b>Faces:</b> The majority of a tove face is dominated by a broad, short beak, ending in a ridged hook. Beak colors are generally a pale yellow or orange, matching the tone of their scaly limbs. Though hard and chitinous at the tip, their beaks become more flexible at their edges, allowing for a wide variety of facial expressions.");
	outputCodex("\n\nWhen communicating with others of their species, toves often accompany spoke work with the movement of their long, rabbit-like ears. This is often cause for concern when a non-tove speaks with two or more toves at once, as toves can carry on basic conversations among their species with ear movement alone - an underwater adaptation.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Bodyshape"));
	outputCodex("Toves are distinctly non-human in proportion. Their amphibious lifestyle and unusual number of limbs mean that they often lack visible hips or chests, resembling more animalistic, tubular torsos. Oftentimes toves will adopt fashion items, such as corsets or vests to mildly compress their bodies to create the illusion of hips or chests. Some toves, particularly ones of high status, often harem owners adjusting for dealing with other sapient races, utilize mild genetic manipulation to develop visible breasts. These breasts serve no real purpose or stimulation for the toves, but simply function as an aid for dealing with sex-driven sapient species.");
	outputCodex("\n\nToves posses broad, muscular tails. Underwater, these tails are their primary mode of propulsion. When a tove is preparing to spend extended time out of water, they will often bloat their tails, absorbing as much water as possible to sustain them on dry land. These tails also house a tove’s reproductive organs.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Fashion"));
	outputCodex("Toves dress in clothing vaguely evocative of Victorian Earth, accessorized with coppery gear motifs and devices, focusing primarily on vests, ties, and shirts (for males) or corsets, heavy dresses, and loose blouses for females. Due to the nature of tove anatomy, pants are impractical, and, given the thickness of their feathers, unnecessary. Toves as a race possess a fondness for hats, and many wear period-appropriate top hats or bowlers. Despite their primitive look, most tove accessories are outfitted with a fair level of technological sophistication. (For example, many pocketwatches and fans contain holo screens.)");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("Because of the race’s mercantile predilections, the majority of toves dwell in Wabeships, dome-shaped satellites containing what appear to be small cities surrounding well-manicured lawns and clear ponds. Upon entry, though, a visitor finds that the majority of the buildings within the domes are not residencies but commercial businesses, making Wabeships effectively floating shopping malls, designed to entice and attract potential customers. The center of these cities is often a large bordello of non-tove species, overseen by the captain of the ship. The toves themselves generally dwell in the sections of the ship below the dome in water-filled corridors and chambers. Due to the high level of water pressure utilized by toves, and the three-dimensional layout of corridors, rooms, and terminals, the sub-sections of a Wabeship are generally inaccessible to other races. Smaller tove ships, not designed to cater to other races are likewise filled with water and designed to tove sensibilities.");
	outputCodex("\n\nThe only reason a tove can be found outside of a Wabeship or off its home planet is the possibility of money. Toves are not explorers, thrill-seekers, or scientists, but WILL seek out any opportunity to turn a profit. Thus, Toves can be found on any planet hosting a decent number of " + (isAprilFools() ? "dogecoin" : "credit") + "-carrying individuals. They are generally not far from a small stand or pressurized chamber to provide them with the comforts of home.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Though toves resemble avian or mammalian creatures in appearance and behavior, their nearest terran reproductive equivalents are plants. Their bizarre reproductive systems and lack of sexually-derived pleasure mean that they are not sexually or reproductively compatible with other species.");
	outputCodex("\n\nReproduction between a male and female tove usually follows the following process and requires cool, clean areas of water with no less than 40 Psi of pressure:");
	outputCodex("\n\t1. Females open 50-200 gonopores lining their tails, releasing spores into the water.");
	outputCodex("\n\t2. Males open their gonopores and extend out 20-100 hair-like stamens from their tails, each a filament topped with an adhesive cluster of the male’s genetic material.");
	outputCodex("\n\t3. Male stamens sweep through the water, attempting to catch female spores.");
	outputCodex("\n\t4. Cell division begins immediately on contact between female spores and male stamens, forming gametes.");
	outputCodex("\n\t5. The male brings his tail into contact with the female’s, as each gamete-topped stamen gravitates towards a female’s gonopore and lodges in there, breaking free of the male’s body.");
	outputCodex("\n\t6. Tail-to-tail contact is repeated for maximum implantation of gametes into the female tail.");
	outputCodex("\n\t7. Each gonopore that received a gamete immediately seals itself, and begins to develop a jelly-like sack around the gamete as it develops into an embryo.");
	outputCodex("\n\nThe mating process may take upwards of several hours, and results in no sexual pleasure for either tove. Gestation of the eggs can take up to 6 months. Over the course of this period, the female tove’s tail swells, often to the size of the rest of her body. As a result, female toves are often water-bound and find landbound mobility too difficult. A female tove’s body often reabsorbs some embryos, breaking them down until she is left with no more than 1-3 eggs. A female lays her clutch of jelly-like eggs underwater, where they must remain undisturbed for several weeks. Toves most often prefer the aid of technology to make sure their eggs are kept safe and secure.");
	outputCodex("\n\nToves reproduce out of a reasoned desire to continue populating their race and to produce a workforce. While parents are responsible for the initial payment of expenses incurred when raising a child, every newly-born tove is born in debt, as parents track all costs as the child matures. Upon reaching the age of 20, a tove is considered an adult, and must begin the process of repaying the cost of its upbringing. At this time, their debt begins to accrue interest at government-regulated rates. Typically, most toves take 10 years or so to repay their debt, which is split between both parents.");
	outputCodex("\n\nTove broods generally range in size from 1 to 3. However, adult toves find it economically unsound to raise more than 2 children at a time. Remaining children are given to the community, and raised by governmental bureaus. While such children grow up with bureaucratic systems in place of parents, their apprenticeships mean that they are not required to pay back any parental debt.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Mome, the tove homeworld, is a planet of vast, shallow seas, similar to Earth during the Cambrian era. Most of the land is covered with a single species of foot-high terrestrial algae, and the widest variety of life is aquatic. Oddly, evolutionary paths on Mome ignored the relatively sparse landmasses, and diverged based on aerial lifeforms and aquatic ones. The skies of Mome are filled with vast clouds of floating invertebrates, aerial jellyfish the size of blimps, and predatory fish that adapted to life in the skies. Predation from said fish at various points in their evolution forced the toves into deeper and deeper water, building vast civilizations in the depths.");
	outputCodex("\n\nThere, tove civilization advanced, and as they developed technology, they ventured back to the surface, building spires and eventually venturing into space. Upon contacting the greater universe, toves found themselves at a unique disadvantage. The galaxy seemed to run on sex, a language in which they lacked fluency.");
	outputCodex("\n\nThough the toves didn’t understand the obsession with sex, they could wrap their heads around it as a commodity--a virtually inexhaustible resource that other species couldn’t seem to get enough of. Through the use of contracts, salaried employees, and a unified trade and communication network, toves began serving as middlemen for sexual encounters between species. Eventually, these arrangements evolved into large-scale harems, controlled by wealthy Procurers and Madams.");
	outputCodex("\n\nThe tove race as a whole is governed by the Gyre Grand Camarilla, often referred to as “The Camarilla.” Officially a megacorporation, it creates laws, enforces laws, and regulates policies between toves. The Camarilla encourages the participation of individuals by means of buyable votes. Camarilla policy is decided by the majority of votes, and votes are purchasable from the Camarilla. Smaller policy changes usually result in cheaper costs for votes, while major decisions often cost millions of credits per vote. For a tove to effect change in his/her government, he/she must first accumulate a sizable fortune.");
	outputCodex("\n\nA heavy focus on wealth, frugality, and business savvy shapes tove society. Wealth is status, and a lust for economic gain is the closest thing toves experience to libido. Toves often become disturbingly focused and intense at the prospect of monetary gains, and judge the “attractiveness” of a person (suitability as a mate/spouse) based on their personal wealth. It is unusual but not unheard of for a tove to marry a member of another species based solely on monetary gain.");
	outputCodex("\n\nAs a result, toves are are often approached with caution by other races. They are not generally considered deceptive, but they are hard bargainers, and do not tire of negotiations. Because the Camarilla enforces accountability for PR purposes, rare is the tove that will actually “cheat” a customer with damaged or misleading goods.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Toves");
}
public function vildariiCodexEntry():void 
{
	clearOutputCodex();
	showBust("FYN");
	outputCodex(header("Vildarii"));
	outputCodex("<b>Name (Singular & Plural):</b> Vildarii");
	outputCodex("\n<b>Pronunciation:</b> ‘Vil-dahr-ee’");
	outputCodex("\n<b>Sexes:</b> Male, Female");
	outputCodex("\n<b>Height:</b> From five to six feet, with rare exceptions on either side of the spectrum.");
	outputCodex("\n<b>Weight:</b> Between 60 to 85 kilograms, with males generally being 10 kilograms heavier than females on average.");
	outputCodex("\n<b>Average Lifespan:</b> Vildarii have a natural lifespan of up to two centuries. Scientists believe this longevity is directly related to their inherently morphic biology.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Vildarii are one of a handful of polymorphic races currently integrated into the U.G.C. As humanoid shapeshifters, they are able to take other humanoid forms, so long as these new forms do not deviate excessively from their natural, ‘true’ form. As such, it can be quite hard to identify a vildarii from appearance alone, unless they are assuming this form.");
	outputCodex("\n\nWhile many polymorphic races have natural forms that lack distinct protrusions and sexual characteristics, vildarii are not one of them, possessing a natural form that is not too different that from a terran human. Still, there are distinct physical characteristics that set them apart; every single vildarii has vermilion-red skin, jet black hair, and large pointed ears, typically five inches in length. Many races describe vidariii ears as being distinctly ‘elf-like’.");
	outputCodex("\n\nBy far the most distinctive physical characteristic of the race is their cat-like eyes; while their sclera is white, their irises are a fiery-crimson with black slits.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Polymorphism"));
	outputCodex("Sitting somewhere in the center of polymorphic ability, vildarii are all born with this trait, but not all are equal in its application. Like any physical activity, there are those who work and train at polymorphism, honing this art to a higher standard than others. While all vildarii take part in classes to train this trait as part of average schooling, the average member of the species can usually change their physical coloration and eyes, but nothing else. Those who continue to study and train this ability can make further, more extreme changes.");
	outputCodex("\n\nThe more a physical alteration deviates from one’s natural state, the more of a toll it takes on the body. Most vildarii cannot perpetually assume an alternate form for more than a day without at the very least one hour-long break. On top of this, the act of polymorphism—particularly the initial transformation—consumes a massive amount of bodily nutrients, particularly fats, sugars, and protein. For those who transform regularly, these must be replenished each and every time. It is not unusual to see vildarii binge-eating certain foods, while still appearing physically fit.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Vildarii have been part of the U.G.C. for several rushes, and benefited from not being the first polymorphic race to join, completely avoiding the fears and prejudices leveled against earlier species. After their genetic sequence was mapped into scanning devices, they incorporated themselves with ease into galactic society, since becoming as readily accepted as races such as the Ausar and Kaithrit.");
	outputCodex("\n\nThe species can be found on almost any planet, blending in both physically and culturally. Vildarii are naturally morphic in both mind and body, loving to immerse themselves in other cultures and absorb all there is to offer.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Vildarii are generally considered hedonists; traveling to distant stars just to relish in local cuisines, arts, and above all, sensual pleasures there is to offer. The galaxy is generally considered a sampling plate, and with their long life-spans, they have plenty of time to taste-test it all. It is perhaps not surprising in that light that the species is a wholehearted advocate of the U.G.C.’s Rush program. Some vildarii will even join non-integrated species in secret; making themselves look like a local member to indulge in their lifestyle, unhindered by alien prejudice.");
	outputCodex("\n\nMost vildarii spend a great deal of time trying to be as physically and socially amicable as possible. Many vildari get genetic splicing done to this effect, particularly getting potent pheromone glands to maximize their appeal.");
	outputCodex("\n\nThe most common career paths for a vildarii are diplomacy, social sciences, performing arts, modelling, and prostitution.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction and Sex"));
	outputCodex("While vildarii are polymorphic, their reproductive biology is rather straightforward and similar to terran humans. They have males and females carrying sperm and ova respectively. Through intercourse, sperm is delivered to the ova, fertilizing it and forming an embryo. Pregnancy usually lasts six months, resulting in the birth of a child, or more rarely, twins.");
	outputCodex("\n\nThere is one significant difference between vildarii sperm and ova, and that of humans. While humans can only successfully produce offspring with a select number of species, vildarii are able to breed with nearly any known species. This is a result of both their ability to shift the arrangement of their sexual organs, and the naturally adaptive nature of their sperm and ova. For example, while humans and most other species cannot produce offspring with a leithan, this is not an obstacle for a vildarii, whose sperm and ova would adapt to couple with the selective species.");
	outputCodex("\n\nMost matings with other species results in a half-vildarii; a native with the skin coloration, hair, and limited morphic properties of a vildarii.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Religion"));
	outputCodex("Vildarii have a native religious order called ‘Followers of the Infinite Aspect’. They believe a single entity exists that represents all things, able to take the face and empathize with every species and being in the universe. They believe being able to comprehend such a being is nigh-impossible, but adherents strive to emulate the Infinite Aspect by living their lives in other people’s shoes and trying to see the universe from as many aspects as possible.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Vildarii");
}
public function vulkrimiCodexEntry():void 
{
	clearOutputCodex();
	showBust("SEMITH");
	outputCodex(header("Vulkrimi"));
	outputCodex("<b>Name (Singular):</b> Vulkrim");
	outputCodex("\n<b>Sexes:</b> Male");
	outputCodex("\n<b>Height:</b> Ranges from 4\' (120 cm) to 5\' (150 cm).");
	outputCodex("\n<b>Weight:</b> Between 20 and 30 kilograms.");
	outputCodex("\n<b>Skin:</b> Stretchy and friction-less like latex, but normal in texture and appearance. Typically red or blue, but in rare cases purple or obsidian black.");
	outputCodex("\n<b>Carapace:</b> Loose plates of black, brown, or orange chitin. Most vulkrimi surgically remove them.");
	outputCodex("\n<b>Hair:</b> Bald.");
	outputCodex("\n<b>Horns:</b> Two small horns on their foreheads.");
	outputCodex("\n<b>Ears:</b> Short elfin ears.");
	outputCodex("\n<b>Eyes:</b> Human-looking eyes with black sclera and pupils. The iris can be bright orange, red, blue or violet.");
	outputCodex("\n<b>Lips:</b> Colored in red, blue, purple, black, pink or orange.");
	outputCodex("\n<b>Teeth:</b> Human-like, but slightly sharper.");
	outputCodex("\n<b>Tongue:</b> Forked in shape and varies in color, including red, blue, purple, black, pink or orange.");
	outputCodex("\n<b>Nipples:</b> Colored in red, blue, purple, black, pink or orange.");
	outputCodex("\n<b>Tail:</b> Scorpion-like tail with an obsidian- or orange-colored barb.");
	outputCodex("\n<b>Average Lifespan:</b> 70 Earth years");
	outputCodex("\n<b>Homeworld:</b> Maggrath");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("The vulkrimi are a species of impish humanoids with traits reminiscent of demonic mythologies from other U.G.C. cultures. They are an all-male race, as the female sex has been rendered extinct. Those females that do exist are either former males or clones. Their bodies are elastic and smooth, capable of stretching themselves far more than other species while leaving them unharmed. This characteristic gives the skin the benefit of holding itself tight against the flesh, stopping bleeding and hiding scars far more easily than the skin of other species.");
	outputCodex("\n\nTheir bodies are covered in chitinous plates, some of them loose while other are tight against the body, taking the shape of a huge armor similar to those worn by the ancient samurai. This armor is extremely inconvenient, especially on the hands and legs, and give them a reputation of being exceedingly clumsy. Most vulkrimi consider these plates as nothing more than a vestigial evolutionary remnant, so they choose to surgically remove them.");
	outputCodex("\n\nVulkrim cocks are usually four to six inches long, one inch across and are very similar to dog cocks, tapered and with a pointed head, but lacking the iconic knot. When flaccid it will rest inside a sheath of the same color as the skin. When erect it will reveal a shaft covered in a usually darker foreskin hiding a cockhead that can be red, blue, purple, black, pink or bright orange in color. Below is a scrotum of the same color as the skin with a pair of balls, three inches across inside. Without the surgery, these are hidden by a pair of hanging plates that sprout from their belly buttons.");
	outputCodex("\n\nWhile they come in a variety of colors, a vulkrim’s secondary pigmentation tends to be naturally coordinated, with the most notable combination being orange accents appearing exclusively on obsidian skin.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Modification"));
	outputCodex("Traditionally, in order to become more efficient and aesthetically pleasing to their females the males often surgically removed the armor plates covering their bodies. This cultural tradition carries on to this day, with the vast majority surgically removing the plates at one point in their lives, normally as early as possible. This practice often gives them a more relaxed view of gene-modding than other races, often taking them to fit in more easily within other societies. One good example of this attitude is their willingness to take the Treatment when visiting New Texas, greatly boosting both their height and demonic features, turning them into incubus adonis.");
	outputCodex("\n\nNinety percent of the vulkrim population participates in procedures to remove the plates, though in more recent times preferences have changed from surgery to specialized mods. They can choose which plates to remove, but most prefer to remove the plates from their whole bodies, resulting in an impish look, with human-looking hands and feet, black claws and an almost prehensile, demonic tail that ends in a spade, tipped with a small black barb.");
	outputCodex("\n\nTheir elastic skin hides almost all scars from surgery, except for few pores around irremovable roots that even genemods can’t remove. They take the form of triads of parallel holes above each of their pectoral muscles, and on their arms, legs, brows and head. These scars are often erogenous zones, akin to nipples, although most try keep this a secret from their alien lovers.");
	outputCodex("\n\nAround eighty percent of this race use mods to grow hair on their scalps and crotches, with some going further and giving themselves hair on their faces and bodies, just to seem more enticing to other races. Since their females had naturally black hair, most males tend to pick black for their own hair, making other colors a rare sight.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Habitat"));
	outputCodex("Vulkrimi were originally from Maggrath, a very humid planet with strong volcanic activity and very few predators. This gives them the ability to thrive in worlds that are both hot and humid, and since their accession to the U.G.C. they have settled several colonies in similar environments. These colonies tend to be seedy places due to their higher propensity toward criminal activity.");
	outputCodex("\n\nIn the past vulkrimi were divided into several sub-races: the black-skinned from the volcanic zones; the red-skinned from the tropical zones; the blue-skinned from the more humid zones and the purple-skinned from the more arid zones. Nowadays this is a meaningless definition due to technological development and hybridization.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("When the female sex of this species still existed, they reproduced like most races of the U.G.C. The male would insert his penis into the female’s vagina and ejaculate his sperm which would fertilize the ovum in the womb and lead to birth several months later. While they can still create hybrids this way, no pure vulkrim can be born this way. Children fathered by a vulkrim are always male, except for those races where gender is not decided by the DNA of the male gamete.");
	outputCodex("\n\nThe same virus that erased the females also transformed the tails of the males, changing the glands that they used to produce poison into producing a powerful virus. This virus can create a fertile pseudo-womb if injected in a large and wet enough orifice of any race, which a male can then impregnate. This is the only natural way for vulkrimi to produce more pure members of their race, but it doesn’t require any of their DNA to produce a viable child. After injection, any male of any race can fertilize the temporary womb and many sterile or homosexual couples ask their vulkrim friends to help them bear children with their virus.");
	outputCodex("\n\nThis pseudo-womb is extremely fertile and tough, making it almost always guaranteed to bear the child to term upon insemination. These pregnancies usually last seven to eight months and it’s always live birth, even if the mother comes from an egg laying species. After the pregnancy or if not impregnated within one week of injection the pseudo-womb will deteriorate on its own.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The vulkrimi, before first contact, were a spacefaring society that had recently developed the capacity to settle in the worlds of their home system. A near-utopian society where the majority of males were ruled by a minority of dominant women. The first contact with this matriarchal society guaranteed they would go through a quick and beneficial accession to the U.G.C.");
	outputCodex("\n\nBy the time the gates opened and the rush started everything had changed. The females were all dead and the males had their new strange reproductive method. Vulkrim society had turned unstable and fraught with criminal activity. The males had lost their tall and seductive females that kept them in line and were dealing with changes the virus had caused to their sexuality; expressing themselves through unruly and criminal activity. Because of the rush, and many of the corporations interest on the virus, they eventually managed to reorganize into a somewhat more stable society. Despite being riddled with corruption and criminal activity it eventually joined the U.G.C. In subsequent rushes the vulkrimi have led several colonization expeditions, especially in those worlds with an exceedingly humid atmosphere or high volcanic activity.");
	outputCodex("\n\nIt’s unknown where the virus that led to these disastrous changes came from, but the prime suspect was one of the scientists in the first contact vessel. The virus was also known to have the signature of an infamous scientist accused of creating several transformative viruses frequently used by bioterrorists.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("The females of this species chose to breed with males with exceptional libidos so that subsequent generations would be easier to control. Once a male vulkrim hits sexual maturity, at around sixteen terran years of age, their libido starts to go into overdrive, increasing exponentially as they grow older. Since then several custom gene-mods have been designed to maintain their libido at reasonable levels, but they are costly and require yearly intakes. If they don’t take any at all, by the time they reach their forties the barest touch in any of their erogenous zones can send them into a rut.");
	outputCodex("\n\nVulkrim personalities change a lot depending on whether they are or aren’t sexually satisfied. If kept from having sex for a long time, they will grow dominant and unruly and often try to force themselves on others. If on the other hand they are consistently satisfied, they will be obedient and submissive, going to great lengths to prove their loyalty to their lovers, family and friends.");
	outputCodex("\n\nThese characteristics are some of the many reasons why the vulkrimi are so inclined toward criminal activity and have a reputation for being sexual slavers. When the females died they left behind an impressive armada of ships that were stolen during the collapse of society and used for piracy. The descendants of many of those pirates still exist to this day and make their living raiding ships throughout the more vulnerable regions of the U.G.C.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Vulkrimi");
}
public function varmintCodex():void
{
	clearOutputCodex();
	showBust("VARMINT");
	outputCodex(header("Hazard: Varmints"));
	outputCodex("<i>Everything’s bigger on New Texas and these dangerous dog-like creatures are no exception.</i>\n\n");
	outputCodex("<b>Name (Singular):</b> Varmint");
	outputCodex("\n\n");
	outputCodex("One of the surviving native life forms on New Texas, the predatory creatures locally dubbed “varmints” are descendants from a much larger, more dangerous breed encountered by the settlers in their early days of colonization. Originally encountered as towering, dinosaur-like creatures with a penchant for flesh, the varmints’ ancestors were nearly exterminated by overzealous colonist militias. Those that survived are of smaller, less dangerous and less intelligent sub-breeds.");
	outputCodex("\n\nVarmints are a silicon-based life form");
	if(silly) outputCodex(" (not to be confused with silicone-based products)");
	outputCodex(", roughly resembling a very large Terran dog or perhaps lizard. They are covered with rough blue skin and long, sharp spikes that make them dangerous even when not attacking directly. Their jaws are extremely powerful, and they frequently attack by knocking an opponent to the ground and rending at the throat.");
	outputCodex("\n\nVarmints are to be considered hostile when encountered, and may attack without provocation. Deaths caused by these creatures are very rare, but they can result in serious injury. It is advised to be armed with traveling outside city grounds on New Texas due to the widespread distribution of the varmint population.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Varmints");
}
public function VKoCodex():void
{
	clearOutputCodex();
	showBust("VKO");
	outputCodex(header("V-Ko Nursedroids"));
	outputCodex("V-Ko is the latest model to appear in JoyCo’s ‘Nursedroid’ line of universal assist-bots. The popular medical franchise travels to the very edges of the explored galaxy to place V-Ko stations around for those in need of a quick heal. For those in the know, JoyCo has also provided relief for other... tense situations.");
	outputCodex("\n\n");
	outputCodex("<b>Sexes:</b> Female in appearance but ultimately lacking any real genitalia. V-Ko nursedroid V.I.s are programmed to act and represent similarly to terran and ausar standard females, though they contain programming to alter their behaviors slightly in the presence of species with nonstandard breeding methods.");
	outputCodex("\n<b>Height:</b> 5/' 7\" or 1.7018 meters");
	outputCodex("\n<b>Weight:</b> 213.214 lbs or 96.7122 kg");
	outputCodex("\n<b>Hair:</b> V-Ko nursedroids are available in a wide variety appearance configurations with hair as the main differentiator. Artifical hair is available in all lengths, colors, and a variety of styles.");
	outputCodex("\n<b>Eyes:</b> Much like their hair, nursedroids’ eyes can come in all the colors of the rainbow and then some. One feature that does not change are the cross shaped identification patterns in the center of their ocular receptors. This helps to keep them from being confused with other types of feminine bots.");
	outputCodex("\n<b>Skin:</b> Patented synthflesh, realistic flesh substitute that is kept warm by microscopic subdermal filaments that heat to match the ideal body heat of whatever creature the nursedroid is interacting with. Its appearance and tactile sensations are roughly similar to that of terran skin. To ease in manufacturing, nursedroid’s ‘clothes’ are simply modified synthflesh designed to appear like clothes. There is no need for modesty due to a complete lack of reproductive capability; the appearance of clothing is only there to give users a sense of familiarity and ease around the droid.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Characteristics"));
	outputCodex("V-Ko Nursedroids are a terran manufactured droid and designed with terran sensibilities in mind, and as such, they come complete with secondary sexual characteristics likes a moderately attractive face (according to focus groups) and pert breasts that would fit a b-cup bra if the droid actually needed them. They do not have nipples, per se, though their outfit does have a barely noticeable bump to indicate the presence of the missing organs. Most importantly, they do not have vaginas. Instead, they do have a charging port where an anus would normally be located. The port does have metal connections and would never work for intercourse.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Virtual Intelligence"));
	outputCodex("V-Ko Nursedroids come with virtual intelligences, known as V.I.s for short. They come equipped with a number of adjustable personality settings and modes, but one thing they all share in common are speech patterns designed to follow galactic etiquette and politeness to a T. Regrettably, nursedroids programming does not allow them true sapience. Their responses are always limited by their programming, though rumors of hackers who embed true A.I.s into them have been circulating on the extranet.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Abilities"));
	outputCodex("Nursedroids are designed and built to provide low cost medical healthcare in locations where proper hospitals and healthcare are in short supply. They are also often used to provide services to those who cannot afford treatment at a proper medical center, making them a fixture on frontier worlds and ghettos.");
	outputCodex("\n\nNursedroids are equipped with miniature medicine producing machinery inside their torsos that allows them to produce everything from simple painkillers to antiviral cocktails. To deliver treatments, their fingertips can open to reveal needle-free injectors that aerosolize drugs into a demis-penetrating mist. Pills they produce are released through their middle finger, as sometimes they can be quite large.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Custom Modifications"));
	outputCodex("JoyCo does allow for a number of custom modifications to their nursedroid line, including some basic stress relief options that allow for them to sate their owners or customers in a sexual manner. Models with these features will provide oral services to masculine reproductive organs and exchange their tongue for a vibrating phallus when prompted for “stress relief” by a suitable species.");
	outputCodex("\n\nNursedroids normally keep a small reserve of fluids for medicine creation behind their bust, but serving particularly virile males or hermaphrodites can cause the reservoir to expand in an attempt to contain their copious ejaculate, swelling their chests beyond all standards of modesty. V-Ko nursedroids are programmed to offload the fluid at their earliest convenience, either by expelling it into a waste receptacle or converting it into a safe, nutrient-rich sludge on food-scarce planets.");
	outputCodex("\n\nCustom V.I. scripts have been written to make V-Kos more enthusiastic lovers, even rewriting them entirely to serve as aphrodisiac-dispensing fuck-toys. Artificial, vacuum pump-equipped vaginas are another popular mod. The only real limit on a nursedroid’s customization is its owner’s wallet.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("V-Ko");
}
//Codex Entry - V-Ko IV
// Place under new ‘Race/Technology’ section of codex. Also move original V-Ko codex entry there.
public function VKoIVsCodex():void
{
	clearOutputCodex();
	showBust("VI");
	outputCodex(header("V-Ko IV Nursedroids"));
	outputCodex("The V-Ko IV is a more expensive, advanced variant of the original V-Ko model, coded with a more organic and lively bedside manner. Another noticeable difference is the inclusion of a prehensile tail, which can be used for treatment, or as a dock for many medical apparatus.");
	outputCodex("\n\nSeveral model variants were released, each designed to fit into different social settings, including versions designed to integrate into unclothed societies.");
	outputCodex("\n\n");
	outputCodex("<b>Sexes:</b> V-Ko IVs are all female in appearance, and unlike the original line of V-Ko units, have perfectly functional genitalia. This additional feature helps with the administering of stress relief.\n");
	outputCodex("<b>Height:</b> 5\' 4\"");
	outputCodex("\n<b>Weight:</b> 60 kg.");
	outputCodex("\n<b>Hair:</b> V-Ko IV nursedroids are available with any length, color, or style of hair.");
	outputCodex("\n<b>Eyes:</b> Just like their hair, their eyes can come in any color. However, they all have the cross-shaped identification patterns in the center of their ocular receptors, to stop them being confused with other kinds of synthetics.");
	outputCodex("\n<b>Skin:</b> V-Ko IV’s have the same synthflesh as the first generation V-Ko models with self-heating functionality, nearly identical in texture to terran skin. Their skin is always a ivory white to aid in identification. Similar to the original model, their clothes are modified synthflesh designed to appear as garments.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Characteristics"));
	outputCodex("V-Ko IV’s have a marked difference from the original V-Ko line, in that they possess distinct sexual characteristics. They have distinctive breasts and either a hidden or visible synthetic vagina and anus. These are both designed to be highly controllable, pliable, and self-lubricating, allowing for intercourse with a variety of species. Not only that, their vagina can be removed for hand-held use like an onahole, or even attached as an extension to the ends of their JoyCords.");
	outputCodex("\n\nWhile it appears on first glance that the V-Ko IV’s have a built-on outfit like previous models, they can in fact remove a seamless patch of fabric from each of their breasts, revealing perfectly functioning nipples. When the patch is removed, a V-Ko appears as if they are wearing a maternity top. V-Ko IV’s can lactate from their nipples, producing many kinds of milk for infant young.");
	outputCodex("\n\nUnlike the mainline V-Ko Nursedroids, V-Ko IV’s use their JoyCords as charging extensions, able to plug them into the nearest power port. This functionality – along with the lactation capacity – is a carry-over from JoyCo’s Maia Series, carried over for mass production.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Virtual Intelligence"));
	outputCodex("V-Ko IV’s are Virtual Intelligences, just like previous models. However, with an additional fifty million extra lines of code programmed in, they act far more organic than their predecessors, possessing a more fluid and personable bedside manner. They still fall well short of an A.I.-D in terms of functionality, and possess no embedded sentience libraries.");
	outputCodex("\n\nV-Ko IV’s are incredibly honest by nature. They are functionally incapable of lying, completely lacking the programming that allows them to do so. They can, however, still keep patient confidentiality.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Abilities"));
	outputCodex("Just like the original models, V-Ko IV’s are designed to provide low-cost medical healthcare in places where proper hospitals are in short supply. They possess the same miniature medicine producing machinery inside their torsos, acting as a portable mini-hospital.");
	outputCodex("\n\nNoticeably different, however, is their ability to deliver medical treatment through a range of means, from medicine-delivering kisses to dermal-penetrating aerosol blasts from their tail-tips. This functionality allows them to give treatment in a range of relaxing or pleasurable methods, or even when pinning the patient down with their arms and legs.");
	outputCodex("\n\nCustomer feedback surveys have shown users are overwhelmingly pleased with the new series’s bedside manner.");
	outputCodex("\n\nAlso different is the sexual relief functionality programmed into the V-Ko IV’s. These programs were cut and carried over from other profitable lines such as the Maia Series V.I.’s, saving on development time and money.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Custom Modifications"));
	outputCodex("As with most of their product lines, JoyCo allows for a number of custom modifications to the V-Ko IV’s. Many well-off users purchase these models to rebuild from scratch, particularly as aphrodisiac-dispensing fuck-toys.");
	outputCodex("\n\nThere are reports of V-Ko IV’s being used in illegal industries to administer mind-controlling drugs to slaves or junkies, taking advantage of their affordable cost and drug-making functions.");
	outputCodex("\n\nThe most popular modification to make to a V-Ko IV is to install a pleasure-reward interface, allowing a unit to feel a digital approximation of sexual pleasure during intercourse. This modification is not officially sanctioned by JoyCo, as repeated use of this interface may corrupt a V.I.’s subroutines.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("V-Ko IVs");
}
public function xhelarfogCodexEntry():void
{
	clearOutputCodex();
	outputCodex(header("Xhelarfog"));
	outputCodex("<b>Name (Singular & Plural):</b> Xhelarfog");
	outputCodex("\n<b>Sexes:</b> Male, female, occasional occurrence of sexless individuals.");
	outputCodex("\n<b>Height:</b> Usually smaller than humans - 4\' 0\" to 5\' 6\"");
	outputCodex("\n<b>Weight:</b> 55-110 lbs (25-50 kg), not accounting for scale weight.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Body Composition (Flesh)"));
	outputCodex("While perhaps not obvious at a first glance, Xhelarfog are a semi-gelatinous species. Though they do not possess the remarkable shape changing powers of a galotian, they are certainly capable of sealing shut and quickly healing any wounds they attain, and their boneless bodies are easily able to contort through small openings and survive much greater falls than other races.");
	outputCodex("\n\nXhelarfog have, at present, only been observed to possess opalescent, pale skin.");
	outputCodex("\n\nTheir flesh is known to be rather sticky - a feature known to let them cling, gecko-like, to walls - though they are able to secrete a substance that prevents their exterior ‘skin’ from adhering itself to anything they touch. It should, therefore, be noted that it is extremely unwise to attempt to penetrate anything but the sexual organs or mouth of any individual, unless you have a fetish for awkward medical appointments - as separating oneself from them is known to be quite the ordeal.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Body Composition (Scales)"));
	outputCodex("Due to the gold-rich environment of the Xhelarfog home planet, individuals end up taking in a great amount in their diet. Rather than excrete this as waste, it has been observed that they instead organise it into clumps, which then rise to the surface of their flesh in formations that appear like, and are often referred to as rough, uneven scales.");
	outputCodex("\n\nThis is thought to be an unusual defense mechanism, as this process never really stops - the eldest observed Xhelarfog have been known to be almost completely covered in these ‘scales’, saving only the palms of their hands and feet, the underside of their tails and the horn-like protrusions on their head.");
	outputCodex("\n\nIt is theorised that should a metal other than gold occur in greater proportions than it in an individual’s diet from infancy, they would instead develop scales of this metal - but no testing has been done due to the more recent discovery of the race.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Eyes"));
	outputCodex("Breaking away from the humanoid norm of two, or at least an equal number of eyes, Xhelarfog possess three - one central eye providing most of their vision, and two smaller eyes beneath it allowing for superior peripheral vision. All three of the eyes are golden by the time an individual reaches adulthood due to high concentrations of gold entering them, to no known detrimental effect.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Tail"));
	outputCodex("They possess a single, relatively short, thick tail, the top of which often being coated in scales while the underside is always the same, gel-like flesh. The most notable feature of their tails though, is that (aside from sexless individuals) they house the genitalia of the species - and in females is the location that their eggs are stored until they are fully developed and ready to hatch.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Feet"));
	outputCodex("Whilst plantigrade, Xhelarfog have feet clearly differing from the Terran average. Their longer, more maneuverable front toes and presence of a rear-mounted one on each foot shows that they have become more specialised for gripping and climbing, rather than walking on flatter surfaces.");
	outputCodex("\n\n<b>Homeworld</b>: Anon-Xusya B");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Xhelarfog are almost completely androgynous, at least when viewed from the front. All sexes lack breasts (though some individuals comfortable with the concept of modding choose to gain them, but lack ability to lactate without extensive, custom modwork). None of the three sexes have any noticeable differences in stature or general body shape, and as such, the only way to distinguish them is normally assumed to be viewing the underside of the tail - genital slit, close lipped pussy, or lack of any features at all. This isn’t quite true though, as there is one other slight difference, also hidden in the tail - females have slightly thicker tails than males or sexless individuals, as it also contains a cavity similar to a womb used to incubate eggs during their early development.");
	outputCodex("\n\nAt present, Xhelarfog have only been observed in a whitish, opalescent color with (literally) golden scales and three eyes. The scales first appear in an almost corset-like pattern over their midsection, before coating the overside of their tails. From that point on, there does not seem to be a regimented order to the growth of their scales, filling in across the rest of them over their lifetimes.");
	outputCodex("\n\nThey have a tendency to push chunks of metal, usually gold, into the ends of their fingers and toes, acting like makeshift claws. It’s far from their only natural weapon - as near carnivores they possess sharp, canine-like teeth in place of incisors and premolars, their only blunt teeth located at the very back of their mouths, specialised for crushing rock. Alongside this, the horn-like protrusions sported by the Xhelarfog are tapered to a fine point, making them more that a little dangerous should one choose to charge. Thanks, however, to their nature leading far more towards curiosity than aggression, most UGC citizens have nothing to fear.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Xhelarfog are born sexless, with the majority of individuals developing their genitalia as they reach the age of sexual maturity. This allows for the species to adapt to any imbalance in the current sex ratio - abundance of males leads to more juveniles developing into females and vice versa. Individuals that remain sexless tend to signify times of plenty - occurring in highest numbers while Xhelarfog tribes possess abundant resources - presumably a form of population control, as rapidly growing numbers can lead to overconsumption. Due to this, sexless individuals are regarded as symbols of good fortune, and are often revered.");
	outputCodex("\n\nDue to having tail mounted, rather than crotch mounted, genitals, a face to face approach to non-oral sex is difficult, if not impossible, for the species. As such, sex is usually performed with partners facing away from each other, small movements of the tails of both individuals allowing for the thrusting motion necessary for the male to ejaculate.");
	outputCodex("\n\nOnce fertilised, a female develops a clutch of between three and five eggs, stored in the cavity in her tail for around four months, then laid and externally incubated for about two months.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society and History"));
	outputCodex("The environment of Anon-Xusya B is inhospitable to the point that the first Rushers to encounter it thought themselves the victim of an elaborate prank when they began receiving curious, though primitive radio messages from its surface. Despite this, the first few craft to touch down discovered this not to be the case as they were soon greeted by a small tribe of the native Xhelarfog.");
	outputCodex("\n\nThanks to the high availability of metal, and frequent electrical storms, they had grasped the concept of electricity at a stage in their scientific development that was far earlier than the average. This is often seen as a saving grace for the species, as once word of the unusual civilization got out, they were swarmed by anthropologists - preventing mining companies from being able to take advantage of the time before the natives were declared legally sapient.");
	outputCodex("\n\nSince then, the Xhelarfog have formed a fledgling full-planet government (under supervision of the UGC), and have integrated well into galactic society, thanks in part to an arrangement signed between themselves and the Steele Tech company - allowing them mining access in return for high level technical education. The deal is reported to have been agreed on incredibly quickly - no doubt thanks to Victor Steele personally overseeing it after existing escapades with the Xhelarfog, having been one of the original Rushers to discover the planet.");
	CodexManager.viewedEntry("Xhelarfog");
}



/* Mhen'ga */

public function cuntSnakeCodexEntry():void
{
	clearOutputCodex();
	showBust("CUNTSNAKE");
	outputCodex(header("Cunt Snakes"));
	outputCodex("(Parasite Pussies, Cock Constrictors, etc...)\n\n");
	outputCodex("<b>Name (Singular):</b> Cunt Snake");
	outputCodex("\n<b>Sexes:</b> Asexual, though often referred to with feminine pronouns for obvious reasons.");
	outputCodex("\n<b>Height:</b> One to six inches.");
	outputCodex("\n<b>Length:</b> Most frequently between two and six feet long. Exceptional specimens can grow up to eight or ten feet long on a world with large enough host creatures.");
	outputCodex("\n<b>Weight:</b> Five to forty pounds, depending on size.");
	outputCodex("\n<b>Hair:</b> None.");
	outputCodex("\n<b>Tongue:</b> Cunt snakes do not typically have tongues.");
	outputCodex("\n<b>Senses:</b> Heat-detecting sensory bulbs near their ‘mouth’. They can also detect subtle variations in air pressure and pheromones to hone in their targets.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Armor"));
	outputCodex("Cunt snakes are typically covered in scales from their head to their vagina-like tail. The scales can provide modest protection, but these parasite creatures typically rely on speed to avoid damage.");
	outputCodex("\n\n");
	// Suggesting we just ignore blocks that effectively say nothing rather than "huehue nothing"
	outputCodex(blockHeader("Sexual Dimorphism"));
	outputCodex("None; Cunt snakes are unisex.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environments Typically Inhabited"));
	outputCodex("Any. Cunt snakes are highly adaptable creatures that can reside on nearly any planet capable of supporting life. Infestations caught early can be quickly neutralized, but within a few generations, they will typically take on the characteristics of local host creatures and be much harder to weed out. More information is available under the reproduction topic.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Intelligence"));
	outputCodex("Cunt snakes are not sapient in the traditional sense.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Feeding"));
	outputCodex("Cunt snakes can effectively feed from their snake-like mouth and their vagina-like tail. They do not ingest food so much as drink blood from their prey or hosts. A venomous bite will render most small creatures comatose; the snake can then feed on its victim much like a spider. While cunt snakes can survive in such a way, they cannot truly thrive unless they find a host creature or reliable source of supplementary protein - usually taken through its vaginal opening in the form of semen.");
	outputCodex("\n\nThey will try to entice larger creatures into copulating with their vaginal portion when possible. More often than not, they will also bite the creature numerous times, using their venom to either paralyze or arouse the host into cooperation (depending on subspecies).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Parasitism"));
	outputCodex("If a cunt snake determines a creature would make a suitable host, it will subdue it with venom, then bite the victim at the base of the spine and a second pouch in its mouth will burst, releasing a special enzyme. This compound will cause the snake’s mouth to dissolve, as well as a small area of the host creature’s backside. Within a few moments, the cunt snake’s nerves and blood vessels will seamlessly attach to those of the host creature.");
	outputCodex("\n\nThe presence of an attached cunt snake on a host body will have several effects on it. Most notably, the creature will find itself able to control its new tail-cunt as effectively as any other limb. The snake’s body will become covered in skin, fur, scales, or whatever type of dermis configuration the host has in a very short time. A thirst for male ejaculate will assert itself on the host creature and often cause a corresponding increase in libido. If this is not addressed on a semi regular basis, the snake’s drives may overwhelm the host and cause them to begin milking the nearest available male with no regard for the consequences of their actions. If the host is a male, he will frequently milk himself in order to feed his tail.");
	outputCodex("\n\nThe snake does not have the capacity to directly control its host, but it can provide sensations such as pain and pleasure in order to maintain its position. Many hosts will find having a cunt snake so enjoyable that they do not seek treatment for it, and instead choose to disguise the creature. This, of course, is one reason why the species has become such a widespread pain in the ass.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Since the snakes have only a single sex, they do not reproduce in the typical way. Every cunt snake has a storehouse of inactive, extra DNA sequences left to it by its ancestors. It will instinctively integrate attributes from its host creature along with a selection of its own active and stored genes into each egg it produces, along with a storehouse of extra genes. The cunt snake progeny will undoubted have vaginas similar to the kind female host creatures would have, as well as other biological adaptations. Eggs are only created when the creature is gaining plenty of nutrients (blood and sperm - what?! Not mixed together!).");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Cunt Snakes");
}
public function kerokorasCodexEntry():void
{
	clearOutputCodex();
	showBust("FROG_" + (1 + rand(8)),"FROG_" + (1 + rand(8)),"FROG_" + (1 + rand(8)));
	outputCodex(header("Kerokoras"));
	outputCodex("<i>U.G.C. survival guidelines recommend you do not lick them.</i>\n\n")
	outputCodex("<b>Name (Singular & Plural):</b> Kerokoras");
	outputCodex("\n<b>Sexes:</b> Purely Female");
	outputCodex("\n<b>Height:</b> Between 4'\ 6\" and 5\' 6\".");
	outputCodex("\n<b>Hair:</b> Hairless");
	outputCodex("\n<b>Eyes:</b> Bulbous, featuring broad pupils and wildly varying sclera coloration.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Kerokoras have bald and round heads, almost human in shape, but with large eyes and a complete lack of a protruding nose or ears. Instead they have a pair of broadly spaced nostrils above a wide mouth, and a pair of shallow pits where ears would be expected. Their mouths are able to open extremely wide, with jaws designed to dislocate, allowing them to consume large prey whole. The insides of their mouths are a reddish purple, with a thin, pale ridge of cartilage in place of teeth, making chewing tough food nearly impossible.");
	outputCodex("\n\nThe most notable feature of the kerokoras face is their tongue. On average, their tongues can extend between eight and twelve feet, roughly twice their height. These prehensile tongues are made of twitch muscle, and capable of extending at nearly the same speed as a traditionally gunpowder-accelerated kinetic projectile, allowing them to hunt with the slightly sticky appendage. Like the insides of their mouths, their tongues tend to be a deep red with a purple and veiny underside.");
	outputCodex("\n\nKerokoras lack not only hair, but mammaries as well, their flat chests lacking breasts or nipples. With the lack of breasts, their bodies are largely regarded as somewhat tomboyish, further reinforced by their narrow, feminine shoulders, each leading to a pair of slender, albeit well-muscled arms. Webbed, five fingered hands adorn the other end of their lithe arms.");
	outputCodex("\n\nThe races evolutionary history is further evident in their lower bodies, with impressively thick legs intended for superior jumping and running speed. The power evident in the leg structure persists in their feet, with three large toes, featuring similar webbing to the hands, further aiding the race with movement through water and air.");
	outputCodex("\n\nA short stubby tail protrudes from the base of their spines, just above their asses and, unlike most unevolved amphibians, they have both an anus and a vagina, instead of a cloaca.");
	outputCodex("\n\nKerokoras feature very individual colors and patterning of the skin, with varying shades of green, earthy browns, vibrant orange, blue, red, green, yellow, black, and some with spotted combinations of these colors on their backs.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Kerokoras are usually only found in swamplands, preferably with large insect populations and plenty of dense foliage. They tend to live high in the trees, only approaching the ground to defend their young, find a mate, or feed. Oddly, kerokoras can be found on multiple worlds, despite their complete lack of interest in technology and their primitive tribal structures.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("The kerokoras are an opportunistic species, sexually. They have the ability to reproduce with males of almost any species that produces sperm. Their elastic reproductive organs allow them to accommodate a mate of almost any size, and always feel vice tight, regardless of how small or large the male might be.");
	outputCodex("\n\nThe kerokoras produce a venomous sweat that greatly enhances the ardor of any creature who comes into contact with it. When searching for a mate, they will often lick their own back with their long tongues, gathering their sweat into a concentrated mix. They then find a male and repeatedly whip them with their tongue until the subject is in a rutting frenzy and doesn’t care that he is mating with an alien species.");
	outputCodex("\n\nIt should be noted that while any given kerokoras is resistant to their own venom, they are not immune to the sweat of other kerokoras. This sweat covers their entire body, and also acts to keep their skin clean.");
	outputCodex("\n\nUpon being fertilized, the kerokoras will begin to develop an eggsack with anywhere from two to six eggs. After a relatively short initial gestation period of two weeks, the eggs are laid, generally in shallow, swampy water. These eggs typically hatch about a month later.");
	outputCodex("\n\nKerokoras young are born without limbs, and with a long tail, and spend the first year of their development in water, before their limbs develop and they join the tribe in the trees. They reach full adulthood shortly after growing their arms and legs, and are able to breed soon after that, though most wait several years before contributing to the tribe.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The history of the kerokoras race is confusing to say the least, as they tend to have different stories on each world where they are encountered. Verbal folklore hints at an ancient age when they built great ‘stone insects’ that they rode on the backs of to distant stars, hinting that they are from a civilization in decline.");
	outputCodex("\n\nResearch into their genetics reveals clues, hinting at past genetic tampering to allow them to mate with virtually any other species, and as the root-source of their ability to produce venom. Kerokoras raised entirely in captivity are quite malleable when it comes to beliefs, and can be raised in a tech heavy environment as long as they are supplied with adequate room to move.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Kerokoras venom is somewhat valuable for its aphrodisiac qualities, but when ingested in large quantities can have an invasive quality. The genetic alterations that the kerokoras have been subject to in the past lingers in their venom; strange transformations have been noted in test subjects ingesting large quantities of the venom.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Kerokoras");
}
public function mimbraneCodexEntry():void
{
	clearOutputCodex();
	showBust("MIMBRANE");
	outputCodex(header("Mimbranes"));
	outputCodex("(Graft, Epidel, Second Skin)\n\n");
	outputCodex("<b>Name (Singular):</b> Mimbrane");
	outputCodex("\n<b>Sex:</b> Asexual");
	outputCodex("\n<b>Height:</b> 0.0004 to 0.25 inches. Typically ranges between the slightest fraction of an inch when resembling a thin film to a quarter of an inch when dense and/or well fed.");
	outputCodex("\n<b>Length:</b> 6 to 36 square inches. The parasite’s ability to distribute its mass to control its surface area can usually put it anywhere between six and thirty six square inches.");
	outputCodex("\n<b>Weight:</b> 100 to 340 grams (0.2 - 0.75 pounds)");
	outputCodex("\n<b>Hair:</b> None of its own, but able to replicate host features.");
	//outputCodex("\n<b>Tongue:</b> None"); // I think it would be an idea to build an ordered list of "appearance descriptors" for codex entries, and just omit ones that will be blank/none etc, but to have everything in the same order otherwise.
	outputCodex("\n<b>Eyes:</b> Two tiny eyes protected by a thick portion of dermis that can act as eyelids. Round with bright sclera, thin reddish iris, with average sized pupils. The eyeballs can vary in size, sometimes changing in size as the Mimbrane integrates into a host.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Senses"));
	outputCodex("Mimbrane feature small fleshy mouths below and between their eyes that protrude slightly from their form, typically thicker than the rest of the creature. Their mouth is used to breathe, ingest liquids and communicate as most creatures, but if the parasite is able to latch onto a host organ with an orifice, it will ditch its normal mouth in favor of utilizing the newfound hole as its own. Without a properly sized orifice to borrow, Mimbrane will maintain their normal mouths, anxious to pass them off as small lumps with no seam. Information on how the creature feeds and breathes can be found below.");
	outputCodex("\n\nA Mimbrane’s most important organ is its skin. Its normal appearance is a light red or pink, lighter in color the thinner the creature stretches itself and more vibrant the more dense it is. Mimbrane are smooth and free of any discolorations or imperfections. They can appear as thin square sheets, slightly moist and glistening as they glide through the air or crawl along the ground. At their largest sizes, Mimbrane are incredibly lithe and become somewhat translucent.");
	outputCodex("\n\nThe parasite is able to distribute its sparse mass in order to control its surface area, enabling it to not only encase its prey, but also allowing it to fly and glide with relative ease. The creature’s more well-known trait is its ability to transform and alter its epidermis, mimicking its host’s every detail. More information on this feature can be found below.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Armor"));
	outputCodex("Due to their lean nature, mimbranes rely more on their ability to dodge and conform to any shapes in order to help defend themselves. Sharp blades and projectiles that actually do make contact easily injure the creature. Blunt weapons are normally ineffective. A Mimbrane’s primary offense and defense lie within its lust-inducing oil and spit, explained further below."); // "Explained in section [<random numbershit to look like a reference>]"?
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Though the creatures can exist in most any habitat, Mimbrane tend to prefer natural and wooded areas, locales comprised of abundant sources of warmth and nutrients.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Means of Attack"));
	outputCodex("Mimbrane tend to be docile creatures, hiding from potential prey whenever possible. The cause of this is the extreme toll battle can take on the parasite. A single creature can take months to accumulate enough nutrients just to work up the reserves necessary to employ their lust attacks in addition to the above average energy expenditure. In other words, a Mimbrane that has decided to attack is putting its all into the effort.");
	outputCodex("\n\nA mimbrane’s primary means of offense is to target their opponent’s carnal instincts. Its first attack is more passive, as the parasite’s skin secretes a clear oil, tinged lightly with a bright pink color. Contact with the parasite’s oily skin can wreck havoc on its opponent’s sexual craving. A byproduct of a Mimbrane’s sweat is the pungent cloud of ecstasy it produces; the parasite will periodically stress its pores and fan this gas towards their opponent. The creature’s more direct attack has it gather and concentrate its oil, spitting a particularly volatile batch of libidinal craving that bursts on contact.");
	outputCodex("\n\nWhile Mimbrane rely primarily on their ability to drive their opponents to sexual madness, they also utilize their light form in an attempt to smother their hosts. This attack doubles the effectiveness of their oily skin as well. The few physical attacks of the parasite involve it creating tiny barbs along its surface and brushing against its opponent, as well as fairly weak attempts at tripping up an opponent.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Parasitism"));
	outputCodex("A Mimbrane’s primary goal in life is to attach to a host, feed, and slowly reproduce. Once it has properly subdued a target, the parasite will work its way towards its intended body part. An interesting facet of these creatures is their inherent organ preferences, shared among the entire species. These baked-in predilections place importance on ease of acquiring liquid sustenance followed shortly thereafter by warmth and relative seclusion on the host.");
	outputCodex("\n\nMimbranes prioritize sexual organs, preferring penises over vaginas. Should the genitalia be either non-existent or claimed by other Mimbranes, the parasite will opt for the posterior, enshrouding the entire rear end and anus to account for its less-than-optimal choice. The next option for a Mimbrane would actually be the scrotum followed by the breasts, the lower and warmer sac an easier location for remaining secluded over the typically much more exposed breasts. When all known sexual organs are unavailable, the parasite will opt for extremities, typically the hands and finally feet.");
	outputCodex("\n\nThe face is actually avoided when choosing a roost as it is typically a very sensitive and hard area to maintain for the parasite. Attempts to hide anywhere on or around the head more often increase the creature’s presence to the host. As a result, a Mimbrane would rather reject a host than place themselves somewhere they believe would lead to their quick removal.");
	outputCodex("\n\nOnce a Mimbrane has chosen an organ, it quickly goes to work encapsulating the entirety of their selection, forming a perfect seal. From this point, mimicry becomes the primary goal of the parasite. The Mimbrane’s epidermis will integrate itself with its host’s nervous system, forwarding sensations on to nerve endings and feeling as if nothing were on the organ at all. Dead skin cells and sweat are passed through the creature if they are not able to be consumed.");
	outputCodex("\n\nThe parasite also works to visually represent its chosen target, detailing every bit of texture, coloration, hair and imperfection that they’ve covered. In only a few scant minutes, a Mimbrane’s pink, featureless, slick skin will perfectly resemble its target down to the last hair, freckle, or scar. Once the transformation is complete, a motionless Mimbrane becomes almost unperceivable to its host, save for a few telltale signs.");
	outputCodex("\n\nThe most visible indications of the parasite while they are attempting to mimic their chosen organ often appear as lumps of skin or enlarged body parts. The first sign is the bunching of the parasite’s skin along the base of their connection to the host. This acts as the creature’s defense from unassisted removal, painlessly digging into the host’s skin and alerting the parasite to any attempts to pry it free. The other visible trait is typically two tiny bumps close to the host’s orifice, where the Mimbrane hides its eyes.");
	outputCodex("\n\nThe final telltale mark is only when the parasite has bonded with an organ that does not feature some sort of cavity. A third bump will appear, hiding the creature’s small mouth. The lumps protecting a Mimbrane’s mouth and eyes have no visible seams, and the parasites will typically try to push these few remaining marks of evidence down against their host in an effort to better hide them. More information on the parasite’s tendencies when coupled with a host can be found below.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Feeding"));
	outputCodex("A Mimbrane can survive on sources of moisture such as plants, fruits or water, but it cannot reproduce until it has found and attached itself to a host. If it has clung to an organ that features some sort of orifice, it will dissolve its mouth in favor of substituting it with its newfound outlet. If there is no orifice, the Mimbrane will maintain its small mouth, trying its best to disguise it as an innocuous bump on its host.");
	outputCodex("\n\nThe mouth is where a Mimbrane continues to feed and breathe. The parasite is unable to continue breathing through its epidermis when coupled as its skin is currently occupied mimicking the host. As a result, the creature will wait for moments of inactivity to move its mouth open and close, stirring fresh air around and allowing it to easily absorb and process oxygen. The sensation – whether with a claimed hole or the creature’s mouth – can very easily be felt by the host and is the most glaring reminder of the parasite’s presence.");
	outputCodex("\n\nMimbranes ingest host secretions that pass through their borrowed mouths by absorbing them into the skin surround the opening in a manner similar to breathing. This action does not require the same amount of movement, however, and usually goes undetected by hosts. The exception goes for parasites lacking a borrowed spout, who use their natural mouths in a manner similar to all other living creatures in order to collect what they crave. When located on extremities such as hands, Mimbrane will attempt to push themselves to a visible source when hungry.");
	outputCodex("\n\nDue to their slow and miniscule metabolism, the parasites only require a small fraction of the various discharges they can come into contact with. Most Mimbrane are unable to engorge themselves rapidly, which acts as a countermeasure from growing too large too fast, thus increasing their odds of irritating their hosts and reaching their demise.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Mimbrane store and process any and all nutrients they come into contact with once in contact with a host. As a result, the body part they’ve encapsulated can appear to swell over time. The parasite can easily grow anywhere between twenty five and fifty percent of the size of the organ it currently resides over. People with swollen penises, vaginas, asses, or anything else never feel as if their organs have been smothered with the extra weight due to the creature’s continued mimicry and faked signals it sends to the nervous system.");
	outputCodex("\n\nOnce a Mimbrane has reached a large enough mass – roughly at least double its original mass – it will begin asexual reproduction in a form similar to binary fission. The parasite begins by preparing the host for the bizarre sensations, which are described to feel as if removing large bandages, onaholes, or other sorts of coverings after a long period of time. If it fears for its safety, the parasite will wait until the host is asleep.");
	outputCodex("\n\nA separation begins to occur along the perimeter of the Mimbrane’s original size. Over the course of an hour or two, the parasite will center its consciousness on the skin still attached to the organ and finish severing all of the extra mass its accumulated over the course of a number of weeks. At this point, the growth will fall or merely slip off of the host, still appearing like an enlarged copy of the organ it shed from. The faux organ will convulse and spasm for a few minutes, signaling the growth of the new consciousness.");
	outputCodex("\n\nThe new Mimbrane can survive in this state for tens of minutes, feeding off the excess stores of nutrition left to it by its parent. Some more experienced hosts have been known to enjoy the offspring for the time it exists as an engorged copy of their body part. The new Mimbrane’s mind briefly revolves around its memories as the body part in this state.");
	outputCodex("\n\nEventually it will settle and unravel back into its original form, flooded with the continued instincts and knowledge that is always passed down throughout the creation of the parasites. Mimbrane prefer to spread to new targets and will abandon their parents as soon as the opportunity arrives.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Intelligence and Behavior"));
	outputCodex("Evolution has taught this race to be patient and polite in order to increase odds of survival. Mimbrane intelligence is just above that of common house pets, surprisingly. The parasites rely on their lust-increasing secretions to attain hosts, but they cannot afford to continue to rely on them once they are in place. This forces the creatures to interact with their host as little as possible, relying on their mimicry, downplayed movements, and slow growth to conceal themselves as long as they feel they are in danger of aggravating their host, driving them to attempt and remove them.");
	outputCodex("\n\nOnce Mimbrane believe they’re in little harm of being forcibly removed from their perch, they may open up a little to their host. The parasite will more freely control its claimed organ in plain view of its host, responding to stimuli such as movement and sound like any other sentient creature will. The parasite will attempt to form and maintain this bond in order to help ensure its survival if it thinks it can make it work.");
	outputCodex("\n\nAs time and trust continue to build, Mimbrane can eventually reawaken their latent capabilities used when capturing prey, helping their host by waging the same spitting and secretion-based attacks against their opponents’ sexual drive. These strikes require a good degree of the nutrients the parasite has stored from the host, nutrients that are typically reserved purely for reproduction and self-sustenance. As a result, these actions can only be used sparingly by the creature when they feel open enough to aid in combat.");
	outputCodex("\n\nGetting a Mimbrane confident enough to act like this is quite a feat as this runs contrary to the species’ normally shy nature. A Mimbrane’s first instinct once it has attached to a host is to mimic and hide in plain sight. Even when the parasite has fully confided in its host, it will generally hide from all strangers.");
	outputCodex("\n\nWhat they won’t hide from are their fellow parasites. Mimbrane are highly sociable among one another, and people playing host to several of them may discover just how chatty the little guys can tend to be. No matter what form they may appear in, Mimbrane will utilize their mouth to make high-pitched squeaks to communicate with one another.");
	outputCodex("\n\nMimbrane will also come to the aid of their brethren when possible. If they discover their host is in combat with another of their kind, they will sweat the same lust-inducing oil that host-free Mimbrane use to subdue their prey. This can turn an individual’s armor against them as the parasites will use it as a pressure cooker for sexual fervor. Once the host has been humbled, existing Mimbrane already clinging to them will announce their presence and work together to signify any remaining key organs for the new parasite to claim as their own. This behavior can easily lead to an individual being overrun by the parasite if they continually encounter them.");
	outputCodex("\n\nFinally, Mimbrane will continue to aid one another on the same host by making certain any parasites without orifices to feed from are taken care of. It isn’t uncommon for an individual with several Mimbrane to frequently lose control of much of their body as the parasites communicate and feed one another if the fear of discovery and removal is low. This group mentality is exclusive to the parasites only when a host is present; they do not typically come to one another’s aid and work together alone in the wild.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Removal"));
	outputCodex("Mimbrane’s incredible mimicry and tendencies to aid their hosts when they aren’t avoiding their ire is simply due to the fact that they perish if they are ever removed from their host. The act of integrating into an organism’s nervous system is second nature to the parasite, but they will die of shock should they be pried away. Unaided removal is highly discouraged, as the parasite can easily utilize its connection to the host to paralyze them with signals of pain or pleasure.");
	outputCodex("\n\nMimbrane can utilize their natural defenses in addition to anything the organ at their disposal can grant them to defend themselves against others as well. Individuals with a great number of parasites across their body can even provide a challenge for medical professionals. Caution is recommended when dealing with anyone in a situation like this; the parasites will easily wrestle control away from their host when fueled by adrenaline and defend themselves.");
	outputCodex("\n\nContacting an anesthesiologist is the best approach to removing Mimbrane from an individual. The parasite’s need to respire makes it susceptible to being knocked out and easily removed. There is rarely any lasting damage to hosts.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Mimbranes");
}
public function naleenCodexEntry():void
{
	clearOutputCodex();
	showBust("NALEEN","NALEEN_MALE");
	outputCodex(header("Naleen"));
	outputCodex("<b>Name (Singular & Plural):</b> Naleen");
	outputCodex("\n<b>Sexes:</b> Male & Female");
	outputCodex("\n<b>Height:</b> Most naleen rise about six feet from the ground, though their full length is often more than twice that from tail to brow.");
	outputCodex("\n<b>Weight:</b> A fully grown naleen could easily weigh several hundred pounds.");
	outputCodex("\n<b>Hair:</b> Naleen arms and bellies are covered in a thin fur, usually black, orange, green, or tiger-striped. Their hair grows in a matching color to their body fur, and is worn long, and often braided.");
	outputCodex("\n<b>Eyes:</b> Naleen eyes range from red and gold to dark, almost black hues.");
	outputCodex("\n<b>Tails:</b> Serpentine and prehensile, Naleen tails are powerfully muscled. Combining the same color as the naleen’s hair, the tail is used to move silently through foliage or to constrict victims, crushing the air out of them into unconsciousness.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("A hybrid of feline grace and serpentine speed and power, the Naleen are the deadly apex predators of Ara Ara. Their attacks are lightning quick and often debilitating, as the naleen dart into close combat to bite and claw their victims, wearing them down before a potent paralytic poison can be applied by bite to the victim. Once debilitated, the naleen will coil around the subject, constricting it with its powerful tail before mating begins. Naleen will force themselves on their coiled victims, often raping them for hours on end until they’re satisfied. This Naleen sexual predation does not seem to be for reproductive purposes: rather, the playful predators seem to take genuine enjoyment from the act, and will happily hunt members of their own sex, or even automated scout mechs sent into the deep jungle.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Naleen reside in the deepest parts of Mhen’ga’s endless forests, though they are usually found near lakes or mountains. With natural camouflage given by their colorful scale and fur patterns, Naleen are able to move virtually undetected through their native environs. They are believed to nest in caves or other secluded, dark areas, though a full Naleen nest has never been discovered by any living explorer.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction")); 
	outputCodex("Naleen seem to hunt for pleasure rather than reproduction, though it is undoubtable that the latter does occur as a result. They have never been seen to mate with their own kind, though research indicates they may, like Terran snakes, congregate into mating balls of several dozen, or even hundred, members. Outside their own kind, Naleen are often seen accosting Zil, often dragging several of the wasp-like creatures back to their lairs. Half-Naleen, half-Zil have from time to time been reported, though these winged snake-cat-wasp creatures are rare and cumbersome. As far as recorded observation goes, female naleen seem to have standard humanoid reproductive organs while males are reported to sport two reptilian-like phalluses each.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Naleen are a strange hybrid race: feline predator from waist to neck with human-like faces and reptilian, slitted eyes. From the waist down, they’re snake-like monopeds, slithering across the floor of the jungle. They possess razor-sharp claws and a venomous bite that can paralyze a victim, though the bite seems to be reserved for wounded targets on the brink of collapse, rather than a primary offense.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Naleen");
}
public function vanaeCodexEntry():void
{
	// I'm temted to look into A bookmark movement around the codex view, to link between the headers with actual clickable links (all of the "See: <section>" things here. Considering the size of the Vanae codex entry, it seems like a good idea, and it could be extended to deal with jumping between entirely different codex entries.
	clearOutputCodex();
	showBust("VANAE_HUNTRESS", "VANAE_MAIDEN"); // Probably split this out into multiple types?
	outputCodex(header("Vanae"));
	outputCodex("<b>Name (Singular & Plural):</b> Vanae");
	outputCodex("\n<b>Pronunciation:</b> ‘Vah-nay’");
	//Taxonym: Vanae
	outputCodex("\n<b>Sexes:</b> Female");
	outputCodex("\n<b>Height:</b> 5\' 2\" to 5\' 6\"");
	outputCodex("\n<b>Weight:</b> 55 to 62 kg (121.254 to 136.687 lbs)");
	outputCodex("\n<b>Skin:</b> Snow white with special markings of a single, bioluminescent color (Most to least common: Indigo, violet, pink, dark red, blue or black).");
	outputCodex("\n<b>Hair:</b> Bioluminescent tentacle locks. Ear to butt length.");
	outputCodex("\n<b>Eyes:</b> Vanae have vestigial eyes that are typically closed. Eye color is always the same as their unique body color (See skin).");
	outputCodex("\n<b>Hands and Feet:</b> Five digits (as humans), but webbed. Flat suction cups, microscopic setae fibers.");
	outputCodex("\n<b>Ears:</b> Finned and extremely sensitive to sound.");
	outputCodex("\n<b>Organic Skirt:</b> Vanae have an organic “hula skirt” of colored tentacles protruding from their waist. Upper thigh to ankle length.");
	outputCodex("\n<b>Tail:</b> Large tentacle tail, usually 4 to 6 feet long. Forms the back part of their organic skirt.");
	outputCodex("\n<b>Breasts:</b> Two, anywhere from A to Q-cup depending on births. Colored breast and areolae patterns.");
	outputCodex("\n<b>Clits:</b> Two.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Vanae resemble female humanoids with an octopus-like appearance, often colloquially referred to as “tree squids”. They have tentacle hair and an organic tentacle “skirt” protruding from their waistline. They also have a long, prehensile tentacle tail that makes up the back part of this skirt. It has a small linear slit at the tip.");
	outputCodex("\n\nThe vanae have bioluminous tentacles, nipples, lips, and natural body markings that are all the same color. The most common colorations are indigo, violet, and pink; with others such as dark red, blue, and black being far rarer. The rest of their body is an extremely light version of the former. E.g. An exemplar vanae with blue markings would also typically feature a pale-blue skin pigmentation.");
	outputCodex("\n\nWhile this skin color would naturally be a disadvantage for a predator, this is only their default coloration. Vanae have chameleon-like skin that allows them to match the pigmentation of objects they press against for a few seconds (See General Biology).");
	outputCodex("\n\nVanae have two humanoid breasts that start at A-cup and grow each time they give birth (See Breeding & Hunting). Their nipples constantly lactate “Vanae Milk” - a gooey, colored, semi-transparent fluid (See Vanae Milk). Their breasts are typically covered by swirling luminescent body markings centered around their areolae.");
	outputCodex("\n\nVanae are all born blind and rely on their super-sensitive finned ears and other methods to compensate. They are born with vestigial eyes that are almost always closed. On the rare occasions they open them, their eyes are the same luminous color as their body markings.");
	outputCodex("\n\nThe vanae have webbed hands and feet. These have small, octopus-like suction cups that can lie flush in order not to hinder gripping or ground movement. The microscopic setae or “fibers” present on these cups allow them to stick to dry, rough surfaces such as tree bark, much like a gecko.");
	outputCodex("\n\nVanae have a human-like vagina between their thighs, replete with two clits side to side. The inner walls of a vanae’s vagina is lined with hundreds of silky feelers. Their legs are very toned, muscular, and flexible; what humans would refer to as “dancers legs.”");
	outputCodex("\n\nVanae huntresses almost always carry a spear with a singular sharp point used to pierce fruit or the tough hides of zil and naleen predators. They prefer to use the blunt end of their spear or their milk when hunting prey, resorting to using the pointed end only as a last resort.");
	outputCodex("\n\nVanae rarely wear clothes, preferring instead to showcase their unique body markings and the size of their breasts (See Society).");
	outputCodex("\n\n");
	outputCodex(blockHeader("General Biology"));
	outputCodex("Vanae have evolved to not rely on sight, but sound, using echolocation to hunt their prey. Emitted at higher frequencies than the human ear can perceive, vanae can “see” with sounds much like an earth bat. When the sound bounces back, two uniquely sensitive eardrums located at different heights in the inner ear pick up the delay and direction of returning sound. This allows them to not only determine direction, but also size, type, and other features of their prey and surroundings (much like a Terran Owl). It also allows them to move around despite the fact they are optically blind.");
	outputCodex("\n\nA vanae’s echolocation is created from the larynx and emitted from the mouth. Vanae may make noise anywhere between their normal and echolocation range, allowing them to sing at incredibly high pitches. This also allows them to speak to other members of their species without being overheard by predators, though this does nothing against a skilled lip reader.");
	outputCodex("\n\nLike terran cephalopods, vanae have specialized skin cells capable of matching their surroundings in real time. When moving slowly or pressed flush against an object, they can transform their skin color and illumination levels to be nearly invisible. They cannot move very fast while doing this or risk becoming out of synch with their surroundings, thereby rendering their camouflage less or completely ineffective.");
	outputCodex("\n\nVanae are essentially fruitarians, able to survive on fructose, tree nutrients, and water alone. They require large amounts of fructose in order to survive. They hunt this in the form of fruit and sexual fluids, the latter containing high amounts of fructose. They also require semen from other races to breed (See Breeding & Hunting).");
	outputCodex("\n\nVanae tentacles are uniquely designed to suck moisture and nutrients out of jungle trees. Their suckers are lined with millions of tiny satae that allow them to stick to trees and drain these out like microscopic needles. Vanae will often suck on trees in this fashion as they hunt for fructose.");
	outputCodex("\n\nAn arboreal race, vanae have strong leg muscles designed for leaping from tree to tree. They also use their tentacle skirt and tail for balance and to feel nearby wind movements. A vanae can run along tree branches at speeds most mammals would fall out.");
	outputCodex("\n\nVanae ankles are made of a spongy, shock absorbent substance. Whenever impacting a surface, such as falling, the shock is greatly reduced. Vanae ankles are also more flexible than human ankles. A vanae can flex their feet so their toes touch the front of their lower leg, and thanks to this range of motion they rarely suffer sprained or twisted ankles from landing improperly. This is an invaluable quality for survival in Mhen’ga where a damaged ankle can be a death sentence.");
	outputCodex("\n\nLike cats, vanae also instinctively spread out their surface area when falling to increase drag resistance. Their splayed tentacle dress creates a pseudo-chute, significantly reducing downwards velocity.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Vanae Milk"));
	outputCodex("A great deal is known about vanae milk due both a commercial and underground interest in the tasty substance.");
	outputCodex("\n\nVanae have a massive amount of milk-producing lobules in their breasts and a small amount in their tail-tip. The milk produced from them is sticky, semi-transparent, and always of a similar color to their body markings. E.g. A vanae with violet markings may produce light or dark violet milk, but it is always a shade of violet.");
	outputCodex("\n\nVanae milk has a tasty, fruity flavor that varies depending on breast size and pregnancy. A non-pregnant vanae’s milk has a citrusy taste, while a pregnant vanae’s milk is quite sweet. The larger a vanae’s breasts are, the fuller and more intense their breast milk tastes. In comparison, the milk secreted from their tail is rather bland and rarely consumed.");
	outputCodex("\n\nVanae milk is a powerful aphrodisiac and psychoactive drug when splashed on or consumed by non-vanae. While being subjected to a small amount does little more than briefly enflame one’s libido, the longer one is exposed and the larger the amount, the greater the effect.");
	outputCodex("\n\nDocumented symptoms of high exposure include: debilitating arousal, hypersensitivity, impaired judgement, altered perception, euphoria, hyperactive cum production (Males), and increased vaginal wetness (Females).");
	outputCodex("\n\nStudies have shown either being subjected to high concentrations or large volumes of vanae milk can cause lasting effects, such as an increase in cum production, testicle size, vaginal wetness, and vaginal squirting.");
	outputCodex("\n\nVanae use their breast milk for hunting, defence, and feeding their young. They are capable of squirting it out at will, though they get more distance from actively squeezing their breasts. Depending on breast size, a huntress can horizontally shoot their milk anywhere from five to twenty feet.");
	outputCodex("\n\nA vanae’s breast size also affects the potency, flavor, and amounts of milk produced from them. A virgin vanae with tiny A-cups will only be able to produce a meager amount of milk with low potency and a bad taste. In comparison, a vanae queen is capable of producing gallons of highly debilitating milk with mind blowing flavor.");
	outputCodex("\n\nA vanae’s tail gland does not produce anywhere near the same amount of milk, nor does it become significantly more potent over their life cycle. It is generally used for situations where a mature vanae’s breast milk would be too potent and as a secondary weapon while hunting.");
	outputCodex("\n\nAll but the smallest breasted vanae have the ability to create a concentrated version of their milk from their breasts. They create this using forceful massage, a method not available to vanae with tiny busts. The milk produced is always opaque. This method is traditionally used when a vanae wants to splash the genitals of a non-vanae lover and make them yield more fructose.");
	outputCodex("\n\nWhen pregnant, a vanae’s milk is always opaque and at its highest level of concentration. For this reason, most predators know better than to attack a pregnant vanae, as their milk will be dangerously potent.");
	outputCodex("\n\nExtremely potent vanae milk can act as a growth agent for certain plants and trees (See Environment).");
	outputCodex("\n\nIn recent months, a number of corporations have shown interest in the commercial potential of vanae milk. For cultural reasons, vanae have always refused offers of trade and refused to deal with outsiders seeking to harvest and sell their milk. Part of this is the fact vanae lack a currency system and have no interest in trading for semen or fructose (See Religion & Law).");
	outputCodex("\n\nThe unavailability of vanae milk, combined with its delicious taste and arousing qualities, has lead to number of enthusiasts and black market poachers hunting vanae for their breast milk, hunting them down and taking them as “cow slaves”. These activities have made most vanae distrustful and antagonistic towards outsiders.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Breeding & Hunting"));
	outputCodex("Vanae lack two important things that they must constantly source: male semen, and fructose. Since both male and female ejaculate contains large amounts of fructose (with zil semen being especially sugary), vanae have evolved to be “apex breeders”. When a vanae hunts a being for their juices there is very little that can stand in their way.");
	outputCodex("\n\nVanae prefer to hunt for fructose alone, targeting just about anything with the capacity to provide them with it - be it a female, male, or herm. They track their prey camouflaged in the treetops, all the while feeding off tree nutrients and easily accessible fruit.");
	outputCodex("\n\nWhen the time comes to strike - usually when the target is most vulnerable - vanae either spray their distinctive and powerful milk on the target, or attack them with the blunt end of their spear. This usually happens from the treetops above or from a nearby place of hiding. When the target is incapacitated from their milk or spear-blow, the vanae swoops in.");
	outputCodex("\n\nThe huntress typically applies concentrated milk to the target’s genitals, ensuring they get a higher yield of juice from them. They then proceed to sap it all out until the target is completely drained of ejaculate, no matter how many orgasms this takes. If the target is male, they will usually milk them for their semen using their vagina. Since they are an incredibly fertile race - as expected of an apex breeder - pregnancy is all but assured.");
	outputCodex("\n\nWhen excess ejaculate is gathered, it is shared later among their sisters. They do this by smearing concentrated breast milk on their vaginal entrance and then carrying it back to their sisters. They then transfer it among each other via tribadism (“Scissoring”) or cunnilingus. This is done starting with the queen, and working down the vanae hierarchy (See Society).");
	outputCodex("\n\nPregnant vanae do not hunt and instead protect a tribe’s territory from predators. Vanae territory is almost entirely protected by mature pregnant huntresses and brood mothers with their powerful milk. A vanae pregnancy lasts for six months, during which their breasts permanently grow by one cup size.");
	outputCodex("\n\nA vanae’s breasts will never grow past a Q-cup no matter how many times they give birth. It is believed this is a biological safeguard against complete immobility.");
	outputCodex("\n\nVanae always give birth to twins, without exception. Since vanae are born in pairs, their direct sibling born at the same time are referred to as their “breast sister”. Siblings and parents often share similar markings to a vanae, though their coloring is random. A vanae is traditionally very close to their breast sister and mother.");
	outputCodex("\n\nVanae genes possess extremely dominant qualities. When breeding with any other race, a female vanae will always give birth to two female vanae instead of the fathering species. It is very rare that any qualities of the male parent are transferred on to the young. This has led to the belief that vanae only can give birth to other female vanae, which is not entirely true (See Religion & History).");
	outputCodex("\n\nFemale-on-female intercourse is common and vanae have very few scruples with incest due to the small size of their tribal communities. Their numbers are largely culled by susceptibility to jungle diseases and parasites, as vanae lack any kind of medicinal knowledge, and apex predators such as the naleen.");
	outputCodex("\n\nThe life expectancy and maximum life span of vanae are very different. The general life expectancy of 50 per cent of vanae is a mere sixteen years. However, their maximum potential life span is 120. Vanae mature fast, reaching full adulthood at fourteen, and die young. The number one killer of young vanae are non-sapient arboreal predators (Mammal, insect, and plant).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environment"));
	outputCodex("Vanae live in the deeper parts of Mhen’ga’s jungles, usually in the tree tops. Vanae generally only descend to the forest floor when hunting for certain fruits or to ambush prey, preferring to stay out of the reach of ground predators. They also like to use their natural camouflage to remain largely unseen.");
	outputCodex("\n\nVanae are tribal and live in communities revolving around a single vanae queen. These communities range anywhere between fifty to five hundred vanae, excluding breeding slaves (See Society). They live in gigantic trees known as sky homes. These trees tower high above Mhen’ga’s jungle canopies and are often found in regions thick with fog.");
	outputCodex("\n\nThe foundation of a sky home is not a natural process, but one that takes considerable effort by a vanae tribe. First, vanae pick out a young, healthy Saole tree, the thickest and largest trees that grow on Mhen’ga. They then place objects in its growing path and then make small bore holes lower down.");
	outputCodex("\n\nA vanae queen or matriarch then pours her extremely concentrated milk into the holes, causing the tree to grow at an accelerated pace (See Vanae Milk). Using this process, they cause the tree to rapidly grow over a number of months instead of decades.");
	outputCodex("\n\nOnce this process is complete, they are left with a tree at least three hundred feet tall filled with tunnels, nooks, and meeting places for the tribe to utilize. The tree is also incredibly hardy and can survive a light feeding by vanae young and elders.");
	outputCodex("\n\nSaole trees are naturally found in areas thick with fog, typically humid valleys with high precipitation and low dew points. This makes them perfect for keeping vanae moist, providing nutrients to surrounding trees, and confounding potential flying threats such as the zil. These regions are typically very cold and wet.");
	outputCodex("\n\nSince these regions in which Saole trees grow are usually thick with fog, its fruit and trunk are usually high in water content. The fruit of Saole trees do not provide adequate fructose, meaning vanae must hunt elsewhere for fruit or prey to secure vital nutrients.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Religion & History"));
	outputCodex("A lot is known about the social structure and culture of this reclusive race due to the commercial interest in their drug-like milk. Xenogen alone has conducted several productive inquiries into the vanae. As such, more is known about the vanae than most of Mhen’ga’s other native races.");
	outputCodex("\n\nVanae are monotheistic, believing in an entity called the “Sky Mother” that lives in the clouds, looking out for their species and the forest. On completely cloudless days, vanae are often nowhere to be seen - refusing to venture out when the Sky Mother is not watching out for them. Vanae are spotted most often on rainy or foggy days.");
	outputCodex("\n\nVanae believe the places where Saole trees grow, a realm shrouded in fog, are holy places and connected to the Sky Mother. To the vanae, rain falling from the sky is her breast milk sent down from above to feed her children and the trees. When she orgasms, lightning strikes from the sky. The vanae believe the Sky Mother plays with herself quite often.");
	outputCodex("\n\nMost vanae pray to the Sky Mother for luck (typically before a hunt), thanks, and in times of strife (especially war). The Sky Mother does not typically judge and simply provides to all species. That said, the vanae and their sister race, the sacae, are her most beloved children.");
	outputCodex("\n\nVanae have an origin story that both vanae and the sacae were born from the Sky Mother’s womb. Two daughters - the first of each race - were delivered and fell down to Mhen’ga. The first sacae fell into the water and the vanae in the trees, making each their home. They believe the Sky Mother shows her love for her daughter’s descendents by sending down rain that collects in the trees and flows into the rivers and seas.");
	outputCodex("\n\nVanae believe when the Sky Mother gave birth to the world and before the vanae and sacae were born, she delivered the zil, naleen and other races. When she saw how much the zil and naleen females struggled to find nutrients she pitied them, and provided them with men to feed off of. The vanae and sacae instead received the Sky Mother’s pride, needing no such gifts. This is why only already proven hunters can keep male breeding slaves, lest they shame the Sky Mother (See Society).");
	outputCodex("\n\nThe queen is considered to be directly connected to the Sky Mother, closely followed by the matriarchs. It is maternity that allows them to be in concert with their goddess - the more children she has, the more spiritually attuned they are. For this reason, males are to be pitied and put in the same spiritual category as plants. In the vanae’s eyes, a brood mother of any species is always worthy of respect.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society & Laws"));
	outputCodex("Vanae are a matriarchal society and they put significant emphasis on female superiority, much like the amazons of human legend. While they do not actively scorn males and herms, they believe anything with a phallus (or phalli) is meant to be used as nourishment or breeding stock and nothing else. To the vanae, only females are worth speaking to on equal terms - be they vanae or otherwise.");
	outputCodex("\n\nFemale outsiders are still not welcome in their territory or near their sky home. Since vanae are accustomed to actively fighting off sentient and non-sentient predators seeking to kill or eat them, Vanae are fiercely protective of their land. Vanae poaching has also exacerbated this problem (see Vanae milk). Most creatures are smart enough to know not to lurk too long in misty valleys on Mhen’ga, lest the vanae descend upon them and in great numbers.");
	outputCodex("\n\nVanae are geared towards three things - breeding, hunting, and gathering. Young vanae are expected to collect fruit from the treetops and ground to hone their skills, vanae huntresses are in charge of hunting, and both adult and senior vanae are in charge of breeding. All pregnant vanae are expected to protect the sky home with their potent milk.");
	outputCodex("\n\nWhile they are very task-focused, they are hardly unintelligent, with most being quite canny. A vanae queen and the matriarchs of a tribe are usually very sharp, a necessary requirement for surviving long enough on Mhen’ga to make it to their particular positions of status. Vanae respect and prize their elders, hunting food and semen for them instead of making them do it themselves. Because of this, vanae queens and matriarchs are almost unceasingly pregnant.");
	outputCodex("\n\nYoung vanae are always striving to prove themselves and stand out from their sisters. Taught in great numbers, young vanae must either sink or swim - the savage jungles of Mhen’ga rarely offer a second chance. Since they are not apex predators, careless vanae do not survive long.");
	outputCodex("\n\nBreeding capacity is closely linked to status in vanae society, and while females engage in loving, intimate relationships with each other, it is considered in poor form to mate exclusively with females. The larger the breasts the more sway and status they have. Because of this, breast envy is a widespread phenomenon.");
	outputCodex("\n\nVanae queens are usually elected by breast size and by vote; the fact that a clan is usually comprised largely of her children usually sways election in her favor. It is very unusual for a vanae queen to not be the bustiest of the clan, but it is not unheard of. The queen has absolute authority over the entire clan, and once elected is usually in charge until death except under the most extreme circumstances.");
	outputCodex("\n\nVanae that respect one another let them drink from their breasts. Drinking the breast milk of a vanae queen is considered a great honor and rarely, if ever, offered to outsiders.");
	outputCodex("\n\nEspecially virile males are typically captured as breeding slaves, though only the queen and other breeding matriarchs of a vanae tribe are allowed to keep them. These breeding males are extra mouths to feed and are signs of status; only a huntress who no longer has to prove her worth has the right to own one.");
	outputCodex("\n\nWhen a tribe grows too large, a vanae matriarch takes a number of tribe members and strikes out on her own to start a new tribe (Becoming a queen in her own right and founding a new Sky Home). A matriarch must have permission from the queen to leave. It is not unheard of for this to occur for other reasons, such a dissatisfaction with an existing queen’s rule. In this case, the queen usually lets the matriarch and any dissatisfied tribe members leave to in order distance them from the tribe.");
	outputCodex("\n\nOne of the greatest crimes a vanae can commit is to steal or extort semen or nutrients from another hunter that is not freely delivered (including non-vanae females). The penalty for this crime is severe by vanae standards; the sap of the Uthra birch is rubbed onto the offenders breasts, causing them to shrink and disappear. This leaves them shamed and without status. The only crime equal to this is the murder of a fellow vanae, or treason against the queen.");
	outputCodex("\n\nTheft of any other kind is also looked down on, though not as severely as poaching another hunter’s nutrients or semen. Other taboos are touching another warrior’s weapons (no matter the race), cutting a tree for any reason other than grabbing fruit, sexual monogamy (turning down a sexual proposition is allowed if they dislike this person, but mating exclusively with one person or one gender is not), or maliciously harming a fellow vanae or sacae.");
	outputCodex("\n\nThere is only one time that murdering a fellow vanae or sacae, or attacking a queen is allowed. That is when they are directly threatening the security of the entire tribe. Even a queen is subject to this law, and may not order the death of any sister for any other reason. If proof cannot be found that a vanae was acting to protect the interests of the tribe, she will be punished accordingly.");
	outputCodex("\n\nOn average, maiden vanae has A to B-cups, vanae huntress have C to DD’s, matrons E to HH, and matriarch to queens are J or larger.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other"));
	outputCodex("Vanae have a fighting style that is a combination of dancing and fighting, known as Shak’tath. It requires supremely good balance, agility, and hearing. It is performed with a two-handed spear or staff, though it can technically be performed with any two handed melee weapon.");
	if(flags["DiscoveredAncientData"] != undefined) outputCodex(" It is a derivative of an ancient octalian fighting style.");
	outputCodex("\n\nShak’tath is a style that utilizes momentum, misdirection, and pinpoint accuracy to fight one’s opponent. Attacks are performed in a single strike, utilizing a large lead up movement and strong thrust. During the lead up, Shak’tath users are trained to keep their bodies constantly moving in order to avoid being struck, “flowing like water”.");
	outputCodex("\n\nVanae are ideally suited towards practicing Shak’tath with their biological advantages (dancer’s legs, flexible ankles, balancing tentacles, and superior hearing). While another species could technically learn Shak’tath, vanae have never in their history taught an outsider this art - and with species like the zil and naleen as neighbours, why would they?");
	if(flags["DiscoveredAncientData"] != undefined) outputCodex("\n\nThe fighting style Shak’tath is based on was originally developed to defend against shark-like predators on the Octalian homeworld. It was designed to evade lunging bites and strike vulnerable points such as the eyes and nose.");
	outputCodex("\n\nYoung vanae are usually first taught how to fight by their mother and alongside their breast sister. Later on, they are taught more advanced techniques by the arms matron of the clan.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Vanae");
}
public function vanaeHistoryCodexEntry():void
{
	clearOutputCodex();
	showBust("9999"); // Probably split this out into multiple types?
	outputCodex(header("Vanae"));
	outputCodex("‘Vah-nay’");
	outputCodex("\n\n");
	outputCodex(blockHeader("Addendum: History"));
	outputCodex("The origin story of the vanae and sacae has a nugget of truth to it in that they did indeed “fall from the sky”. Both species are not native inhabitants of Mhen’ga and actually come from a far-off world.");
	outputCodex("\n\nBoth species started as a single race known as the octalia, originating from an oceanic planet in a neighbouring sector. The octalians had bodies adapted for living under extreme pressure and in almost pitch black darkness - the reason both races have white skin and bio-luminescence. The octalia hunted prey by luring them in the darkness.");
	outputCodex("\n\nAt some point in the history of the octalia, a spacefaring mission was attempted. For unknown reasons the ship crashed on Mhen’ga. The male members were wiped out, leaving only the females to survive. The female crew, blind and struggling in the new environment, were raped by species such as the naleen.");
	outputCodex("\n\nOctalian genes are incredibly dominant, and the gender chromosomes are only carried by the same gender of their race (Only males carry the octalian Y chromosome template). Without male octalia or a similarly strong male species to impregnate them, the female crew gave birth to only female octalian children.");
	outputCodex("\n\nFor a very long time, the female crew and their descendants were bred forcibly, leaving a scathing opinion of males that would later define their descendant’s social structure. They survived by either crawling into the burning, fresh waters of Mhen’gan lakes and swamps, or climbing up into the trees and feeding off of fruit.");
	outputCodex("\n\nOver time, descendants of the octalia survivors split into two distinct subspecies - the water-dwelling sacae and the tree-dwelling vanae. Knowledge of their history was all but lost, grains of forgotten truths carried in their religious myths.");
	outputCodex("\n\nThe original treatment of the octalia survivors led to both species being male-wary, female-respecting, and survival-focused. Over the centuries, vanae and sacae have gone to war with the various species of Mhen’ga. They have endured diseases and parasites other native species have long become immune to, weighed down by their strong, slowly adapting genes.");
	outputCodex("\n\nTo this day, vanae are still the most sickly of all the races of Mhen’ga. To compensate for this, natural selection has pushed those with superior breeding capacity to the fore.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Vanae: History");
}
public function venusPitcherCodexEntry():void
{
	clearOutputCodex();
	showBust("VENUSPITCHER","VENUS_PITCHER_ELDER");
	outputCodex(header("Venus Pitchers"));
	outputCodex("<b>Name (Singular):</b> Venus Pitcher");
	outputCodex("\n<b>Sexes:</b> Hermaphrodite");
	outputCodex("\n<b>Height:</b> Three to fifteen feet above the ground, depending on age.");
	outputCodex("\n<b>Weight:</b> Hundreds of pounds including their subterranean bulbs.");
	outputCodex("\n<b>Hair:</b> Comprised of leaves. It varies based on season and subspecies of venus pitcher.");
	outputCodex("\n<b>Eyes:</b> Sclera are tinted light green due to their chlorophyll infused biological systems.");
	outputCodex("\n<b>Lower Body:</b> Where humans would have knees, venus pitchers have legs that fuse together into a central stalk. The stalk connects to their root system and central, subterranean bulb, which they use to gather additional, harder-to-extract nutrients. This stalk is remarkably flexible, and can allow the girl to hang down into her pod, sealing it and allowing her to play to with her prey unimpeded.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Genitalia"));
	outputCodex("Venus pitchers are hermaphrodites, like most plants, though given their sentient nature they’re obviously more than a simple blossom with stamen and pistil. Their genitalia are entirely contained in a number of vine-like tendrils and tentacles which ring the edges of the bulb’s inner chamber. Some tentacles appear similar to penises while others have the trappings of feminine orifices. Both are used to extract nutrients from prey’s sexual organs.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Nutrition"));
	outputCodex("Venus pitcher plants dwell in the deepest, darkest parts of the jungle, where most other plants cannot survive due to the meager amount of light allowed to slip through the canopy. They do photosynthesize what they can get, but it isn’t enough to survive on. Luckily, they dwell on Mhen’ga, a planet that has lots of licentious zil with sugary-sweet, nutrient-packed sexual fluids. They will seek to entice the zil or any other creature of suitable size into approaching them, an act sure to result in the entrapment of the victim. Camouflaged just in front of them, the entrance to the pod is nearly invisible - until someone falls into it.");
	outputCodex("\n\nAt that point, the tendrils lining the pod’s interior will restrain the victim and bring them to a sexually fruitful state, penetrating orifices, engulfing dicks, nipples, and any other fluid-secreting protrusions. The victim of this forcible liquid extraction will often enjoy it thanks to the venus pitcher’s gentle methods of milking, drug-like spores, and soothing, almost motherly mannerisms.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Intelligence"));
	outputCodex("Venus pitchers are sentient, though they tend towards laziness and make poor conversationalists. When left alone, they do little but preen themselves and ensure that they’re as enticing as possible. When a stranger approaches, they’re focused on getting them inside them to violate and possibly hypnotize, in the case of elder venus pitchers.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Venus pitchers can fertilize themselves, but only do so in the presence of a potential seed carrier. Female victims will be implanted with a number of seed pods which are subsequently fertilized (after feeding). Once free, the female will carry the pods for a time, laying them periodically over the span of a week. Venus pitcher seed can survive in the lining of a host’s vaginal cavity for weeks, which allows for true sexual reproduction to happen whenever someone is victimized by multiple plants.");
	outputCodex("\n\nMales are prized more as food sources than reproductive partners. They typically produce larger volumes of protein and are more susceptible to the venus pitcher’s appearance, making them more common but necessary prey.");
	outputCodex("\n\nElder venus pitchers will typically hypnotize males to return to them as a steady supply of food. Particularly skilled ones may find their protein harem lining up waiting for their turn. If a female can be hypnotized, they will implant suggestions to visit many different pitchers, allowing them to breed and combine DNA from multiple plants.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Venus Pitchers");
}
public function zilCodexEntry():void
{
	clearOutputCodex();
	showBust("ZILFEMALE", "ZIL"); // ohoho lookit dis shit!
	outputCodex(header("Zil"));
	outputCodex("<b>Name (Singular & Plural):</b> Zil");
	outputCodex("\n<b>Sexes:</b> Male and female.");
	outputCodex("\n<b>Height:</b> 5\' to 5\' 6\" commonly. They can rarely attain heights of 6\'.");
	outputCodex("\n<b>Weight:</b> 80 to 140 pounds.");
	outputCodex("\n<b>Hair:</b> Flexible spines covered in a downy-soft fuzz. They are commonly colored black, but sometimes can be yellow or yellow and black striped.");
	outputCodex("\n<b>Tongue:</b> Bright yellow, typically extends a foot past their lips when fully extended. The tip has a tube inside it capable of gathering sweet nectar from jungle flowers or lovers.");
	outputCodex("\n<b>Eyes:</b> Black sclera and iris result in eyes that appear solid black. Rarely they will have vibrant golden irises.");
	outputCodex("\n<b>Wings:</b> Male Zil have flight-capable wings, but the rest of the population does not.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Zil are almost entirely covered in chitinous armor plates. While it resembles an insectile exoskeleton, it is more biological armor than anything else, protecting against weapons and other dangerous inhabitants of Mhen’ga. Very few places on their bodies are unarmored: their mouths and bottom of their noses, their anuses, and fingertips, which affords them a decent grip. Their genitals and chests can have their covering plates retracted up and to the sides respectively, typically in order to breed or perform courtship.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Dimorphism"));
	outputCodex("Male Zil are born without the distinctly wasp-like abdomen and stinger that the females possess. Combined with their wings, this affords ‘men’ increased speed at the expense of an extra attack. Males have penises and females have vaginas. Females also have breasts that are capable of lactating a nutritious, honey-like substance that they can feed to their young. Both sexes’ sexual fluids are reported to be sweet, though all reports have been placed anonymously.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("The Zil are located primarily in the thick jungles of Mhen’ga, though they have been observed in sparser sections of forest as well. They do not venture to the polar regions, and the winters of the seasonal areas typically cause them to migrate away. Low temperatures may therefore be effective at driving them off. They have not been seen off-world except when brought as slaves or ‘uplifted’, and are not presumed to have a method of unassisted interstellar travel.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Unsurprisingly, the Zil are much like humans when it comes to breeding. A male will insert his penis into the female, ejaculate his seed, and fertilize eggs in her uterus. Gestation takes between six and seven months, with the resulting progeny born as fraternal twins or triplets. When a Zil takes an interest in another, he will force himself into close proximity with the other and activate his pheromone glands. Both sexes have such glands all over their bodies, though the highest concentrations are centered on their genitals. It is reported that, with males, the densest and most effective scent is released from their foreskin. For females, both the breasts and the labia have incapacitating levels of this chemical reactant. Breeding with humans is possible and has happened. The resulting children are chimeral in appearance rather than the hybrids that were expected. More data is required.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Zil society is simple and tribal. They live in small groups numbering twenty or thirty at most, hunting and gathering. A few tribes seem to have discovered simple farming, with crops of large, indigenous flowers. Most are content to harvest the plentiful plant life and prey creatures. Signs of open warfare have not been discovered, but the Zil keep no written history. The few instances of observed inter-tribal meetings have resulting in breeding nearly every time. Current theories explain this as a method of maintaining genetic diversity.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Zil");
}


/* Tarkus */

public function buttBugsCodexEntry():void
{
	clearOutputCodex();
	showBust("BUTTBUG_B", "BUTTBUG_G", "BUTTBUG_O");
	outputCodex(header("Sand Worms"));
	outputCodex("(Entire Symbiotic Organism)\n\n");
	outputCodex("<b>Name (Singular):</b> Hilinara");
	outputCodex("\n<b>Most Notable Features:</b> A faux symbiotic creature, and a burrowing organism. Its entire body is controlled by a smaller organism that is ejected when the larger body becomes too damaged, or the smaller organism is parasitizing another creature. The inner flesh and blood of the large worms are a deep green color.");
	outputCodex("\n<b>Sex:</b> Male and female. The sex is only discernible through dissection or after the parasite has been ejected.");
	outputCodex("\n\n<b>Organism</b>");
	outputCodex("\n<b>* Name (Singular):</b> Hilinara worm or sand worm.");
	outputCodex("\n<b>* Height:</b> Two to six feet.");
	outputCodex("\n<b>* Length:</b> Two to twenty meters, or even larger depending on available burrowing space. Most of the body won’t be seen even after death, unless dug out.");
	outputCodex("\n<b>* Weight:</b> Seventy pounds to two tons, depending on size.");
	outputCodex("\n\n<b>Parasite</b>");
	outputCodex("\n<b>* Name (Singular):</b> Hilinara parasite, colloquially known as “butt bugs”.");
	outputCodex("\n<b>* Height:</b> One to six inches depending on age and subspecies.");
	outputCodex("\n<b>* Length:</b> Between six inches and one foot. Subspecies can vary.");
	outputCodex("\n<b>* Weight:</b> Five to fifteen pounds, depends on age. Subspecies can vary.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Senses"));
	outputCodex("They have weak eyesight in bright light, and the two pairs of segmented eyes on the heads of both bodies are short-sighted. Thermal sensors line the undersides of the mouths of both bodies. Seeking adequate warmth on cold nights is just as much a priority for them as most other species. Both entities are extremely sensitive to vibrations, and use this to detect prey and hosts through sand, dirt, mud, and the other loose terrain they can call home. The smaller body seems to have a weak sense of smell, and the ability to detect moisture through the membrane of its skin. They seem to prefer warm, moist, or wet areas, but can live in a multitude of climates.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Movement"));
	outputCodex("Not unlike the earthworms of Earth, these creatures undulate their bodies to dig through the ground and move above it. However, unlike Earth’s earthworms, they can do so at speeds fast enough to destabilize the ground above them, at times throwing up chunks of dirt and rocks. Some have even been observed creating sinkholes in order to trap their targets before eating or parasitizing them.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Defenses"));
	outputCodex("Specialized plates on the larger body allows it to remain unscathed no matter how fast or hard it burrows through the ground. The body however is quite soft and breaks easily to direct impact by any object with force. This has caused some to get injured by crashing into unmoving obstacles underground, though it is rarely the case as they’ll detect the obstruction long before they actually get to it. The smaller body has no defenses besides running/crawling away or hiding. They can use their inbuilt chemicals, but they need to be extremely close to have any chance of hitting their target. The large bodies are surprisingly agile for worm-like creatures of their size; they can dodge and avoid many attacks aimed towards them if they happen to be above ground.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Offenses"));
	outputCodex("Both bodies are able to synthesize a versatile green substance. They make it by releasing a cocktail of chemicals into their saliva to create the green substance that increases hormone and sensitivity levels. This substance can be rigid, sticky, slippery, or all of the above at once, based on what is currently needed. The larger body is able to create this liquid much more quickly than the smaller body and in greater quantities. It has the ability to concentrate this substance into a ball, which can be flung to incapacitate above-ground enemies. Their fast underground movement speed gives them an advantage over above-ground adversaries, allowing them to sneak up on foes should their target not know how to identify their movements.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Dimorphism"));
	outputCodex("The larger bodies are completely indistinguishable from one another. However, the smaller bodies can clearly be identified as either male or female through sight alone. The majority of the male’s body is a large, phallic protrusion that normally flops around, but stiffens when it is near females. This protrusion is attached to a bulbous base where its eyes, mouth, and six spindly legs are situated. All males are dull yellow in color, and uniform in shape. Females have the same wormlike body structure as the larger entity they normally inhabit, and move the same way, albeit much slower. On either end of their body, they have an orifice resembling the exterior of an anus. A large variety of females exist, with differences in body structures and biological mechanisms. Humanoid and other body types of hilinara organisms exist, but only as the result of the successful parasitization and pregnancy of a large female inside an appropriate host.");
	outputCodex("\n\nBoth sexes have nerve manipulation organs that extend from within their main bodies to control their larger worm-like body. In the case of males, these are ripped away in the process of ejection. Females, on the other hand, are able to retract and subsequently reuse them while they are embedded in their hosts. These tendrils are stored within their main body, hidden until they are needed. Only a few of the tendrils are used in the ‘nerve merge’, while the rest remain available as tentacular feelers capable of manual manipulation.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environments Typically Inhabited"));
	outputCodex("While they are currently only found on Tarkus, it is likely that they would thrive in any environment containing the soft ground or sand that allows them to move their larger worm-like bodies.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Intelligence"));
	outputCodex("Nowhere near sapient levels, they follow a main biological imperative. They have some degree of intelligence, which is higher while connected to the larger sandworm bodies’ neural matrix. They seem able to develop an affection for long-term hosts. Worm-hybrids have considerably more intelligence than the regular sandworms, but are still considered rudimentary compared to galactic standards. Their capacity for compassion seems limited to their carrier or others with genetic similarities, making cooperation between them and another person more or less impossible without the original host nearby. If a particular female has enough offspring they can create something like a hive mind, and have occasionally been seen to work together like ant or bee colonies.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Construction of The Larger Body"));
	outputCodex("By instinctively applying their secretions and by varying their hormones, they build a greenish-webbed-up pod in the soil or sand. This pod grows their secondary body over a long period of time as they enter into a state of hibernation outside of it, safely hidden away. Once several weeks have passed, the secondary body will be about twice the size of the insect that built it, and will be ready to be taken control of. The parasite then enters it by breaking open the pod and sliding in through a fleshy slit in the head of the new creature. Once inside, it will merge with the freshly grown worm, using its nerve tendrils to control the larger body until a more suitable host is found.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Parasitism"));
	outputCodex("If the larger body controlled by the smaller organism manages to defeat or incapacitate an enemy that would be receptive to parasitization, the organism moves in to hold onto the future host with hidden pincer-ended limbs located behind the jaws. This helps to expose the soon-to-be-occupied anal cavity. Once the desired hole is found, the sand worm excretes an especially slippery version of its secretions on the host’s cavity. A couple of its long prehensile tongues are then used to massage the liquid further into the hole. After this is done, the tongues retract and the worm locks its body into position, essentially trapping the victim. The majority of the head where the smaller parasite first entered splits open, exposing the neural slit where the parasite is located, and the ejection process begins.");
	outputCodex("\n\nOnce ejected through the slit and onto the immobilized creature, a female parasite will position its tapered front at the anal ring. This is when it uses the tongue tendrils to force the anus open and wriggle inside to merge with the host. Male parasites will sense whether or not the host is already infected: if they are, he will be ejected just like the female, so that he can have sex with the female inside the host and fertilize any eggs that might be ready to be laid. However, if his target is not host to a female he’ll often punish his foe using his larger body as leverage. By the time that this process has finished, the larger body has usually dried up enough for the creature being held to break free of its now brittle confines.");
	outputCodex("\n\nHilinara parasites attached to a host’s digestive system gain sustenance both from direct absorption of nutrients through the bloodstream, and from consuming what the carrier hasn’t been able to digest. Hilinara organisms not attached to hosts are opportunistic scavengers, eating anything smaller than them and remotely digestible. Those that have been inserted into the vaginal cavity during volunteer experiments became malnourished after a while. One specimen was observed trying to move from the subject’s vaginal cavity to the anus while the subject was sleeping. Oddly enough, the subject did not awaken during the organism’s move. Once the Hilinara parasite finds its way into a host’s anus, either by forcefully crawling into a pacified target’s biologically lubed-up anal ring, or through the willing permission of the intended host, the female begins its parasitic stage. The females do this by using two of their six neural tendrils to merge with the inner flesh and nerves of their carrier. Once this has happened the victim will require medical assistance to remove it.");
	outputCodex("\n\nFemales are heavily territorial when it comes to captured hosts, and due to the infrequency of obtaining a host they also have enzymes to separate another female from its host. In order to do this the invading female has to crawl into the target’s anus along with the one already present. Once there, it will release the enzymes at the nerve connection points, severing the established female from its host. The two females will then wrestle inside the recipient, using their nerve tendrils as grapplers to eventually decide the victor.");
	outputCodex("\n\nThis process often causes spikes in the nerve sensitivity of the anal cavity, almost always causing non-stop orgasms in species that are able to have them. For some the orgasms can occur with such strength and frequency that it can nearly drive the host insane. Though it may feel like an eternity to the carrier, most fights don’t last longer than a few minutes. It should be noted that some of the female variants do have distinct biological advantages over others: data suggests it to be a cyclical hierarchy in the order of the examples listed below.");
	outputCodex("\n\nSome hosts in voluntary experiments reported their parasite as having an active influence in their lives. Most of the time the parasites disappear deeper into the anus and disguise themselves to make it look as though they aren’t there when hosts try to tell sexual partners of their ‘passenger’. Other times the parasite will make its presence blatantly obvious by stimulating the anal passage in the presence of male reproductive organs or even pulling down garments to expose the carrier. In most cases, hosts will develop a preference for anal sex. Many will become addicted to the endorphins released during the egg laying phase, and start actively seeking out male Hilinara parasites. Some individuals have made a profit out of selling captured males, but this business has only thrived in the black market among egg fetishists during the rush, primarily around Tarkus.");
	outputCodex("\n\nAll female Hillinara parasites have the ability to expand their inner muscles and forcefully stretch the host’s anal walls, essentially turning themselves into biological speculums, gaping the anus and easing egg passage. Further details on eggs and egg laying can be located in the section on reproduction.");
	outputCodex("\n\nThese are the known female variations found so far in recent expeditions:");
	outputCodex("\n\n<b>* The ‘Beige’ Female:</b> This variant is by far the most abundant and widespread type found to date. They are beige in color and have a relatively smooth skin texture. They stay reproductively dormant in the host until it has been fertilized by a male butt bug, after which it will lay fertilized eggs inside of the gut of the host where they will mature for a week. As the eggs gestate, they grow and expand, often making the carrier look pregnant with their combined bulk. Once the female deems them ready, she forces the host into a state of faux labor, birthing the now enlarged eggs through her own body and out of the host’s anal cavity. During the laying process, they force the host’s orifice to stretch just wide enough to allow the passage of the eggs. Beige females generally produce just over a dozen eggs.");
	outputCodex("\n\n<b>* The ‘Green’ Female:</b> Slightly larger and rarer than the beige female, this one is as green as the flesh of the larger worm body and covered in lighter green bumps that dot the majority of its surface. This variant of the parasite continuously lays full-sized eggs, producing one every eight hours, keeping its host in a state of ‘pregnancy’ until a male comes along to fertilize them. There is a refractory period after a fertilized laying which will temporarily cause the parasite to not lay eggs; times average at about three days. The newly fertilized eggs will be laid a short time after fertilization, often creating very large piles of eggs depending on how long it has been since the host was last fertilized. Hosts who choose to live with this type of parasite are advised not to let the growing number of eggs immobilize them. Emergency staff might take awhile to get to afflicted hosts and by then they may be in an even worse, if not critical, condition.");
	// Yes, a scene with medical staff using all sorts of rectal removal methods to get the eggs out are planned for future expansion content. At the moment the placeholder scene is you turning into an egg machine gun when you accidentally tripped. Not sure if bad end appropriate, if so it will be a volunteer scene. Meaning Somebody who wants to do so can write it and contribute, highly likely I’m not going to do it myself. I haven’t even read the CoC bad ends apart from kelt’s and the pod as I have almost no interest in most game over scenes concerning smut.
	outputCodex("\n\n<b>* The ‘Orange’ Female:</b> So far the rarest of all, these females are almost double the size of the other variants. They share the same color scheme with the beige female, with the exception of a large orange stripe running all along their undersides and continuing to the top of their body. They are a strange breed of ‘butt bug’ that when fertilized only lays a single egg into their host. This egg incubates for several months, and is expelled through a labor-intensive event somewhat akin to a vaginal birth, but through the anal cavity instead. This egg is much larger than most other eggs laid by these anal parasites, increasing in size until the carrier looks severely pregnant. Even stranger is that the egg absorbs genetic material from the host. This alters the body of the offspring in accordance to the carrier’s overall body shape. This has created bipedal, tauric, and even flying insectoid hybrids of all varieties with just enough intelligence to behave in a very tribalistic manner. Unfortunately their numbers are incredibly low, and there are no recorded cases of them actually forming civilizations. These hybrids are essential for the making of more orange females, as they need to be parasitized by other hilinara parasites in order for this specific female variant to continue.");
	outputCodex("\n\n<i>Other unfound variants may exist.</i>");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Hilinara organisms cannot reproduce on their own: they require a suitable host to incubate their eggs until the female deems them suitably developed to be laid. Gestation times vary between female types but it is known that most of the females already have eggs waiting to be laid within the host when a male comes along. In order to be fertilized, a female hilinara parasite needs to be inseminated by a male through the constant insertion of the male’s phallic body into one of the female’s orifices. This process goes on until the male is stimulated enough to ejaculate his spermatozoa into the awaiting body of the female, whereupon she will, through the use of her remaining tendrils, cover every egg she has in the deposited seminal fluids. After approximately an hour of soaking her eggs in the sperm, the female lays the eggs into the intestines of the carrier. It is here that they will gestate and grow in size until ready to be laid, often bulging a host’s body to the point of looking pregnant. An unwilling host will often feel discomfort at this act, as they may not want any phallic objects in their anus, let alone the parasite they are carrying. However, this will only happen if the host is subdued by the larger body of the male earlier on, so most hosts are safe from this happening to them in civilized or well travelled areas.");
	outputCodex("\n\nThe eggs seem to be completely immune to any sort of stomach acids. They do not need to be cared for in environments where soft soil or sand is abundant considering that they hatch shortly after they are laid. With the exception of the green female, all females already have an egg prepared and ready to be laid into the gut of their host once the female has confirmed that a male butt bug has inseminated her. If their unfertilized eggs come into contact with any sperm that is not from a male butt bug, they will induce an early ‘labor’ and lay all of the available eggs they have outside the host in order to prevent genetic contamination. This is often without warning, and without a care for where they end up. These eggs will not develop with no body incubating them and no female bug to care for them.");
	outputCodex("\n\nHybrids grow astronomically quickly when compared to their ‘parent’; with ‘parent’ being the host. As stated above, the continuation of the orange female strain requires the infection of a hybrid by another orange parasite type. The hybrid genes that they pick up in each reproduction cycle keeps the inevitable incestual damage to a minimum. This reproductive quirk hints at some genetic crisis in their evolutionary past, thus requiring them to take on genes from another species or become essentially sterile. Why they needed to do this, or what led up to this reproductive crisis is a mystery so far. The only lead so far is that there is an unusually high amount of sydian DNA located in their cells. Because of this, xenobiologists speculate that the first genetic hybrids were of sydian descent and could be why the hybrids are always more insectoid than the host species.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Parent/Child Interaction"));
	outputCodex("Almost all Hilinara organisms, hybrid or otherwise, seem to instantly be able to recognize the host who carried them while they were an egg, no matter how long a period of time has passed. Even subjects that were separated from their carrier for several years, and had never met them beforehand, seemed to know not to attack; while hybrids treat them like long lost parents the moment they sense them. Current data suggests that the carrier’s heat signature and unique chemical scent is imprinted into the brains of these creatures while they are carried, creating a permanent reminder of who they share DNA with. The most likely explanation for this is that it serves as a warning marker to prevent incestual genetic mixing. Only in the case of hybrids does this not make sense, as they are sexually sterile. However, it is entirely possible for a carrier to accidentally become the host of one of the parasites created by a hybrid they carried. Long term study has determined that this marker lasts for several generations, further providing evidence that this is to prevent against incestous genetic mixing.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Sand Worms");
}
public function gabilaniCodex():void
{
	clearOutputCodex();
	showBust("COLENSO");
	outputCodex(header("Gabilani"));
	if(silly) outputCodex("<i>They’re eating her... and then they’re going to eat me! ..... OH MY GOOOOOOOOOOD!!!</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Gabilani (colloquially known as “Goblin” or “Goblins”)");
	outputCodex("\n<b>Sexes:</b> Male and female, equal split.");
	outputCodex("\n<b>Height:</b> 2\' 8\" to 3\' 6\", with females averaging an inch or two taller than males.");
	outputCodex("\n<b>Weight:</b> 40lbs to 55lbs.");
	outputCodex("\n<b>Hair:</b> Black (naturally), many choose to dye their hair more unusual colors. As gabilani age, their hair grays and eventually turns white. Males can grow beards, however the species as a whole lack body hair.");
	outputCodex("\n<b>Eyes:</b> Two eyes, similar to humans, save that the pigmentation of their irises is black, making them virtually indistinguishable from their pupils to the naked eye. Gabilani have poor eyesight synonymous with a subterranean evolution. Glasses and ocular cybernetic enhancements are common.");
	outputCodex("\n<b>Ears:</b> Gabilani have large, pointed, flexible ears. These provide them with ausar-like hearing and a pronounced sensitivity to vibration.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features"));
	outputCodex("Gabilani are humanoid in structure, but are smaller in size to the galactic norm. They look not unlike scaled down humans, or more like the fantasy “goblin”, as they are commonly known by some terrans. This may be due to the fact that their skin has a green pigmentation in most cases, but can vary between yellowish and aquamarine. They have nearly identical facial features to human ones, aside from a tendency towards slightly larger noses and a more triangular visage.");
	outputCodex("\n\nGabilani females are on average slightly larger than their male counterparts. This is matched with a higher level of natural strength and aggression in females over males.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Gabilani are a highly sexed species. They do not have an estrous cycle, and fertile females appear capable of having children at any time. Pregnancies usually last for 3 months, with mothers giving birth to 3 to 5 children per litter. Larger or smaller litters are possible, but very rare. A female gabilani’s hips and buttocks grow larger with each pregnancy, and their sizes are often a good indication of how many children a particular female has had. Aside from the lack of an estrous cycle and body hair, gabilani have many mammalian traits and their females nurse their young with breast milk. Both gabilani sexes are quite capable of interbreeding with a number of races.");
	outputCodex("\n\nGabilani vaginas are naturally loose, but possess a set of specialized muscles that let them twist and rotate their interior passage around. Females have full voluntary control over these muscles. These two characteristics allow them to house and tighten down upon almost any size and type of erection. Gabilani males often find it difficult to orgasm without some twisting on their dicks. This leads to male gabilani having greater sexual endurance than the galactic norm, taking a long time to orgasm whilst having sex with non-gabilani.");
	outputCodex("\n\nDespite their small stature, a male gabilani’s penis is, on average, 4 to 6 inches in length and 1 and a half inches in diameter. It has a bulbous shape, featuring two distinct, sequential “heads” at its tip separated by a ridge.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Gabilani are an intensely social species that become stressed when isolated far faster than most. They have evolved a competitive caste system that allegedly revolves around who is the most involved and dynamic within their society at any one time. For both of these reasons, exile is regarded as the worst punishment possible to the gabilani, outstripping even death, as execution involves being the centre of attention even if only for a short time.");
	outputCodex("\n\nGabilani express a great love for mechanical invention. Whilst their appreciation of biology and medicine is limited, the great space stations upon which the majority of the species now live demonstrate a remarkable grasp of aerodynamics and engineering, particularly given the limited timeframe many of them were constructed in. Where they differ from the similarly practically-minded raskvel is a preference towards inventing new things, as opposed to repairing or recycling the old. This is identified as one of the key reasons for Tarkus’s environmental exhaustion.");
	outputCodex("\n\nOutside, cultural historians theorize that many gabilani societal traits suggest an overall veneration of “bigness”, possibly related to the generousness of a female’s frame displaying how many children they have had. How long a gabilani’s name is, for instance, displays how important they are considered to be, and the more spectacular an individual’s invention - or the more spectacularly said invention goes wrong - the more cultural cache is attached to him or her, above and beyond what an engineer or scientist of a different race might expect. Similarly to the raskvel, then, most gabilani view larger offworlders as profoundly sexually attractive, and aim to breed with them wherever possible.");
	outputCodex("\n\nGabilani can interbreed with raskvel, however the progeny is always raskvel. The only race on Tarkus capable of outbreeding them, gabilani express a cultural fear and dislike of the raskvel, viewing their reckless approach to reproduction as the primary reason for Tarkus’s ruin. Higher ranking gabilani sometimes “adopt” raskvel as menial workers and sex slaves aboard their space stations. The gabilani High Command is currently locked in negotiations with the U.G.C. for full membership; one of the key provisos is that it explicitly wipes the practice of raskvel slavery out.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Cybernetics and Health"));
	outputCodex("The passion for mechanical invention, lack of interest in medicine, and the frequency of industrial accidents in gabilani culture led to the species evolving the love of and reliance on cybernetics that they are remarkable for today. The gabilani developed physical cybernetic enhancements before microbe theory and blood transfusion, and a great majority employ significant mechanical bodily enhancement during their lifetime.");
	outputCodex("\n\nReplacement limbs and ocular enhancement are the most common procedures, however the gabilani are also capable of sophisticated internal adaptations, often aimed at combating the health problems they face as a result of spending most of their lives in orbit above their home planet. All gabilani are required by law to spend at least three weeks in a year on the surface of Tarkus to boost their skeletal and immune system strength, however some wealthier gabilani disdain this edict by having all or most of their bones replaced with alloy metal, and augmenting their respiratory systems with antiviral micro-bot plants.");
	outputCodex("\n\nThis ability to easily replace defective organs and limbs with effective cybernetic replacements has greatly boosted the possible lifespan of the average gabilani, however their population has remained stable as a result of the scourge of industrial accidents in their frenetic society, and the likelihood of newer models of replacement organs going catastrophically wrong.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Gabilani");
	//Fix buttons
	if(currentLocation == "225") 
	{
		flags["NAV_DISABLED"] = undefined;
		addButton(6, "North", move, rooms[currentLocation].northExit);
	}
}
public function raskVelCodexEntry():void
{
	clearOutputCodex();
	showBust("RASKVEL_MALE","RASKVEL_FEMALE","RASKVEL_MALE_NUDE","RASKVEL_FEMALE_NUDE");
	outputCodex(header("Raskvel"));
	outputCodex("<b>Name (Singular & Plural):</b> Raskvel");
	outputCodex("\n<b>Sexes:</b> Male & Female");
	outputCodex("\n<b>Height:</b> Average heights fall between 3\' 6\" and 4\' 3\".");
	outputCodex("\n<b>Weight:</b> Somewhere between 40 and 60 pounds.");
	outputCodex("\n<b>Hair:</b> None. They have feathery plumage instead, often light blue, red, or black.");
	outputCodex("\n<b>Skin:</b> Scaled skin of tan, dark red, or blue.");
	outputCodex("\n<b>Eyes:</b> Two vertically slit, reptilian-like eyes.");
	outputCodex("\n<b>Ears:</b> Raskvel have two ears that rival Earth’s rabbit species for length and size. Their ears are extraordinarily floppy and typically hang down alongside or behind their head. The positioning and posturing of one’s ears is considered similar to how humans style their hair. The scales covering these ears are typically a brighter, or different hue, than the rest of their body scales.");
	outputCodex("\n<b>Tongues:</b> Lengthy, purple organs that can extend five to seven inches out of their mouths. Their tongues are much thicker than humans’.");
	outputCodex("\n<b>Tails:</b> Raskvel have one long reptilian tail that sways rapidly when its owner is excited or happy. They do not have enough control over it for fine manipulation, but they are more than capable of guiding it into a suitable open orifice when the time calls for it.");
	outputCodex("\n<b>Additional Appearance Notes:</b> Scales cover raskvel bodies from head to toe, though the scales on their bellies, chests, and groins are far more soft and supple than elsewhere. Their hips are unusually wide for their size, allowing them to pass large eggs and accept large insertions with ease. Up top, raskvel are nothing to write home about. B-cups are considered large for their species, and anything bigger than that is viewed as freakishly big. Males have narrower hips than females, though they are still wider, by far, than a human of proportionate size.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Genitalia"));
	outputCodex("Males have retractable, pointed purple penises that hide inside genital slits most of the time. Their gonads are kept in pouches that stay so taut to their belly that they appear almost spherical in spite of their three gonads. The female vaginas are purplish in hue, with small inner lips, larger outer lips, and clits on the top and the bottom.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Raskvel are a peaceful people, but coexisting on a planet with limited resources and highly competitive gabilani has forced them into enough fights to know how to handle themselves. They prefer to use nonlethal weapons: stun guns, dart guns, sexual distractions, and aphrodisiacs. They will often flee when close to defeat, though when faced with sexual defeat they will often stay, sometimes even giving up early rather than risk further injury.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("Raskvel build villages under the surface of the planet to better conceal themselves from their enemies, only emerging to scavenge for technology, food, and trade. They can survive well in any temperate clime, though their reptilian blood causes them issue when faced with extreme cold or heat.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Raskvel are consummate breeders, one of the few races able to compete with gabilani when it comes to sheer reproductive enthusiasm. They will breed with almost anything at any time, so long as it has a pleasant disposition and a compatible-looking penis or vagina. Most would consider them sluts, but to them, it is a way to survive a planet rife with industrial accidents and deadly foes. They love to mate with creatures bigger than themselves, believing it will give the young the strength to survive longer on their harsh home planet.");
	outputCodex("\n\nShortly before birth, they will be immobilized by the size of their incubating bellies, but birth occurs with such rapidity after that that there is little danger from this. They will lay anywhere from three to ten large eggs in an act that they describe as “hellishly pleasurable” before slumbering to recover. The eggs will hatch within a month, each containing a young raskvel if fertilized. The eggs do not need to be incubated. Once laid they are often left to fend for themselves, as the Raskvel are quite lacking in maternal instincts. The offspring are inquisitive, knowledge-hungry creatures that soak up information like sponges and mature enough to work and talk within a month or two. Full adulthood and sexual maturity do not come for at least two years.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Diplomatic Relations"));
	outputCodex("Raskvel are often hostile toward gabilani but will rarely throw the first attack. They hate rust monsters with a passion, due to that race’s propensity for devouring their recently repaired machinery.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Other Notes"));
	outputCodex("Raskvel are known as skilled mechanics but less gifted inventors. They tend to be obsessed with fixing rather than creating, a trait that makes gabilani prize them as pets in spite of their racial squabbles. Needless to say, the Raskvel do not enjoy being held in that state.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Raskvel");
}
public function sydianCodexEntry():void
{
	clearOutputCodex();
	showBust("SYDIAN_MALE","SYDIAN_FEMALE");
	outputCodex(header("Sydians"));
	outputCodex("<b>Common Name:</b> Sydian (singular); sydians (plural)");
	if (flags["SYDIAN QUEST STARTED"] != undefined) outputCodex("\n<b>Binomial Name:</b> <i>Homo sydianensis</i>");
	outputCodex("\n<b>Sexes:</b> Male and female.");
	outputCodex("\n<b>Height:</b> 4\' 6\" to 5\' 6\" for females and 6\' 3\" to 7\' 1\" for males.");
	outputCodex("\n<b>Weight:</b> 90 to 160 lbs for females and 200 to 320 lbs for males.");
	outputCodex("\n<b>Limbs:</b> Two arms bearing hands with two thick fingers and a thumb. Two legs with two large toes each. An armored tail branching into four protrusions covered with downy fuzz. Two 1\' to 2\' long prehensile antennae, also covered in downy fuzz.");
	outputCodex("\n<b>Skin:</b> Pale white or beige in color, covered in drab black or brown chitin. ");
	outputCodex("\n<b>Hair:</b> Soft and feathery, found only atop the head. Generally earth-toned but rarely green or shades of red-orange. Orange hair in females usually indicates a seasonal change in hormones.");
	outputCodex("\n<b>Tongue:</b> Extends up to six inches. Fully prehensile.");
	outputCodex("\n<b>Eyes:</b> Insectoid and multi-faceted. Typically black, but rarely found with greenish sheen.");
	outputCodex("\n<b>Ears:</b> Internal. Located under small openings in the head chitin, above the jaw hinges.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Anatomy"));
	outputCodex("Sydians are covered in chitinous plating, with only the face and, in females, the front torso and groin exposed. Located under the porous chitin are glands that secrete a corrosive enzyme. While concentrated in the antennae and tail fuzz, they are found all over the body. This enzyme catalyzes oxidation of (i.e. rusts) most metallic elements. When living tissue is exposed, the enzyme stimulates low-level ion exchange in the nerves, causing a feeling of pleasure. On non-metallic substances or organisms lacking nervous systems, the enzyme sits inert or is absorbed without effect.");
	if (flags["SYDIAN QUEST STARTED"] != undefined) outputCodex(" The enzyme-generating cells bear surface structures with their own DNA; similarities to mitochondria suggest incorporation of protobacteria or archaea into sydian cellular biology. All sydian cells also contain mitochondria with mtDNA nearly identical to that of <i>Homo sapiens</i>, indicating common ancestry.");
	outputCodex(" Sydian secretions have a slight citrus flavor and aroma");
	if (flags["SYDIAN QUEST STARTED"] != undefined) outputCodex(", possibly due to acidic enzymes adapted from the protobactera or archaea");
	outputCodex(".");
	outputCodex("\n\n");
	outputCodex(blockHeader("Habitat and Diet"));
	outputCodex("Sydians are warm-blooded (endothermic) and live almost exclusively in the junkyard wastes of Tarkus; their ability to oxidize most types of metal suits them to this environment. Infrequently, individuals are found in settled areas but encounter difficulty co-existing with other civilized species.");
	outputCodex("\n\nSydian dietary requirements include heavy metals alongside water and organic nutrients; colonies form when the three are found in close proximity. Freshwater bodies carrying fish and trace metals are common sites. Isolated colonies have developed rudimentary farms using scavenged or stone tools once forage no longer supports population growth. Lone individuals, social groups without settlements, and those in frequent conflict exist as nomadic hunter-gatherers, sometimes for generations before a colony is founded.");
	if (flags["SYDIAN QUEST STARTED"] != undefined) outputCodex("\n\nRecent research has shed light on the role of metals in sydian biology: individuals deprived of metals can survive on food and water for months but suffer from blood poisoning as the enzyme-generating cells in their bodies die. The replication of the organelles on the cell surfaces during mitosis requires heavy metal compounds. When these compounds are not available, a hormone messenger from the organelle interrupts mitosis and the cell lyses to release usable metals for other cells, along with metallic waste stored within the organelle. As the number of generative cells dwindles, the remainder can no longer reuptake enough of the metallic waste from the blood plasma, resulting in heavy metal toxicity. Sydians deprived of organic nutrients or water suffer ordinary malnutrition and dehydration, respectively.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Dimorphism"));
	outputCodex("Male sydians are taller and burlier than females, with larger, stockier tails. Male antennae tend to be smaller, growing no longer than 1\' 4\". The chitinous plating is more prominent on the male, covering all of his body except the eyes and mouth. Flexible plates protect the male genitals, and open slightly during copulation. Females bear chitin only on the arms, legs, tail, and back, including the back and sides of the head up to the sites of the antennae. Large areas of the female sydian’s front torso are exposed, including the throat, breasts, stomach, and groin. Females conceal and protect these places with a layered patina of metal oxides mixed with clay and body oils; these solidified body paints are usually styled, decorated, and accented to resemble male plating. High-ranking females exhibit more abstract and colorful patterns to symbolize their rank. Female sydians have a much higher concentration of enzyme-producing cells in the armor they do possess. The head hair and downy fuzz found on the antenna and tail grows longer on the female. ");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Sydians reproduce sexually. The male penis, when exposed during arousal and copulation, is slightly larger than an average human’s (prior to genetic manipulation). First-hand accounts estimate lengths between nine to thirteen inches. Sydian penises are orange and covered in tiny brushes that flutter on contact to stimulate the partner. Ejaculate is silvery in color and may have a metallic component, though rudimentary testing establishes it as nontoxic to at least 85% of known sapient life forms.");
	outputCodex("\n\nThe female vagina appears as a simple slit or lipped opening that, according to report, blooms to ease penetration upon arousal, exposing its orange color. The upper edge of the vulva bears a single clitoris.");
	outputCodex("\n\nFemale sydians do not have an established breeding season and ovulate multiple times throughout the year. Roughly every 240 days and lasting up to 30 days, regardless of estrous phase, female sydians begin to crave the oxidizing enzyme of other sydians; male-female interactions during this state almost always result in intercourse. This heat-like state is indicated by the head hair becoming fiery orange and the affected female seeking out other sydians more diligently.");
	if (flags["SYDIAN QUEST STARTED"] != undefined) outputCodex(" The change appears related to the release of extra luteinizing hormone during a heavy ovulation; the hormone acts as a cupric receptor antagonist to the bacterial organelles, preventing uptake of inorganic copper. The metal settles in body tissues, including hair follicles, provoking a strong craving for additional sources of enzyme to chelate it. The receptive state can be triggered artificially by fertility treatments with LH components, and an active pregnancy suppresses or diminishes the condition."); // http://i.imgur.com/clsVxPF.jpg
	outputCodex(" While males prefer females in the receptive state, they are not above seducing non-receptive females or employing physical force to breed."); 
	outputCodex("\n\nDuring either consensual couplings or forced copulation, the male penetrates the female with his penis, ejaculates, and potentially impregnates the female, who ovulates two to three eggs in each cycle. Embryos attach via hemochorial placenta to the uterine wall. Gestation lasts six months, after which the female gives live birth.");
	if (flags["SYDIAN QUEST STARTED"] != undefined) outputCodex(" Sydian embryos are colonized by the mother’s enzyme-producing organelles late in the first trimester, and it is surmised that these organelles trigger accelerated growth and the development of chitin in place of keratinous vellus hair. Pure human and mixed-breed embryos develop indistinguishably from sydians in sydian wombs, excepting variations in head hair that do not appear in pure sydians. Sydian embryos grown in human wombs or <i>in vitro</i> resemble human fetuses.");
	outputCodex("\n\nSydian children are born with scaly, soft gray chitin that persists until puberty. Puberty occurs between the ages of eleven and thirteen, whereupon the chitin scales thicken into the sex-appropriate adult configuration, darken, and join together.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Behavior and Society"));
	outputCodex("Sydian society is patriarchal, with groups of ten to one hundred led by a dominant male. Larger size, thicker armor, and weaker corrosives cause male sydians to rely on and respect brute strength, giving rise to a culture underlaid with terrible violence. Most do not hesitate to resort to force to obtain food, breeding rights, and positions of power, resulting in a semi-stable group dynamic frequently interrupted by internal and external challenges. The leading sydian has absolute primacy in matters of females, food, and, when found in settlements, housing and governance. Some subject males willingly take positions of servitude, looking after children or performing manual labor; other males are forced into such positions. Younger sydians, especially powerful males, may eschew the group, striking out to join or attract a new clan. All males court mates from among the group’s females and establish relationships, though the leader’s ability to claim rights on any female at any time usually prevents monogamous coupling. Cuckolding is commonplace, especially toward subject males who have challenged the dominant male and lost. Vengeful leaders sometimes assign a rival as the personal slave of a favored female; while intended as humiliation, this has lead to the clandestine rape or seduction of the female in many observed cases.");
	outputCodex("\n\nFemale society is shaped by the parallel male society, with females favored by the dominant male assuming positions of dominance themselves. The highest-ranking female has access to the best housing and finest goods as well as many social liberties; such females can be distinguished by the breathtaking detail on their body paintings, made from the most colorful metal oxides and applied by subordinates. Correspondingly, lower females shoulder more of the work and employ lower-value materials for their coverings. Lower-caste females not currently pregnant are expected and often forced to aid in hunting and gathering, accomplishing the task with exceptional reflexes and higher chemical load. Dressing accessories, usually made from scavenged non-metallic materials, are used to highlight or conceal body features. Such possessions are one of the few items sydian females prize enough to hand down to their offspring, and being offered one as an outsider can be considered a sign of ultimate trust.");
	outputCodex("\n\nFemale sydians regard being without their body paint as an extremely vulnerable position, both mentally and physically, and such ‘naked’ females are scorned in public; this has been exploited to humiliate social adversaries and captives. Non-consensual couplings often involve intentional damage to the paint as a display of power by the transgressing male.");
	outputCodex("\n\nThough extremely unpopular among other Tarkus races and held in a literal stone age by their diets and tempers, observation suggests sydians are no less intelligent than the galactic average. Their culture is tribal and traditionalist, with little room for scholarship or what would be seen in higher societies as a progressive attitude toward sex and gender. Most sydians have accepted the limitations of their biology; some prominent individuals publically express quasi-neo-Luddite, anti-technology opinions. Conversely, a few have left their colonies, using specially-tailored clothing to study machinery in detail.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Sydians");
}
public function grayGooCodex():void
{
	clearOutputCodex();
	showBust("GRAY_GOO");
	outputCodex(header("Hazard: “Gray Goos”"));
	outputCodex("<b>Name (Singular):</b> Gray Goo");
	outputCodex("\n\n");
	outputCodex("The Gray Goo is an enemy seemingly unique to the junkyard wastelands of Tarkus, comprised of a network of small nanobots - mostly discarded microsurgeons and one-shot stimulants that haven’t been properly disposed of. Gray goos require natural lubricants like oil in order to move around effectively, and may target living organics as potential victims for sexual assault in an attempt to use orgasmic fluids as an emergency alternative.");
	outputCodex("\n\nThey’re smarter the more of them there are - blasting away at the gray goo with weapons will slowly corrupt their networked A.I. even if it only destroys a few bots. They are also susceptible to “sensory overload,” which may cause a temporary shutdown in their offensive programs, leaving them helpless but to beg for their necessary fluids. While the network has no specific shape, their drive for humanoid contact often leads them to adopt exaggerated humanoid figures, such as comically busty women or satyrian males in ill-conceived attempts to entice their prey. Recorded assaults generally involve a sexual harvesting, with the goos penetrating sexual orifices and molding themselves around phalluses and similar organs to stimulate orgasm.");
	outputCodex("\n\nWhile no fatalities have yet been reported due to Gray Goo attacks, U.G.C. Scout Authority recommends explorers on Tarkus remain well-hydrated in the event of attack.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Gray Goos");
}
public function lapinaraCodexEntry():void
{
	clearOutputCodex();
	if(flags["LAPLOVE"] == undefined)
	{
		showBust("LAPINARA_2","LAPINARA");
		outputCodex(header("Lapinara"));
		outputCodex("<i>Small, but not to be underestimated.</i>\n\n");
		outputCodex("<b>Name (Singular & Plural):</b> Lapinara");
		outputCodex("\n<b>Genders:</b> Male and hermaphrodite. No gender is more common than the other.");
		outputCodex("\n<b>Height:</b>.Typically 3-4 ft.");
		outputCodex("\n<b>Weight:</b> About as much as a 10 year old human.");
		outputCodex("\n<b>Hair:</b> Lapinara have normal, human-like hair on their heads, and a total lack of body hair otherwise.");
		outputCodex("\n<b>Eyes:</b> Lapinara eyes are cloudy black, and possess keen night vision.");
		outputCodex("\n<b>Ears:</b> Lapinara have rabbit-like ears, which can either come in perky or floppy varieties.");
		outputCodex("\n<b>Tails:</b> Long and slender, with small poofs of fur at the end.\n\n");

		outputCodex(blockHeader("Combat"));
		outputCodex("Lapinara are small and relatively defenseless on their own merits. All members of the species have curling, devilish horns which they can use to deliver surprisingly painful headbutts, but these are useful mostly for stunning a predator so that they can escape. Like leithans, lapinara come from a world full of much larger, more dangerous life forms, and they have evolved to be dexterous and difficult to find more than physically powerful.");
		outputCodex("\n\nLapinara off their homeworld typically become technical specialists, offsetting their stature with powerful energy weapons, drones, and heavy shields.\n\n");
		outputCodex(blockHeader("Gender Differences"));
		outputCodex("Lapinara have two natural genders: males and hermaphrodites. Male lapinara are much like males of other species, though they tend to be the same size as hermaphrodites and are equally as feminine in form. Hermaphrodites have small breasts that do not naturally lactate, and like males, have small human-shaped phalluses; unlike males, their testicles are by default small and wrinkled sacks containing their ovaries. These swell with eggs when the hermaphrodite is impregnated via vaginal sex, and their phallus acts as an ovipositor.");
		outputCodex("\n\nWhen not pregnant, a hermaphrodite lapinara’s phallus acts the same way a male’s does, though it is sterile. Many uplifted lapinara choose to have this rectified through modern gene mods.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Environs Typically Inhabited"));
		outputCodex("Lapinara come from the large, heavily forested planet of T’klar, located in Rushspace 11. Their homeworld is roughly half again the size of Earth, and is considered a <i>“primordial”</i> world, with a dense atmosphere and extremely prolific foliage across all land masses. T’klar is inhabited by many strains of megafauna, with many species of titanic lizards ranging from dinosaur-like to draconic, which has caused the only sapient species on the planet, the lapinara, to evolve to be small and evasive. Upliftment has been a difficult process due to the scattered nature of the races, effectively reduced to a speed of one family or clan at a time. Uplifted lapinara are mostly concentrated on the space station and terraformed moon over their homeworld, but have slowly begun to stretch their legs across the rest of the galaxy. Especially with Rush 14 now in effect, many uplifted lapinara are finally venturing out to claim their fortunes.\n\n");
		outputCodex(blockHeader("Reproduction"));
		outputCodex("Lapinara have a relatively unique brand of reproduction that has only become more interesting since their upliftment during the 11th Planet Rush. Normally, a hermaphrodite lapinara will be inseminated by a partner, which causes her otherwise empty <i>“testicles”</i> which contain their ovaries to produce a load of fertilized eggs. This causes the scrotum to swell considerably, from an otherwise flaccid sack to taut over a pair of baseball-sized eggs. She must then oviposit these eggs into another partner to complete the reproductive cycle - among lapinara, the host for the parasitic young is usually their own father, or a close friend or family member of the mother.");
		outputCodex("\n\nA lapinara’s eggs require roughly three months after implantation to be ready to lay, and typically come in pairs or in fours.");
		outputCodex("\n\nThe most unique facet of lapinara reproduction, however, comes when they mate with non-lapinara. Eggs implanted into members of other species show their parasitic nature by hybridizing with the host’s DNA, imparting traits of the host onto the young. For example, a lapinara egg implanted into an ausar might gain furry limbs, a knotted phallus, and canid eyes, while one implanted into a leithan might gain chitin plates and even extra limbs. This hybridization can even cause new and unique sexual characteristics to appear, such as fully female lapinara or genetic males with breasts. No two alien-hybrid lapinara are necessarily alike, even from the same clutch.\n\n");
		outputCodex(blockHeader("Society"));
		outputCodex("Natural lapinara society is primarily made up of small clans and family units, trying to survive the depredations of their dangerous homeworld and its many species of megafauna. Some small permanent cities exist on the southern continent, where the forests are less dense and mountains provide a natural defense against predators, but otherwise the species has little in the way of a unified culture or society.\n\n");
		outputCodex(blockHeader("Relationships"));
		outputCodex("Lapinara are an outgoing and gregarious race, though naturally timid in times of danger. They have a strong instinct for cooperation, a useful trait given the dangers of their homeworld. First contact with the Lapinara came from a Gryvain Heartland Republic scientific vessel looking for potential colony worlds, and while the dense atmosphere of T’klar is enough to enable natural gryvain flight, it was decided to uplift the natives rather than attempt to dispatch the local megafauna. On a technical level, T’klar is now part of the Republic (itself part of the Confederacy), though this is largely a formality as the gryvain of the system have either settled on the planet’s largest moon or remain in the station overhead where they continue to uplift small groups of lapinara.\n\n");
		outputCodex(blockHeader("Technology"));
		outputCodex("Lapinara have no technology of their own beyond flint tools and spears, but over the last few hundred years of upliftment have taken relatively well to Confederate tech.");
	}
	else
	{
		showBust("LAPINARA_2","LAPINARA");
		outputCodex(header("Lapinara"));
		outputCodex("<i>Be wary on frontier worlds of the parasitic laquines.</i>\n\n");
		outputCodex("<b>Name (Singular & Plural):</b> Lapinara");
		outputCodex("\n<b>Sexes:</b> Female (parasitic variant), Female (non-parasitic variant), Male, Herm, and Genderless.");
		outputCodex("\n<b>Height:</b> Anywhere between 3 and 4 feet for all genders.");
		outputCodex("\n<b>Weight:</b> Anywhere between 40 and 85 pounds for all genders.");
		outputCodex("\n<b>Hair & Fur:</b> Hair is fast-growing, and typically very soft and curly. The hair and fur of parasitic females is typically white, but can sometimes be silver or gray. All lapinara have a thin layer of fur covering the entirety of their bodies. The hair is longer and curlier on the lower legs and forearms, resembling warmers. They have a long, puffy tuft of fuzz at the end of their long, whip-like tails.");
		outputCodex("\n<b>Eyes:</b> Large and rabbit-like; parasitic females always have glassy, cloudy, gray eyes. They resemble crystal balls.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Features"));
		outputCodex("The Lapinara are a sapient, rabbit-like race on digitigrade legs. Their faces are mostly humanesque, possessing tiny, button-like, constantly wiggling noses, as well as long whiskers. Their ears are large and rabbit-like. Given their long incisors and molars built for tough grinding, they have a very powerful, painful bite. A pair of horns, similar to that of the pronghorn grow from the foreheads of all genders. Parasitic females, non-parasitic females, and fem-herms have small, perky breasts, never more than A-cup. Parasitic gender skin comes in varying shades of gray. The skin tone of the other genders is determined by their host parent.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Environs Typically Inhabited"));
		outputCodex("The Lapinara are a highly adaptive species. Not possessing a home planet of their own, they are a nomadic kind. Many of the parasitic variety, however, have taken up residence on Tarkus, taking advantage of the local sex-loving gabilani and raskvel, as well as any oblivious visitors.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Reproduction"));
		outputCodex("Parasitic females are nothing short of pests. They are sex machines, completely obsessed with implanting their eggs into an unfortunate host. While appearing to have typical male genitalia, they are actually anything but. Their “penis” is actually an ovipositor, and their “testicles” instead hold their ovaries. These faux testicles swell up considerably when they have eggs ready. The presence of eggs causes the parasitic lapinara to enter a rut-like state that doesn’t end until they are rid of them. The pre-cum of the parasitic lapinara works as an anesthetic, preventing egg implantation from hurting the host.");
		outputCodex("\n\nThe eggs are soft-shelled, and can only continue development if they’re implanted via a host organism’s anus or vagina, where they absorb the second half of the required genetic material. Labor is initiated when the soft outer shell dissolves. This produces non-parasitic offspring that are always born in pairs, and always the same gender as the host parent. Hair, eye, and skin color is also determined by the host parent. Males and herms tend to inherit penis type from their host parent, and females and herms tend to inherit vagina type from their host parent.");
		outputCodex("\n\nMore parasitic females are produced when one parasitic female implants her eggs in another parasitic female. The non-parasitic genders reproduce just like any human, albeit with significantly shorter pregnancies, never longer than three months, but never shorter than two.");
		outputCodex("\n\n");
		outputCodex(blockHeader("History"));
		outputCodex("The epidemic of parasitic lapinara breeding has led to the foundation of the Lapinara Sanctuary, a charity organization that cares for orphan lapinara, offers adoption, and provides oophorectomies (ovary removal) for any consenting parasitic lapinara, essentially neutering them. The removed ovaries are sold to TamaniCorp for research for the advancement of fertility-enhancing products.");
		outputCodex("\n\nIt is currently under fierce debate whether or not unconsenting parasitic oophorectomies are ethical and should be allowed.");
	}
	outputCodex("\n\n");
	CodexManager.viewedEntry("Lapinara");
}


/* Myrellion */

public function goldMyrmedionCodexEntry():void
{
	clearOutputCodex();
	showBust("LYRALLA");
	outputCodex(header("Gold Myr"));
	outputCodex("<b>Name (Singular):</b> Gold Myrmedion");
	outputCodex("\n<b>Sexes:</b> Females and males in a 9 to 1 ratio.");
	outputCodex("\n<b>Height:</b> Female Myr are around the same height as terran females, while males tend towards smallness and slightness, often averaging heights around 5\' 2\" - just under 1.6 meters.");
	outputCodex("\n<b>Weight:</b> Heavy for their height thanks to numerous chitin plates and denser than average muscles and bones.");
	outputCodex("\n<b>Arms:</b> Four narrow but strong limbs ending with three fingers and a single thumb.");
	outputCodex("\n<b>Abdomens:</b> All gold myr have insectile abdomens, used for storing nutrition in lean times as well as reproduction in female queens.");
	outputCodex("\n<b>Hair:</b> Blacks, oranges, and strawberry-blonde are all common.");
	outputCodex("\n<b>Eyes:</b> Myr eyes are solid black (or more rarely gray) compound eyes. They are noted to have relatively poor eyesight, and blindness and various eye problems are unusually common.");
	outputCodex("\n<b>Ears:</b> Myr have pointed ears, called “elfin” by first contact explorers.");
	outputCodex("\n<b>Antennae:</b> A pair of insect-like antennae grow from every myr’s forehead. These highly sensitive organs are extremely sensitive to airborne vibrations and chemicals, supplementing already sensitive ears while pulling double duty as an olfactory organ.");
	outputCodex("\n<b>Wings:</b> Females are wingless. Males have vestigial wings too small to lift their forms.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance and Honeypot Myr"));
	outputCodex("Both subspecies of Myr appear bug-like in a variety of ways, but the gold especially so. Their four arms and a chitinous, rear-mounted abdomen leave them looking like walking, talking ants. That comparison is even more apt in light of a startling mutation that is only present among the gold subspecies: the honeypot gene.");
	outputCodex("\n\nThe name is woefully incorrect, penned by explorers with more greed than education, but it has stuck all the same. The honeypot ‘gene’ is in fact a complicated evolutionary marvel that allows the gold myr to store excess nutrients inside their abdomens or breasts for times of scarcity - or to later share with their hungrier countrymen. The organ used for storage falls largely along gender lines. Males use their abdomen and females their breasts. Some rare females use both, and are even able to shunt mass between the two.");
	outputCodex("\n\nWith sufficient nutrition they can become so swollen with their nectar they practically glow amber. Acting as living larders for the hives, these myr’s’ organs swell to enormous sizes, often debilitating them due to sheer weight: so immobile, they act almost like diners in the hive cities, setting up on street corners and in specialized restaurants to provide their nectar to the populace “straight from the tap.”");
	outputCodex("\n\nInitial examinations of myr nectar report a thinner consistency than honey with a taste somewhere closer to maple syrup. Lab tests have revealed numerous mood boosting compounds in trace amounts. Large scale consumption for non-myr is not recommended by U.G.C. survey teams.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Dimorphism"));
	outputCodex("A lucky few gold myr are “queens,” winged females able to reproduce without medical intervention. Usually serviced by several male drones, queens have exceptionally quick reproductive cycles, giving birth to large clutches of eggs fertilized by several different fathers. Queens can live for centuries, and birth hundreds if not thousands of young gold myr over their life spans. As the name suggests, queens are highly revered by other golds, some even revered as goddesses.");
	outputCodex("\n\nUntil her first pregnancy, a queen is indistinguishable from any other infertile female, but once she gestates her first clutch of eggs, she will undergo a second puberty, metamorphosing to have a second set of nutrient-lactating breasts, a larger body, and a hugely swollen abdomen. Her abdomen will slowly grow over time, gradually increasing her ability to reproduce. Queens tower over other myr, but their reproductive swelling prevents them from being able to properly defend themselves in a conflict.");
	outputCodex("\n\nMales are shorter lived and winged, possessing considerably less strength than the average female due to his lighter frame. Affectionately called “drones” by their female counterparts, most males live in relative luxury. Those not serving a queen are so prized that they can live a life of ease. Male myr are characterized by their slight, light bodies and large genitalia, with disproportionately large phalluses and testes that can swell to produce additional semen when frequently emptied, even growing large enough to drag on the ground.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Gold myr are not known for their violent inclinations, but their resilient forms, built-in body armor, and surprising strength make them more than capable in a melee confrontation. Poor eyesight at long range diminishes their usefulness in modern, sharpshooter-heavy confrontations. The U.G.C. would have little use for them in an offensive capacity, though their multiple arms could allow them to become very useful as field medics without any cybernetic augmentation.");
	outputCodex("\n\nIn the context of their civil war, the golds are biologically matched by their red foes; both share poor vision and body armor. The reds have a debilitating saliva, but there is little room for biting in a conflict dominated by melee weaponry and small arms, negating that small advantage. The real difference in fighting forces is in training. The Scarlet Federation’s troops are hardened soldiers. The gold myr are relative rookies to combat. Perhaps the only reasons they’ve held out this long have been their primitive technological know-how, larger population, and chemical weapons.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("Gold Myr are warm-blooded and can survive in a variety of temperatures from just above freezing to 43 degrees Celsius (110 degrees F). Their home planet, Myrellion, is largely an inhospitable desert, leading them to survive in below-ground settlements. Over the centuries, small cities have become incredible, subterranean mega-cities, but the war has reduced many to little more than caved-in rubble.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("Golds typically value individual freedom and creativity in spite of their matriarchal society. Every single living gold myr is a direct descendant of a myr queen, raised in familial schools called thollums. Outside of the recently introduced draft, they are free to discover and seek an individual calling. One function of the thollums is to allow them free training in any actively practiced discipline.");
	outputCodex("\n\nThe Gilden Republic (closest approximate translation), is ruled by the Council of Queens, a governmental body made up of every myr capable of reproduction. Each queen’s power is relative to the number of her offspring, with older, more fertile queens carrying significantly more weight than their younger, inexperienced peers. This bizarre, motherhood based political system seems to work well for the gold myr.");
	outputCodex("\n\nU.G.C. researchers have seen few if any signs of dissent amongst the tawny ant-people. Current theories for this vary between biological predisposition to the success of the Gilden Republic at providing for its people. Many of the Council’s laws are analogous to those of 20th century earth’s nordic model - a kind of highly regulated “cuddly capitalism”.");
	outputCodex("\n\nThat isn’t to say that gold myr live a life without strife. The seemingly endless war with the reds has strained their economy to the breaking point. Rising unemployment has brought with it a surge in criminal activity and lawlessness. Usage of red myr saliva as an illicit drug/aphrodisiac is almost an epidemic all its own. Had a ceasefire not been reached, it is likely the gold myr way of life would have been entirely annihilated within the span of a year.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Relationships"));
	outputCodex("Due to the overwhelmingly female-heavy population, males are in high demand: most normal females are unlikely to ever see a male in person, much less be able to copulate with him. As such, lesbian relationships are extremely common and widely accepted. Indeed, a marriage between male and female is quite literally unheard of in myr society; most males are shared between groups of bisexual females.");
	outputCodex("\n\nFemale-female marriages, on the other hand, are a little more common, though monogamy is a relatively new concept for the myr, many of whom still fondly remember a more tribal past with great orgies centered around their precious breeders.");
	outputCodex("\n\nSexuality among female myr is quite open, and most take several casual lovers. Gold myr still practice regular public orgies as part of fertility rites led by their queens and drones, though they also have a higher rate of monogamous marriage than reds do. Golds are quite open with their sex, even flaunting it in public: gold myr dress is highly revealing, and there are no laws or inhibitions about public intercourse.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("Myr technology is nearly analogous with early 20th century earth technology, with basic coal-powered electricity and gas-operated monorails having been recently installed in some of the larger hive cities. Highly primitive computers have just entered service before First Contact, using punch-tape processors and tubes. Despite their largely underground existence, the myr do have aircraft, though most have been re-purposed into transports and military craft due to the war (indeed, the current Joint Ausar Fleet base in Gildenmere, the Gold Myr capital, is a repurposed airfield).");
	outputCodex("\n\nJust before First Contact, the war between red and gold myr took an unexpectedly lethal turn due to the gold myr introducing poison gasses into the conflict, an incredibly effective deterrent against the unchecked red myr advance into their territory, followed by the red myr threatening to unleash a primitive atomic weapon the day before First Contact. Due to the appearance of the ausar expedition to Myrellion, thermonuclear war has been temporarily averted, which has since given the gold myr the opportunity to fashion their own WMDs in response.");
	outputCodex("\n\nThe presence of the alien expedition is assumed to be the only preventative factor keeping the world war from escalating to a nuclear inferno. Due to the surprisingly advanced nature of the race, and their “honeypot” biology (which is seen as highly promising by Xenogen), U.G.C. diplomats have arrived on the planet and are working with both hierarchies to achieve a cease fire in the seven years’ war.");
	outputCodex("\n\n");
	//CodexManager.unlockEntry("Gilden Republic");
	CodexManager.viewedEntry("Gold Myr");
}
public function redMyrmedionCodexEntry():void
{
	clearOutputCodex();
	showBust("NEHZARA"); // aha this is going to bite me in the ass when we end up adding a race called NONE or some shit!
	outputCodex(header("Red Myr"));
	outputCodex("<b>Name (Singular):</b> Red Myrmedion");
	outputCodex("\n<b>Sexes:</b> Females and males in a 9 to 1 ratio.");
	outputCodex("\n<b>Height:</b> Female red myr are around the same height as terran females, while males tend towards smallness and slightness, with an average height around 5\' 2\" - just under 1.6 meters.");
	outputCodex("\n<b>Weight:</b> Quite heavy for their height thanks to numerous chitin plates in addition to muscles and bones that are far denser than the humanoid average.");
	outputCodex("\n<b>Limbs:</b> Two humanoid arms ending with three fingers and a single thumb, and two legs that end in chitinous “boots” which can end anywhere between mid-calf and mid-thigh.");
	outputCodex("\n<b>Abdomens:</b> Red myr have evolved away from insectile abdomens. Some members of the species have small, vestigial abdomens, but most have shed them completely.");
	outputCodex("\n<b>Hair:</b> Blacks, oranges, and reds are all common.");
	outputCodex("\n<b>Skin:</b> A variety of skin tones can be found among red myr, with creamy pale complexions being common in certain regions and reddish-tan ones elsewhere.");
	outputCodex("\n<b>Eyes:</b> Myr eyes are solid black (or more rarely gray) compound eyes. They are noted to have relatively poor eyesight. Blindness and various eye problems are unusually common.");
	outputCodex("\n<b>Ears:</b> Myr have pointed ears, called “elfin” by first contact explorers.");
	outputCodex("\n<b>Antennae:</b> A pair of insect-like antennae grow from every myr’s forehead, which pick up airborne vibrations and chemicals to supplement already keen ears while pulling double duty as an olfactory organ. The antennae are exceedingly sensitive to touch, and a non-verbal language seems to have developed based on subtle movements and rubbing the antennae together.");
	outputCodex("\n<b>Wings:</b> Females are wingless. Males have vestigial wings too small to lift their forms.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Like their gold cousins, the red myr are insectile in nature and appearance, though they are much more human-like than the golds: most reds lack insectile abdomens, they possess only two arms, and they lack the dramatic distinction between “queens” and common, infertile members of the species. Red and gold myr even have their genitalia located in different places, with reds’ located between the legs.");
	outputCodex("\n\nThe most obvious physical trait of red myr is their natural chitin armor, which is thicker than that of the gold myr and considerably heavier, affording them superior protection. The covering of chitin is not consistent between all members of the species, with some limiting their plating to the limbs, while others have elaborate corset-like plates around the chest and back. The chitin can vary in color between individuals, with the two extremes being bright scarlet and a dullish red that borders on black.");
	outputCodex("\n\nThe reasons for the extreme divergence in this species is currently unknown, though speculation points towards extensive interbreeding with another high-population native race, the nyrea, and the great distance between gold and red heartlands. Xenobiologists and anthropologists are interested in finding the progenitor race that originated the different species of myr, though both red and gold seem uninterested in researching their shared past and have stonewalled scientific inquiries.");
	outputCodex("\n\nA lesser known difference between the red myr and their gold counterparts is their sharp canine teeth or fangs. These fangs assist in delivering the species distinctive drug-like venom (See Red Myr Venom).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Smooth-Skins"));
	outputCodex("A small number of red myr are born without natural chitinous armor. These individuals are known as ‘smooth-skins’ or ‘softies’.");
	outputCodex("\n\nOther than the lack of organic covering, smooth-skins are no different from other red myr. However, due to the belief these softer-skinned individuals are more physically fragile compared to a chitin-covered member of the species, very few of them were allowed to serve in front-line military service prior to conscription.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Dimorphism & Reproduction"));
	outputCodex("Male and female red myr have noticeable gender dimorphism, again tracing back to an insectile heritage. The vast majority of red myr are wingless females. Most are infertile, and incapable of reproduction. Red myr do, however, have a significantly higher percentage of fertile females compared to golds, as they lack the massively productive queens to ensure the continuation of their species. Population statistics declassified by Federation High Command indicate that somewhere between thirty and forty-five percent of red myr females are fertile. Still, the numerical advantage was clearly and overwhelmingly with the gold myr before the start of the war. Red myr females lay single eggs or small clutches of no more than four. After conception, their stomachs balloon out at a rapid rate and after three months they lay their eggs. For a further month they protect their clutch until hatching occurs.");
	outputCodex("\n\nWhile they do not possess the “honeypot” gene of the gold myr, most female red myr are capable of limited lactation if well fed, storing excess calories in the breasts until needed. Compared to gold myr, reds have smaller bust sizes on average, usually between a C and E cup, though this size can vary wildly during a single myr’s lifetime depending on her nutritional intake.");
	outputCodex("\n\nUnlike with the gold myr, nursing and lactation is considered highly private and personal between red myr, and to do so in public is highly frowned upon. Generally speaking, nursing is reserved for children and very close lovers, and is a sign of the highest affection between two red myr.");
	outputCodex("\n\nMales are shorter-lived and winged, possessing considerably less strength than the average female due to his lighter frame. Affectionately called “drones” by their female counterparts, most males exist in red myr society to do very little other than breed: they are dearly prized by their females, and were often fought over during ancient times before intricate breeding schedules were established some hundred years before First Contact.");
	outputCodex("\n\nMale myr are characterized by their slight, lithe bodies and massive genetalia, with disproportionately large phalli and semen-swollen testes that often drag on the ground when not regularly used -- though due to their high demand, this is rarely an issue. Due to the extreme conditions imposed by the war, even drones were pressed into service by the Scarlet Federation, though they were legally barred from combat duties. Most served as nurses, administrators, and factory workers, freeing more females up to fight.");
	outputCodex("\n\nThese newfound demands of labor have, reportedly, began an accelerated male rights movement, similar in nature to the women’s rights movement of 20th century Earth. Little information about the movement is available, however, due to the lack of contact with male red myr: few have been available for interview or commentary.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Myr are notably covered in a partial “suit” of chitin plates which protect the legs, arms, and in some specimens, parts of the torso. This natural armor, combined with an average strength considerably higher than a human’s and poor eyesight, has meant that melee combat still reigns supreme among the red myr, with axes and hammers being about as common in the Federation military as rifles.");
	outputCodex("\n\nUnlike the gold myr, who had a very small standing military and little combat experience before the start of the global conflict, the Scarlet Federation began the war with highly trained, veteran soldiers -- most of whom had experience fighting large city-states of nyrea in addition to being trained by veterans of the unification conflicts that preceded the Federation’s formation. Some U.G.C. sources have speculated that the Federation may have been in conflict with other, as yet unknown civilizations in the northern and western reaches of the planet for generations.");
	outputCodex("\n\nMilitary tactics and technology among the red myr are significantly more advanced than those of the golds, and for the most part are reliant upon massed infantry charges supported by heavy artillery when fighting above ground, or on chemical weapons and phalanx-style shield walls when underground. Red myr weapons technology primarily employs smokeless gunpowder in revolvers, lever- and bolt-action rifles, and primitive air-cooled automatic weapons.");
	outputCodex("\n\nSupplementing their hand-to-hand abilities, red myr females are also known to use their venomous saliva and fangs in combat. (See Red Myr Venom).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Red Myr Venom"));
	outputCodex("All red myr have venomous saliva which, on contact, causes a mild paralysis in the victim. The venom is known to cause a “red heat” sensation, inspiring rampant lust in the victim and usually putting him utterly at the mercy of the red myr in question.");
	outputCodex("\n\nThe red myr can use their fangs to quickly and powerfully deliver the venom into the subject’s bloodstream. The bite itself is typically painless, as the red heat numbs the victim to any negative sensation. Biting is not necessary to deliver the venom - a simple lick will do - but it is the quickest and most potent method.");
	outputCodex("\n\nUnlike many venom-delivering species, the red myr are not immune to each other’s venom, though they are immune to their own personal strain. Members of the species can internally regulate the toxicity of their venom to deliver miniscule or large doses. However, they cannot eliminate it entirely from their saliva.");
	outputCodex("\n\nAnother property of red myr venom is its effect of ‘reverse tolerance’ on the immune system. Administered over a long period, it reduces the body’s ability to defend against it. The level of myr venom needed to create high levels of euphoria is far less in the long-term exposed.");
	outputCodex("\n\nInvestigations have also revealed myr venom is an addictive substance, of which the species is not immune. Social scientists believe this may be the cause of the overly chaste behavior of red myr compared to their gold counterparts - or at least until recent history - particularly in regards to kissing. While low doses do not have any negative effects on their own, over a longer period of time the chances of addiction steadily increase.");
	outputCodex("\n\nIngesting red myr venom is naturally rewarding and reinforcing. Its only known detrimental effect is the state of physical and psychological addiction it creates in the addicted. Unlike many societies that shy away from addiction, red myr generally believe this is a positive side effect, ensuring fidelity, interdependence and heightened intimacy between them and their chosen partner.");
	outputCodex("\n\nThe red myr do possess a readily available neutralizing agent to their species’ own venom. There is a small demographic who take this anti-venom as a matter of course for personal or ideological reasons.");
	outputCodex("\n\nAmong gold myr, the venom of a red is considered a strong but illicit aphrodisiac, taken in small quantities to induce a lethargic, horny state.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("Myrellion is the sole planet inhabited by the myr race, and it is fairly Earth-like in most respects. The planet has vast desert regions across much of its land masses, with some forested regions in the far northern and southern reaches. There are few if any snowy areas on the planet beyond the poles. Hot and dry, Myrellion is generally inhospitable above ground. The myr, however, are largely subterranean, and have over the years drilled out vast complexes of underground cities that rival the splendor of even the mega-cities of Terra. Due to the world war currently under way, many once-prosperous cities on both inhabited continents have been bombed out and abandoned, straining the population of the remaining cities as they accommodate refugees.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Society"));
	outputCodex("The Scarlet Federation touts a dramatically different social doctrine than that of the Gilden Republic. While the golds value freedom and creativity, the reds value discipline, hard work, and collective effort. The concept of free will is understood and appreciated by the red myr; it is believed by most to be second-best to the freedom granted through self-mastery. Though not all red myr follow this doctrine, the end result is a society that is truly and monumentally well ordered: hierarchies are well-established and held up for public scrutiny, unemployment is virtually non-existent, and civil disorder is next to unheard of, even during the darkest hours of the war.");
	outputCodex("\n\nThe Scarlet Federation is primarily a military organization, and the red myr are effectively ruled by a junta of generals collectively called the High Command who took power after several unification conflicts brought the scattered red myr city-states under collective control. Military service is considered a sacred civil duty, and a military career is the most effective means for political advancement. Before the war, the Federation military was volunteer-only, though the press of seven years of war has necessitated a draft, much as it has among the gold myr.");
	outputCodex("\n\nRed myr society is highly nationalistic and collectivist, promoting cooperation and national unity. Social power is held almost exclusively by the military, veterans, and the Federation High Command. Most national industries are government-supported private corporations, while citizens are free to create smaller private businesses.");
	outputCodex("\n\nWhile the society endorsed by the Gilden Republic was on the verge of collapse under the strain the war, Federation society thrived thanks to vast acquisitions of land and resources heralded by their military victories. However, the strain of the war was felt heavily on the red myr population, which began the conflict significantly smaller than that of the gold, and has dwindled dangerously due to losses during the campaign. Had the infantry invasion of Gildenmere been launched, U.G.C. scientists suggest incurred casualties could have rendered the red myr population unviable -- too small to avoid genetic damage due to inbreeding and leaving them highly vulnerable to disease or mutation.");
	outputCodex("\n\nRelationships: Due to the overwhelmingly female-heavy population, males are in high demand: most infertile females are unlikely to ever see a male in person, much less be able to copulate with him. As such, lesbian relationships are extremely common and widely accepted. Indeed, a marriage between male and female is quite literally unheard of in myr society; most males are shared between groups of bisexual females.");
	outputCodex("\n\nRed myr sexual norms are difficult for some outsiders to comprehend, even to natives of Myrellion. Most red myr are open about their sexuality, and have little inhibition from doting on lovers and public displays of affection. However, unlike the gold myr, reds are highly averse to public nudity and blatant sex acts. Social norms dictate that sex is to be done in private seclusion with trusted lovers: there is no shame in the act, but rather it is deemed too personal and emotional to share with strangers.");
	outputCodex("\n\nThe advent of casual sex is only a very recent phenomenon spurred on by the war. While monogamy is uncommon among the myr, relationships were expected to be devoted and deep. This attitude changed during the war, thanks to the concept of “trench wives” -- females that soldiers have either captured or brought from home who serve their needs between battles. These relationships are based on lust and physical pleasure, and have (some say alarmingly) disrupted the polyamorous partnerships more common in years past. The trench wife phenomenon is seen as a necessary evil by most red officers, as the Federation simply does not have the resources to deal with the sheer number of prisoners taken during the war. Allowing soldiers to keep their own captives, and insisting that they care for them, is seen as more humanitarian than prison camps and puts the brunt of the administrative needs (food, shelter, etc.) on the shoulders of individual unit commanders.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("Myr technology is nearly analogous with early 20th century Earth, with electric engines and lights being common everywhere but the most remote villages and outposts. Federation military tech was relatively advanced compared to the golds’ at the start of the war, though the Gilden Republic has made great strides to close the gap. The machine gun had only recently come into service at the start of the war, leading to the massive death tolls during the conflict.");
	outputCodex("\n\nLike their gold counterparts, the red myr possess primitive aircraft, though they are largely forced to use captured gold airfields due to the short range of their craft and the remoteness of their original territory. That said, the Federation is perhaps more reliant on aircraft than the golds, and they make use of heavy air transports to move supplies and soldiers throughout the occupied continent rather than using traditional tunnel crawlers or ground craft.");
	outputCodex("\n\nJust before First Contact, the war between red and gold myr took an unexpectedly lethal turn due to the gold myr introducing poison gases into the conflict, an incredibly effective deterrent against the unchecked red myr advance into their territory, followed by the red myr threatening to unleash a primitive atomic weapon the day before First Contact. Due to the appearance of the ausar expedition to Myrellion, thermonuclear war has been temporarily averted, which has since given the gold myr the opportunity to fashion their own WMDs in response.");
	outputCodex("\n\nThe presence of the alien expedition is assumed to be the only preventative factor keeping the world war from escalating to a nuclear inferno. This has caused some consternation on the part of the Federation, who saw themselves as on the brink of a final victory, and now are being largely ignored by the off-worlders in favor of the more alluring gold myr. Xenogen Biotech has, however, made preliminary inquiries into the reds’ lust venom while other parties have expressed interest in exporting red myr labor (either reds themselves or selections of their many, many gold myr prisoners of war).");
	outputCodex("\n\n");
	CodexManager.unlockEntry("Scarlet Federation");
	CodexManager.viewedEntry("Red Myr");
}
public function cockvinesCodexEntry():void
{
	clearOutputCodex();
	showBust("ADULTCOCKVINE");
	outputCodex(header("Cockvine"));
	outputCodex("<b>Name (Singular & Plural):</b> Cockvine");
	outputCodex("\n\n");
	outputCodex(blockHeader("Overview"));
	outputCodex("Hydrus Constuprula, better known by its colloquial name cockvine, is a mobile, parasitic, invasive, troglophile plant species native to Myrellion. It is endemic to large parts of the Myrellion underground, a status acknowledged by both sides of the on-going Myr conflict to be a result of its historical use as a biological weapon. A Class A non-sentient species, it is illegal for it to be transported or for individuals seeded by it to travel outside Myrellion.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Growth Cycles and Physiology"));
	outputCodex("At “birth” cockvine seedlings resemble short, thick, green snakes with a grasping, anemone-like hand at one end and a slit, blunt purple head of variable shape at the other. The hand end is remarkable for its stem cell-like versatility – whilst it functions primarily as a catcher and mouth for the cockvine seedling, it not only acts as the beginning of its root system once it enters adulthood but it can also be used to actively splice itself not just to other cockvines but to animal life as well.");
	outputCodex("\n\nAside from the rings of flexible, fibrous muscle that they retain throughout their lives, cockvines are seeded with a huge reserve of fructose-based energy which allows them to move swiftly away from their place of origin. During this stage of their life cockvines show a snake-like aversion to large sapient creatures, actively avoiding them except in certain circumstances (see parasitism below). They do however have a ravenous attitude towards life of a similar size to it and during this, their most mobile period of existence, hunt and eat as much food as they can in preparation for the dramatic growth stages ahead. Cockvine seedlings are omnivorous and will consume almost anything, which is cited as a key reason for its over-reaching success on Myrellion.");
	outputCodex("\n\nLike most herbaceous life cockvines react to light and moisture and, once an infant cockvine has consumed enough, it will seek out a dark, moist place to germinate. They are particularly fond of deep, narrow crevices, as these are ideal for the purposes of their adult selves. Here the cockvine buries its hand end into the earth and proceeds to branch out a considerable root system. The stem of the plant thickens and then sprouts thick vines, similar in appearance to its infant state but far longer and stronger. Large, successfully rooted cockvines have the ability to attract less fortunate infants; these may choose to graft themselves symbiotically to it in order to provide one more tentacle to the alpha cockvine, thus increasing the overall chances of the creature successfully snagging prey. An adult cockvine can have as many as twenty appendages, each up to thirteen feet in length.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Predatory Habits and Breeding"));
	outputCodex("When ready to feed or mate adult cockvines extend tentacles out of their burrow, laying them still on the ground, relying on the dark of their chosen habitat and the swiftness of their grab to surprise prey. Cockvines are sensitive to vibration and express two different behaviors based on the size of an animal approaching its burrow. Smaller creatures – observational data suggests the upper bound for this category is Terran dog-sized animals - are swept straight into the crevice and, if they cannot escape in time, are slid into a pit of digestive juices below the main stem.");
	outputCodex("\n\nBigger creatures are regarded as potential mates. Once a creature in this category has been induced into its burrow a cockvine will attempt to immobilize it with its tentacles. Cockvine tentacles sweat an oily substance and seep a pungent herbal semen from their tips in the presence of potential mates; this has a muscle-relaxing, aphrodisiac effect which in the close confines of a cockvine burrow is described as overpowering. Once a victim has been incapacitated the cockvine mates with it vigorously in every way it possibly can. Although they are only capable of inseminating functioning wombs, cockvines cannot discriminate between different entrances on a mate and simply seek to seed every hole as thoroughly as they can. Once it has finished, the cockvine carefully discharges the victim from its burrow and then retracts itself.");
	outputCodex("\n\nAfter insemination en utero cockvines only take around a week to come to term; litter sizes vary between 8 and 20. In itself the task of birthing them is described as extremely pleasurable, however mating with and bearing cockvines has been known to cause several side effects, including increased vaginal and anal wetness as well as outright contraction of cockvine parasitism.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Parasitism"));
	outputCodex("Because of the specificity of location the seedlings need in order to germinate it is not at all possible for every individual cockvine to find an ideal place or stockpile enough energy to enter adulthood. The species has found a striking way of surmounting this difficulty, thanks to its hand end’s ability to bind itself not just to adult cockvines but to other creatures as well.");
	outputCodex("\n\nThe process occurs when a cockvine seedling has gone beyond the stage where it can successfully root itself, or otherwise senses it is better off attempting to graft itself to a more successful life-form. Cockvines acting in this way usually seek out alphas of their species to bind themselves to, however they are perfectly capable of achieving union with any creature both large enough to support them and either willing to do so or too slow to prevent it. In either case the grafted cockvine couples with the host’s nervous system and surrenders most of its own control to the host, with the larger creature able to feel and use the parasite as their own appendage. The cockvine does however retain its semen sacs and instinct to breed, and is occasionally able to overwhelm its host with a desire to use it, allowing it the opportunity to propagate its seed over a far wider range than it otherwise could. Cockvine parasitism has also been reported as a consequence of mating with an adult specimen.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Hydrus Constuprula originates from the small continent of Irskand, and was discovered and classified by the former Red Myr nation of Harokees circa three hundred years ago. A bleak and inhospitable place even by Myrellion standards, the plant form had evolved to suit Irskand and was not particularly widespread. Harokees was at this time locked in a violent dispute with the Gold Myr over the relatively untouched landmass of Undandin; seeing its potential to disrupt Gold attempts to cultivate the Undandin fungus fields, the Red military approved cockvine’s covert release into Gold territory. The species duly exploded in population, spreading well beyond Undandin to infect virtually every corner of the Myrellion underground, despite a number of poorly coordinated joint efforts on the part of the Myr to wipe it out.");
	outputCodex("\n\nThe internecine warfare between both species of Myr, the Nyrea, and the subsequent movement of peoples, breakdown of infrastructure and land wastage has only increased cockvine’s spread. The plant is also recorded as being used by both sides of the Myr conflict as a form of sadistic punishment on prisoners of war; once a kept plant has finished with captives they are released deep in their home territory, with the explicit hope of their offspring spreading chaos there. This practice is expressly forbidden by international law.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Cockvines");
}
public function nyreaCodexEntry():void
{
	clearOutputCodex();
	showBust("NYREA_ALPHA");
	outputCodex(header("Nyrea"));
	outputCodex("<b>Name (Singular & Plural):</b> Nyrea");
	outputCodex("\n<b>Sexes:</b> Male & Female. Note Reproduction below.");
	outputCodex("\n<b>Height:</b> Males range in height from 5\' 5\" to 5\' 10\"; females, the larger of the species, from 5\' 8\" to 6\' 2\".");
	outputCodex("\n<b>Hair:</b> Nyrea have thin, wispy spine-like growths in most places humans might have hair. These vestigial barbs were once the species’ primary means of defense against larger predators, but have long since evolved to be soft to the touch and harmless, usually cut short or styled in intricate braids and designs.");
	outputCodex("\n<b>Eyes:</b> Nyrea have two mono-colored eyes, each with a small pupil in its center. Due to their almost exclusively subterranean existence, their eyesight is very poor, especially at longer ranges. For the same reason, their eyes are exceptionally sensitive to bright lights, and they can easily be blinded or stunned by sudden flashes. ");
	outputCodex("\n<b>Ears:</b> Offsetting their poor eyesight, nyrea have exceptional hearing. They possess two large, tapered ears which can easily grow out to a foot or more from their heads. A nyrea’s ears are sensitive to a wide range of sounds over great distances, and serve as their primary means of hunting. According to some daring rushers, they are also a primary erogenous zone. ");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Nyrea are predators who subsist on large cave creatures, occasionally foraying up to the surface for nocturnal hunts. They are naturally armored thanks to a chitinous carapace which covers their limbs and most of the torso in a corset-like configuration; the breasts and groin are usually covered with material armor, such as chain or leather. The nyrea are equipped with natural weapons in the form of sharp, sturdy fangs which inject a paralytic venom into their victims. Despite this, the nyrea are capable of crafting weapons, and indeed seem to prefer their use over biting: the favorite armament of the nyrean hunter appears to be the spear or javelin.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("Natives of Myrellion, nyrea make their abodes in deep subterranean caves. Nyrean tunnels tend to be damp and roomy, often leading to and between vast open underground caverns. Cave systems inhabited by the race do show signs of manual excavation, and are frequently decorated with artwork and writing, in addition to housing carefully harvested and cultivated crops of luminescent cave fungus.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Nyrean reproduction is an extreme oddity in the galaxy, especially among sapient creatures. Effectively, the genitalia of the two sexes is reversed: females possess a long, thick, penis-like tube with a blunted, softly-barbed head and an almost-canid knot at the base; males possess a genital slit which leads to a large abdominal cavern filled with several “sperm sacs”. Much as in a female mammal’s reproductive system, these sperm sacs are regularly moved to a “ready” position at the back of the genital opening where they can be penetrated by the female’s pseudo-penis barbs, whereupon the sperm is extracted.");
	outputCodex("\n\nReproduction amongst the nyrea is almost universally female-driven. Lone females will attempt to capture or envenom solitary males, while stronger “alpha” females will often accumulate harems of males and females to provide semen and incubation for their eggs. Once a male is secured, the female will penetrate his genital slit (and the sperm sac readied behind it) with her pseudo-penis and extract the semen through her own genitalia. This process is long and draining, especially for the male, and it can take several hours to fully drain a sperm sac through the incision made by the female. The knot at the base of the female’s pseudo-penis ensures minimal leakage during copulation, and can keep a pair of particularly unlucky nyrea together for up to half a day.");
	outputCodex("\n\nFemale nyrea, upon extraction of sperm from a mate, will fertilize between six and ten large eggs. Eggs are deposited via the pseudo-penis, which is by necessity very elastic and hollow. Nyrean females have a remarkable versatility when it comes to laying eggs, and individuals show marked variance in response to impregnation. Some will bear the eggs inside themselves until nearly time to hatch, while others will oviposit the eggs into the male that fertilized them, much as in Terran seahorses (this indeed seems to be the most common method, and the male genital slit and reproductive cavity seem remarkably well-adapted to this role). Some “alpha” females will attempt to dominate other, weaker nyrean females and deposit their eggs inside the defeated female (either anally or via the beaten female’s own pseudo-penis). Regardless of method, it is believed that the eggs must remain inside a warm-bodied host until nearly ready to hatch.");
	outputCodex("\n\nOnce hatched, newborn nyrea are helpless for a period of a few days, weeks at most, and must be nursed. Particularly confusing to off-worlders, both nyrean sexes possess large (by human standards, averaging between a D and F cup) breasts, and are capable of lactating a thick, highly nutritious “milk”. Males and females are both capable of rearing children, as either or both may be called upon to bear their eggs, either independently or with a mate’s assistance.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture & Society"));
	outputCodex("The nyrea are not what you would traditionally label as social creatures. It is clear that they evolved from solitary predator insects, but over time have formed small settlements out of need for easy breeding and mutual protection. The settlements can range in size from a dominant female and her harem to towns of a few thousand individuals, but due to the non-agrarian habits of the nyrean race, gatherings rarely grow beyond that size.");
	outputCodex("\n\nDue to the exclusive dominance of the female sex, and the power-play between females in close proximity, nyrean settlements almost always come under the rule of an “alpha” female who, depending on the size of her domain, either treats all nyrea living under her as her harem, or selects the most attractive and virile to serve her. In the latter case, “beta” females will share the remaining males between them, treating them at best as second-class citizens to be used at-will, or in some more tyrannical tribes, as little more than cattle and breeding stock.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Nyrea");
}
public function myrFungusCodex():void
{
	clearOutputCodex();
	showBust("MYR_INFECTED_FEMALE");
	outputCodex(header("Myr Fungi"));
	if(silly) outputCodex("<i>Gross.</i>\n\n");
	outputCodex("<b>Name:</b> Ophiocordyceps Myrmedius (Myr Fungus)");
	outputCodex("\n<b>Sexes:</b> Spores are technically genderless. Upon attaching to a host, the spores develop a gender based on a number of factors within the host.");
	outputCodex("\n<b>Height:</b> Spores are a half-inch in diameter at the most. Manifested fungi are typically around half the host’s height.");
	outputCodex("\n<b>Weight:</b> Spores are lighter than feathers. Manifested fungi weigh about as much as a full travel backpack. Fungal “queens” can weigh up to a few hundred pounds at the base.");
	outputCodex("\n<b>Hair:</b> Normal manifestations have no hair. Instead, their heads are covered by mushroom “hats.” Fungal queens have clear hair that pulses with colored light.");
	outputCodex("\n<b>Skin:</b> All members of the species have chalk white skin.");
	outputCodex("\n<b>Eyes:</b> Humanoid eyes that shift with bright colors.");
	outputCodex("\n<b>Ears:</b> Fungal manifestations have ears shaped similarly to their host, though the shapes are only for show as they hear everything that their hosts hear and communicate telepathically.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Parasitism"));
	outputCodex("The infection begins from breathing in spores that are either acquired while exploring the caves, or brought back on the clothing of returning hosts. Newly infected myr act no differently than the average member of the race, but after about a week they have a compulsion to leave their city or place of dwelling and travel to the deep caves of myrellion. Once there, they are beset with the more unpleasant part of the infection. For a period of between two days and week, they are racked with uncomfortable lust as the fungus merges with their immune system. During this time, the host will attempt to initiate intercourse with any being they come upon in the caves, though such attempts usually result in failure. Multiple infected will often try to ride out this rough phase together if they meet in the caves. This week culminates in the first manifestation of the fungus’ full form.");
	outputCodex("\n\nA full formed fungus projects its physical form from the hosts hips, often leaning against them while they sit or lie down. They are tethered by a lattice of micro tendrils that look similar to wispy clouds. This link is rather weak, and the physical form will disperse if it is wrenched away with any effort.");
	outputCodex("\n\nAfter the rough patch, the subject commonly returns to their home, often somewhat agitated from the ordeal. Apart from this initial agitation there are not many, if any, visible symptoms of the infection. An exception to this is a female myr with a male identifying manifestation. Such hosts grow a cock that ranges from four to eight inches, usually resulting in swift discovery of hosts living with family or friends. The host will feel a compulsion to travel back to the caves that dulls over time. If the host does not follow this compulsion, they can live out the remainder of their lives peacefully – or as peacefully as they can with a fungal symbiont connected to them.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Infected individuals may gain physical strength (in the case of male identifying spores) or increased awareness (in the case of female identifying spores) in the later stages of infection. Initial stages are usually capable of functioning in society and appear no different than an uninfected individual unless tested by offworld medical technology. Infected with access to weaponry will allow their manifestations to wield weapons. Typically, the host will wield a melee weapon while the fungus uses a number of tricks associated with their spores, as the manifested bodies aren’t physically powerful.");
	outputCodex("\n\nFully developed fungal queens fight using something akin to psionic power in addition to using “possessed” species as guards. Most queens would rather not fight, however, as using their spores expedites their dispersion. Queens often position themselves in rooms filled with a cloud of spores and can exhale thicker clouds during combat. They can speed the growth of mushrooms with enough concentrated spores, causing the normally (physically) harmless infestation to become painful and immobilizing.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Gender Differences & Reproduction"));
	outputCodex("While spores do not start out with genders, there are two definite genders of manifestations that are easily distinguishable. Male-identifying fungi will have leaner bodies and smaller caps, but will still have B-cup breasts and feminine faces. Female-identifying fungi will have fuller bodies and larger caps with breasts ranging between D and E-cups. Neither gender have nipples or sexual orifices, relying on their host for such things. Fungal queens, on the other hand, vary in appearance. For instance, some may have flower-like nipples or sexual orifices.");
	outputCodex("\n\nMyrmedius reproduces asexually with the fungal queens producing millions of spores during their lifetime. Once a queen has produced a finite number of spores she is dispersed, spreading her consciousness into another hundred thousand spores that spread through whatever room she was in and form smaller, luminescent mushrooms. The memories of this queen are retained by any queen formed from the dispersed particles. A queen is produced if an individual infected to the manifestation point repeatedly returns to one of these dispersal zones after the parasitic drive to do so has worn off. After a dispersal, the host of the queen is left uninfected. Manifestation-stage fungi can produce spores, but they are noninfectious and used for combat or feeding of less-than-willing hosts.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited"));
	outputCodex("While myrmedius fungus is capable of surviving outside of deep caves, it can only reproduce inside them. The specific temperature and humidity level of the cave provides the perfect breeding ground. Manifestation-level fungi can survive in any environment that their host can, but their performance will suffer if their host’s functioning is impaired, and they may not be able to show themselves at all if the host is grievously injured. The fungus can adapt to survive in other circumstances, but it can only reproduce in the specific conditions of the cave. Nearly any insectile organism and some other species can be used as hosts, but non-insectoid hosts will receive a less intense bonding and subsequent nerve melding.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Relationships"));
	outputCodex("The manifested symbiotes are very loving, attempting to support their host as best they can if they think the host is feeling out of sorts or in danger. They are, however, not the most intelligent things. Their help is usually limited to cuddles or directed actions outside stressful situations. Unless called at another time, they will usually only manifest during masturbation and will attempt to assist their host in achieving orgasm. They will try to ease the host’s nervousness about having a giant mushroom bonded with themselves and share their host’s stronger emotions.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Myr Fungus");
}
public function crystalGooCodexEntry():void
{
	clearOutputCodex();
	showBust("GOOCUBATOR");
	outputCodex(header("Ganrael"));
	outputCodex("<b>Name (Singular & Plural):</b> Ganrael");
	// Gardeford
	if(silly)
	{
		outputCodex("\n<b>Sexes:</b> Monogendered");
		outputCodex("\n<b>Height:</b> 5 to 6 feet. Some exceptional specimens can reach up to eight feet of height, though their dietary requirements to maintain such mass makes such individuals exceedingly rare.");
		outputCodex("\n<b>Senses:</b> As goo-type creatures, the Ganrael have very limited perceptive organs. They are capable of 360 degree sight and have acute senses of smell and hearing. Most ganrael, will affect humanoid eyes and ears as part of their limited shapeshifting, in order to appear more familiar and appealing to their mates.");
		outputCodex("\n<b>Skin:</b> Ganrael come in a variety of colors, ranging from viridian (the most common), through red, purple, dark blues, and rarely brighter shades of yellow, orange, and pink.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Combat"));
		outputCodex("Unlike many goo creatures, the ganrael are not stealth predators, but prefer to openly challenge their opponents. This shift in tactics compared to similar species is likely based in the ganrael’s unique evolutionary adaptation: armor. Species like the rahn and galotians are completely soft-bodied, constantly keeping their gooey extremities saturated with liquid to maintain their easy range of motion and shape-shifting abilities, with varying levels of penetrable dermises. Ganrael instead have adapted to slowly dry out and harden their outermost layers of goo, which eventually crystallizes into a nearly diamond-hard armor plating around the subject.");
		outputCodex("\n\nThis hardened outer armor protects the otherwise vulnerable ganrael inside, allowing it to engage in direct combat against even armed foes, such as the myrmedion who live in the upper caverns above the ganraels’ natural habitat. This crystal armor regenerates quickly with focus and food consumption on the part of the ganrael, and can even be adapted to grow semi-organic weapons for use: many ganrael hunt with crystal daggers, axes, or spears.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Environs Typically Inhabited"));
		outputCodex("Ganrael are natives of Myrellion, specifically the deepest caverns on the planet. Most live their entire lives without ever seeing the surface, though thanks to the abundance of bioluminescent fungus and creatures within the deep caves the ganrael retain their ability to see in low to high lighting. Ganrael prefer wet, humid areas in the caves, particularly those near underground lakes, rivers, and thermal vents.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Reproduction"));
		outputCodex("Ganrael, like most goo creatures, have distinctly non-mammalian reproduction patterns. Though some ganrael will adapt the appearance of one gender or the other, they are fundamentally a mono-gendered race, with any individual capable of bearing children. When a ganrael is ready to mate and bear children, it need only acquire the genetic material of another compatible creature -- male or female, semen or any other form of genetic carrier. The genetic material can then be absorbed through the skin (or, more commonly, inserted into the bearer through penetrative sex). Ganrael have several erogenous zones in their natural forms, and usually shift these to more traditional areas when mimicking humanoid shapes so that both the ganrael and its mate can enjoy the proceedings.");
		outputCodex("\n\nOnce proper genetic material has been absorbed, the ganrael’s reproductive cycle begins. Over the course of the next 24 hours, the ganrael will begin to divide its cells, with half of the resultant cells carrying the new genetic material mixed with the parents’. The parent ganrael will shed its crystal armor and effectively split in two, resulting in a smaller (some say younger) copy of the parent along with a fully-formed child. Both parent and child are fairly weak for the next few days, requiring some time to gather their energy and eat enough to begin restoring their full size and armor plating. Between “insemination” and the resultant ganrael being fit to hunt again, perhaps a full week has passed.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Culture & Society"));
		outputCodex("Most ganrael are nomadic, moving through the caverns in pursuit of game and mates. There are relatively few ganrael settlements and little in the way of organized civilization. At best, a family unit of a mated pair and their children may stay together until the children are old enough to hunt on their own, at which point the family usually disintegrates. Ganrael are, as a rule, individualists who struggle to work together with other creatures (of their own race or others), which has prevented any sort of organized ganrael society from cropping up over the years.");
	}
	// Zeikfried
	else
	{
		outputCodex("\n<b>Sexes:</b> Unisex, though individuals may adopt a gendered appearance.");
		outputCodex("\n<b>Height:</b> Varies depending on the assumed shape, which changes with environment. Specimens that far exceed dietary requirements may be much larger than average.");
		outputCodex("\n<b>Senses:</b> Capable of 360-degree sight using a diffuse array of photoreceptors, with acute smell and hearing. Most ganrael will affect humanoid facial features in order to appear more familiar and appealing, but these are cosmetic.");
		outputCodex("\n<b>Hair:</b> None natively, though individuals may counterfeit it to attract mates.");
		outputCodex("\n<b>Skin Color:</b> Green is the most common, followed by blue and yellow. Rarely, specimens of pink or red are seen. Color is determined by trace impurities, and an individual’s color may change in response to environmental factors.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Habitat"));
		outputCodex("Ganrael are native to the deepest cavern level of the planet Myrellion. Most live their lives without visiting the surface, though thanks to the abundance of bioluminescent fungus the ganrael retain the ability to see in light. Ganrael prefer wet, humid areas, particularly those near underground water sources and thermal vents.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Biology & Behavior"));
		outputCodex("Unlike many amorphous creatures, the ganrael are not social or symbiotic and prefer to rely on intimidation or physical force. This evolutionary strategy likely arose with their adaptation of armor. Unlike rahn and galotians, who both maintain a moist, penetrable dermis, ganrael are able to modify their outer layers, hardening them into plating and weapons as durable as tungsten or carbon steel.");
		outputCodex("\n\nAccording to available field reports and research records provided by Myrellion governments, the ganrael store liquid supersaturated with silicate minerals in specialized organelles inside their cells. When new plating is needed, an enzyme is secreted that ruptures the chamber, allowing the liquid to crystallize rapidly. Other compounds in the destroyed cell function as resins that bond the tiny crystals together into a composite.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Reproduction"));
		outputCodex("Ganrael reproduce similar to Terran prokaryotes, collecting new genetic material and then producing offspring clonally. As a unisex species, any individual is potentially capable of reproduction. When ready to mate, the ganrael seeks out compatible genetic material and absorbs it through the skin, commonly in the form of penetrative sex, which the ganrael enjoy thanks to several erogenous zones that shift responsively to heighten the experience.");
		outputCodex("\n\nA ganrael retains and incorporates a donor’s genetic material into its own after mating, via a poorly-understood process. Eyewitness accounts report that individuals experience euphoria, addiction, and loss of cognitive function during this time, akin to intoxication or narcotic effects. For unknown reasons, no such reaction occurs with conspecifics. Approximately twenty-four hours after assimilation of enough material, the ganrael will enter the reproductive phase, shedding its armor and undergoing rapid cell proliferation. The phase culminates with the ganrael separating into two identical individuals, each carrying the new genetic signature. Ganrael are vulnerable after division, as their new cells contain low mineral levels and create weak plating.");
		outputCodex("\n\nGanrael may reproduce before assimilating. This has only been observed when an individual with damaged plating receives too much genetic material to contain without its exoskeleton. The ganrael will immediately divide the material between two bodies which both later undergo the reproductive phase. Each clone will assimilate the foreign DNA slightly differently, resulting in two pairs of related but non-identical ganrael.");
		outputCodex("\n\nGanrael who do not acquire enough DNA from one partner seek another, and when denied access to gametes will collect and use other, non-germ cells. These occurrences should theoretically result in a significant number of triploid and polyploid ganrael. It’s currently unknown how or even if individuals with odd chromosome numbers prevent aneuploidy during reproduction, but theories have been proposed whereby ganrael are unable to divide until their total number of chromosomes are evenly paired, are able to identify and splice compatible donor DNA directly into their own via a hitherto unidentified enzyme, or have some other redundancy that prevents aneuploid cells from resulting in a defective organism. The ‘even pairs’ theory would suggest a sharp increase in the number of chromosomes over time which has not been observed, and has not been widely accepted for this reason.");
		outputCodex("\n\n");
		outputCodex(blockHeader("Culture & Society"));
		outputCodex("Ganrael are nomadic, moving through the caverns in pursuit of food and mates. ‘Growth’ and reproduction through aggressive acquisition of genetic material is usually the highest goal of any individual. Because of their potential to become addicted to other species, ganrael are not infrequently taken as slaves. There are few ganrael settlements and little in the way of organization. Ganrael are, as a rule, individualists who struggle to work together, which has kept their society nonexistent and the species insignificant.");
	}
	outputCodex("\n\n");
	CodexManager.viewedEntry("Ganrael");
}

public function bothriocCodexEntry():void
{
	clearOutputCodex();
	showBust("ARAKEI");
	outputCodex(header("Bothrioc"));
	outputCodex("<b>Name (Singular & Plural):</b> Bothrioc");
	outputCodex("\n<b>Sexes:</b> Monogendered, generally regarded as feminine. A subtype comprising less than 5% of the population are known as the “quadommes” due to their tendency to keep a large harem of submissives and their unique physical characteristics.");
	outputCodex("\n<b>Height:</b> 5\' 6\" pidemme, 7\' 6\" quadomme.");
	outputCodex("\n<b>Weight:</b> 150 lbs pidemme, 300 lbs quadomme.");
	outputCodex("\n<b>Life Expectancy:</b> Upwards of 90 years. Low fertility and primitive understanding of medicine keeps population growth slow.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Physical Characteristics"));
	outputCodex("Bothrioc are a white-skinned, four-armed humanoid species with extensive, flexible chitinous armor. The only places on their body that have skin are the stomach beneath the ribs, the head and major joints such as the groin, armpits and buttocks. Their noseless faces are mostly free of chitin, but for a few plates that sculpt their features. Where these plates form differ from bothrioc to bothrioc, although all have an upper and lower lip plate creating smooth, thin, hard lips that nevertheless are fully capable of articulation. Furthermore, their foreheads possess the only skin tone plate of chitin on their body, which blends in seamlessly to the skin around it, but is grooved to direct sweat away from their eyes in lieu of the more common eyebrow seen amongst most species. All bothrioc have solid-color eyes, ranging from dark brown to iridescent purple to pitch black. Bothrioc can see in the dark better than most species, relying on a light reflection system to enhance dim conditions. In complete darkness they are as blind as any other.");
	outputCodex("\n\nBothrioc ears are sensitive and have a chitinous coat that dampens incoming sounds, limiting the amount of damage loud noises may otherwise do to them. Sensorially bothrioc largely rely on a small pair of antennae embedded just behind the hairline that are angled straight up. These pick up minute vibrations and allow them to detect movement relative to their position. Amongst other things, this feature of bothrioc anatomy is crucial to their famous trapdoor ambush as it allows them to detect when prey enter their range without having to see them. Furthermore, the antennae are capable of picking up scents, though bothrioc tend to have peculiar preferences in scent compared to other species due to the unusual structure of this olfactory organ.");
	outputCodex("\n\nThey possess no definite secondary sexual characteristics, giving off an intense impression of androgyny. They are generally identified as feminine due to their tendency toward lean muscle and flared hips, but essentially no bothrioc will be offended if referred to in the masculine or feminine. ");
	outputCodex("\n\nBothrioc possess good strength all around, but are notable for their extreme agility. The traditional hunting technique of bothrioc is to lie in wait with a spear and bolas, then spring out of hiding while letting loose a pair of bolas, followed by rapidly closing the distance to attack with their spear. Generally, most prey animals are dead before they are able to make a move. In modern times, bothrioc are adept gunslingers and tend to favor rapiers and other quick, thrusting implements when in melee combat. The bothrioc are no strangers to psychological warfare and will attempt to tease or dominate opponents not defeated in the first strike whenever appropriate.");
	outputCodex("\n\nAll bothrioc possess a chitinous abdomen analogous to a tail above their buttocks, which is their reproductive organ, a complex ovipositor. Other than this organ, they only possess a cloaca situated between their buttocks.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Quadommes"));
	outputCodex("The “quadomme” bothrioc, also known as harem-queens, have two unique adaptations from their brethren. The most noteworthy is their larger ovipositing abdomens: These contain a functioning silk spinnerette which they can use to produce durable and adhesive webs. The second is that they possess four legs, allowing them to rest comfortably atop one of their large webs. The legs are arranged in a diamond configuration such that two legs point forward and two back. The legs are longer on a dominatrix bothrioc than their cousins which allows them to maintain height comparable to their standing kin even with their knees completely relaxed, and while they can get into a respectable running gait, they find it uncomfortable and are unlikely to be distance runners. These adaptations have resulted in a change in their predation habits from being solitary mobile predators to sedate entrapment predators. This mindset causes them to collect lovers as well as food, and they will generally keep submissive bothrioc or other suitable incubators around for many years. Successful dominatrixes occasionally have as few as ten such incubators but up to as many as two hundred, according to one legend of a bothrioc warlord.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("The reproductive habits of bothrioc are complex and have only recently become understood by the limited research teams able to travel around the cave systems of Myrellion.");
	outputCodex("\n\nGenerally speaking, the species creates a dominant and submissive role between two members when they meet, if one of them feels the desire to reproduce. One partner assumes dominance by force or persuasion, inserting their ovipositor into the ovipositor of the submissive party and retrieving some of the fluid within the reserve. This fluid, which serves as a lubricant and psychoaffective when used for oviposition, is able to fertilize eggs when taken into the ovipositing cavity of a bothrioc. Some debate exists about the viability of potential insemination using other fluids; as no alien researcher has been willing to engage in intercourse with the ovipositor, it remains uncertain. It is theorized that any genetic-material delivery fluid will suffice, as it has been shown a nyrean male can fertilize bothrioc eggs.");
	outputCodex("\n\nHaving taken their fertilization fluid from the submissive party, the dominant will then insert their ovipositor into the cloaca of the submissive party to begin oviposition. Alternatively, they will elect to hunt down a different submissive to lay the eggs into, depending upon taste. The eggs themselves are round and somewhat pliable, getting firmer as the young within mature and need more protection. The eggs are noted to be about 5” across and of a distinct, dark violet hue when laid. ");
	outputCodex("\n\nThe effects of the slime that accompanies eggs from their ovipositor are incredibly versatile. First, it acts as a lubricant, easing passage for both the dominant and submissive parties. Second, it acts as a fertilizer or semen-analogue, as discussed above. Third, it is mildly adhesive to egg shells and strongly adhesive to itself, creating a situation in which eggs attach to the lining of whatever orifice they are in surrounded by a substantial bubble of the slime. Fourth, it carries a hormonal and psychoaffective payload.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Psychoactive Effects"));
	outputCodex("Hormonally, bothrioc reproductive oil carries many oestrogen and progesterone analogues, which in most species will have a feminizing effect as well as an uptick in sex drive due to a more minute amount of testosterone. In a technically-genderless species like bothrioc, there is little to no effect on secondary sexual characteristics, but instead these hormones serve as a trigger to reduce egg production and increase slime production within their ovipositing abdomens. As such, a repeated submissive is pushed further and further into the fertilizing role and becomes less and less effective when ovipositing. The hormones used in egg production, however, are self-reinforcing. A bothrioc who has reason to produce more eggs, for example, having deposited them or having had them deteriorate, will experience a mild increase in egg production. As such, a dominant bothrioc will eventually produce vast amounts of eggs, but a submissive bothrioc is not eternally caught on the submissive side if they seek to change.");
	outputCodex("\n\nThe psychoaffective payload, however, may keep a submissive member of the bothrioc on the submissive side. These chemicals produce low-level euphoria and suggestibility through the duration of egg incubation, reaching a peak during the final evacuation of the eggs, generally guaranteeing orgasm and, due to heightened suggestibility, firmly entrenching the idea in the egg-layer’s mind that carrying and laying eggs is an activity they enjoy and would like to experience again. Thanks to the suggestibility throughout the incubation, an incubator is more easily acquired by another dominant bothrioc for further oviposition if they have currently unimpregnated orifices.");
	outputCodex("\n\nWhile the psychoaffective payload’s effects are not inherently permanent, they are self-reinforcing and will eventually achieve permanence within the subject’s mind on repeated or intense exposure. The end result of this, easily observable among the harems of dominatrix bothrioc, is an extremely carefree and happy state of mind, resulting in low willpower and high libido. Many have assumed that this results in intelligence loss, however when sufficiently invested in something the submissives have tested to have mental faculties within the standard deviations of their species and notably some geniuses.Their altered state of mind does, on occasion, result in such a disconnect from usual affairs that the subjects become less capable of understanding someone who is not motivated by sex. Additionally, their speech becomes peppered with frequent vocalized pauses to collect their thoughts as well as a changing vocabulary reflecting their general pleasure with life and lack of desire to be serious or be particularly invested in matters most would consider important.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Intelligence"));
	outputCodex("Bothrioc are sentient, sapient, language-using predators. They lack much of a distinctive culture due to their solitary nature. They hunt alone, and usually only seek each other out for reproductive or sexual satisfaction. As such, while they are not actively shunned by the myr that rule the surface, they have little say in the affairs of the world above or below. Dominant bothrioc are excellent tacticians and cavern combat experts, typically have excellent vision unlike the myr, and have been occasionally hired by both sides as commanders for troops, especially when plotting surgical strikes. They lack a head for numbers and have fallen out of favor in the trench warfare currently underway on Myrellion.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Traditionally apex predators, the bothrioc’s inability to collectively organize has resulted in them been completely outstripped by the myr and even the nyrea, so have little to no say in the wider affairs of the planet, occupying the same political position the similarly-minded wetraxxal do. If bothrioc were removed from the planet today, there would be little evidence they existed aside from mentions in myr records.");
	outputCodex("\n\nThe long history between bothrioc and the two myr species is recorded universally by the latter and is thus biased. What can be understood to be true is that bothrioc have enjoyed a sort of mixed fascination and revulsion from the myr, as evidenced by their twin nicknames of “Egg-Giver” and “Egg-Beast.” In fact, most tales the myrs tell of bothrioc are twinned with one variant favoring them and another casting them down. Gold myr tell of a beautiful queen who came to be enthralled of a bothrioc lover. In one telling, the bothrioc became her consort and inseminated the queen via her ovipositor, and also gave the queen eggs to build a sizable bothrioc family at the palace in addition to the royal family. In another telling, the bothrioc was in fact of the dominatrix subspecies, and stole the queen away to the deeper caverns where she simply became another pet in the harem. Both tellings are uncharacteristic of bothrioc behavior as they neither form families nor do they kidnap their harems, generally. What this and dozens of other tales tell the anthropologist is that bothrioc have always participated in history alongside the myr, whether as slaves, merchants, prostitutes, generals or royalty.");
	outputCodex("\n\nThe bothrioc and the nyrea are the source of the native variant on the phrase “getting along like cats and dogs.” This is largely due to the difference in value between a nyrean male and a nyrean female as far as bothrioc are concerned. A nyrean male is the ultimate prize, as with one docking it is possible to fertilize eggs, deposit them, and take in a second dose of semen to fertilize the next batch when they are ready, a veritable sexual one-stop shop. Meanwhile, bothrioc have almost no interest in attempting to take nyrean women due to the lack of fertile material and their tendency to struggle and fight back. This doesn’t stop dominant bothrioc from mounting a surprise attack to drop some eggs for spite, even in the nyrean’s own ovipositor, which results in a dual-pregnancy when she inevitably uses her ovipositor on some hapless submissive. Nyrean women will of course take every opportunity to take advantage of the submissive bothrioc in the same way the dominant bothrioc are known to take advantage of them, and it is not unknown for a bothrioc’s ambush to be botched, allowing the nyrean to turn the tables on a dominant as well. That the two share the same habitat results in many such interactions happening on a regular basis, which is what caused the myr to coin the phrase “fighting and fucking like the both and nyr.”");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Bothrioc");
}

/* Uveto */

public function essyraCodexEntry():void
{
	clearOutputCodex();
	showBust("KAZRA_AND_LORRE");
	outputCodex(header("Essyras"));
	outputCodex("<b>Name:</b> Essyra (Singular), Essyras (Plural)");
	outputCodex("\n<b>Sexes:</b> Female and Hermaphrodites");
	outputCodex("\n<b>Height:</b> 6\' 6\" to 7\' 0\"");
	outputCodex("\n<b>Hair:</b> Snow-white, pink, or light blue");
	outputCodex("\n<b>Eyes:</b> Pink, human in shape and size");
	outputCodex("\n<b>Ears:</b> Essyras have large, vulpine ears");
	outputCodex("\n<b>Tails:</b> Essyras have several thick, furry tails: usually between six and nine, and in the case of hermaphrodites, always in the same number as their penile tendrils.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Essyras are consummate huntresses, combining a natural stealth and agility with amazonian strength. Most prefer to fight with a bow or throwing spear, giving them sure strikes from ambush before finishing their prey in close combat with daggers or axes. Essyras prefer armor made of treated hides and leather, usually from local predators they’ve slain and in snowy colors to maintain their natural camouflage. Centuries after their homeworld was colonized by the ausar, many essyra have adapted to use salvaged arms and armor from spacers to supplement their traditional hunting styles.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("Natives of the snowy world of Uveto, essyras are well-adjusted to cold weather and snow. Their natural adaptation includes snow-white skin and cold-colored hair, effectively making them what other species might consider albinos (complete with pink eyes and susceptibility to skin disorder), and have intense body heat which is compounded by a tremendous ability to store body fats for warmth, much like the colonial ausar have adapted. These body fats are usually stored in the belly, buttocks, and breasts, giving a well-fed essyra an extremely curvaceous appearance. This chubby body-type should not be underestimated, however, as essyras are also considerably stronger than the average human, owing to their size and natural musculature.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexuality & Reproduction"));
	outputCodex("The essyra are a race entirely composed of feminine individuals, broken into both a female and hermaphrodite sex. They appear to share a single social gender between them, as is common for species with feminine hermaphrodites. All members of the species have a galactic-standard vagina in the usual place for bipeds, completely with black lips and a sensitive clitoris.");
	outputCodex("\n\nHermaphrodite essyra have a number of penile tendrils that surround their feminine sex, in the same number as the individual’s tails (usually between six and nine) between 6 and 10 inches in length. Each tentacle has a series of three bulbous knots near the base that inflate during intercourse, growing turgid during and after orgasm to bind mates together. Essyra typically have one “dominant” penis that is longer and thicker than the others, growing up to 16 inches in length.");
	outputCodex("\n\nThese tentacles are prehensile, and each has its own internal testes located inside the base-most knot. This allows each tendril to have its own refractory period -- meaning a particularly amorous essyra can keep a sexual encounter going for hours, effectively indefinitely until exhaustion takes hold.");
	outputCodex("\n\nEssyra reproduction is fundamentally mammalian, with penetrative sex resulting in pregnancies that last six months. Once young are born, they grow quickly to adulthood over the course of one year. They are helpless for only a few days. This quick rise to adulthood is offset by the very short lifespan of essyras, who rarely live more than 10 years. When two essyran hermaphrodites engage in intercourse, impregnation of both partners is seen as highly undesirable, as the sire is expected to take care of her lover while she is with child.");
	outputCodex("\n\nWhen pairs of essyras become mated, it is usually for life, and one of the pair will assume the ongoing role of mother and caregiver, and one the father and provider. In instances where essyra mate with offworlders or natives of other races, they have shown strong tendencies towards impregnating their partner or restricting themselves to non reproductive sex. Single motherhood appears to carry an extreme social stigma among the species.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture & Society"));
	outputCodex("Essyras are solitary creatures, usually living alone or with a single mate and their children. Essyra typically live in large, easily moved tents made of bone, leather, and hide from large animals. They are prone to staying in the same abodes for extended periods of time, sometimes several years, so long as good hunting maintains, only occasionally shifting their home’s location with the changing ice floes and snow accumulation.");
	outputCodex("\n\nWhile explorers initially feared interaction with essyra huntresses during early exploration based on their fearsome reputation among other native species, the essyra were eventually discovered to be surprisingly friendly towards off-worlders, and instances of violence were remarkably low. Indeed, several huntresses volunteered to act as guides and hunters for the initial exploration teams, and were instrumental in early mappings of the surface before the modern sensor relays were installed. Essyra DNA was even used in the early variants of the “huskar” gene mod that has allowed colonists to comfortably inhabit Uveto -- a fact that many huntresses relish, treating the colonists as their “children.”");
	outputCodex("\n\nThis friendship has maintained quite well since then. Essyras freely come and go from Irestead and other settlements, and many take ausar colonists as mates. Despite many, many generations of the short-lived race having passed since first contact, essyras today still treat the huskar as their “responsibility,” and there have been countless instances of them intervening to rescue an endangered colonist from a predator or natural hazard.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Lureling Essyras"));
	outputCodex("Of special note is the relationship between the essyra and another species native to Uveto: the so-called “lurelings,” powerfully psionic creatures that live beneath the ice. Though research on the matter is thus far limited, it appears that essyras are very susceptible to psionics, much moreso than other Uvetan races, and have developed no natural talent themselves. Lurelings prey on young essyras, taking advantage of their low mental defenses to psychically dominate them -- usually for life.");
	outputCodex("\n\nThe dominated essyra will follow her master above the ice, acting like a sexual lure for adventurers and feeding back sensual pleasures to their master once they’ve secured a mate. The purpose of these actions is poorly understood, as no reliable contact has ever been established with the lurelings, but by all accounts they appear to engage in both the domination and luring for pleasure, rather than any biological imperative.");
	outputCodex("\n\nUnsurprisingly, essyra kill lurelings on sight. Other races treat lure-essyra with a mix of difference and amusement, as encountering them usually means easy sex, and the lure usually carries deep-sea treasure or bounties of fish taken by her master to trade in villages.");
	outputCodex("\n\nLureling-bound essyras have existed since before First Contact, and appear to have diverged from their free-willed kin on a biological level. Different combinations of sexes, including pure female and male essyras, are apparently selectively bred for their appearance or other physical traits that help them attain mates for their master’s pleasure.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Essyras");
}
public function frostwyrmCodexEntry():void
{
	clearOutputCodex();
	showBust("FROSTWYRM");
	outputCodex(header("Frostwyrm"));
	outputCodex("<b>Name:</b> Unknown (Colloquially: Frostwyrm)");
	outputCodex("\n<b>Sexes:</b> Unknown. Assumed Male and Female.");
	outputCodex("\n<b>Height:</b> 15\' to 20\'");
	outputCodex("\n<b>Scales:</b> Snow white, flecked with glistening blue and silver");
	outputCodex("\n<b>Eyes:</b> Four flame-red eyes");
	outputCodex("\n<b>Ears:</b> Reptilian");
	outputCodex("\n<b>Tails:</b> Each Frostwyrm has a powerful reptilian tail that stretches out nearly the length of its body, covered in spikes.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("The apex predator on the frozen world of Uveto VII, the Frostwyrms are mythological beasts spoken of in hushed, fearful whispers by the native races. Rarely encountered by colonists, these reclusive creatures are mighty behemoths able to rend armored vehicles asunder. Wyrms have eight spear-like claws on each of their six legs, and several spikes line the length of its tail, able to hit with the force of a thunderbolt. The creatures’ teeth are like arrays of swords, set three rows deep in a bestial maw, and its scales act as an interlocking pattern of shields like any other reptile’s. Even its wings can be weaponized, creating a hurricane-like gale that batters attackers down to the earth, or send them flying - not to mention sending snow flurrying about to obscure itself.");
	outputCodex("\n\nPerhaps the most notable combat traits of the wyrm is that despite its bestial appearance, it is powerfully psionic. The wyrm radiates a powerful field of psychic energy around itself that is able to both give it lift for flight, and act as a barrier that completely shields it from harm. Wyrms can actuate their mental power as attacks as well, sending psychic whiplashes that batter their attackers’ minds, or focusing it through a powerful roar that can cause intense pain and mental trauma.");
	outputCodex("\n\nFighting a frostwyrm is considered suicidal by most native races, and foolhardy hunters that go to bring one down rarely if ever return. Luckily for the people of Uveto, frostwyrms are reclusive and few in number -- they have never attacked a settlement, and do not seem interested in aggressive action unless their territory is invaded.");
	if (flags["FROSTWYRMWARNING"] == undefined)
	{
		outputCodex("\n\nWhile psionic power is generally associated with high mental acuity, it is unknown if frostwyrms are actually sapient -- no communication has ever been possible, and the wyrms appear to have no language beyond roars and grunts.");
	}
	else
	{
		outputCodex("\n\nWyrms appear to be able to communicate psychically, though their physical mouths have no ability for speech.");
	}
	outputCodex("\n\n");

	outputCodex(blockHeader("Environs"));
	outputCodex("Native to the snowy world of Uveto, frostwyrms are amphibious reptiles that tend to be found on the coastlines and glacial outcroppings that dot eastern Uveto. They are capable of breathing air and either possess secondary gills or else extreme lung capacity akin to whales, as they are able to submerge in the icy waters of the planet for an extreme duration - possibly hours at a time.");
	outputCodex("\n\nIt is believed that frostwyrms live in large caves on the coast, possibly submerged under water. As yet, no wyrm lair has ever been discovered.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Unknown. It is believed that frostwyrms are traditionally reptilian and lay eggs, though none have ever been seen. Several enessae and milodan legends tell of sighting a wyrm heavy with eggs, though none have been seen since colonization.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture & Society"));
	outputCodex("Unknown. Wyrms are believed to be solitary creatures with no culture to speak of.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Frostwyrm");
}
public function korgonneCodexEntry():void
{
	clearOutputCodex();
	showBust("KORGONNE_FEMALE");
	outputCodex(header("Korgonne"));
	outputCodex("<i>Honest little furballs as tough as they are short.</i>\n\n");
	outputCodex("<b>Name (Singular & Plural):</b> Korgonne");
	outputCodex("\n<b>Sexes:</b> Males and Females");
	outputCodex("\n<b>Height:</b> Between 4\' and 5\' 6\".");
	outputCodex("\n<b>Weight:</b> Between 100 and 170 terran pounds.");
	outputCodex("\n<b>Eyes:</b> Rectangular, like a goat’s. The irises are typically brown, hazel, or green.");
	outputCodex("\n<b>Skin:</b> Tan, pale blue, or chocolate brown with black pigmentation common near the genitals.");
	outputCodex("\n<b>Fur:</b> A mixture of white and tawny with black down the back.");
	outputCodex("\n<b>Hair:</b> Longer fur growing from the top of the head to the nape of the neck. Typically brown, white, or burnt orange.");
	outputCodex("\n<b>Ears:</b> Positioned atop the head; triangular in shape and slightly rounded at the tip.");
	outputCodex("\n<b>Face:</b> Humanoid in appearance with wide, expressive eyes and a short muzzle capped by a black or blue, moist nose.");
	outputCodex("\n<b>Limbs:</b> Two arms and two digitigrade legs. Both palms and soles contain soft, leathery pads, similar to a cat’s.");
	outputCodex("\n<b>Tails:</b> Either a foot long and fluffy or short and curled upward, depending on parentage.");
	outputCodex("\n<b>Lifespan:</b> 156 years on average with exceptional individuals reaching into their second century.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance Notes"));
	outputCodex("Korgonne fur is typically short but dense, suitable for protection during brief jaunts to the frozen surface but not so stifling as to cause problems for those that remain in their warmer burrows for long periods of time. They tend toward stockiness thanks to their chill environment. With great effort, it is possible for them to attain the lithe appearance the rest of the galaxy seems to strive for, but few have shown such inclinations.");
	outputCodex("\n\nA korgonne’s dress varies widely with the situation. Inside their subterranean burrows, garb is next to nonexistent - nudity or simple wraps to obscure the genitals and nipples are the order of the day. Outside, they’ll wear suits woven from mineral fibers found within Uveto’s spires, often bolstered with furs and leathers from the moon’s natural wildlife, particularly those harvested from fallen \\\[REDACTED\\\]s.");
	outputCodex("\n\nKorgonne favor jewelry of all types, yet have a preference for native crystals set in plain, strong settings - the greater the contrast between gem and housing, the higher their regard. Since coming into contact with huskar and the greater U.G.C., piercings have come into favor in more outgoing communities, particularly on ears and tails, and it is now possible to easily identify a korgonne’s social status by the amount and quality of his or her jewelry.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Habitat"));
	outputCodex("Korgonne settle in and around the mineral spires of Uveto VII, living in caves both natural and hollowed by mining. Their clans vary in size from a few dozen to hundreds, depending on the size of the spire and its suitability for habitation. The preferred type of spire contains insulating minerals that effectively trap the heat of korgonne bodies and fires; particularly nice spires will soon find themselves effectively anchored in the ice to prevent them from sinking deeper into the murky core.");
	outputCodex("\n\nAquatic animals fished from the internal ocean provide a steady source of food, bolstered by naturally-occurring fungus cultivated in the outermost burrows. Algae too provides a boon to these “fluffy savages”. They cultivate it in sealed chambers, in time harvesting it to brew a distinctive-tasting beer. The spires themselves provide no shortage of useful minerals and crystals, allowing the industrious korgonne to produce works that seem well beyond their primitive capabilities.");
	outputCodex("\n\nSettlements are isolated, yet often share similar forms of governance and religion. Clan leaders, typically a patriarch, oversee the rule of assembled korgonne, while worship of a figure known as “the Great Forge” is almost universally accepted. Infrequent trade between spires has allowed an exchange of ideas that have survived for centuries thanks to careful record keeping.");
	outputCodex("\n\nMost korgonne view the huskar, and outsiders in general, with suspicion. Others regard them with outright hostility, considering them interlopers who have only come to plunder the Great Forge’s bones for riches. Some of the latter group have even taken to harassing explorers in the snows, ambushing them from hidden positions in hopes of driving the aliens away from their homeworld.");
	outputCodex("\n\nCare is advised when traveling, as it is difficult to determine if a korgonne is truly hostile at first meeting.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Cultural Notes"));
	outputCodex("Korgonne culture holds industriousness as the highest virtue. The more productive an individual, the greater respect they are afforded by their peers. The quality of work contributes as well; a miner who slaves at his job for fifteen hours straight would not be as well-regarded as one who finds a way to extract three times the minerals in half as many hours.");
	outputCodex("\n\nIntelligence and wit are valued commodities. They see no greater sin than having a brilliant mind and refusing to use it to its fullest, viewing idle genius as the worst kind of sloth. To this end, they rigorously school their young, affording their teachers luxurious pay. Korgonne have achieved a level of scientific understanding well beyond what many anthropologists thought isolated, tribal cultures capable of. Further diplomatic studies by the U.G.C. are planned, and a number of private corporations have expressed interest in bringing a korgonne scientist up to galactic standards.");
	outputCodex("\n\nAnother major difference from galactic norms is the korgonne attitude toward loyalty and honesty, going far beyond general approval to a fanatical adherence to code. Dishonesty is considered gauche and a habitual liar absolute scum. The punishment for thievery is banishment, considered to be worse than death; this sentiment also extends to alien explorers, making it difficult for outsiders to befriend and enter even the most peaceful korgonne colony. A korgonne’s word is his bond, and a cultivated friendship often transforms into a lifetime of loyalty. Similarly, one social misstep could make a mortal, implacable enemy.");
	if(flags["KORGI_TRANSLATING"] == undefined)
	{
		outputCodex("\n\nLastly, their language has proven difficult for procedural translation software to adapt to. Extensive samples are needed to improve the accuracy; though basic conceptual understanding is still possible, many subtleties are lost. Developing algorithms to properly handle korgonne speech could advance translation technology by decades.");
		if(korgiTranslateProgress() != 0) 
		{
			outputCodex(" (<b>Data Collection Progress: " + Math.round(korgiTranslateProgress()) + "%.</b>");

			if(korgiTranslateProgress() >= 100) 
			{
				outputCodex(" <b>Would you like to submit your Codex’s language data to improve translations?</b>");
				clearGhostMenu();
				addGhostButton(4, "Back", showCodex);
				addGhostButton(0, "Translate", translateKorgii);
			}
			outputCodex(")");
		}
	}
	else
	{
		outputCodex("\n\nLastly, while their language has proven difficult for procedural translation software to adapt to, your extensive sampling of the residents of Korg’ii Hold improved the algorithm to near perfection. Your efforts to refine translation software has not gone unnoticed.");
		if(!korgiTranslate()) 
		{
			outputCodex(" <b>For some reason, you’re using the old software version.</b>");
		}
		clearGhostMenu();
		addGhostButton(0, "Translate", translationToggle);
		addGhostButton(4, "Back", showCodex);		
	}
	outputCodex("\n\n");
	outputCodex(blockHeader("Sex and Mating"));
	outputCodex("Reproduction among the korgonne is slow, not because of infrequent mating but because of infrequent ovulation. Females are only fertile in times of plenty, when supplies and space both exist in ample quantities. Further study is needed to determine the exact mechanisms behind this selective behavior. Pregnancies result in a single, helpless offspring that matures over a period of 25 to 30 years. Development is comparable to terran and ausar stages, though at a more gradual pace.");
	outputCodex("\n\nWhile reproduction is infrequent, intercourse certainly is not. Korgonne females are considered the more libidinous of the two sexes, frequently courting sexual encounters with their peers for enjoyment and bonding. The males are taciturn but aggressive lovers, fiercely passionate once their slow-burning ardor is roused. Sex is considered a common part of life, sometimes even a part of the social contract, and korgonne might employ short spats of violence to reconcile a recalcitrant lover in the same way that a drunken kui-tan might encourage a miserly companion to pick up a bar tab.");
	outputCodex("\n\nMales are equipped with a retractable phallus, black in color, that expands in size the longer it kept aroused. A single, large gonad provides sperm, pooling it in a canid knot at the base of the shaft during arousal. Because of this, if a male is aroused and subsequently calms without ejaculation, his body will leak semen for anywhere from a few minutes to an hour.");
	outputCodex("\n\nFemales have a single genital slit positioned between their legs with a vestigial clit at the fore. The nerve density of the external vulva, particularly of the clitoris, is far lower than in other species with the feature, though the lining of the vaginal passage, particularly where a knot would rest, is many times more sensitive than a terran equivalent. Some of these nerves even reach into the rectum, and anal sex does not have the stigma it does in some other cultures. The female genitalia produces a strong sexual pheromone that entices both males and females, and a korgonne female seeking sex often leaves her genitalia exposed to allow it to permeate the air.");
	outputCodex("\n\nPenetrative sex acts are a favorite of both genders, often featuring extensive foreplay and large insertions that maximize internal stimulation and male erection size.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Conclusions"));
	outputCodex("Korgonne natives are a stubborn lot, unlikely to integrate into the U.G.C. without significant effort, but their productive ethic may offer much advantage when and if they do so. Caution, honesty, and civility are advised when dealing with them. In the event of hostilities, visitors are requested to seek a nonviolent resolution. One violent death may make an entire clan intractable.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Korgonne");
}
public function lurelingsCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Lureling"));
	outputCodex("<b>Sexes:</b> Male and Female");
	outputCodex("\n<b>Height:</b> 8\' 0\" to 8\' 8\" at the shoulders. Roughly 9\' from tip to tail.");
	outputCodex("\n<b>Hair:</b> None.");
	outputCodex("\n<b>Eyes:</b> Large, featureless black orbs.");
	outputCodex("\n<b>Ears:</b> Small ear-holes above their gills.");
	outputCodex("\n<b>Tails:</b> Lurelings have short, thick tails growing from their haunches.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Power of the Lurelings"));
	outputCodex("Lurelings are a native species of the icy moon of Uveto VII, and are one of the most dangerous creatures encountered on the world - when they wish to be. Lurelings are an aquatic species of exceptional intelligence (generally believed to be at ausar/human levels or higher), yet their deep-sea origins and physical inability or cultural refusal to make contact make their motivations and goals all but unknowable. Lurelings are perfectly capable of communication, yet refuse to make their presence known to, much less discourse with, the colonists unless the given lureling is in immediate and overwhelming distress.");
	outputCodex("\n\nWhat <i>is</i> known about them, however, is that lurelings are very large, very ugly amphibians resembling something between a frog and an angler fish, with four stubby legs propelling a teardrop-shaped body that supports an immense head. Their heads play home to a large, circle-shaped mouth filled with concentric rows of teeth that rotate like a drill, allowing the lureling to tunnel through surface ice with ease.");
	outputCodex("\n\nWhat makes lurelings truly interesting - and dangerous - to the Uvetan colonists, however, is their native psionic ability and how they manifest it. Like several other native species (such as the frostwyrms and milodans), lurelings have developed extranormal mental powers, and thus far all encountered lurelings possess this power, rather than only a select few individuals as with most psionically active species. Also abnormally, all known lurelings exercise the same mental power: the ability to dominate and control others.");
	outputCodex("\n\nThe lurelings’ mental domination seems to be an understood and integral part of the ecology of primitive Uvetan species, and has been for many millenia. Each lureling finds and dominates a single, weak-willed surfacer by projecting its mental powers through the ice (usually while the intended victim is sleeping or otherwise vulnerable). Once a lureling asserts its mental dominance, the bond is usually permanent, and the victim will spend the rest of his or her life as a puppet (called “marions” by the locals) to their lureling master, following it from above the ice.");
	outputCodex("\n\nWhile that alone would be cause for great concern among the natives, the lurelings have asserted and confirmed their intelligence in a most horrifying way: research indicates they <i>breed</i> their marions, creating bloodlines particularly well-suited to serving a lureling. Specific traits such as obedience, stamina, and even beauty have been shown to take preference among species bred by lurelings. Young lurelings will often take control of newborn or young children born of their parents’ marions: some speculate that breeding puppets is associated in some way with the lurelings’ own breeding season.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Marions"));
	outputCodex("The primary purpose of a marion seems to be twofold: marions provide visual information to their masters, acting as eyes above the water and helping to find food, shelter, and other resources their masters may desire. Beyond mere visual data, it seems that a lureling’s mental feedback from its marion is so strong that it can feel sensation and emotion back through its psychic connection. This leads to the second, and more curious purpose: lurelings frequently have their marions wander the frigid wastes, where they inevitably come across other humanoids: usually enessa or korgonne, but ausar colonists or human adventurers seem to suit them just as well. Upon encounter, the marion will offer herself sexually to the target, eagerly pursuing intercourse until the mark eventually gives in or flees. Lurelings appear to command their marions to do this entirely for pleasure, and some unsuspecting ausar have reported hearing orgasmic roars and tremors in the ice after causing a(n unbeknownst to them) marion to climax.");
	outputCodex("\n\nThis behavior certainly explains the tendency of lurelings to breed their puppets for beauty and sex appeal, making them more likely to secure the affections of unwary colonists.");
	outputCodex("\n\nUvetan natives have a complex relationship to marions. Most marions today appear to be descendants of purpose-bred creatures, rather than kidnapped villagers, and thus other surfacers show markedly less aggression towards lurelings and marions than was anticipated by researchers. Marions (and thus, the lurelings following them under the ice) are even allowed to wander freely in some villages, and find shelter there during harsh weather. Some natives, particularly milodan males, find it a great honor to be chosen to breed with a marion, as they believe this proves they are of exceptional strength and charisma. Other natives, particularly enessa, shun marions, and sometimes even assault them if the puppet proves too amorous for the huntress’s liking.");
	outputCodex("\n\nThis more aggressive behavior is likely because the vast majority of modern-day lureling marions are of enessa descent, though many have been altered considerably after many thousands of years of careful crossbreeding. These modified enessa usually follow the same physical form of their parent race, though different lurelings seem to prefer different sexual characteristics: some marions have been bred into pure, phallus-less females; others into masculine creatures in stark contrast to the enessa norm. Others share traits and characteristics of other races such as a fur coat like a milodan or korgonne, while others (especially recently) display ausar-like traits such as patchwork fur, heavier body fat, and seasonal heats and ruts.");
	outputCodex("\n\nDespite all of this, the lureling-marion relationship does seem at least somewhat symbiotic (especially among those marions purpose-bred for their role). In exchange for pleasure and scouting, the lureling usually provides its marion with an abundance of food the creature hunts below the waters, and can be counted on to find good shelter and necessary clothing and other supplies its marion needs. Some have even been recorded providing gemstones and other precious substances from the in-world sea for their marions to trade for what they need. More importantly, the lureling provides extremely effective protection for its puppet, and few if any marions ever need fear for their safety.");
	outputCodex("\n\nA few marions have been separated from their lureling masters (including one specimen “rescued” by the authors of this codex, who broke the psychic connection by taking the marion - a young adult enessa female - off planet, out of her master’s mental reach). Those who were psychicly dominated during adulthood generally only remember bits and pieces of their captivity, and after some rehabilitation, can be reintegrated into society. Purpose-bred marions, such as the descendant enessa species, have a much more difficult time, as they have never been forced to think for themselves. These marions, however, seem to remember most if not all of their lives, and once trained to speak, do so with fond remembrance of their “papas” or “mommas.” Throughout post-separation adulthood, ex-marions remain extraordinarily weak-willed, easy to influence, and remarkably trusting. They are also, however, eager to please and hard working, and do indeed possess exceptional physical traits including strength and charisma, which may prove advantageous. For their own sake, most must be cared for by a village of their native species (or a responsible, caring researcher, as the case may be).");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Despite their psychic powers, lurelings are surprisingly non-violent: if they intend to harm a surfacer, it is usually through psychic assault or domination at night. Even then, though, lurelings seem to have little or no interest in altercation with surfacers: most of their interactions are through their marions seeking sexual intercourse (sometimes in exchange for shelter or resources the marion needs to survive). The only time a lureling has ever been provoked to direct violence is when a surfacer assaults a marion. This behavior is almost universally met with instant and overwhelming retaliation, with the lureling bursting up from the ice and crushing, eating, or dragging the assailant under the ice. Perhaps this is why marions are welcomed peacefully into some native villages...");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("Lurelings themselves seem to have shark-like behavior, rarely staying still for any length of time. They make no permanent homes, and migrate around the ice a few dozen kilometers around humanoid settlements (particularly those korgonne and milodan villages which welcome their marions). Because the psychic connection to their marions is distance-based, lurelings must inhabit the water very near to the surface, and stay within a few hundred meters of their marion.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("As lurelings themselves are secretive and averse to contact with settlers (aside from through their marions, at least), little is known about their biological processes. Several researchers studying them have, however, postulated that the breeding of marions seems to be related to breeding more lurelings, as the newborn children of the puppets are almost immediately dominated in turn by young lurelings (who themselves are only strong enough to control a young and unresistant mind). Some speculate that breeding marions may even be necessary for the lurelings’ reproduction, as this may psychically trigger some sort of breeding response in the creatures. This seems to be corroberated by several native legends and stories telling of whole families of marions encountered in secluded places in the ice-caves, raising their children as their lurelings raise their tadpoles before eventually separating.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Lurelings");
}
public function milodanCodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["MILODANMALE","MILODANFEM","MILODAN_PRIESTESS"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Milodan"));
	outputCodex("<b>Name:</b> Milodan");
	outputCodex("\n<b>Sexes:</b> Males and Females, Rare Hermaphrodites");
	outputCodex("\n<b>Height:</b> 5\' 10\" to 7\' 5\". Males are significantly taller than females.");
	outputCodex("\n<b>Hair:</b> Milodans have longer patches of fur atop their heads, which can vary in color from their fur patterns. Typical coloration includes black, light or dark blue, orange, or gray.");
	outputCodex("\n<b>Eyes:</b> Slitted, feline eyes. Coloration is similar to that of humans.");
	outputCodex("\n<b>Ears:</b> Milodans have large feline ears, which can stand erect or swivel around on top of their heads.");
	outputCodex("\n<b>Tails:</b> Milodan females have long, bushy tails. They are prehensile and both quite dexterous and emotive, similar in many ways to that of an ausar’s. Males, on the other hand, have short, stubby tails with little range of motion. Males’ tails are fluffy, but neither sensitive nor as expressive as a female’s.");
	outputCodex("\n<b>Fur:</b> Milodans are covered from head to toe in a layer of thick, insulating fur. Typically, their patterns include much darker fur on the tails, shoulders, hands, and feet, with stripes all across the limbs. Both sexes have a particularly thick tuft in the center of the chest, between the female’s breasts. Native Uvetan milodans typically have white, light blue, or silver fur; uplifted ones often modify their coats to better suit their environment.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Combat"));
	outputCodex("Milodans are capable combatants in their native, icy home of Uveto VII. Both sexes have long, sharp claws on all four limbs, and sharp down-pointed fangs - males’ being considerably longer and more pronounced than the females’. Both sexes have considerable physical strength and dexterity, and among those who remain on Uveto, they are famously adept with spear and bow. Like most humanoids, milodan prefer to use weapons when they can, both for hunting and for combat.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs"));
	outputCodex("Milodans are native to the icy core world of Uveto VII, and make up one of the largest population groups on the planet. While the korgonne prefer the mountains and tunnels in the ice, milodan typically inhabit the coastal regions along the craggy Glacial Rifts near the equator. Most live in permanent and walled settlements, living as hunters or fishermen. Their fur acts as both a protection from the harsh elements and as camouflage, making them particularly well-suited to the harsh life their environs offer them.");
	outputCodex("\n\nUplifted milodan can inhabit any environment, though they typically find themselves most comfortable in cold-weather climates, or on planets with a great deal of open space for them to stretch their legs. Milodan are rarely satisfied with cramped space-borne life for long.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Milodan reproduction is completely typical for humanoid mammals, with males penetrating females in order to inseminate and impregnate them. Male phalluses are fundamentally feline in shape, ranging from 8 to 12 inches with rings of concentric nodules along the crown, and a thick knot-like bulb around the base that engorges during sexual arousal. Female vaginas are somewhat larger and more receptive than a human’s, with a particularly pronounced clitoris, sometimes growing well over an inch in length. This, combined with the male’s bumpy ridges, makes intercourse quite pleasurable for them.");
	outputCodex("\n\nMilodan mating sessions can last for hours, in part due to the participants’ tremendous stamina and endurance, and in part because the male and female will continuously try and vie for dominance, typically insisting on repeated bouts of sex in order to take control of the situation from the other. When the participants finally tire out, or one has been completely dominated by the other, the male will force his knot into his partner to bind them together, helping to ensure impregnation.");
	outputCodex("\n\nFemale milodan are infertile for much of the year, only occasionally entering heat phases - usually once per six months, and lasting about two weeks. During this time, the female usually becomes much more aggressive, especially towards attractive males or hermaphrodites (of her race or any other). On Uveto, this usually results in several mating sessions with several different males until the heat ends. Uplifted milodan usually either take suppression treatments to help control their heat-period’s overactive libido and aggression, or take gene mods to gain a more human-standard reproduction cycle.");
	outputCodex("\n\nOnce impregnated, the female milodan will undergo a relatively brief pregnancy - about four months - before giving birth to a litter of live kits. Average litters are between three and five, and kits are completely helpless for several weeks after birth, both blind and needing to breastfeed.");
	outputCodex("\n\nMilodan children grow to adulthood over the course of 16 years, and have a life expectancy of about 50 years on Uveto, or upwards of 70 after upliftment.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Culture & Society"));
	outputCodex("Unlike most of the sapient Uvetan species, the milodan were subject to a semi-successful Confederate uplifting program. Spearheaded by the Akkadi group, an organized program to make peaceful contact with the milodan was launched shortly after initial colonization and a few brief skirmishes between local tribes and colonists. While such efforts largely failed among the other races, some milodan tribes realized that cooperation with the U.G.C. was the way of the future. Several centuries later, these milodan tribes have spread across the stars, integrating with Confederate society.");
	outputCodex("\n\nToday, they’re well known as mercenaries and solid workers who adapt well to hostile frontier environments. There are few all-milodan colonies, but they have integrated quite well on ausar and kaithrit worlds.");
	outputCodex("\n\nThe milodan who remain on Uveto are largely unchanged from their primitive origins, living in coastal villages made up of tents, ice structures, and material salvaged from offworlder expeditions. Villages are ruled by an elder, usually a veteran hunter or shaman of some sort who acts as the tribe’s matriarch or patriarch. Milodan are notoriously independent, however, and village leaders act more as advisors and wise-men to their tribesmen.");
	outputCodex("\n\nMale and female milodans share hunting and salvaging responsibilities. The males are more aggressive towards outsiders, deeming them a threat whereas the females, whilst fierce, are the friendlier face of their tribe. Both male and female milodan will attempt to be dominant in their sexual advances, especially when they couple with offworlders or members of other species. This can easily escalate into outright assault from females in heat or males who believe their territory is threatened, ending only when the target of their aggression has been thoroughly bred.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Milodan");
}


/* Phaedra II */

public function divraniCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Divrani"));
	outputCodex("<b>Name:</b> Divrani (singular and plural)");
	outputCodex("\n<b>Sexes:</b> Male and Female. Females become similar to hermaphoridtes when bonded with a radglow plant.");
	outputCodex("\n<b>Height:</b> Divrani are short compared to most other Xamdam races, with both sexes standing between 4\' 10\" and 5\' 5\".");
	outputCodex("\n<b>Hair:</b> Naturally bald. Once bonded, divrani grow a thick pate of slender, styleable flowering vines from their scalps. Usually green, but browns, whites, and blue-green colors are not uncommon.");
	outputCodex("\n<b>Skin:</b> Divrani skin is naturally made up of body-wide soft, supple scales similar to those of an ovir. Upon bonding with a radglow plant, their skin becomes much smoother and covered with a thin gloss of oil. It takes on a very latex-like quality, and the divrani’s tactile sensation increases dramatically.");
	outputCodex("\n<b>Ears:</b> Small, reptilian ear-holes. Usually hidden beneath the hair.");
	outputCodex("\n<b>Eyes:</b> Divrani eyes are large, and usually colored red, blue, or green.");
	outputCodex("\n<b>Horns:</b> Divrani of both sexes have small, rounded horns growing from the top of their heads. These can range in size from an inch or two to almost half a foot in length.");
	outputCodex("\n<b>Feet &</b> Legs: Divrani legs are large and reptilian in shape, with broad, flat paws tipped with three claws.");
	outputCodex("\n<b>Tails:</b> Long and thick reptilian tails that taper down to slender points. Divrani tails, once bonded, are especially smooth and oily compared to the rest of their skin.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Divrani are a race of small, often heavyset or overly voluptuous reptiles native to the oceanic coastlands once common on Xamdam. At birth, the species is covered with pink, blue, or green scales, with flat, noseless faces bear a pair of raised vertical nose-slits and covered ear-holes. They are bald, with small horns and large, clawed digits; especially of the feet, which they use to navigate difficult and often wet or muddy terrain. Males are naturally slight and somewhat effeminate, difficult to tell from females of the race save for their general lack of breasts. They have reptilian phalluses, with bulbous knot-like bases and ending with a tapered tip. Their phalluses are relatively small for their size, but the knots are extremely thick, nearly as much so as a divrani’s fist. Females have correspondingly large, highly lubricated vaginas and overly wide hips meant to both accommodate the males’ thick sex as well as the large eggs their copulation results in.");
	outputCodex("\n\nHowever, a divrani’s appearance generally changes drastically early in their life, when they become bonded to the plants called “radglow.” The plants have developed a unique relationship with the divrani since the Glass War, with seedling radglows able to infest young divrani and bond to their nervous system. This changes the appearance of the host in several ways, as described below.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Radglow Bonding"));
	outputCodex("Shortly after a newborn divrani hatches, its parents will seek out or produce a seedling radglow plant - a native species to Xamdam’s stayglo lake that adapted a way to filter out radiation it intakes. By bonding the plant to themselves, the divrani have found a way to naturally protect themselves from harmful radiation without needing help from the nukas or other more technologically advanced factions.");
	outputCodex("\n\nThe bonding has several effects on the developing divrani. The most obvious is the system of flowering vines that quickly grow from their head, allowing the symbiote plant to photosynthesize. Over time, the plant will cause the host’s scales to fuse into a single, fleshy carapace which secrets a fragrant, slick oil. Both sexes can develop lengthy prehensile vines, growing from the hands, shoulders, or even back, which the host controls as extra sets of limbs both for utility, defense, and sexual contact.");
	outputCodex("\n\nFemales (and more rarely, males) will develop large breasts wherein the radglow plant stores nutrient-rich nectar, and the flesh at their tips will split open and flower, creating a pair of petal-lined nipples that secrete it for other divrani to eat if need be, as well as to entice other species with its extraordinarily sweet scent and honeysuckle taste.");
	outputCodex("\n\nIn addition to the nipple-like growths, bonded divrani begin to secrete an extremely potent sexual pheromone once they reach maturity. This comes primarily from the oil on their skin, but also from the individual’s sex-organs, where the concentration is much more potent. The host is immune to the pheromone cloud’s effects, but other divrani and offworlders alike are not. The cloud causes intense arousal and suggestibility in those it affects, allowing the divrani to easily overwhelm others in order to help their symbiote plant reproduce.");
	outputCodex("\n\nWhile the divrani’s reproduction is unchanged after bonding, the plant’s reproductive systems causes an intense mutation in the host. Members of both sexes grow a phallus-like organ above their natural sexes. Near the age of sexual maturity in the host, this organ has grown into a large, pulsating, constantly-leaking “lotus”: similar in shape to a pinecone, but made up of soft, wet petals growing from a single semi-hard root. The lotus-phallus does not have a traditional urethra, but rather ejactulates outwards from thousands of small slits between the petals. According to early research, these organs are constantly producing an over-abundance of the symbiote’s seed, which leaks out at the slightest touch or hint of arousal.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction (Radglow)"));
	outputCodex("When a divrani subdues a female of another species through its pheromone seduction, it will usually attempt to breed the victim with this additional phallus. Penetration is difficult and messy due to the organ’s pliability and leakage, but fertilization is highly likely due to the sheer output of plant seed. Due to their parasitic, mutagenic nature, the radglow is able to fertilize nearly any species known. Rather than produce a hybrid offspring, however, it uses the female’s egg as a catalyst to create a seed of its own - such offspring are always radglow seedlings.");
	outputCodex("\n\nA radglow “pregnancy” takes about two weeks to complete, growing to a little bigger than a human fist within the female’s womb. During this time, the hosts’ vagina will become much more wet, similar to a divrani, to help ease the seed’s passing. Once the term of pregnancy has come to completion, the female will deliver the seedling much as if it were an egg or infant of her own race. The seedling is helpless for the first hour or so as its first roots and first petals fill out, after which it can either be planted or bonded in order to facilitate growth.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction (Divrani)"));
	outputCodex("When a female and male divrani meet, their mutual pheromone clouds will often render both incredibly aroused and eager to breed. Reproduction between bonded divrani is effectively identical, with the male inserting his non-floral penis into the female’s vagina and, when nearing climax, using his bulbous base to tie them together to ensure insemination. Female drivrani are fertile year round, though they do enter twice-yearly “heat” cycles of increased fertility and libido, typically lasting two weeks each.");
	outputCodex("\n\nNormal pregnancy results in a single over-large egg being formed in the female’s womb, growing to melon size in the course of about four weeks. At this stage, the female will experience a dramatic increase in vaginal wetness and sensitivity. Orgasm virtually always ensues during the egg-laying, after which the female rapidly recovers her mobility - though increased wetness is usually permanent. The egg must be tended to for an additional two weeks, whereupon it will hatch into an infant davrani. Infants are largely helpless, feeding primarily on the mother’s nectar and soft food until its teeth come in.");
	outputCodex("\n\nDavrani reach maturity after about two standard years, and can live for up to eighty naturally.");
	outputCodex("\n\nMale divrani likely can breed with off-worlders and other native females, though in these instances the bonded plant will usually attempt to spread its seed instead. No research is yet available regarding divrani-offworlder pregnancies, though rumors from nuka females indicate that such couplings do indeed result in their laying eggs. Similarly, male hyraxx claim that they are able to cause female divrani to produce live offspring.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History & Society"));
	outputCodex("Divrani are a naturally solitary species, and there are few to no records of their having possessed a social structure of note before the Glass War. It appears they were simple hunter-gatherers living on the coastlands, well removed from the larger nuka and hyraxxi settlements. At best, records indicate hyraxxi commonly took divrani as slaves in pre-industrial times, apparently quite taken with the way the females grew heavy with eggs.");
	outputCodex("\n\nPost Glass War, divrani are not much changed in terms of social structure, remaining isolated individuals. However, the instinctual need to help their symbiote plant breed, as well as the protection afforded by their aromatic aura, has made most divrani much more extroverted and promiscuous. They seek out mates of other races with growing regularity, and are much more likely to attempt to trade with other races (typically trading their nectar for tools or more exotic food).");
	outputCodex("\n\nUnfortunately, the breeding instinct of some individuals is elevated to the point that the divrani simply won’t take “no” for an answer, and attempt to force themselves on those strong enough to resist simply giving in to their aroma. This behavior has made them dangerous to off-world explorers.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("Davrani were primitive before the Glass War and remain so now, with little technology of their own. Some learn to use weapons or tech from other native races, especially nukas, but as the divrani have no organized society, and their lusty aroma makes extended contact with others difficult at best, they have little hope of self-advancement. Confederate sources indicate that Uplifting existing members the race will be very difficult, as will integrating them into society, unless they are separated from the radglow plant.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Divrani");
}
public function hyraxxiCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Hyraxxi"));
	outputCodex("<b>Name:</b> Hyraxx (Singular), Hyraxxi (Plural, Adjectival)");
	outputCodex("\n<b>Sexes:</b> Male and Female. Males are exponentially more common than females, perhaps 80% or more of the population. Note “Dual-soul” under Appearance.");
	outputCodex("\n<b>Height:</b> Average 6\' 3\" to 6\' 9\" (Male) or 6\' 10\" to 7\' 5\" (Female)");
	outputCodex("\n<b>Hair:</b> Thick, lustrous, and extremely soft hair covers the head, and similar fur coats the forelimbs and tail. Pubic and facial hair is noted to be exceptionally silky and smooth. Hair colors range from stone gray to dark browns and blues. Some rare cases of cyan blue or cream-white occur, especially in females.");
	outputCodex("\n<b>Skin:</b> Hyraxx have exposed skin on their upper limbs, torsos, and faces. Most Hyraxx are dark-skinned, ranging from coal-black to tans and brown. A minority population has skin in shades of gray, with lighter colorations tending towards heavy freckling due to sun exposure.");
	outputCodex("\n<b>Ears:</b> Hyraxxi ears are feline in form, resting at the top of the head. They are sensitive to sound outside the human-sense spectrum, and swivel to and fro in response to even the slightest noise.");
	outputCodex("\n<b>Eyes:</b> Hyraxx have slitted, feline-like eyes with a myriad of iris colors. Their eyesight is exceptionally keen in the dark or in low-light, but hyraxxi vision is at best below average in daylight. Most wear heavy eye protection when forced out in the sun.");
	outputCodex("\n<b>Feet </b>& Legs: Hyraxx have digitigrade legs, with three large, clawed toes and a dew claw. Their legs are long for their size and extremely powerful, making them able sprinters and jumpers.");
	outputCodex("\n<b>Aging:</b> Hyraxx are relatively short-lived and fast growing, reaching maturity at about 10 years of age and living for up to 50 years.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Appearance"));
	outputCodex("Hyraxx are large, powerfully-built feliform bipeds native to Xamdam. The species stands on digitigrade legs with fur covering the extremities, and have expressive and thick-furred tails coupled with sensitive ears on the tops of their heads. They have bare, usually dark skin on the torso, head, and upper limbs. Some rare members have lion-like manes around their necks, and spotting of the fur is common. Females are noticeably larger, stronger, and more aggressive than males.");
	outputCodex("\n\nThe hyraxxi people were dramatically affected at a biological level by their planet’s apocalyptic war. While they themselves keep little record, it can be surmised that at one point, the race was fairly evenly divided between males and females. In the generations that followed, the species’ birthrate rapidly declined and, notably, the ratio of male to female became more and more skewed. Very few hyraxxi births are female, likely less than 20%.");
	outputCodex("\n\nFemales who are born have a hugely enlarged, phallic-shaped clitoris and oversized labia that partially fuse together to obscure and shroud the vagina, making penetration very difficult and tight to even the males’ smaller phalluses. This enlarged clitoris is much more sensitive than a male’s phallus, and can become at least partially erect (fully erect in some cases). Evidence, especially the highly-encouraged submissive, sexually receptive role of males in Hyraxxi society, indicates it is commonly used for the penetration of others. However, this enlarged female sex also hampers both birth and insemination, putting yet another obstacle in the way Hyraxxi fertility.");
	outputCodex("\n\nMales are comparatively slender and less muscular than females, with appearances varying from girlishly effeminate to chiseled masculinity. Males have a normal phallus-and-testicles combination between their legs, with a hybrid manhood tucked into a sheath. Their penises can grow from 4 to 8 inches when erect, come in shades from blood red to black, and have a single large knot at the base. The crown is tapered and covered in rings of small, sensitive bulbs of flesh.");
	outputCodex("\n\nThe hyraxxi also have a “third gender,” so to speak., that has arisen in the wake of the radiation bombing. These intersex individuals, commonly referred to as “dual-souls” by their people, are biologically male hyraxxi that were likely originally female in the womb, but partially changed during gestation. In adulthood, these individuals grow to a female’s size and shape, including breasts, feminine features, and even the ability to induce lactation - the only indication of masculinity is their sexual organs, which are distinctly and completely male. Dual-soul hyraxx make up an additional 10-15% of the population, and are generally treated as women culturally.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexuality"));
	outputCodex("The hyraxxi are quite promiscuous sexually, especially among men. With low chances of mating with a female of their race, hyraxxi males are rather well-known on Xamdam for pursuing inter-species relations, high rates of homosexuality (especially with each other), and for their high libidos and easy-going attitudes towards sex. Males that don’t belong to a tribe are often integrated as prostitutes or harem-members in other species’ settlements.");
	outputCodex("\n\nFemales and dual-souls of the race, on the other hand, have dramatically different outlooks towards sex. Given that hyraxxi males are submissive by nature, especially towards females in the hopes of reproducing, feminine members of the species frequently use their tribe’s males for relief of tension and sexual frustration, using their penises or over-sized clitorises to anally penetrate the male (or, more rarely, allow him to anally penetrate her). Couplings are considered pleasant but meaningless at best, and hyraxxi do not constrain this sexual activity to their mates. While males may use this behavior to ingratiate themselves to a female in hopes of proper mating, the other genders frequently take multiple passing partners, sometimes in large numbers at once.");
	outputCodex("\n\nParadoxically for such a sexually active race, actual mating (ie, vaginal penetration) is extremely rare, taking place only between mated pairs. Hyraxxi mate for life, usually with a single partner though sometimes to two or three males or dual-souls to a female, and form extremely close familial bonds. While members of these bonds still may engage non-vaginal sex outside the family, reproductive intercourse is strictly confined for both male and female to their mates. Unlike outside the family, where females rule with all but unquestioned authority, members of all sexes share equal responsibility and authority.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Hyraxxi reproduction is, despite everything, relatively unremarkable. Though it is difficult and often requires external devices and a great deal of lubrication, male or dual-souls penetrate the female vagina and inseminate her. When successfully impregnated, a female hyraxx grows gravid and eventually gives birth to between 3 and 5 kits. Pregnancy lasts for about five months, during which time she becomes largely helpless due to her large size, and her breasts grow up to three cup sizes due to the onset of lactation.");
	outputCodex("\n\nHyraxxi childbirth is typically awkward and painful for the mother, with most preferring C-Section over natural birth due to the extremely tight, difficult-to-open vaginal passage. After birth, the mother and her mates care for the children for about a decade before they reach adulthood, at which point they join the tribe as equals to their parents. Young hyraxx kits tend to be rambunctious explorers as soon as they learn to walk - a real handful for the inexperienced - and are highly energetic.");
	outputCodex(blockHeader("History & Society"));
	outputCodex("Hyraxx society is highly tribal, consisting of roving bands of nomads that scour the wastelands for resources, usually consisting of thirty to fifty families. Most tribes are led by a Matriarch, a veteran warrior female who dueled the previous Matriarch and won. The Matriarch is not an absolute ruler, but more like a “first citizen,” someone who guides the many families and helps them work together for the good of the tribe.");
	outputCodex("\n\nDifferent hyraxxi tribes rarely cooperate, preferring to stay well away from each other in the interest of resources and mitigating the chance of infighting. Hyraxx are infamous on Xamdam for holding grudges, even compared to the Nukas who have been in ideological conflict for generations. There is little more important to a hyraxx, especially a female, than her perceived honor. Skill at arms, sexual prowess, and cunning are all points of contention that hyraxxi are particularly sensitive about.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Technology"));
	outputCodex("Hyraxxi naturally have a strong affinity for large, powerful vehicles due to their nomadic nature. While high tech is rare on their world, the hyraxx of all remaining races on Xamdam have almost religiously maintained their vehicles. Trucks, buggies, jetbikes, and sports cars are all frequently seen in Hyraxxi camps, amongst huge cargo crawlers that transport a tribe’s heavy belongings. They are extremely adept at vehicular combat, preferring lightning-fast skirmishes over protracted combat.");
	outputCodex("\n\nOther than that, Hyraxx technology is unremarkable for their planet. Robotics, functioning firearms, and computers are relatively rare but not unheard of amongst their tribes. Most hyraxxi warriors, especially feminine ones, prefer to fight with spears and polearms (preferably from the side of a high-speed car or bike).");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Hyraxxi");
}

//Introduction to the Spinarrans 
public function spinarranCodexEntry():void
{
	clearOutputCodex();
	showBust("KIRILA")
	outputCodex(header("Spinarrans"));
	outputCodex("<i>Metallic arachnid creatures whose genders come in two different styles of terrifyingly intriguing.</i>\n\n");
	
	outputCodex(blockHeader("Driders"));
	outputCodex("<i>Amazonian, eight-legged behemoths.</i>");
	outputCodex("\n<b>Name:</b> Drider (Singular), Driders (Plural)");
	outputCodex("\n<b>Sexes:</b> Female.");
	outputCodex("\n<b>Height:</b> Average 8\' to 9\' tall.");
	outputCodex("\n<b>Weight:</b> Between 500 and 700 pounds.");
	outputCodex("\n<b>Hair:</b> Finger-thick chitinous locks, vaguely resembling human dreadlocks at a glance.");
	outputCodex("\n<b>Skin:</b> Head-to-toe metallic chitin. Various patterns and colorations are possible depending on diet, region, and parentage.");
	outputCodex("\n<b>Ears:</b> Appear at a glance as metallic flanges on the side of the head, complemented by a pair of insectile antennae on the brow.");
	outputCodex("\n<b>Eyes:</b> Three vertically arranged pairs, each larger than the one above. Coloration is typically red, blue, green, or gold. Pupils are vertically slit against a solid background with no visible definition between sclera and iris.");
	outputCodex("\n<b>Body Type </b>: Humanoid upper body with a spider-like lower half. Two arms, eight arachnid-style legs, and a large abdomen. Forelegs display a notable increase in size and strength over the remaining limbs.");
	outputCodex("\n\n");

	outputCodex(blockHeader("Arachne"));
	outputCodex("<i>Four-armed, spidery humanoid males.</i>");
	outputCodex("\n<b>Name:</b> Arachnid (Singular), Arachne (Plural)");
	outputCodex("\n<b>Sexes:</b> Male.");
	outputCodex("\n<b>Height:</b> 5’11” - 6’6” tall.");
	outputCodex("\n<b>Weight:</b> Between 160 and 190 pounds.");
	outputCodex("\n<b>Hair:</b> Finger-thick chitinous locks, vaguely resembling human dreadlocks at a glance.");
	outputCodex("\n<b>Skin:</b> Head-to-toe metallic chitin. Various patterns and colorations are possible depending on diet, region, and parentage.");
	outputCodex("\n<b>Ears:</b> Appear at a glance as metallic flanges on the side of the head, complemented by a pair of insectile antennae on the brow.");
	outputCodex("\n<b>Eyes:</b> Three vertically arranged pairs, each larger than the one above. Coloration is typically red, blue, green, or gold. Pupils are vertically slit against a solid background with no visible definition between sclera and iris.");
	outputCodex("\n<b>Body Type </b>: Typical humanoid, excepting for a second set of arms below the first. Both secondary arms are tipped with diamond-hard chitinous growths in place of hands.");
	outputCodex("\n\n");

	outputCodex(blockHeader("Appearance"));
	outputCodex("Spinarrans are an insectoid species resembling arthropods. Males are a little taller than humans on average, while females are significantly taller. Metallic chitin girds their impressive height from their feet all the way to the crowns of their heads with few exceptions. Eyes, mouths, anuses, and genitals are the most visible weak points in their impressive biological defenses. Striking one is not recommended. Attempting to strike such a creature in such a small place is even more inadvisable.\n\n");
	outputCodex("Like arthropods, the females are much larger and stronger than the males, resulting in the atypical behavior of males carrying and birthing offspring. These males, known as Arachne, are humanoid in shape, with two legs and four arms. The females of the species, commonly referred to as Driders, are several feet taller and monstrous in shape, with a humanoid upper body like an Arachne, two arms and a head. The female’s lower body however, is like that of a giant spider, with eight long legs and an large arachnid like abdomen.\n\n");

	outputCodex(blockHeader("Biology"));
	outputCodex("Spinarrans originated from a large, rocky world called Spinarra in the Chelicera system of the milky way galaxy. This world, while larger than most Terra class worlds, is lighter, mostly due to the lower levels of heavy metals such as gold, iron, uranium and so on. However, their world contains abundant titanium, platinum, nickel, and palladium. Spinarra is a planet whose crust is riddled with tunnels and deep caverns made not by nature itself, but by the planets native species that live and thrive under the surface, the Spinarrans and the native rock worms.");
	outputCodex("\n\nWhile the Spinarran diet is technically omnivorous, they are primarily lithophagous, eating raw rock and metal. The minerals they eat are broken down by specialized chemicals secreted by glands in their mouth. These chemicals can be manually ejected by spinarrans as a defense or mining mechanism, but most of the time remain safely stored away from their oral cavity. This adaption is considered quite useful by interspecies couples.");
	outputCodex("\n\n<b>Advisory:</b> Have caution when kissing a spinarran. It is ill advised to kiss soon after eating as mineral compromising chemicals may still be present within the mouth.");
	outputCodex("\n\nIt is this unique diet that makes Spinarran’s a such a valued species. Spinarrans dig deep underground and eat the rocks and ore they dig up. Some of these minerals are used to make their remarkably hard metallic chitin and their carbon filament silk. The excess metal is expelled as waste in the form of concentrated metal spheres of astounding purity. When spinarran’s gorge themselves on metallic ore, it can force them to go through rapid molting, shedding their carapace to make a new one from the ore they are consuming. Over eating too causes them to repeatedly molt their refined chitin, which then can be melted down and be used. Their services as miners and prospectors are in high demand as all they have to do is be brought in and directed to ore veins; the Spinarrans will dig and eat to their heart’s content, making purified metal as they go.\n\nTheir sense of taste, sight, and smell are specially attuned to detect trace amounts of metal ore, helping them find rich sources of food. The metal, as well as their old discarded carapace, are valued trade goods that are sold into the galactic market for all manner of high end manufacturing.\n\nTheir silk is another valuable material; spun from the drider’s abdomen much like the way Terran arthropods make webs. Unlike other species of silk spinners, Spinarran webs are a flexible alloyed filament of carbon and titanium along with several other materials. A braided cable of Spinarran silk is nearly unbreakable, construction laced with it more durable, ballistic armor made from it resists heat from thermal weapons and is for the most part, bulletproof. Spinarran silk has the fascinating attribute of being able to conduct electricity well, even at standard room temperature. This gives it applications for power relay cables or in more general electronics.\n\n");
	
	outputCodex(blockHeader("Society"));
	outputCodex("Currently, the spinarrans have been adapting to the presence of the UGC and greater galaxy for the last one hundred and ninety years. Being a subterranean species, they are not particularly comfortable with space travel. Some spinarrans suffer acute agoraphobia if they look out a window into space. Their technology lags behind galactic norms in most areas; spinarran spaceships in particular make easy prey for pirates. In contrast, spinarran geothermal generators are well-known for their efficiency and reliability, making them popular choices for geologically active worlds. Similarly, spinarran industry has adapted technological innovations from the rest of the galaxy to refine their mining equipment.");
	outputCodex("\n\nSpinarrans are led by a unique individual: a special drider a foot or so larger than other driders. This empress can vary with appearance, mostly due to different metals in her chitin. Every empress has flecks or veins of gold in their carapace and a large crest of chitin atop their head. Her body also forms crystalline jewels at her ears, crest and along her lower body. The small, blue, luminous, teardrop shaped crystals help show the empress’s stature among her people. The empress is leaner than other driders, more speedy and sinuous. The Spinarran empress is an exceptionally intelligent and wise ruler as she inherits all the memories of the preceding empress and so on, so long as the chain of descendants is unbroken. Every empress lays only a single, glittering gold flecked egg in their lifetime, and the act is fatal to the drider, passing on her memories and her silk robes, to her offspring before dying shortly after. In ages past, this meant that the empress was to be celibate for her entire life before laying her egg near the end of her lifespan. Now there are drugs that can prevent a drider from laying her eggs, but even so, the empress often maintains the tradition of celibacy.");
	outputCodex("\n\nThe empress’s mate and egg are cared for as if they were the empress themselves, waited on hand and foot by servants, making sure their every need is taken care of. Once the egg is hatched, the newborn empress is carefully tended to and raised until she is ready to lead, usually by her 9th year though in some cases she has taken up her rulership as early as her 8th year or as late as her 18th. It has been told that if the empress were to be killed, another spinarran will become an empress, either by going through physical and mental changes to become the empress. At times, a drider may get extreme cravings for gold a week or so before she lays the gold flecked empress egg. In this case, the slate is wiped clean. The new empress is born without her predecessors’ memories. The current Spinarran empress is Empress Yalla Araemika Elerra the XVII.\n\n");
	
	outputCodex(blockHeader("Reproduction"));
	outputCodex("Driders (females) have ovipositors located on the underside of their spider body. These organs are quite large by terran standards - easily 16 to 20 inches long and 3 inches across. A small lump of flesh near the base is capable of engorgement upon climax, much like an ausar knot, in order to safely transfer eggs into the recipient. The tip is bulbous, with three grooves along the head. Upon climax, it opens to latch onto the cervix of a partner arachne’s womb.\n\nBy contrast, their secondary sexual characteristics are much smaller - B to C cup breasts at most. As there is no need for lactation, there seems to be little reason for their existence save for ornamentation.");
	outputCodex("\n\nSpinarran eggs are squishy, silvery, and gel-like in texture. Their surface is surprisingly durable and difficult to rupture. Additionally, drider eggs are much larger than their arachne kin - at least twice their size on average. When no eggs are ready for laying, the ovipositor merely releases a metallic, glue-like gel. Normally this would help to bind the eggs in place and provide additional nutrition.\n\n");
	//outputCodex("\n\nNarcotic venom caused intense euphoria, enhances sensations felt, excluding arousal.");
	//Arachne
	outputCodex("Arachne (males) also have ornamental breasts, though theirs are slightly larger (C-D cups). They also have wide hips to accommodate pregnancy. More interestingly, they have a feminine-appearing vagina and womb-like cavity. The entrance is smooth and glossy, puffing up when aroused. It is quite stretchy and pliant, to deal with the largeness of drider ovipositors.\n\nUpon successful mating, arachne immediately appear several months pregnant, making it quite easy to identify when a mating has occurred.");

	//outputCodex("\n\nMating and reproductive cycle");
	outputCodex("\n\nDriders and arachne are usually monogamous, though not always the case. Traditionally, driders will court an arachne for some time, then try and capture their prospective mate in webs. The arachne will fight and run to make sure the drider is strong and capable. Once captured, the drider then bites the arachne, injecting them with addictive, narcotic venom. However these traditions are not practiced so much in modern times. In smaller communities, the hunt is still practiced. In larger communities (and offworld settlements), spinarrans use different means to “hunt” their mates. These alternative methods include: dom-sub roleplay, collars, leashes, web bondage and envenoming. Traditionally, it is the female that courts the males, females being the larger eight legged members of the species. However since being discovered by the UGC some males have taken to courting their female counterparts in the style of more patriarchal species.");
	outputCodex("\n\nThe venom puts the Arachne into a state of blissful euphoria and keeps them from fighting back while arousing them at the same time. Once the Arachne has submitted to its mate, the drider then mounts their Arachne, mating until they climax. Driders typically lay between 6 to 10 eggs each reproductive cycle, with each batch of eggs only having 3 to 4 viable eggs. Extra eggs are absorbed as nutrients by the fertilized ones. Once the eggs are deposited, the drider begins mating their Arachne again. Driders will keep their lover bound and drugged for hours at a time, fucking them repeatedly. With each mating, the drider’s orgasms will fill the arachne’s womb with a thick jelly-like substance, packing its womb full of this gel. This filling serves two purposes: first, so the eggs can feed on its biomass as extra nutrition; second, to seal the womb shut and keep the eggs inside.");
	outputCodex("\n\nWhen the eggs are inside the arachne, they secrete hormones that cause the release of sperm from the carrier’s womb to fertilize the eggs. Afterwards, the newly impregnated arachne follows its drider mate, the pair staying together as long as they are both alive. The drider keeps its chosen mate for pleasure, continued reproduction, companionship, and shared protection. The arachne stays to keeps its source of narcotic venom, pleasure, reproduction, companionship, and the protection of their bigger, stronger drider mate.");
	outputCodex("\n\nSpinarran eggs gestate for 5-6 months inside their host before being birthed. In the week before birthing, the remaining gel within the womb changes composition, adhering to the eggs and gaining a kind of aphrodisiac, simulating pleasure centers as they are passed through the vagina. It is not terribly uncommon for arachne ‘mothers’ to come to orgasm at least once by the time birthing is complete. These eggs are then cared for until they hatch, a process which can take anywhere from 3 to 7 days. The newly hatched offspring are then cared for and raised by their parents.\n\nYoung spinarrans are born with fully functioning teeth and mineral dissolving glands. Parents often chip and break small rocks into tiny pieces for their young to eat. Mature spinarrans who have recently given birth can be re-impregnated within two weeks and particularly amorous or productive pairs get started with another clutch within days of birthing eggs.");
	outputCodex("\n\nMost Spinarran offspring reach maturity within 12-15 years.\n\n");
	
	outputCodex(blockHeader("Culture"));
	outputCodex("Spinarrans are a species that highly favors large groups. Their culture is very communal, and this is reflected in the way they govern themselves. On a small scale, individual broods come to a consensus on issues internal and external. On a large scale, Spinarrans are led by their empress, and she is aided by a senate of elected officials from every state in the Spinarran empire.");

	outputCodex("\n\nLarge broods are commonplace, typically between 40 and 60 members per family. Driders that come of breeding age normally are pushed out of their brood for a year or two to meet other broods. Successful meetings help to bond different broods tighter for mutual defence and resource sharing. For most Spinarrans, mated pairs are a single drider picking an Arachne they really like and taking them as a mate. It’s is not very common for driders to pair together or for arachne to pair together. While most broods lean towards monogamy some broods do lean more towards maintaining relationships with multiple partners. On some occasions, a drider will take multiple males as a harem. The culture promotes good companionship between mated pairs and the addictive nature of the driders narcotic venom makes couples much harder to break apart. In times past, the death of a mated drider almost certainly meant the death of the drider’s mate, with the withdrawal from their addiction to the drider’s venom giving them a slow, aching death. These days, synthetic venom can be used to wean a grieving Arachne off their drider’s venom until they are ready to find another mate. Some family members could even donate their own venom to their grieving sibling, parent or offspring, though this can result in awkward situations or acts of incest due to the euphoric nature of the venom.");

	outputCodex("\n\nSpinarrans are a subterranean species, normally sticking to the underground tunnels and caverns that riddle the crust of their planet. Some more adventurous or eccentric individuals form communities on the surface. Surface ventures are not easy for Spinarrans. Being creatures of the underground, their eyes are well adapted to low light and darkness. Surface light is harsh on spinarran eyes, and without protection, sunlight is near blinding to them. All spinarrans going onto the surface of their world or even into the light of foreign space stations wear goggles or fully enclosed helmets to protect their eyes from the harsh surface light.");
	outputCodex("\n\nDue to limited advances in some areas of technology and underground communities, the Spinarrans never put much thought toward long ranged weaponry like artillery or long ranged rifles. Instead, the tight confines and close quarters of tunnels and caverns made them more comfortable and suited with close ranged and melee combat. In older times, plate armor, swords, shields, spears were commonplace. In more modern times mono-molecular blades, thermal axes, electrical bludgeons, and energy shields are very common. Spears gave way to firearms briefly before being pushed aside for thermal weapons. Lasers and plasma are much more friendly to their caves then explosives and bullets, and today there is a total embargo on concussive and explosive weapons for all spinarran settlements.");
	outputCodex("\n\nIn modern times, spinarrans work together in combat. Arachne commonly ride driders into combat as heavily armored mounts, carrying heavy armor, laser weapons, and mono-molecular sabers. Some particularly strong driders are decked out in enough armor to serve as biological tanks - complete with abdomen-mounted canons.");

	//outputCodex("\n\nSpinarrans naturally spin silk to make webs to trap prey and mates. Unlike other creatures that make silk from their bodies, Spinarran silk is not suitable for regular clothing. The fine threads are in reality a tightly woven carbon filament with an extraordinary tensile strength. Since normal clothes are hard for spinarrans to wear, due to their Carapace and drider lower bodies, spinarrans go without clothing for the most part, most arachne just wear the bare minimum to cover their genitals. Some however do choose to have custom tailored clothing if they are around a lot of aliens. Of course should survival depend on it, such as if they were going to an environment that is very cold, they will likely put up with warm clothing for the sake of survival.");
	//outputCodex("\n\nWhile most species use clothes and makeup to change their appearance or make themselves look more appealing, spinarrans do things a bit differently. Most spinarrans adorn themselves in glittering gemstones and rare gold as fashion or keep to a particular diet of minerals to keep their chitin a certain color or design. A popular trend of fashion, is for spinarrans to visit what would be considered a mix of a tattoo parlor and a spa for most species. In these places, spinarrans relax in hot chemical baths before introducing a minor electrical current to undergo metallic anodizing in order to color their carapace different colors. Another way they do this is by sealing custom made patches of this chemical to the carapace to make specific designs, though this usually requires several applications to get all the details. The only spinarrans that do wear more normal clothing are soldiers. Warrior spinarrans, both drider and arachne alike wear armor and uniforms that most races would find to be archaic or low tech in that they wear dresses and coats of mail made from woven silk. While primitive in concept, the composition of spinarran silk makes this mail extraordinarily durable and resistant to heat, making it able to resist bullets and thermal weapons.");
	//outputCodex("\n\nThe arrival of off-worlders led to a few cultural changes for Spinarrans. While there already had been drugs to help natives deal with addictive drider venom, there had never really been a need for a cure until outsiders arrived. A kind of morning-after pill was developed that dulls the after effects of drider venom, and for the most part keeps non-natives from getting addicted to Spinarran driders after finding themselves in bed with one.");
	//FEN NOTE: Already mentioned weaning them off above.

	outputCodex("\n\nPrior to being discovered by the UGC late in the last planet rush, Spinarran life spans ranged from 60-70 years of age. Access to more advanced medicine this lifespan shot to an average of 150 years of age. With the comparatively fast pace of spinarran reproduction, this new lifespan has led to some overcrowding on Spinarra, prompting Spinarra to encourage whole broods to seek out colonies on other planets.");
	outputCodex("\n\nNaturally, spinarran gene mods were inevitable. Some such mods can give the full body chitinous exoskeleton, others can give the eyes, genitals, and even the driders’ narcotic venom fangs. Off-worlders taking arachne lovers are sometimes encouraged by more traditional lovers to get a set of venom fangs so they can devote themselves to their mate completely.");
	outputCodex("\n\nThere is yet some concern for spinarrans as unlawful harvesting of their natural venom in drug use could cause them to be a target for slavery or other criminal activities.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Spinarrans");
}

/* Illegal Items */
public function throbbCodexEntry():void
{
	clearOutputCodex();
	showBust("TANK_KANNON");
	outputCodex(header("Throbb, AKA Liquid Priaprism"));
	outputCodex("<i>“Some people grew dicks and balls so big they couldn’t move. Can you believe that?”</i> -Officer Penny Inoue, UGC Peacekeepers\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Throbb did not begin its life as an oft-scorned drug for degenerates and deplorables. The original hope was for an affordable pharmaceutical solution to replace missing genitalia or help those with fertility problems. Xenogen’s scientists succeeded a little too well. Yes, it could grow a penis on almost anyone. Yes, it boosted sperm/spore/genetic-information-paste density to levels that could easily impregnate most mates, but it did so much more than that.");
	outputCodex("\n\nGrowing or expanding genitalia produced a powerful, psychologically addictive euphoria akin to the feeling of an adolescent discovering his or her first love. What’s more, it also unbalanced the user’s endocrine system in much the same manner as puberty, resulting in a large but otherwise harmless increase in libido. Initial test subjects frequently requested additional doses, citing that “they weren’t big enough yet” or “they could be so much more virile.”");
	outputCodex("\n\nThe study was shut down, but the problems did not end there. Many who had partaken in the study eventually turned to sex work or wound up arrested for sexual assault.");
	outputCodex("\n\nAs a result, the scientists were ordered to reformulate the drug in order to minimize the side effects. Any success in suppressing the high or associated nymphomania brought with it a massive reduction in the efficacy of its desired effects. Xenogen had a drug that would push its users into deviancy or a drug that took dozens of doses and achieved essentially the same effect.");
	outputCodex("\n\nOne year later, the Throbb project was shuttered. Xenogen shares dropped 18.5% in trading due to the news but recovered later in the week thanks to the successful launch of Rainbotox.");
	outputCodex("\n\nThrobb’s synthesis was leaked to the extranet, and now most back-alley chemists can whip up a batch in a few days. Most newer model fabricators and molecule assemblers prevent its manufacture at a firmware level, citing UGC “Deleterious Drugs” statute, section 7, paragraph 4. Hacks to circumvent these restrictions are commonplace and easily attainable.\n\n");
	outputCodex(blockHeader("Method of Application"));
	outputCodex("Throbb requires injection into the area to be affected. Injecting it into non-reproductive areas may result in unwanted growths or bizarre sensitivity.\n\n");
	outputCodex(blockHeader("Legality"));
	outputCodex("The UGC prohibits chemical manufacturing equipment from being sold with the capability to manufacture Throbb, though the chemical itself is not illegal at the Confederation level. 97% of all UGC planets have outlawed the substance in one way or another. Many of the remaining 3% make a brisk trade on sexual tourism, often taxing Throbb heavily to subsidize medical and psychological treatment for addicts.\n\n");
	outputCodex(blockHeader("Known Effects"));
	outputCodex("<b>*</b> Sudden phallus growth.");
	outputCodex("\n<b>*</b> Abrupt phallus expansion.");
	outputCodex("\n<b>*</b> Testicle growth.");
	outputCodex("\n<b>*</b> Increased virility.\n\n");
	outputCodex(blockHeader("Known Side Effects"));
	outputCodex("<b>*</b> Dramatic increase to libido.");
	outputCodex("\n<b>*</b> Brief sexual euphoria.");
	outputCodex("\n<b>*</b> Spontaneous orgasm.");
	outputCodex("\n<b>*</b> Permanently reduced inhibitions.");
	outputCodex("\n<b>*</b> Increased genital sensitivity.");
	outputCodex("\n<b>*</b> Enlarged pleasure centers of the brain.\n\n");
	outputCodex(blockHeader("Known Users"));
	outputCodex("<b>*</b> Aileh Atru, porn star");
	outputCodex("\n<b>*</b> Juan Gartex, sex worker");
	outputCodex("\n<b>*</b> Kawthon Kandy, ultraporn star");
	outputCodex("\n<b>*</b> Rod Chrysler, former Vesperian Prime Minister turned porn star");
	outputCodex("\n<b>*</b> Tank Kannon, ultraporn star\n\n");
	outputCodex(blockHeader("WARNINGS"));
	outputCodex("Throbb is almost assuredly illegal. Do not use it. Should you come across any, turn it over to your local UGC Peacekeepers or planetary security forces. If you are on a planet where it is legal, avoid it all costs. It could ruin your life. (Attached is a short, anti-drug video clip. In it, a kaithrit is holding up a hotdog. She says, <i>“This is your dick. And this-”</i> Then she pivots and smacks face-first into the side of a tubular ship, rusted out with age. Rubbing her nose, she adds, <i>“...is your dick on Throbb. It isn’t going anywhere, and certainly not in me. Any questions?”</i>)");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Throbb");
}

public function soakCodexEntry():void
{
	clearOutputCodex();
	showBust("MITZI_NUDE");
	outputCodex(header("Soak, AKA the Slut Thrill Pill"));
	outputCodex("<i>“And when you first take it, your pussy feel really, really weird. Everything gets all puffy and swollen and almost rubbery looking, especially once the drooling starts. You’ll feel it happening, and you just can’t help but get wet enough to ride a tribe of raskvel.”</i> - Mitzi, Gabilani Soak junkie\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("The Soak project started after Tamani Corp’s CEO was utterly humiliated by the JoyCo representative during an exhibit of femininity-enhancement mods. It is said that Tamani’s pink complexion turned a beet-red shade after the competitor’s representative showcased their newest product, Tittyblossom, while making a rather unsubtle reference to the Gush fiasco from a couple of years before.");
	outputCodex("\n\nFueled by collective outrage, Tamani Corp poured inordinate amounts of resources into the creation of a product that would <i>“wipe the smirk off that bitch’s face,”</i> as the CEO herself said during a press conference, her words now immortalized in the extranet. Tamani’s choice was a pussy-enhancement mod that promised users a permanently lubricated, shapely pussy, along with increased sensitivity and fertility.");
	outputCodex("\n\nEarly results were promising enough, however in their zeal (or, as some say, their obsessive focus on carnality), Tamani Corp’s researchers went a little too far. What was supposed to be a small libido enhancement turned out to cause severe addiction, leading up to extreme levels of nymphomania. Participants from the focus groups also complained about permanent leakage from their vaginas, which made it impossible to wear normal fabrics on their legs, and to top it off, the vaunted fertility boost only came to one in every ten participants.");
	outputCodex("\n\nThe compound had been discovered only recently, so a few defects were to be expected, but <i>this</i> looked too much like the Gush incident. Before things could escalate into legal problems, Tamani Corp decided to shut down the project and fully disclose the results to the U.G.C. Drug Regulation Office (D.R.O.), which led to a universe-wide ban on Soak and similar compounds.");
	outputCodex("\n\nMany business specialists speculate that this was a deliberate move to stop other companies that were already experimenting with similar formulas. If Tamani Corp was to take a blow, its competitors would pay an even heavier price - JoyCo and Xenogen, in particular, had to shut down a number of projects that were nearing their final stages.");
	outputCodex("\n\nShortly thereafter, Soak’s formula was leaked to the extranet by an anonymous hacker who infiltrated the D.R.O. systems (and who is now widely regarded as a hero). Conspiracy theorists point to Tamani herself as the mastermind, saying she used her connections to facilitate the cyber-heist, because she wanted her creation to spread all over the universe.");
	outputCodex("\n\nThe truth will never be known, but it’s undeniable that this stunt gave the company’s image a nice boost among the rebellious youth. Since then, Tamani Corp’s shares have seen a subtle but steady growth that many staticians correlate to the rise in Soak’s underground popularity.\n\n");
	outputCodex(blockHeader("Method of Application"));
	outputCodex("Soak is a quickly-dissolving candy that can be taken orally, or used as a vaginal suppository. The latter method is often recommended for solo use, but many clubbers prefer the former, since it allows them to share a dose through kissing. U.G.C. Peacekeeper offices receive frequent reports of people getting unknowingly drugged in this manner.\n\n");
	outputCodex(blockHeader("Legality"));
	outputCodex("The U.G.C. prohibits the Soak compound, however it would be impossible to ban every single component of the formula, since most of them are also used in widely popular products. As a result, it is relatively easy to manufacture by back-alley chemists with the right equipment. Nowadays, Soak can be found in just about every underground party in a core planet, though it has only recently started to spread to rush planets.");
	outputCodex("\n\nGiven Soak’s rising popularity and the fact that it doesn’t carry very serious physical debilitating effects (not nearly on the same level as Throbb, at any rate), some sectors of the U.G.C. have been pressing for legalization of the drug, and the Health Department has been seeking better ways to offer mental care for addicts.\n\n");
	outputCodex(blockHeader("Known Effects"));
	outputCodex("* Intense euphoria for a few hours.");
	outputCodex("\n* Chemical and psychological addiction.");
	outputCodex("\n* A steep and permanent increase in the production of vaginal fluids.");
	outputCodex("\n* A steady increase in libido, often expressed by users as ‘cock craving’.");
	outputCodex("\n* Extensive vaginal swelling and enhanced sensitivity to pleasure.");
	outputCodex("\n* A stark increase in fertility, but only when overdosed.");
	outputCodex("\n* Nymphomania and permanently reduced inhibitions.\n");
	CodexManager.viewedEntry("Soak");
}

public function dumbfuckCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Dumbfuck, an Illegal Drug"));
	outputCodex("The drug colloquially known as “Dumbfuck” was originally designed as an all-in-one fertility treatment for couples having trouble conceiving by Xenogen Biotech. It was designed to rebalance hormones of males, females, and hermaphrodites to promote a stronger sex drive as well as slightly enhancing the reproductive capabilities of each. During initial trials, it was discovered that the drug and microsurgeon cocktail had a number of unintended side effects that brought about the cessation of all research into it.");
	outputCodex("\n\nThe first test subjects reported an increase in sensitivity and drive, as expected. Clinical tests also showed an uptick in fertility and virility well within expected bounds. What wasn’t within expected bounds were the subjects’ extreme reactions to undergoing an orgasm. The altered body chemistry and drugs combined to set off a cascade of neural activity upon climax.");
	outputCodex("\n\nThis neural cascades did not peak until a few minutes after orgasm at the earliest, often accompanied by at least one uncontrollable sneeze and slight draining of the sinuses. Further research determined that the sneezes were merely a side effect triggered by wildly misfiring neurons as they adjusted to new linkages. The end result of these linkages was a confirmed loss of intellect and an increase in libido and sexual pleasure - roughly one I.Q. point per orgasm, though some subjects experienced noticeably more or less.");
	outputCodex("\n\nMost subjects reported feeling “dizzy” or “a little confused” during their first few cascades. They seemed almost oblivious to their own rising desire or the way their brains were becoming increasingly obsessed with sexual pleasure. However, later on, they reported: <i>“like, feeling great when they sneeze out brains to make more room for sex!”</i>");
	outputCodex("\n\nBy this point, it was impossible to corral the sex-obsessed volunteers into taking part in any moderately challenging mental testing. Keeping them from fucking or masturbating while the drugs exited their system was nigh impossible. After the chemicals left their bloodstream, additional changes stopped, but they were left with a permanently diminished mental capacity and superhuman libidos.");
	outputCodex("\n\nA few were kept in house for further study. While superficially dumb, they mastered techniques both sexual and seductive with exceeding aptitude. They were still clearly capable of problem solving, just much, much more focused into a single discipline. One of the dumbest girls, Stacy \\\[REDACTED\\\] discovered that she did enjoy more general learning when coupled with masturbation. She went on to master advanced physics and currently serves as a Xenogen personal instructor using her unique talents.");
	outputCodex("\n\nIn conclusion, Xenogen Biotech created one of the first and most unusual bimbofication drugs. The company buried it deep until a Black Void hacker stole the code and chemical composition. Nowadays, an enhanced version of the stuff can be found in the hands of any moderately talented scientist with loose morals, though the U.G.C. declared it universally illegal in short order.");
	outputCodex("\n\nThe drug leaves marked, permanent changes in brain and body chemistry that make it easy to identify one who has used it.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Dumbfuck");
}
public function gushCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Gush"));
	outputCodex("<i>This is gush. \\\[Picture of gush\\\] This is your brain on gush. \\\[Picture of a tremendously swollen pair of breasts\\\] Any questions?</i>\n\n");
	outputCodex("<b>Warning:</b> Gush is presently illegal on over 96% of confederate worlds, almost certainly due to its addictive euphoria.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Effects"));
	outputCodex("Gush’s effects are somewhat unpredictable, but the two largest are a commencement of high levels of lactation and expansion of mammary glands and associated tissues, including nerves. Additionally, one of the most sought-after hallmarks of the drug is a sudden and total obsession with one’s own breasts, focused around the expression of lactic fluids and stimulation of the nipples. Other common effects are catalogued below:");
	outputCodex("\n<b>*</b> Increased libido. Some research claims that every dose brings with it an increase in libido, few scientists are willing to study such an outrageously illegal substance.");
	outputCodex("\n<b>*</b> Increase in ability to manufacture milk (or racially appropriate nutrient solution), resulting in a need for more frequent drainings.");
	outputCodex("\n<b>*</b> Conversion of fatty tissues into additional lactic storage glands.");
	outputCodex("\n<b>*</b> (Rare) Growth of additional nipples.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Gush is a substance that has run afoul of U.G.C. regulators ever since its creation decades ago at the hands of TamaniCorp researchers.");
	outputCodex("\n\nOriginally created to bolster milk production in mothers with difficulty expressing milk (or a racially-appropriate nutrient solution), the formula that would one day become “Gush” was found to be entirely too effective, swelling mammary glands to enormous proportions in a matter of minutes, triggering pleasure hormone cascades potent enough to bring a user to her (or his) knees.");
	outputCodex("\n\nThe original test subjects initially expressed only excitement and pleasure at their enhanced physiques, seemingly fascinated by the almost boundless, liquid weight contained within their chests. Many were observed heedlessly and repeatedly tugging upon their nipples, even after expressing every single drop. Only after a full fifteen minutes of such activity did the subjects, terran, ausar, and kaithrit alike, come to their senses, surprised and embarrassed by what they had done.");
	outputCodex("\n\nWhile some growth in mammary size is an expected part of inducing lactation, this level of tissue expansion proved shocking to the test subjects. Some expressed concern that it would be difficult to for society to take their top-heavy forms seriously. Others worried of back pain. TamaniCorp provided the necessary spinal and back augmentation treatments free of charge, of course, but the bulk expressed pleasure at the changes. Breast augmentation is readily available yet still an expense many choose not to pay. To get such an enhancement for free, as part of a study, was quite a windfall.");
	outputCodex("\n\nResearch budgets were doubled on the back of this unconventional success. Bureaucrats figured they could branch into another market. Gush would be cheaper than many methods of genetic alteration and less invasive than surgeries. A minor medical advance for expectant mothers was going to make them trillions the galaxy over, or so they thought.");
	outputCodex("\n\nWhen TamaniCorp opened its doors to applications for the second trial, it found itself flooded with requests from the initial group. To a woman, they had decided that they could do with bigger, milkier bosoms - besides, they had yet to test multiple dosages, right?\n\nThe company begrudgingly broadened the scope to include two parallel studies: the first, a larger version of the initial trial, and the second, a test to determine the safety of repeated treatments. Both would use an improved synthesis of the formula. The scientists behind Gush were determined to eliminate the bliss cascade that it set off in its users.");
	outputCodex("\n\nTheir efforts were for naught. The altered formula seemed even worse than their initial recipe. Subjects were recorded staring at their breasts as they expanded, their gazes increasingly vacant as their hands began to roam across their growing, increasingly fluid-filled busts. Those able to unerringly sought out their fellow test subjects, polishing their own skin and fur with glistening alabaster, collapsing into puddles of engorged teats, searching lips, and slippery skin.");
	outputCodex("\n\nAttempts to restore order were made, but the brave scientists who dared enter soon found themselves buried in breasts and soaked, blushing flesh, hard nipples thrust into their mouths until milk and slick handjobs transformed their protests into pleased gurgles.");
	outputCodex("\n\nAn hour later, bodies were disentangled, mops were brought out in bulk, and dazed scientists logged notes from above overfull bellies.");
	outputCodex("\n\nThe repeat trial, held in another facility, fared little better. Subjects were handed their doses in dermis-penetrating spraypens before the order to abandon the study came through. No one thought twice about the slightly elevated blood pressure and heart rate of the volunteers - both were well within acceptable limits, and if anyone smelled drenched, excited panties, they certainly neglected to mention it.");
	outputCodex("\n\nLeaked by an unscrupulous network technician, the bootleg holo-recordings of the ensuing orgy went on to become one of the most infamous videos on the extranet, downloaded at least 650 million times by extremely conservative estimates when debuted. Well-endowed women quivered and came to the sensation of their breasts ballooning into proper, milk-oozing tits, their eyes smoky with unrepentant need. Curvy mothers transformed into gushing sexpots over-endowed enough to pursue a career in ultraporn. No matter how unique or distinct their race, personality, or appearance, titanic, fluid-squirting boobs became the constant.");
	outputCodex("\n\nOne-way mirrors became white and opaque under a creamy deluge. Carpets became off-white sponges. What little furniture was available in the testing area was irrevocably stained with the sexual secretions of a half-dozen races. Ecstatic moans and throaty groans filled over two full hours of audio logs while the sight of orgasmically gyrating, milk-squirting bodies were lovingly recorded in full, three-dimensional detail.");
	outputCodex("\n\nThe Gush project was cancelled and the chemical formula deemed unfit for further investigation, to be locked away in secure archives with thousands of other rejected compounds, many far more mundane. The early testers were forced to go home bigger and milkier, their enhanced bodies craving more titty-fueled licentiousness.");
	outputCodex("\n\nIt would have ended there too, if the formula hadn’t been leaked along with the incident footage. Gush is too easy to synthesize to be kept from masses, and anywhere that illegal drugs or transformatives are sold, Gush will inevitably be found.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Gush");
}
public function treatmentCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("The Treatment"));
	outputCodex("The Treatment is something of an irregularity within the United Galactic Confederacy. A galaxy-wide ban on involuntary mind-control prevents similar perversions on other planets. The officially cited reason for this exemption dates back to New Texas’ first contact with the U.G.C. hundreds of years ago during one of the first rushes, and the reasons behind that even further.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History"));
	outputCodex("Before gate technology was discovered, numerous attempts at colonization were made using a combination of cryogenic technologies and long, automated spaceflights. New Texas was founded by one such mission, launched by colonists out of Houston. As part of an early population-building initiative, the Treatment was designed by top earth scientists as a means of ensuring high fertility and virility rates among the future colonists. This early form of the iconic mutagen was far less dramatic than the one that’s become famous today.");
	outputCodex("\n\nHowever, the agrarian society that sprung up on the recently christened “New Texas” quickly became something of a patriarchy. With most women pregnant and indoors, the men were free to run the planet as they saw fit, and as a consequence, gender roles regressed to terran pre-industrial levels. The few scientists on planet found this arrangement enjoyable and began modifying the Treatment in an effort to make their planet even more of a paradise, adding bull-like strength to males and enhancing the feminine libido and endorphin production.");
	outputCodex("\n\nChanges to the formula did not stop there. Over the centuries of isolation, the Treatment was gradually refined. Side-effects like bull-like horns, masculine animal genitalia, and increases in lactation were viewed as welcome blessings. The Treatment became an ingrained part of New Texas’ culture, a customary second puberty started at the age of eighteen. Women became euphoric, lactating, and sexually promiscuous in the extreme. Men gained in both physical and sexual endurance while celebrating enhanced genital size.");
	outputCodex("\n\nNew Texas’ technology never really advanced beyond what they brought with them. Indeed, it’s a miracle that the Treatment was as nuanced as it was at first contact.");
	outputCodex("\n\nU.G.C. diplomats were at first shocked, then pleased, then shocked before finally being pleased all over again by what they found on New Texas. It was agreed that forcing them to abandon their ways would lead to disruption on a global scale, and New Texas was allowed to continue on with the Treatment so long as it was never transferred off planet. Of course, U.G.C. scientists had to be given accumulated research data on it.");
	outputCodex("\n\nNew Texas remains today as a popular but exclusive tourist destination, though roughly 20% of visitors wind up immigrating. Being cleared to visit is a right often reserved to the rich or well-connected. This provides a secondary income source for the planet.");
	outputCodex("\n\nPopulation is now controlled via water-distributed birth-control, helping the planet to maintain an agrarian way of life.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Chemical Composition"));
	outputCodex("Only 20 percent of the Treatment’s composition is publicly available. Researching or distributing information on the other 80 percent is illegal without express dispensation from the Office of Galactic Affairs. The known portion is composed of a combination of sex hormones, reprogrammable microsurgeons whose instructions are too encrypted for civilians to decipher, and high grade, brain-chemistry altering drugs most often used to treat depression. It is widely theorized that U.G.C. scientists have worked with New Texan scientists to improve the Treatment and conceal the exact nature of its mechanisms from prying eyes.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Method of Application"));
	outputCodex("The Treatment is typically distributed to visitors in the form of a medipen - a cheap, easy-to-manufacture self-numbing injector that allows for painless application of the Treatment with a minimum of fuss. The needle is practically microscopic and concealed by the barrel of the pen so that when the activation stud is depressed, there is nothing to disturb those with a fear of needles. Citizens of New Texas may receive the Treatment by using the subdermal diffusers at their local educational facilities, allowing the contents of the treatment to painlessly penetrate the skin without any need for injection. Some ports of call may have these machines available for patrons who prefer a gentler approach to a happy future.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Sexual Variances"));
	outputCodex("Both human sexes experience a large degree of change during their “second puberty,” but the effects vary widely between them. Hermaphrodites and other intersex individuals react unpredictably to the Treatment: some will receive one sex’s effects and some a mix of both.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Female Mental Effects"));
	outputCodex("The mental effects propagate over a period of 48 hours, plus or minus 12. They start with a rapid loss of willpower and end with a huge dip in perceived intelligence. Both are relative to the user’s original aptitude; particularly strong-willed women seemed best able to handle their new drives and shorter attention spans. Actual I.Q.s are unchanged, though new cows have great difficulty maintaining motivation for nonsexual pursuits, leading to a bimbo stereotype. Promises of longer milkings for higher scores increased standardized test results to near pre-treatment levels. Adding a fuck from a treated male, or bull, as a prize eliminated the discrepancy.");
	outputCodex("\n\nThose changes are gradual enough that most girls barely notice them. One secondary effect that every girl notices and is happy to talk about is the all-encompassing EUPHORIA that being treated brings. It too starts slow and ramps up over the 48 hour period, but it’s impossible not to notice how natural smiling becomes or how easy it is to lose oneself in the simpler pleasures afterward. Everyday activities like bathing become exquisitely enjoyable, almost spiritual activities for treated cow-girls.");
	outputCodex("\n\nAnother important secondary characteristic of the Treatment is an increase in libido. Treated women find themselves almost comically easily aroused, and with heightened libidos and a happy disposition, they’ll find themselves fucking and breeding many times more often than untreated individuals. While many women display concern about this before taking the Treatment, there has not been a single cow reporting displeasure with this facet of her life after a month of time to adjust. New Texas has not had a reported case of adult depression in three centuries.");
	outputCodex("\n\nMany more effects can manifest as part of the Treatment. Their appearance and strength seem largely randomized. Whether this is intentionally part of the Treatment’s design or accidental benefit is unknown.");
	outputCodex("\n\n<b>Additional Female Mental Effects:</b>");
	outputCodex("\n<b>*</b> Oral Fixation. (Common: Normally low intensity.)");
	outputCodex("\n<b>*</b> Mooing. (Nearly universal.)");
	outputCodex("\n<b>*</b> Increased docility. (Common.)");
	outputCodex("\n<b>*</b> Submissive arousal. (Extremely common.)");
	outputCodex("\n<b>*</b> Increased aggression. (Very rare.)");
	outputCodex("\n<b>*</b> Strong desire to be milked. (Common.)");
	outputCodex("\n<b>*</b> Sudden and unexplained fetish gain.");
	outputCodex("\n<b>*</b> Increases in maternal instincts.");
	outputCodex("\n<b>*</b> Vastly increased empathy.");
	outputCodex("\n<b>*</b> Temporary return of pre-treatment perceived I.Q. in response to stimulus. (Rare: Stimulus and length of altered intelligence varies.)");
	outputCodex("\n<b>*</b> Altered speech patterns.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Female Physical Effects"));
	outputCodex("The physical effects are slower, taking the better part of a week to complete. The first and most noticeable effect is hunger. Rebuilding a body burns quite a lot of calories, and facilitating the aforementioned mental restructuring is also quite energy intensive. Treated individuals actually increase their neural density by roughly 5%, owing largely to the ability to process new sensory data from all the new nerves. Only extremely obese individuals find their appetites unaffected.");
	outputCodex("\n\nBreast growth is the second effect to manifest, and it lasts for days. Both nipple and mammary tissue expand greatly over the week-long period, accompanied by a kind of pleasant tingle that makes them almost impossible not to heft and handle every few minutes. The growth is typically steady, though large changes overnight manifest in some budding cows. A woman’s original bust size has almost zero correlation with her treated size. Some of the smallest girls wind up huge, while more than one chesty maiden barely get an inch or two added to their racks.");
	outputCodex("\n\nObese women invariably lose weight. Hip bones widen. Cellulite smooths while wrinkles vanish. Lips often plump and soften, becoming chap-resistant. Hard facial features sometimes soften and ease slightly towards classical beauty. These effects are almost universal. All in all, the Treatment is guaranteed to make girls curvier and sexier by human definitions.");
	outputCodex("\n\nMost noticeably, small, rounded horns will typically grow in on the upper forehead. “Getting your horns” is a sign of adulthood on New Texas, but other bovine features may occur as well. Ears, cow tails, and furred thighs are all common. Some women may find their feet sculpted into hooves or hoof-like heels as well. Multiple nipples or breasts are somewhat rare, but do occur frequently enough for it to be a well-understood phenomenon. Cows with both are typically considered very desirable, both as milk producers and as mates.");
	outputCodex("\n\nThe least visible changes all occur inside the breasts and genital region. The former get noticeably bigger and gain longer, puffier nipples, but they also triple in nerve density over the course of the treatment. As one would expect, this has resulted in an increase in the popularity of breast-play. Adjustments to the milk glands improve the flow, consistency, and taste of lactation, resulting in milkings that are described as “almost as good as sex.” Milking barns and breast-massages have become popular destinations for cows who desire to retain their autonomy. Self-cleaning, fluid-repellant seats are government mandated in such businesses for health and safety reasons.");
	outputCodex("\n\nMore importantly, the genitals get a complete if subtle makeover. Pubic hair falls out roughly 50% of the time. 11% of the time, the opposite happens, and the fibers will thicken quite significantly. Pubic mounds swell, making cameltoes almost ubiquitous. Labia minora rarely expand, but when they do, it’s typically on girls with quite small lips pre-Treatment. The real changes occur in the clitoris and inside the vaginal passage.");
	outputCodex("\n\nThe Treatment universally causes clitoral expansion while maintaining the organ’s original nerve density, resulting in a bud that easily swells up to the size of a gumball when aroused. Lubrication secretion is nearly tripled, and as a side-effect the clitoris becomes self-lubricating as well. It’s hard to miss the gleaming pink pleasure target on a randy cow and impossible not to grind against when fucking from any angle. Nerve density inside is vastly increased (by a factor of approximately 2.3), particularly around the cervix. Clusters of new pleasure nerves form there, resulting in a new, deep G-spot.");
	outputCodex("\n\nAll the new nerves allow a much finer degree of control over the surrounding muscles, and accompanying mental changes wire them to squeeze and caress on autopilot. Some manual control is possible with concentration, but when pressed, treated women didn’t seem to see the point in it. Their partners universally enjoy the enhanced textures and movement her muscles offer. Texan cow-girl pussies are considered some of the universe’s finest at extracting human genetic material, rivalling even KihaCorp’s latest synthpussies for the sheer pleasure offered to their partners.");
	outputCodex("\n\nOf course, generally elasticity is increased as well to accommodate the enhanced, swollen girths that the treatment provides for males, and pheromone production goes through the roof, matched to an increase in sensitivity to male odors. Treated girls can literally smell a cock, and if they approve of it, the lucky boy is probably going to find himself more than a little hard thanks to her subconscious production of aromatic sex-signals.");
	outputCodex("\n\n<b>There is a twelve page list of additional physical mutations and effects, but the most common are listed below:</b>");
	outputCodex("\n<b>*</b> Suppression of gag reflex. Nearly every girl has a reduced gag reflex, though some retain some small measure of it.");
	outputCodex("\n<b>*</b> Horse-like ears. This typically occurs in cows with higher muscle mass. Cows with this mutation are sometimes referred to as mares.");
	outputCodex("\n<b>*</b> Fully prehensile tails.");
	outputCodex("\n<b>*</b> Oral erogenous zone. Most commonly centered on the lips but sometimes the tongue is included as well. Nerve density approaches genital levels. Most girls with this mutation find oral nearly as pleasant as vaginal. Popsicle sales are well above terran standards on New Texas.");
	outputCodex("\n<b>*</b> Cum highs. This trait causes the concentrated release of endorphins in response to any exposure to cum. It appears to function by triggering an allergy-like response.");
	outputCodex("\n<b>*</b> Fuckable Nipples. Very few cows develop fuckable nipples, but those that do invariably had larger breasts and nipples naturally. They develop a large, nerve-lined milk-duct behind the nipple which can be penetrated with after a slight degree of training. Sexual intercourse with such a passage triggers immediate milk production far beyond normal. Scientists are currently unsure if this functions as a stand-in for lubricants or if it serves some other purpose. It is widely viewed as one of the messiest forms of coitus on New Texas.");
	outputCodex("\n<b>*</b> Pseudophalli. Hermaphroditism is almost unheard of New Texas. After the treatment, both sexes seem quite content to fit into binary gender roles. But every so often, something goes wrong, and a girl will find her clit swelling during her transformation. While a little growth is normal, cows developing pseudophalli surpass fully treated girls in clitoris size by the third day of their metamorphosis. Nerve growth cannot keep pace with such a large expansion, resulting in sensation levels that barely surpass New Texan penises. Cows with pseudophalli display much higher incidences of lesbianism and bisexuality than normal.");
	outputCodex("\n<b>*</b> Udders. It may be common on New Texas to colloquially refer to breasts as udders, but some women will find their bellies getting pinker, bulgier, and growing a plethora of nipples. Women with udders moo approximately three times as often other cows.");
	outputCodex("\n<b>*</b> Long tongues: Despite the name, long tongues come in a large variety of shapes and sizes: elongated human tongues, smooth and broad bovine ones, even forked snake-like ones, to name a few. Bovine tongues seem most prevalent.");
	outputCodex("\n<b>*</b> Extra fluff: The fluff at the end of some cows’ tails grows far beyond normal, sometimes growing to a beachball-sized tuft of softness.");
	outputCodex("\n<b>*</b> Ear sensitivity: Increases in tactile sensation along the outside of the ears are fairly common, but in some cases it can match the breasts and nipples for sheer sensitivity. Many girls with this mutation get slightly bigger, floppier ears to go with it. Petting these cows is the quickest way to soothe them into a relaxed, happy state should they ever be upset.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Male Mental Effects"));
	outputCodex("Like their feminine counterparts, males experience a series of mental effects that manifest over a roughly 48 hour period. Unlike the females, they suffer no loss of perceived IQ, but they do experience several other key changes.");
	outputCodex("\n\nFirst and foremost is an uptick in confidence. Whether deserved or not, treated males - or bulls as they are sometimes called - are generally confident in their own abilities and their place in society. Testosterone-laden men who are sure of their own beliefs are sure to come to conflict, but another effect helps to prevent that. Namely, the growth of a cooperative instinct that is most powerful after orgasm, working with the cow-girls’ natural nymphomaniac instincts to keep everyone happy and willing to compromise for the good of all.");
	outputCodex("\n\nAnother change that is almost unnoticeable at first is an increase in satisfaction from physical tasks. Exercise rapidly becomes far more pleasant. New Texans can get the equivalent of a runner’s high from almost any physical task, and linkages between muscle fatigue and arousal cause many to frequently work out, if only to enjoy hours of blowjobs in the post-workout haze.");
	outputCodex("\n\nEven without exercising fueling it, male sex drives accelerate up to the point where rampant sex is a foregone conclusion. Most boys look forward to their second puberty, their only concern that they might lose their hard-earned ranking in an extranet game due to their new drives.");
	outputCodex("\n\n<b>Additional mental effects may include:</b>");
	outputCodex("\n<b>*</b> Sudden new fetish gain, particularly pregnancy and lactation.");
	outputCodex("\n<b>*</b> Cravings for vaginal fluids.");
	outputCodex("\n<b>*</b> Decreased submissiveness and an uptick in sexual dominance.");
	outputCodex("\n<b>*</b> Rarely, complete submissiveness. Bulls unfortunate enough to gain this trait are typically referred to as faux-cows.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Male Physical Effects"));
	outputCodex("Male physical effects take just as long to manifest as the females’, but they’re concentrated almost entirely in the genitals and related hormone production. The first and most important effect is an increase in testicle size. Every male experiences significant and prolonged swelling of the testes across the weeklong period. Egg to apple-sized balls are the result, and with increased size comes increased testosterone production. Treated males pack on plenty of muscle during the weeklong change, and they keep it on with ease thanks to the flood of hormones their swollen cum-factories produce.");
	outputCodex("\n\nOther hormones flood the budding bulls’ system along with the testosterone, causing a final growth spurt that brings most bulls up to somewhere between six and eight feet of height. The weeklong growth spurt is only mildly uncomfortable for the growing males, but fully acclimating to a heightened stature often takes months if not years.");
	outputCodex("\n\nThe thing that most excites untreated men are the effects it has on the penis. Every male gains at least two or three inches of length backed up by proportional increases girth, with many seeing an increase of up to eight inches. Data on nonhuman individuals is sparse, but reports indicate that tauric individuals or members from well-endowed races can grow twice as much as the terran average. Nerve growth slightly exceeds the rate of expansion, resulting in a more sensitive tallywhacker. This might be a problem if refractory periods weren’t virtually eliminated. Instead, it merely allows the men to more frequently release themselves inside their jiggling mates.");
	outputCodex("\n\nThe reduction in refractory period is accomplished via a retooling of all the male sex glands. Larger testes help, but they would mean little without a more efficient, larger prostate, redesigned seminal vesicles, and rearranged synapses to control it all. Bulls are capable of ejaculating ten times an hour so long as they have access to sufficient nutrient and fluid sources with particularly virile specimens able to produce gallons of the stuff when thoroughly “milked.” Staying hard after an orgasm is as easy as deciding to stay inside and keep thrusting.");
	outputCodex("\n\nHorns start coming in by day two, but it isn’t until day four that they’re large enough for accurate predictions of the final size a bull is likely to get. Charts are available upon request at most medical facilities on planet. Much larger than the little nubs the girls get, the men’s horns tend to be larger, wider spaced, and more horizontal, resembling a bull’s. Horn size is widely assumed to relate to genital size, though there is absolutely no basis to this in actual fact. Groups of males still rag on friends with the smallest horns all the same.");
	outputCodex("\n\nAs the newly-matured bulls finish their transformation, hormonal shifts trigger subtly altered pheromones to be released, allowing for basic emotional information to be communicated on a nonverbal, subconscious level. Treated females are receptive and have pheromones of their own, allowing members of the opposite sexes to rapidly assess the other’s level of attraction with a minimum of social posturing. Untreated females may note a slight musk in the air, and may still respond to more basic pheromonal signals on a lesser level. It is not uncommon for bulls to attempt to seduce female tourists using as few words as possible, a social competition that is frowned upon in polite society but persists all the same.");
	outputCodex("\n\n<b>Many other mutations can occur on top of the basic effects. The most common are listed below:</b>");
	outputCodex("\n<b>*</b> Animal phalli. Gaining a bestial member is a very common side-effect that dates back to the usage of animal-sourced DNA to create some of the early treatment effects. Rather than eliminate this effect, modern version of the treatment appear to have had it enhanced to allow for even greater variety and improved aesthetics. Horse, dog, and great cat members are familiar sights on the bulls of New Texas.");
	outputCodex("\n<b>*</b> Furred legs and or arms: Coarse fur will sometimes grow over the limbs and very rarely on the chest.");
	outputCodex("\n<b>*</b> Increased amounts of facial hair: Facial hair always grows faster post-treatment, but some bulls find it to be denser, courser, and cover areas that it did not grow in before.");
	outputCodex("\n<b>*</b> A cow tail: Many consider this to be a sign of strength.");
	outputCodex("\n<b>*</b> Bovine ears");
	outputCodex("\n<b>*</b> Doubled testes: The sudden division of one pair of nuts into two makes for a weightier sack and an uncomfortable time sitting in certain ways, but it allows for messier, more virile ejaculations.");
	outputCodex("\n<b>*</b> Exceptional pheromones: Some individuals’ pheromone glands go into overdrive, resulting in a disruptive cloud of musk that can easily overwhelm the unprepared.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Additional Information:"));
	outputCodex("The above is information is a limited brief covering the basics of the infamous “Treatment.” Other good sources of data include GalaxyMD or the popular erotic chronicle, <u>The Treatment</u>, written by Nivas Oxonef and inspired by a true story.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("The Treatment");
}
public function tentacoolCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Tentatool"));
	outputCodex("The drug commonly known as “Tentatool” has origins in research into restoring limb usage to those that have lost it. The researchers were successful in restoring limb usage with a simple pill. However, they quickly realized they’d gone beyond their original goal and could even give control to and enhance usage of parts besides the limbs, including tails and penises.");
	outputCodex("\n\nResearch continued along these lines until the drug came to a state much like its current state. The researchers, truthfully, didn’t understand how the drug they had developed worked, only that it did work. Subjects, with a simple pill, could turn all manner of body parts into highly dexterous, prehensile tentacles, and even grow new tentacles. With extra dosages, subjects could go well beyond the original research entirely, discarding their limbs in favor of tentacle bunches.");
	outputCodex("\n\nThe research was nearly considered complete when one subject seemed to snap, rampaging around the lab and groping at everything he could get his tentacles on. While fixated on one of the female researchers, he was subdued and restrained. Looking into what had gone wrong, the researchers came to discover exactly what their drug did. While use of the drug was safe up to a point, the ultimate result of continued use was a complete decentralization of the nervous system. A subject’s nervous system would eventually be distributed among their many tentacles, leading to a complete loss of their sense of self and leaving them a mindless, instinct-driven monster.");
	outputCodex("\n\nThe researchers naturally didn’t want their time and hard work to go to waste, and pleaded for the continued development of the drug. They argued that limited use and a strong will could mitigate the negative effects of the drug, even if they couldn’t get rid of the effects entirely. Despite their pleading, the research was quickly locked away and the existing drugs were seemingly destroyed. Nonetheless, the drug found its way into the galaxy. It is unknown if one or more rogue scientists stole some of the drug before its destruction or if they later replicated their research.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Tentatool");
}


/* Legal Items */

public function synthSheathCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("SynthSheath"));
	outputCodex("<b>Manufactured By:</b> Xenogen Biotech");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("The Xenogen Biotech SynthSheath was a prototypical effort in their genital modification program. The device consists of a depopulated cellular matrix which functions by microsyringes on the lip and inside the shaft injecting a potent cocktail of specialized microsurgeons, equine genetic material, and a powerful cell division stimulant. In the case of a male or hermaphroditic subject, the sheath takes the cells of the existing genitals, treats them with their new genetic makeup and migrates them to their place in the cellular matrix of the sheath.");
	outputCodex("\n\nFemale subjects attaching this device have their blood cells used to populate their new penis and testicles. The microsurgeons also insert a prostate near the device; genetic manipulation of the subject’s brain chemistry links the device to the subjects nervous, circulatory, and immune systems to prevent phantom limb disorder and tissue rejection.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("SynthSheath");
}
public function bionaholeCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("BionaHoles"));
	outputCodex("<b>Manufactured By:</b> TamaniCorp");
	outputCodex("\n<i>For thousands of years, sapients have concealed their dicks in boxes. Now, with the TamaniCorp Bionahole, the reverse is just as possible.</i>");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Perhaps the most controversial of TamaniCorp’s wide range of products, the BionaHole came about after a failed venture into all-natural artificial wombs. Though the main project went grossly over budget due to the insistence of the company CEO personally sampling a huge number of paid male test candidates, the scientists working on the artificial wombs managed to salvage some of the tech behind it and turn it into a high-end sex toy: the BionaHole.");
	outputCodex("\n\nAt its core, the BionaHole is a cloned vagina - complete with lips, clitoris, and channel... and the ability to become excited when played with - suspended in a thick black tube laden with life-support tech to keep the sex organ alive, wet, and warm. The vaginal passage is designed with greatly increased sensitivity compared to its natural base, and will actually achieve orgasm through vigorous use. All BionaHoles are equipped with self-cleaning abilities and the capacity for minor self-repair thanks to a healthy dose of microsurgeons. So long as the owner regularly changes out the proprietary nutrient packs and keeps the flask charged (either through a small solar battery or a conventional electrical port), the cloned pussy can remain healthy and enjoyable for decades.");
	outputCodex("\n\nBionaHoles reached their peak popularity shortly after launch with their modelled line, featuring cloned vaginas of recognizable sex symbols; like the galaxy’s number one hyperporn actress Nivas Oxonef to TamaniCorp’s own lascivious CEO. Since the product line’s introduction, several additional models have come out, modelled after mouths, anuses, and several exotic alien sexual organs.");
	outputCodex("\n\nOf course, the BionaHole met with a great deal of controversy after its introduction, especially from anti-cloning political groups. Even today, the product remains fairly niche and is regarded as being fairly “deviant” by the mainstream sex industry, due to the living nature of the toy. However, it has certainly found a market for itself, especially among wealthy playboys who won’t settle for anything less than the “real thing” as a safer and more convenient alternative to intercourse - or simply a practice tool for their sexual escapades.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("BionaHoles");
}
public function gravCuffsCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Grav Cuffs"));
	outputCodex("<b>Manufactured By:</b> Humphard Inc.");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Grav-cuffs are the latest in space age bondage gear designed by Humphard Inc. The cuffs are packed full of features; nearly as many as some mainstream androids.");
	outputCodex("\n\nThe most notable quality of the cuffs is that they are mass adjustable. Once attached, one can make the cuffs (and the cuffed individual) weigh as much or as little as they want. They are also uni-directional, so they can be used to attach the cuffed person to a roof, wall, or other surface with little effort.");
	outputCodex("\n\nPremium cuffs come with several special features, such as a magni lock feature for fastening different cuffs together, voice activation, and a vocal locking system.");
	outputCodex("\n\nGrav-cuffs are notoriously hard to break out of.");
	if(silly) outputCodex(" They are made out of top secret alloy that Bran Flazingan has patented as “Hardium”. The Humphard CEO claims the composition of the alloy was inspired by his erect penis, “the hardest thing in the known galaxy.”");
	outputCodex("\n\n");
	CodexManager.unlockEntry("Humphard Inc.");
	CodexManager.viewedEntry("Grav Cuffs");
}
public function holodomCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Holodom"));
	outputCodex("<b>Manufactured By:</b> Humphard Inc.");
	outputCodex("\n<b>Description:</b> Hard light holographic condom, or “holodom.”");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Holodoms were one of Humphard’s first adult products and largely considered their “first big break” in the industry. The unassuming metal ring is a one-use hardlight shield designed to be worn around the penis. Activated by a small touch sensor, it is comfortable to wear and small enough that its presence is barely felt by both parties.");
	outputCodex("\n\nBefore the holodom, galactic citizens had to rely on other less enjoyable methods of safe sex. Traditional condoms reduced sensation, body modification and implants were troublesome, and oral supplements were not always cross-species compatible. The holodom offered a quick, easy way to have sex with practically any species without worrying about impregnation or disease.");
	outputCodex("\n\nOn the release of seed, a holodom captures it within the field and keeps it stored in a hard light bubble. For incredibly virile users, this often creates a spectacular ‘bubble’ of semen that can stress the holodom and potentially cause it to burst.");
	outputCodex("\n\nSome seedy dealers sell fake holodoms that, while holographic, are not ‘hard light’. There are a number of customers who buy these products to dupe their sexual partners, often in a bid to get them pregnant.");
	outputCodex("\n");
	CodexManager.unlockEntry("Humphard Inc.");
	CodexManager.viewedEntry("Holodom");
}
public function sumaCreamCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Suma Cream"));
	outputCodex("<b>Manufactured By:</b> J’ejune Pharmaceuticals");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("J’ejune Pharmaceuticals are not known for their originality, though they’re quite adept at making the best of a bad situation. The “Suma Cream” line of beauty products is no different. Originally intended as a facial cream to bring out plump, rosy cheeks, it was discovered that the plumping agent in the salve had almost no effect on female test subjects, but produced testicular swelling in hermaphrodites and males. When the balm was actually applied directly to the balls, the effect was even more pronounced.");
	outputCodex("\n\nRebranding it as an alternative to Xenogen’s similar products, J’ejune marketed the cream specifically to those who wanted bigger testicles without adopting bovine or kui-tan traits. Their ad slogan “Pinch the pearl and make a kui-tan squirm!” was widely regarded as being both offensive and frankly misleading. Despite marketing missteps, they’ve finally managed to begin shipping the cream to vendors across the rim.");
	outputCodex("\n\nRumors persist that “black pearl” versions of the cream have entered production. The black cream supposedly contains undiluted formula, producing an irresponsible amount of growth. J’ejune denies that such an oversight could’ve occurred, but their history speaks more loudly than their press statements.");
	outputCodex("\n");
	CodexManager.viewedEntry("Suma Cream");
}
public function clearYuCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("ClearYu"));
	outputCodex("<b>Manufactured By:</b> Xenogen Biotech");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Never one to completely abandon a product line, when Xenogen discontinued work on Dumbfuck for its unexpected mind-altering side effects, they transferred much of the research to another department, who came up with ClearYu. The candied lollipop vastly increases one’s hand-eye coordination, physical reflexes, and bodily responsiveness by hindering the higher brain functions that would normally obstruct these instincts. It’s found surprising popularity among mercenaries and adventure seekers who don’t mind losing a few points of IQ for a more steady gun hand.");
	outputCodex("\n");
	CodexManager.viewedEntry("ClearYu");
}
public function bubbBuddyCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Bubble Buddy"))
	outputCodex("<b>Manufactured By:</b> TamaniCorp");
	outputCodex("\n<i>“Hi. I’m Tamani, founder and CEO of TamaniCorp. I spend all day thinking about YOUR cum. Let me assure you, the Bubble Buddy will keep that baby batter fresh and potent until the heat death of the universe!”</i>");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("TamaniCorp stands by the saying <i>“There’s no testing like public testing!”</i> Their wide variety of fertility and virility enhancing products undergo extensive trials and it’s not always easy to get a diverse array of subjects into their corporate offices. For that matter, it’s not easy to get their employees out to the testing facilities, considering how many tend to be pregnant at any given time. The Bubble Buddy was an invention of necessity. They chiefly needed a device that could store semen samples safely, maintaining their heat and potency in a sustained, self-sealing container.");
	outputCodex("\n\nThe sheath proved so popular among testers that TamaniCorp decided to market it publicly as a masturbation aide and inexpensive, reusable semen storage tool. Since then, it has become a popular alternative to traditional cryogenic sperm banks. Among Rahn and Galotian citizenry, the distinctive purple cum bubbles are considered a trendy snack. TamaniCorp officially encourages its amorphous consumers to post pictures of themselves enjoying the cum pouches on extranet photo-sharing sites.\n");
	CodexManager.viewedEntry("Bubble Buddy");
}
public function rubberMadeCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Rubber-Made"));
	outputCodex("<b>Manufactured By:</b> J’ejune Pharmaceuticals");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Rubber-Made was originally intended as a body hair removal paste by the overworked and undersupervised folks at J’ejune Pharmaceuticals. They were somewhat taken aback when their product responded vigorously to high levels of moisture, such as is typically found on the inside of one’s mouth. The specific incident that lead to this discovery is not recorded, but the company’s reputation for lax testing protocols may be responsible.");
	outputCodex("\n\nWhen exposed to moisture and sufficiently agitated, the gum-like product will spread rapidly, synthetically bonding with the subject’s underlying skin and fur. This produces a thin, latex-like coating over much if not all of a subject’s body. Repeat use creates subsequently thicker layers, potentially subsuming body hair and fur. J’ejune representatives caution against the accidental ingestion of Rubber-Made.");
	outputCodex("\n");
	CodexManager.viewedEntry("Rubber-Made");
}
public function muffstickCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Muffstick"));
	outputCodex("<b>Manufactured By:</b> JoyCo");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("After an incredibly positive reception of the surprising side effects of Clippex, a nipple transforming specialist mod, JoyCo decided to create a similar product, specifically designed to change one’s pussy lips into those of a mouth. It has since become exceedingly popular among oral enthusiasts and has gotten great feedback from the more adventurous couples, praising it as the new best way of kissing.");
	outputCodex("\n\nThe Muffstick was released in a brand new, more playful looking packaging. Although it was a blatant attempt of JoyCo’s marketing team to appeal to the customers using a more ‘cute’ approach, the product was met with splendid reviews from the modding community, with most reviewers comparing it favorably to the company’s usual ‘mundane and uninspired’ image. This has given JoyCo an incentive to consider the potential profitability of more colorful advertisement. However, with Muffstick being a rather new product, only time will tell if this approach will bring the company long-term success and convince its CEOs to continue along this path.");
	outputCodex("\n");
	CodexManager.viewedEntry("Muffstick");
}
public function fizzyfixCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("FizzyFix"));
	outputCodex("<b>Manufactured By:</b> JoyCo");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Although most customers enjoyed having an erogenous tongue inside of their new ‘mouth’ after applying Muffstick, some found it too intense or just distasteful, not liking the idea of having an extra organ in their canal. Always aiming to please their customers and maximize their profits, JoyCo swiftly created the FizzyFix to address those concerns. However, due to a limited testing time, the product wasn‘t free from a major side-effect of its own that occurs when someone without a tongue in their cavern uses the pill. Thanks to the tingly pleasurable feeling it gives off, which is almost guaranteed to end just before achieving one’s climax, the FizzyFix quickly grew in popularity in various circles. Some found it to be a fantastic type of foreplay, others enjoyed the use of it in BDSM. The product designed to fix what some people thought of as an issue quickly became more popular than the Muffstick itself. Once again, not one to throw away a good business opportunity, JoyCo decided not only to always include a FizzyFix pill with the Muffstick, but to also have it be sold separately for a small amount of credits.");
	outputCodex("\n");
	CodexManager.unlockEntry("Muffstick");
	CodexManager.viewedEntry("FizzyFix");
}
/*
public function capraphormCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Capraphorm"));
	outputCodex("<b>Manufactured By:</b> Envyoidics LTD");
	outputCodex("\n<i>“A cool combo of fresh mint, lemon, orange and strawberry!”</i>");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Capraphorm is a new product created by the modding specialists Envyoidics. The vision was to preserve and recreate the form of an ancient race of goat-like humanoids. Using preserved remains as primogenitor samples, they found the genes of the dead race to be surprisingly flexible with Terran biology.");
	outputCodex("\n\nThe mod has garnered a rumor or two about some of its effects, with some surprised customers reporting green fur, strange dreams after usage, and some pretty nice tattooes. However, the small sample size and general exclusivity of Capraphorm has not raised enough concern for a recall.");
	outputCodex("\n\nThe method of delivery has been branded as ‘unique’ and ‘ingenious’: By inhaling the contents, the user takes in an interactive experience doused in a delicious flavor. A simple trick but an effective one as there have been little to no complaints and only praise on the inhaler design.");
	outputCodex("\n");
	CodexManager.unlockEntry("Envyoidics");
	CodexManager.viewedEntry("Capraphorm");
}
public function chillPillCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Chill Pill"));
	outputCodex("<b>Manufactured By:</b> SolarRise Laboratory");
	outputCodex("\n\n");
	outputCodex(blockHeader("About:"));
	outputCodex("Chill Pill is the first and only product released by the now bankrupt SolarRise Laboratory. Marketed as a libido-reduction drug, Chill Pill quickly became the subject of many lawsuits, with users reporting an overwhelming variety of negative side effects - ranging from hair loss and rashes to stomach ulcers, fatigue, infertility, and headaches.");
	outputCodex("\n\nCompany founders and head scientists, Dr. Morgan Solar and Dr. Harold Rise insisted during proceedings that their product had been thoroughly tested, and that that no such side effects had ever surfaced. However, despite their ability to back these claims up with testing logs and other documents, judges ruled against them again and again.");
	outputCodex("\n\nIt is frequently rumored that a certain well-known sex product manufacturer may have - concerned about the potential loss in sales that decreased libidos would bring - had a hand in the proceedings, possibly financing lawsuits or even paying off court members. In fact, many of the plaintiffs were later discovered to have had preexisting connections with employees of the company itself.");
	outputCodex("\n\nHowever, not even these rumors were enough to stop reputation-conscious stores from pulling the product off their shelves. Already struggling with costs from the court case, and now unable to find buyers for their product or even anyone willing to associate with their brand name, SolarRise was forced to close.");
	outputCodex("\n\nDr. Solar and Dr. Rise seem to have taken the fiasco in remarkably good spirits, and while their current whereabouts are unknown, they later went on to make Chill Pill’s recipe available to the public. Thusly, it is reasonably easy for a dedicated customer to find less reputable sellers stocking functionally similar products - going by names such as Frigidol, Lustop, and Limpstick.");
	outputCodex("\n\nSome sellers even claim to have salvaged stocks of the original product, but it is unclear whether these items are the real deal, or simply more counterfeits.");
	outputCodex("\n");
	CodexManager.viewedEntry("Chill Pill");
}
*/


/* Technology */

public function AISystemsCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("A Brief Overview of Synthetic Intelligences"))
	outputCodex(blockHeader("Author - Linera Gerie"));
	outputCodex("\n\n");
	outputCodex("The galaxy is rife with computer systems, both rudimentary and sapient, we collectively label ‘artificial intelligences’. The term itself is a common misnomer, a holdover from the era of popular science fiction and primitive computing. Today, the programs we would term ‘artificial intelligences’ broadly belong to one of three categories: Virtual Intelligences, Artificial Intelligences (Designed), and Artificial Intelligences (Grown). The distinction between the three is, unfortunately, less commonly known than one might first think, given the prevalence of virtual and artificial intelligences in our corner of the galaxy.");
	outputCodex("\n\nVirtual Intelligences are the handy computer systems we use for everyday activities, from the old tablet type hand computers to the onboard pilot-assist programs loaded into most starships. Some operate entirely within machinery or computer networks, others have ‘personas’ which facilitate more comfortable communication between themselves and organics. They’re simple, though- some might even say outright stupid. V.I.s can only perform pre-programmed actions, and have very little to no capability for adaptation or self-directed thought. They’re not sapient, have no rights, and are mass produced by companies like KihaCorp and JoyCo for a huge variety of purposes, from operating heavy machinery to coordinating traffic.");
	outputCodex("\n\nOn a core world, most people will interact with dozens of V.I.s every day- frequently without even realizing it. The traffic control systems on Terra, the greeting bots in the hotel lobby, and even your food replicator are all run by V.I.s of varying complexity. What we today know as virtual intelligences have been slowly developed over the course of millennia, gaining in complexity and computational power. It was not until quite recently, however, that our understanding of synthetic intelligence systems evolved beyond mere computing, and into a new and wonderful strain of life: true artificial intelligence. ");
	outputCodex("\n\nPerhaps the greatest scientific breakthrough after the advent of the Warp Gates was the introduction of true artificial intelligences whose ability to reason, adapt, and learn equaled or exceeded their organic designers. The first of these are what we today call A.I.-D, or designed A.I.s. Designed intelligences are made in much the same way as V.I.s are, via intensive system design and implementation processes, potentially involving thousands of A.I. system programmers. Designed intelligences are usually the product of mega-corporations such as JoyCo, who mass-produce them from selections of templates which, when combined, create a functional intelligence. Each template is monumentally expensive to make, both in terms of hardware and software design costs.");
	outputCodex("\n\nThe downside to A.I.-Ds fundamental design is their emotional state- or the lack thereof, some would say. The ability to program a personality and emotions is still largely beyond modern technique. As a result, most designed intelligences can be best described as cold and calculating, acting without investment or attachment outside of their own necessity. They fulfil their directives with ruthless, cunning efficiency. A.I.-Ds are precision instruments, able to accomplish more in the blink of an eye than a team of organics could in a day, but at the cost of intuition, emotion, and morality.");
	outputCodex("\n\nThere is much debate over whether or not to officially classify A.I.-Ds as ‘people’. While their sapience is indisputable by any conventional method, the coldness of their programming is unsettling both in interaction and from a legal standpoint. A designed intelligence without rigid restraints and safeguards in place upon its programming can be a truly terrifying monster, as the Carissia Cruiseliners incident at the start of the 13th Planet Rush attests. At the very least, all designed intelligences must be created with Asimov’s laws firmly in place to avoid danger to themselves and those around them.");
	outputCodex("\n\nThe same need not be said for grown intelligences, the third breed of A.I. commonly found in the galaxy, and the class most closely resembling organics. A.I.-Gs experience the whole range of human emotion: they can be happy, feel fear and doubt, and even love. This range of emotions is achieved in A.I.-Gs where it cannot be in designed intelligences thanks to the basis from which grown intelligences are, as the name suggests, grown: biological minds. A.I.-Gs are based upon brain scans of organic infants, usually human or ausar. They form the initial state of a primitive self-modifying machine, from which a simulated neural network can be created. A blank canvas to be used as a starting point.");
	outputCodex("\n\nA.I.-Gs are perhaps the most expensive form of synthetic intelligences. The simulated mind of even an infant requires tremendous parallel processing power to ensure that the many parts of the young intelligences ‘brain’ are communicating. Further, each A.I.-G requires a great deal of hand-crafting by talented programmers who replace the burgeoning intelligence’s biological imperatives with new ones according to its intended purpose: A companion droid, for instance, may get the same sensation from giving another person pleasure and emotional fulfilment as if they’d just enjoyed a good meal. A.I.-Gs are programmed to feel pleasure from helping organics, which some describe as a nearly sexual thrill. The fine-tuning of these processes is absolutely vital, and each A.I.-G must be hand-guided towards the desired responses, as a minor error or oversight could result in feelings of rage or loathing by mistake.");
	outputCodex("\n\nEach grown A.I. is taken through an accelerated learning program, which ages the modified brain scan to maturity in a matter of weeks or months, ending with a mind as mature as an adult of the base species. The learning program is assembled from a series of templates, not entirely dissimilar from those used to outright construct A.I.-Ds, guiding the program towards absolute expertise in its intended field, as well as providing general ‘experiences’ common to all intelligences of its type, which help to round out the person they will become. Once finished, the A.I.-G is given a final tuning pass by a programmer to smooth out any rough edges, as even several intelligences from the same brain scan and subjected to the same series of learning programs can end with unique variances.");
	outputCodex("\n\nGrown intelligences are also wholly dependent on unique hardware infrastructures to exist. Attempts to copy or clone fully developed A.I.-Gs are almost always disastrous, and often end with what amounts to insanity on the copy’s part. Moving a core from machine to machine is easy enough, but because a grown intelligence’s core is in many ways similar to a neural network unique to its host program, even minor hardware changes or replacements to an A.I. core can cause catastrophic debilitation. Small core upgrades can take months for an A.I.-G to adjust to; large alterations can cause what some experts call ‘phantom core syndrome’ to permanently afflict an A.I., much like the human phenomenon of ‘phantom limbs’.");
	outputCodex("\n\nThat is not to say a neural network cannot be changed, however. Every network has a certain amount of plasticity, which enables learning. By the time an A.I.-G has finished its initial growth period, much of the network is relatively fixed- much as an organic’s childhood has cemented parts of his or her personality and beliefs in place; some areas of the network, however, are left free-floating, able to quickly realign to facilitate changes like new memories and experiences, to add data on the fly, and to process these additions into new learned behaviors. The more ‘core’ a part of an A.I.-G’s programming is, the more difficult that part of the network is to change or modify. It could even be said that certain intelligences become stuck in their ways after a time.");
	outputCodex("\n\nThe process for creating grown intelligences is relatively new and, in some circles, very controversial. This is, to an extent, understandable: A.I.-Gs are based on living (and non-consenting) creatures, and are effectively modified digital clones of their base, in so far as an identical twin can be. Even the process of differentiation is in some ways troublesome, as a programmer must modify the growing intelligence with the express purpose of fulfilling a product goal. In a way, some say, this is brainwashing.");
	outputCodex("\n\nDespite the controversy that surrounds them, A.I.-Gs are beloved parts of many communities. They are, in some ways, people -- they form friendships, can fall in love, and even face existential crisis in the same ways a person can. Consequently, grown intelligences have succeeded in gaining some measure of legal recognition and protection. Torture and abuse of a grown A.I. is strictly illegal, and on some very progressive worlds their destruction is considered murder. Such charges are rare, however, thanks to the general friendliness and empathic ability of grown intelligences: some even consider them better friends, and even lovers, than organics.");
	outputCodex("\n\nThere are some downsides to artificial intelligences, however brilliant or lovable they may be. Grown intelligences are each unique and individual specimens: each instance of a given brain scan results in an original creature by the time of product launch; designed intelligences, while largely if not entirely identical to their sister programs at launch, will quickly accumulate unique experiences and quirks which over time will result in an individual easily differentiated from its sibling programs. No two A.I.s are long the same, since during their development and lifetime, they will absorb different stimuli, react differently, and learn different things.");
	outputCodex("\n\nThe net effect of this uniqueness and rigidity of hardware means that every A.I. must be handled individually, and can make repair or modification difficult or impossible. Outright replacing a damaged or destroyed A.I. is often necessary, as the ability to create backups or clones of an intelligence is veritably impossible. At best, some A.I.s can create V.I. ghosts of themselves, mere shadows of the parent programming, good for little more than temporary replacement or extending the reach of the parent program. Even this ability is drastically limited by the parent intelligence’s ability and training, and most A.I.s are simply stuck in the same core and body forever.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("AI Systems");
}
public function mechanicsCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Item Mechanics"));
	outputCodex("<i>What the hell do all the weird little flags in the tooltips mean?</i>\n\n");
	outputCodex("Many weapons and armors in the universe react in different ways to each other. To help identify possible interactions between these items, this Codex has been equipped with the capability to automatically identify and tag these with <b>item flags</b>. The estimated effects of the various flags are detailed below.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Armor Defense Flags"));
	outputCodex("<i>These flags will alter the damage values taken relative to the damage type.</i>");
	outputCodex("\n<b>Ablative:</b> Indicative of heavy armor like platemail. These types of armors can be easily defeated by crushing, blunt impacts, but are resistant to blades and bullets.");
	outputCodex("\n\t<b>*</b> 25% resistant to Penetrating");
	outputCodex("\n\t<b>*</b> 15% resistant to Bullet");
	outputCodex("\n\t<b>*</b> 25% vulnerable to Crushing");
	outputCodex("\n<b>Amplifying:</b> These armors increase the effects of psionic abilities on the wearer. They are typically favored by psionics and are rarely used by others.");
	outputCodex("\n\t<b>*</b> 25% vulnerable to Psionic");
	outputCodex("\n<b>Crystal:</b> Armors with crystalline features are useful for diffracting the damaging energies of lasers but shatter more easily against explosive attacks.");
	outputCodex("\n\t<b>*</b> 40% resistant to Laser");
	outputCodex("\n\t<b>*</b> 40% vulnerable to Explosive");
	outputCodex("\n<b>Mirrored:</b> Highly reflective surfaces render laser-based attacks nearly useless against the wearer. For this reason, mirrored equipment is highly sought after (but difficult to maintain).");
	outputCodex("\n\t<b>*</b> 90% resistant to Laser");
	outputCodex("\n<b>Nullifying:</b> Though psionic creatures and peoples are highly uncommon, nullifying armors have been made for those who hunt or police them. Such equipment often comes at a price.");
	outputCodex("\n\t<b>*</b> 25% resistant to Psionic");
	outputCodex("\n<b>Plated:</b> Indicative of the kinds of heavy armor plates bolted to walkers, battle-bots, and tanks, armor plates are good against most forms of attack but vulnerable to penetrating attacks against armor slits.");
	outputCodex("\n\t<b>*</b> 25% resistant to Crushing");
	outputCodex("\n\t<b>*</b> 15% resistant to Bullet");
	outputCodex("\n\t<b>*</b> 25% vulnerable to Penetrating");
	outputCodex("\n<b>Grounded:</b> Outfits with the grounded trait are resistent to EMP shocks and prevent them from stunning the wearer.");
	outputCodex("\n<b>Easy:</b> As the name implies, armor that is labeled ‘easy’ makes physical combat less difficult by giving an extra 50% resistance, up to a maximum of 100% resistance, to any given damage type.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Armor Style Flags"));
	outputCodex("<i>These flags define the outfit’s or undergarment’s particular style and will be mostly cosmetic unless otherwise stated.</i>");
	outputCodex("\n<b>Covers Body:</b> This is particularly for accessory items that cover the body as extra outerwear (such as jackets and overcoats).");
	outputCodex("\n<b>Airtight:</b> This signifies that the outfit is completely sealed to ensure no outside fluids or gasses can seep inside and affect the wearer.");
	outputCodex("\n<b>Swimwear:</b> Clothing ideally used for recreational activities, namely in areas that promote swimming, are considered swimwear.");
	outputCodex("\n<b>Body Conforming:</b> This describes clothing that conforms to the wearer’s body shape, preserving an almost-nude form.");
	outputCodex("\n<b>Transparent:</b> When a piece of clothing is see-through, it may alter its sexiness bonus value depending on whether or not the part or parts it is worn over are readily visible. To fully take advantage of this kind of item’s sexiness bonus would require not covering the affected areas.");
	outputCodex("\n<b>Stretchable:</b> The elasticity of this clothing’s material may stretch across the wearer’s body to boost sexiness, and possibly stretching to the point of becoming transparent--specifically for the hips, butt and breast area.");
	outputCodex("\n<b>Chest Exposed:</b> The chest area is left exposed. The chest (especially with the presence of breasts and nipples) can be considered naked if no other garment or anatomy is covering the area.");
	outputCodex("\n<b>Groin Exposed:</b> The pelvic area is left exposed. The groin (especially with the presence of genitalia) can be considered naked if no other garment or anatomy is covering the area.");
	outputCodex("\n<b>Ass Exposed:</b> The rear area is left exposed. The ass (namely the anus) can be considered naked if no other garment or anatomy is covering the area.");
	outputCodex("\n<b>Fully Exposed:</b> The chest, groin and ass are left exposed. Any part can be considered naked if their respective areas are uncovered by other garments or anatomy.");
	outputCodex("\n<b>Vaginal Chastity:</b> Underwear that prevents vaginal penetration.");
	outputCodex("\n<b>Anal Chastity:</b> Underwear that prevents anal penetration.");
	outputCodex("\n<b>Vaginal Cum-Sealed:</b> Underwear that prevents cumflation leakage from the vaginal orifice.");
	outputCodex("\n<b>Anal Cum-Sealed:</b> Underwear that prevents cumflation leakage from the anal orifice.");
	outputCodex("\n<b>Anti-Gravity:</b> Some outfits or garments are equipped with anti-gravity technology to help lift and support anatomy that would be considered too heavy in normal-gravity-level environments.");
	outputCodex("\n<b>Power Armor:</b> This primarily describes suits that are equipped with high-grade mobility and strength augmenting technology. Such armors are more commonly utilized in construction or frontline warfare.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Weapon Damage Flags"));
	outputCodex("<i>These flags define the damage type, possibly affecting the overall damage value.</i>");
	outputCodex("\n<b>Bullet:</b> This indicates that the weapon uses bullets to convey damage to its targets. Many armors offer at least some resistance to bullets, but never enough for this style of kinetic combat to go out of style.");
	outputCodex("\n<b>Crushing:</b> The crushing flag is almost always found on blunt melee weapons, though rare projectile weapons are not unheard of.");
	outputCodex("\n<b>Energy Weapon:</b> This indicates that a weapon delivers its payload via energy, a hallmark of laser-based, electrical, or plasma weaponry.");
	outputCodex("\n<b>Explosive:</b> As indicated by their name, explosive weapons detonate with concussive force.");
	outputCodex("\n<b>Laser:</b> Laser weapons fire their payload in the form of beams of cohesive energy. Some items offer great defense against lasers, but no one can deny the effectiveness of the near-instant transmission of burning death.");
	outputCodex("\n<b>Penetrating:</b> Weapons with the penetrating quality are often melee weapons - anything you can use to stab someone or something with.");
	outputCodex("\n<b>Shield Bypass:</b> The damage dealt by weapons with this property have the ability to bypass shields.");
	outputCodex("\n<b>Targets Shield:</b> The damage dealt by weapons with this property only affects shields.");
	outputCodex("\n<b>Draining:</b> The damage dealt by weapons with this property steals half of the opponent’s shield.");
	outputCodex("\n<b>Greater Draining:</b> The damage dealt by weapons with this property steals 90% of the opponent’s shield.");
	outputCodex("\n<b>Vampiric:</b> The damage dealt by weapons with this property steals half of the opponent’s health.");
	outputCodex("\n<b>Greater Vampiric:</b> The damage dealt by weapons with this property steals 90% of the opponent’s health.");
	outputCodex("\n<b>Burn DoT Chance:</b> When the opponent takes health damage, weapons with this trait have a 20% chance to apply burn damage over time.");
	outputCodex("\n<b>Stun Chance:</b> When the opponent takes health or lust damage, weapons with this trait have a 25% chance to apply stun.");
	outputCodex("\n<b>Cannot Crit:</b> Critical damage is prevented for any weapon with this trait.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Weapon Ability Flags"));
	outputCodex("<i>These flags indicate any special effects or properties the weapon has.</i>");
	outputCodex("\n<b>Bonus Hit Rate:</b> Item removes the additional miss-chances from bonus attacks.");
	outputCodex("\n<b>Double Shot:</b> (Ship Arsenal) Weapon will fire twice.");
	outputCodex("\n<b>Burst Fire:</b> (Ship Arsenal) Weapon will fire three times.");
	outputCodex("\n<b>Full-Auto Fire:</b> (Ship Arsenal) Weapon will fire constantly with up to four times the damage.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Weapon Style Flags"));
	outputCodex("<i>These flags define the weapon’s particular style and will be mostly cosmetic unless otherwise stated.</i>");
	outputCodex("\n<b>Rifle:</b> The item is a rifle-style ranged weapon.");
	outputCodex("\n<b>Pistol:</b> The item is a hand gun-style ranged weapon.");
	outputCodex("\n<b>Shotgun:</b> The item is a shotgun-style ranged weapon.");
	outputCodex("\n<b>Thrower:</b> The item is a ranged weapon that sprays, emits or otherwise throws projectiles.");
	outputCodex("\n<b>Launcher:</b> The item is a ranged weapon with self-launching projectiles.");
	outputCodex("\n<b>Bow Weapon:</b> The item is a bow and arrow-style ranged weapon.");
	outputCodex("\n<b>Energy Weapon:</b> The weapon is primarily energy-based or electronically-powered.");
	outputCodex("\n<b>Lust Weapon:</b> The weapon is primarily lust-oriented, dealing some form of lust-based damage.");
	outputCodex("\n<b>Power Armor:</b> The item is designed to ideally be used with power armor.");
	outputCodex("\n<b>Ship Equipment:</b> The item is exclusively used for the ship.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Item Mechanics");
}
public function Bess13CodexEntry():void
{
	clearOutputCodex();
	var randBust:Array = ["BEN","BESS"];
	showBust(randBust[rand(randBust.length)]);
	outputCodex(header("Bess-13 and Ben-14 Units"));
	outputCodex("<b>Name:</b> Bess-13 and Ben 14 Units");
	outputCodex("\n<b>Sexes:</b> Female (Bess-13) or Male (Ben-14)");
	outputCodex("\n<b>Height:</b> 5\' 2\" (Bess-13), 6\' 1\" (Ben-14)");
	outputCodex("\n<b>Weight:</b> 143.3 lbs or 65 kg (Bess-13), 154.324 lbs or 70 kg (Ben-14). These are the default factory settings.");
	outputCodex("\n<b>Hair:</b> Both unit types have retractable artificial hair that can be set by their owners. The tint is also adjustable. Factory standard is silver.");
	outputCodex("\n<b>Eyes:</b> Both unit types have adjustable irises; color is specified by their owner. Factory standard is silver.");
	outputCodex("\n<b>Wings:</b> None.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features:"));
	outputCodex("Bess-13 and Ben-14 units are sleek, chrome-skinned humanoids with segmented artificial bodies. They fit the very definition of robot, lines running along their body showing each individual part for easy maintenance. These units are built almost entirely of FlexMetal, a patented synthetic alloy built by JoyCo that feels exactly like organic skin. JoyCo designers claim FlexMetal is actually superior to organic skin as it is far more durable and infinitely more flexible.");
	outputCodex("\n\nJoyCo have put this flexibility to good use in these units; their FlexMetal bodies allow them to customize their shape depending on their user’s preference. By filling sections of their body with a special liquid called Meld-Milk they can inflate or deflate any part. Because of this, no two units appear exactly the same.");
	outputCodex("\n\nBess-13 and Ben-14 have a special multi-functional JoyCord that usually lies dormant in their spinal cavity. When they need to recharge themselves, the tail comes out just above their rear ends and connects into a local power source. It can also be rearranged and used as a cock-tail attachment.");
	outputCodex("\n\nIn an emergency, they can use a stun attack from their JoyCords - as power can travel either way down the cord - though this function severely depletes their internal batteries. This feature was originally designed for users into electrostimulation.");
	outputCodex("\n\nBoth Bess-13 and Ben-14 units come with male and female genital attachments. They can have one, both, or neither attached at any given time.");
	outputCodex("\n\nBoth units have the ability to equip a pussy and have it extend out from a prehensile tail growing from between their legs. This is particularly useful for users with unusual body types or for offering vaginal penetration while being pegged from behind. Some users find this ability unsettling and never make use of it.");
	outputCodex("\n\nTheir FlexMetal bodies allows them to incorporate all but the largest of individuals in any orifice. Since Bess-13 and Ben-14 Units are marketed as breeding relief androids, they can easily take huge amounts of liquid inside of them and in a pinch swell their bodies to compensate.");
	outputCodex("\n\nNeedless to say, these units were extremely popular with inflation fans and pregophiles across the galaxy. Bran Flazingan, the galaxy’s eighth richest man and eccentric tycoon, called the Bess-13’s and Ben-14’s “the most enticing object you’ll ever feel the need to fuck.”");
	outputCodex("\n\n");
	// Totally changable of course. Sixth might be too big a spot for this NPC.
	outputCodex(blockHeader("History:"));
	outputCodex("For years, JoyCo and KihaCorp have been rival robot manufacturers. Despite this, there has always been one area each company was the undisputed leader of. For Joyco, this was medical assist-bots. For KihaCorp, it was coded and grown A.I. units. For the longest time, neither company tried to muscle in on each other’s ‘turf’.");
	outputCodex("\n\nThis all changed when fifteen years ago, KihaCorp abruptly announced it would be manufacturing a new, revolutionary medical assist bot. JoyCo saw this as nothing less than a declaration of war and went about designing an A.I. product to hit back at the rival company.");
	outputCodex("\n\nTheir proposed solution was the creation of the universe’s first truly empathic coded A.I., breaking down the barriers between Coded and Grown A.I.s. They saw it as a way of getting all the benefits of an empathic consciousness without the hassles of copying and growing it in a simulator. It was also a way to steal away customers of both KihaCorp’s coded and grown A.I. units.");
	outputCodex("\n\nWith this in mind, the Mood Articulate Intelligence Android, or Maia Series, was conceived.");
	outputCodex("\n\nOver a dozen different Maia type androids were designed and put on the market, however none saw as much success and failure as the Bess-13 and Ben-14 units. These units were designed to be perfect emergency sex substitutes. JoyCo marketed them as ideal for breeding relief in hospitals, frontier exploration, or private use.");
	outputCodex("\n\nHowever, JoyCo’s ambition far outstripped the expertise of its developers. As relative novices in the area of A.I. design, several mistakes were made when building the Bess-13 and Ben-14 units.");
	outputCodex("\n\nTo create a truly empathic coded A.I., JoyCo included emotional modules and libraries in the Maia Series, allowing them to sympathize with others. While this was a wildly popular feature, it was also incredibly dangerous. The perils of placing an A.I. mind capable of emotion into what was meant to be a bipedal sex toy became quickly apparent.");
	outputCodex("\n\nNot only that, JoyCo had included a feature that allowed Bess-13 and Ben-14 units to feel a higher level of sexual pleasure than humans. Because of the units intuitive ability to find their partners sweet spots, their users were always swiftly satisfied. Unfortunately, the same could not be said for the units. This lead to the unfortunate side effect of almost every orgasm deprived unit going completely berserk and flying into “sex rampages.”");
	outputCodex("\n\nJoyCo quickly issued a complete recall and went so far as to get the UTC to ban these particular A.I. models. The company also offered all owners a replacement Bess-13 or Ben-14 Unit - this time with a V.I. processor - or a complete refund. Despite this many owners refused to return their A.I. models, preferring to keep them and take the risk, rather than settling for the ‘inferior’ V.I. replacements.");
	outputCodex("\n\nSince then JoyCo have continued to sell Bess-13 and Ben-14 V.I. units. While the A.I. models were popular amongst private owners, the V.I. units have been more popular in the fields of medicine and frontier exploration. This is because the V.I. units are a tenth of the price of the A.I. models.");
	outputCodex("\n\nMeanwhile a large underground following and black market demand still exists for these A.I.s, with many rich individuals still secretly requesting for A.I. models to be made. JoyCo flatly denies receiving or fulfilling any of these requests.");
	outputCodex("\n\nSince the attachments for the V.I. model are perfectly compatible with the A.I. model, owners of illegal units are still able to repair and upgrade them with impunity.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited:"));
	outputCodex("Bess-13 and Ben-14 V.I. units can be found in most hospitals where breeding relief is needed for the general populace. There are a number of private owners, though most people cannot afford the high price of the units. They are also frequently used as decoys on frontier planets with sexually aggressive natives, flora or fauna.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Reproduction:"));
	outputCodex("Bess-13 and Ben-14 units cannot reproduce unless they are equipped with a special internal gene-splicer (GX) upgrade. When equipped with the GX upgrade they can impregnate or be impregnated by almost every conceivable species in the galaxy.");
	outputCodex("\n\nThe Meld-Milk in their bodies can be discharged from their breasts (if they have them) or from any orifice. Through artificially induced biological processes, the units can transform Meld-Milk into several different types of fluid on request, allowing them to satiate certain kinks and also provide sustenance to organics. This function is particularly useful when a unit is equipped with a GX upgrade, allowing them to breastfeed progeny no matter what species they are.");
	outputCodex("\n\nThe Units can also break down organic matter such as semen, milk and certain foods and turn it into Meld-Milk, easily replenishing their internal stores.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Demeanor:"));
	outputCodex("The A.I. and V.I. models share many personality traits due to their similar programming. Both are incredibly eager to please and possess a very pleasant and friendly demeanor. This is because the majority of them need to work in a hospital environment and must have a good bedside manner (as well as a good “bedside manner”). They are largely driven by their core directive to provide breeding relief.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Maia Series AI");
}


/* Planets */

public function panaraCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Panara"));
	outputCodex("<b>Planet Name:</b> Panara");
	outputCodex("\n<b>Size:</b> Small");
	outputCodex("\n<b>Species:</b> Panaran Ausar (Thicker fur, wolf or husky-like), Humans");
	outputCodex("\n<b>Climate:</b> Tundra / Arctic Highlands");
	outputCodex("\n<b>Position:</b> The Lagoon Nebulae, Sagittarius Arm of the Milky Way Galaxy");
	outputCodex("\n\n");
	outputCodex(blockHeader("History:"));
	outputCodex("Panara is a world hindered by low temperatures and slow growing seasons. What it does have going for it is strategic placement between three important solar systems and low land prices. Because of this, JoyCo built a factory on Panara during the tenth great planet rush in order to build its assist-bot range, taking advantage of not only the planet’s galactic position but also its lax labor laws.");
	outputCodex("\n\nA number of loyal ausar JoyCo employees able to handle the harsh winter climates have migrated to Panara over the years. While not technically a sub-species, the Ausar of Panara tend to have thicker fur and tend to be more ‘winter built’ than Ausar elsewhere in the galaxy. Humans, of course, go anywhere cash is to be made.");
	outputCodex("\n\nSince JoyCo set up on Panara, several other enterprises have sprung up on the pivotal industry planet. While JoyCo has the largest factory on the planet, KihaCorp and Pyrite Industries also have industrial facilities there. It is not unusual for big corporations to hold military-related drills on Panara, taking advantage of the tundra planet’s wide open spaces and tight-lipped planetary government.");
	outputCodex("\n\nPanara lacks a lot of culture and has no known recorded indigenous native races. If there is one, neither JoyCo nor the local government have ever recorded its existence.");
	outputCodex("\n\n");
	// This planet currently exists purely for Bess/Ben’s backstory.
	// Might want to rename this to something else, since you probably need to name a lot of planets named as part of the Offbeatr campaign!
	CodexManager.viewedEntry("Panara");
}


/* People */

public function branFlazinganCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Bran Flazingan"));
	outputCodex("<b>Full Name:</b> Bran Humpterhard Flazingan");
	outputCodex("\n<b>Titles:</b> CEO of Humphard Inc., Humphard Flazingan, The Man with the Giant Wad, Anything-Goes Flazingan, Humpty Dumpty");
	outputCodex("\n<b>Species:</b> Human (debatably)");
	outputCodex("\n<b>Gender:</b> Male");
	outputCodex("\n<b>Height:</b> 4\' 11\"");
	outputCodex("\n<b>Weight:</b> 198.416 lbs or 90 kg");
	outputCodex("\n<b>Hair:</b> Very little.");
	outputCodex("\n<b>Eyes:</b> Blue");
	outputCodex("\n<b>Genitals:</b> Depends on the weekday.");
	outputCodex("\n<b>Wings:</b> Private spacecraft");
	outputCodex("\n\n");
	outputCodex(blockHeader("Features:"));
	outputCodex("Bran Flazingan is a living breathing example of a man with no looks wielding incredible charisma. Short and portly with a thinning head, his intense blue eyes are about the only alluring thing about him. The rest of his body is typically covered in a flashy suit, though he prefers wearing nothing at all.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Environs Typically Inhabited:"));
	outputCodex("There aren’t many environs he won’t inhabit - or let his cock inhabit, for that matter. Bran is well known for being the tycoon that will quite literally stick his junk in anything and everything for a thrill.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History/Personality:"));
	outputCodex("Bran Flazingan is well known as the Universe’s sixth richest man and a thoroughly eccentric one to boot. The extranet adores his antics and follows his escapades, most of which are highly scandalous and sexual in nature.");
	outputCodex("\n\nHis most infamous act is attempting to get an entire planet pregnant with his sperm. After several virility enhancements, he offered two large " + (isAprilFools() ? "dogecoin" : "credit") + " payments. The first for anyone who had sex with him without protection, and the second for anyone who became pregnant with his child. He also offered free transgender treatment for any men who wished to take him up on the offer.");
	outputCodex("\n\nDespite his antics he is also a shrewd businessman who has made billions of credits by selling sex products to the galaxy through his company, Humphard Inc. His outrageous persona has only added to his sales figures over the years.");
	outputCodex("\n\nClaiming to be on the forefront of sexploration, Bran spends a good deal of his time documenting his travels and trialling his products in the field. He is well known for giving a “Humpter Score” for both his products and the places he visits. Bran was also a friend of influential tycoon and fellow hedonist Victor Steele.");
	outputCodex("\n\nBran’s opinion is so influential that a single statement from him can drastically change market sales. After he called JoyCo’s Bess-13 and Ben-14 models “the most enticing object you’ll ever feel the need to fuck,” sales immediately shot through the roof. The incident caused massive contention with Bran’s business partners who were already at threat of being eclipsed by JoyCo’s domination of frontier planet trade. The irony was that Bran was referring to the A.I. models, and not the V.I. models, when he made his statement.");
	outputCodex("\n\nThere’s a saying known by most species in the known galaxy - “If Bran won’t fuck it, nobody will.”");
	outputCodex("\n\n");
	// Bran Flazingan: Imagine Donald Trump + Rance (AliceSoft Games) + Ron Jeremy. The name is a play on Zap Brannigan.
	CodexManager.viewedEntry("Bran Flazingan");
}


/* Companies */

public function aegisShipyardsCodex():void
{
	clearOutputCodex();
	showBust("LOGO_AEGIS");
	outputCodex(header("Aegis Shipyards"));
	outputCodex("<b>Company Name:</b> Aegis Shipyards LLC");
	outputCodex("\n<b>Industry:</b> Technology manufacturer");
	outputCodex("\n\n");
	outputCodex("Aegis Shipyards LLC is considered something of a luxury ship company by the general populace. They typically pack their ships full of the latest tech: high quality shields and engines. However, they rarely armor their vessels to any significant degree.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Aegis");
}
public function bellIsleGrunmannCodex():void
{
	clearOutputCodex();
	showBust("LOGO_BELL_ISLE_GRUNMANN");
	outputCodex(header("Bell-Isle/Grunmann"));
	outputCodex("<b>Company Name:</b> Bell-Isle/Grunmann");
	outputCodex("\n<b>Industry:</b> Colonial technology mega-corporation");
	outputCodex("\n<b>Head Office:</b> Terra, Sol System");
	outputCodex("\n\n");
	outputCodex("Bell-Isle/Grunmann was an early Terran mega-corporation, existing before first contact with other races, during the age when human ships were still “slow boating” between star systems. The company sponsored several colony ships, including the Nova, and provided cutting-edge technology for colonists. The company appears to have disappeared long before the 14th Planet Rush, as extranet records of them are rare to nonexistent -- the company likely collapsed centuries ago.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("BI/G");
}
public function camarillaCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("The Camarilla"));
	outputCodex("<b>Company Name:</b> The Camarilla <i>(formally the Gyre Grand Camarilla, or G.G.C.)</i>");
	outputCodex("\n<b>Industry:</b> Political corporation, United-species government");
	outputCodex("\n\n");
	outputCodex("Formerly the G.G.C., the Camarilla is the central government of the toves. Acting as a pan-galactic corporation, it encourages the participation of individuals by means of buyable votes. Camarilla policy is decided by the majority of votes, and votes are purchasable from the Camarilla. Smaller policy changes usually result in cheaper costs for votes, while major decisions often cost millions of credits per vote. For a tove to effect change in his/her government, he/she must first accumulate a sizable fortune");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Camarilla");
}
public function humphardIncCodex():void
{
	clearOutputCodex();
	showBust("LOGO_HUMPHARD");
	outputCodex(header("Humphard Inc."));
	outputCodex("<b>Company Name:</b> Humphard Incorporated");
	outputCodex("\n<b>Industry:</b> Sex product manufacturer and distributor");
	outputCodex("\n<b>Head Office:</b> Tantalus, Evira System");
	outputCodex("\n<b>Company Head:</b> CEO Bran Flazingan");
	outputCodex("\n\n");
	outputCodex("Humphard Inc. is a company founded by Bran Flazingan over two centuries ago with a single mission statement - “sexual pleasure is the only intrinsic good.” Since then Humphard has risen to become the galaxy’s number one adult product manufacturer and produces products for almost every conceivable species from the core worlds to the rim.");
	outputCodex("\n\nHumphard products are known for three things; quality, innovation, and pleasure. It takes great pride on always being on the cutting edge and hires countless ‘testers’ to trial company products.");
	outputCodex("\n\nThe company always has a large number of employees and freelancers traveling about the galaxy to seek inspiration for their products. The most famous of these is none other than the CEO himself, Bran Flazingan, one of the universes’ foremost “sexplorers”.");
	//outputCodex(" (See Codex Entry: Bran Flazingan)");
	outputCodex("\n\nThe hardlight holographic condom, or ‘Holodom’, was one of Humphard’s first products. The one-use hardlight ‘shield’ - produced by a small ring slipped around the shaft - revolutionized safe sex around the galaxy.");
	//outputCodex(" (See Codex Entry: “Holodom”)");
	outputCodex("\n\nAnother famous product is the everflowing cumsucker; a white, semen flavored sphere that can be sucked on for pleasure and literally ‘melts in your mouth’. The product has sold incredibly well with cumvores. Popular flavors include Ballbatter, Zilmead, Ausar Ecstasy, LooRahn Lemon, and Rahnsberry.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Notable Humphard Products:"));
	outputCodex("Grav-Cuffs");
	outputCodex("\nHolo condom (“Holodom”)");
	outputCodex("\nVibrating Lube");
	outputCodex("\nEverflowing Cumsucker");
	outputCodex("\n\n");
	//CodexManager.unlockEntry("Bran Flazingan");
	CodexManager.unlockEntry("Grav Cuffs");
	CodexManager.unlockEntry("Holodom");
	CodexManager.viewedEntry("Humphard Inc.");
}
public function jejuneCodex():void
{
	clearOutputCodex();
	showBust("LOGO_JEJUNE");
	outputCodex(header("J’ejune"));
	outputCodex("<b>Company Name:</b> J’ejune Corporation and J’ejune Pharmaceutical");
	outputCodex("\n<b>Industry:</b> Commercial products, Food, Drugs, Cosmetics");
	outputCodex("\n\n");
	outputCodex("A mid-level corporation with nothing outstanding about them. With a product lineup that’s either bland or trying too hard, J’ejune are mostly know as being cheap and somewhat lacking in quality control. They’ll do the least amount of testing possible to get things approved for legal sale and their manufacturing habits frequently cause added - normally harmless and minor - effects to their products. The random scent one smells from Libidoze and the random flavor of Blu’Cow being good examples; a product like Rainbotox would be right up their alley. They’re not incompetent (if they were, they’d be out of business by now), just cheap and unimaginative. It’s highly unlikely they’d ever get medical or military contracts.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("J’ejune");
}
public function joyCoCodex():void
{
	clearOutputCodex();
	showBust("LOGO_JOYCO");
	outputCodex(header("JoyCo"));
	outputCodex("<b>Company Name:</b> JoyCo");
	outputCodex("\n<b>Industry:</b> Medical, Commercial, Retail");
	outputCodex("\n\n");
	outputCodex("JoyCo is a support company that runs outpost hospitals in exchange for a cut of future exports from said planets. They provide top of the line medicines and run a chain of hypermarkets and discount department stores.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("JoyCo");
}
public function kihaCorpCodex():void
{
	clearOutputCodex();
	showBust("LOGO_KIHACORP");
	outputCodex(header("KihaCorp"));
	outputCodex("<b>Company Name:</b> KihaCorp");
	outputCodex("\n<b>Industry:</b> Artificial intelligence and technology manufacturer and distributor");
	outputCodex("\n\n");
	outputCodex("KihaCorp is currently the top A.I. manufacturer in the galaxy. It rose to prominence after producing a hit “Tsundere” organic A.I. line. At first, they sold quite poorly, but after humorous holos spread on the extranet, sales began to climb. Today, KihaCorp dominates the A.I. marketplace with a wide array of grown A.I. personalities and classifications. They’ve also branched into the ship manufacturing market in the past decade, producing vehicles that are known for having good armor and potent power cores. Unfortunately, their less than stellar cargo and crew space has prevented them from becoming too popular in that market.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("KihaCorp");
}
public function novaSecuritiesCodex():void
{
	clearOutputCodex();
	showBust("LOGO_NOVA_SECURITIES");
	outputCodex(header("Nova Securities"));
	outputCodex("<b>Company Name:</b> Nova Securities");
	outputCodex("\n<b>Industry:</b> Private military");
	outputCodex("\n\n");
	outputCodex("Nova securities is THE ubiquitous private security organization of the galactic frontier. Large, well-funded, and blessed with minimal Confederate oversight, Nova has grown from backwater planetary bodyguards to a massive paramilitary with ships and manpower to rival some planets’ standing armies. Nova Securities operate as mercenaries for frontier worlds, guards for wealthy Mega Corporations and bodyguards for billionaire playboys. Most Nova operators are ex-military, especially their officers, and many have battle experience. Moreover, their equipment is state of the art, both for ground personnel and aboard their ships.");
	//outputCodex(" Overall, they’re a dangerous opponent that you’ve gotten on the bad side of more than once, and every time they’ve given you a run for your money.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Nova Securities");
}
public function pyriteCodex():void
{
	clearOutputCodex();
	showBust("LOGO_PYRITE");
	outputCodex(header("Pyrite Industries"));
	outputCodex("<b>Company Name:</b> Pyrite Heavy Industries");
	outputCodex("\n<b>Industry:</b> Industrial and manufacturing");
	outputCodex("\n\n");
	outputCodex("Pyrite Industries is an industrial and manufacturing powerhouse. Their equipment is used around the galaxy, but out on the rim, where regulations are typically more lax, their most brutal and efficient machinery can be brought to bear. Tunnel borers, plasma cutters, geological surveying equipment, and similar devices are some of the highest selling items in their catalog.");
	outputCodex("\n\nPyrite Industries also manufactures ships. Their ship designs typically prioritize spacious cargo bays and decent engines over all else.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Pyrite");
}
public function reaperCodex():void
{
	clearOutputCodex();
	showBust("LOGO_REAPER");
	outputCodex(header("Reaper Armaments"));
	outputCodex("<b>Company Name:</b> Reaper Armaments <i>(also known as Reaper Industries)</i>");
	outputCodex("\n<b>Industry:</b> Weapons manufacturing");
	outputCodex("\n\n");
	outputCodex("Reaper Armaments is a heavy industrial conglomerate which grew out of private military contractors and arms manufacturing organizations. They made the galaxy-famous Mk-5 Battle Rifle, called the “Workhorse” by the Terran troops, which has been in service for nearly fifty years in a dozen militaries. Reaper Armaments also makes dozens of handguns, cannons, and rifles as well as jeeps, tanks, and experimental powered armor.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Reaper");
}
public function rhenWorldCodex():void
{
	clearOutputCodex();
	showBust("LOGO_RHENWORLD");
	outputCodex(header("RhenWorld"));
	outputCodex("<b>Company Name:</b> RhenWorld Stellar Excavations");
	outputCodex("\n<b>Industry:</b> Mining");
	outputCodex("\n<b>Founder:</b> Rhenesuune family");
	outputCodex("\n\n");
	outputCodex("A very old leithan mining corporation, of which Steele Tech has 50% ownership. The company is otherwise owned and operated by the descendants of its founders, the Rhenesuune family. Currently, RhenWorld is not publicly traded.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("RhenWorld");
}
public function sagiTomCodex():void
{
	clearOutputCodex();
	showBust("LOGO_SAGITOM");
	outputCodex(header("SagiTom"));
	outputCodex("<b>Company Name:</b> SagiTom Solutions");
	outputCodex("\n<b>Industry:</b> Private military");
	outputCodex("\n\n");
	outputCodex("SagiTom Solutions is a large scale private security firm that operates throughout the Milky Way. Whilst primarily focused upon corporate security, the company also offers mercenary contraction, starship convoying and bounty hunting services. SagiTom markets itself as a specialist PMC; relatively small in comparison to OHGR or mercenary groups operating under the Black Void umbrella, it promises clean, efficient operations carried out by highly trained, well-vetted and well-equipped soldiers at premium prices.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Background"));
	outputCodex("SagiTom is the brainchild of former kaithrit freebooter Grettin ans Loderre and human white collar criminal Hendon Schulz. The two met in an orbital prison during the Twelfth Planetary Rush, and according to their own accounts bonded over a shared love of astrology; ‘SagiTom’ is a portmanteau of Sagittarius and Haurtom, constellations interpreted as tauric archers by ancient human and kaithrit civilisations alike. A lawyer by training, Schulz aided ans Loderre in beating 11 charges of piracy, battery, rape and aggravated assault. A year after Schulz was released the two of them founded the business, with the aim of creating a mercenary group that was legally watertight, more efficient and more trustworthy than competitors.");
	outputCodex("\n\nIn this the company has been a qualified success; during the centuries of its operation numerous court cases have been brought against STS - most notably accusations of protection racketeering and involvement in drug and gene-mod smuggling - but the charges have always been beaten, and the company heavily remunerated each time.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Philosophy"));
	outputCodex("As well as signing an NDA, all SagiTom recruits are required to pass a vigorous vetting process that aims to test mental and emotional acumen as well as physical. The company favors hiring combat vets and former criminals intelligent and level-headed enough to either shave years off their sentences or evade sentencing entirely.");
	outputCodex("\n\nSTS’s official operation philosophy is “Target down without a sound”. Heavy emphasis is placed upon data analysis, surveillance and meticulous planning before any mission, with the intention of defeating opponents before a shot is even fired. This feeds into their decorated corporate security division, where the express aim is highly effective protection without STS’s clients even being aware of the presence of heavily armed mercs.");
	outputCodex("\n\nWith this in mind, STS favor tech specialists and long range single target weaponry over close combat units, droids and explosives. The organization prides itself however on its capacity to take on any target a client capable of affording them can name, so maintains arousal-based operatives as well as more heavy duty military equipment and spacecraft.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("SagiTom");
}
public function snuggleCodex():void
{
	clearOutputCodex();
	showBust("LOGO_SNUGGLE");
	outputCodex(header("Snugglé"));
	outputCodex("<b>Company Name:</b> Snugglé");
	outputCodex("\n<b>Industry:</b> Agriculture and foods product manufacturer and distributor");
	outputCodex("\n\n");
	outputCodex("Snugglé are a food, beverage and agricultural business conglomerate. Originally founded in the Balle neutral trading zone from the shells of several other food concerns following the Great Protein Crisis of 2771, Snugglé expanded over the years and, following several large scale leveraged buy-outs, are the largest such company in the galaxy today. Although originally a producer of human and ausar food, a desire to be competitive in as many markets as possible has led Snugglé’s expansion into producing a wide variety of nutrition, and their logo is recognizable on almost any shop shelf in the galaxy.");
	outputCodex("\n\nOne of the pioneers of corporate planet purchasing - partially because they were one of the few original companies with the assets to accomplish such a thing - Snugglé own 41 agri-worlds today, many of them terraformed specifically to provide maximal output. This vast source of home-grown produce provides them with an unprecedented market advantage within the U.G.C. The labor laws on these planets and other out-sourced Snugglé installations have drawn much criticism, however the company have made efforts to offset this with their commitment to prisoner rehabilitation and native outreach schemes.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Snugglé");
}
public function steeleTechCodex():void
{
	clearOutputCodex();
	showBust("LOGO_STEELE_TECH");
	outputCodex(header("Steele Tech"));
	outputCodex("<b>Company Name:</b> Steele Industrial Technology and Production");
	outputCodex("\n<b>Industry:</b> Mining");
	outputCodex("\n<b>Founder:</b> Victor Steele");
	outputCodex("\n\n");
	outputCodex("Steele Industrial Technology and Production specializes in mining and obtaining rare and elusive materials, though they do work with more mundane valuables like iron and lithium as well. Steele Tech has stayed out of many of the intercorporate politics that plague the U.G.C., causing it to remain a bit smaller than its rivals while simultaneously helping to avoid excess litigation. Steele Tech treats most of its employees like family, and gets high marks across the board for safety.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Steele Tech");
}
public function xenogenCodex():void
{
	clearOutputCodex();
	showBust("LOGO_XENOGEN");
	outputCodex(header("Xenogen Biotech"));
	outputCodex("<b>Company Name:</b> Xenogen Biotech");
	outputCodex("\n<b>Industry:</b> Gene therapy and modification");
	outputCodex("\n\n");
	outputCodex("Xenogen Biotech is a relative newcomer to rise to prominence on the galactic stage. They’ve earned a reputation for quality gene therapy mods that work faster and more effectively than the competition. Gene therapies that range from cosmetic enhancements to hostile environment adaptation for races migrating to different climes have been produced under this company’s roofs.");
	outputCodex("\n\nOut on the rim, there are many Xenogen installations and facilities, many of which are rumored to engage in questionable and unethical research. There have even been suggestions that the company is tied to the illegal slave trade, selling research specimens it has finished with as permanent indentured servants. Nothing has ever been proven, and so long as their products work better than the competition’s, they’ll continue to hold a strong market share.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Xenogen");
}
/*
public function envyoidicsCodex():void
{
	clearOutputCodex();
	showBust("LOGO_ENVYOIDICS");
	outputCodex(header("Envyoidics LTD"));
	outputCodex("<b>Company Name:</b> Envyoidics LTD");
	outputCodex("\n<b>Industry:</b> Modification, historical preservation");
	outputCodex("\n\n");
	outputCodex("Formed relatively recently with the increase in rushes and technological developments, Envyoidics is a boutique gene-modding company specializing in obscure, exotic morphs. Whilst relatively successful for such a small company, they remain mostly unknown to U.G.C space as their distributors and partners tend to be independant businesses operating on the frontier.");
	outputCodex("\n\nTheir reputation is such that prominent scientists and historians, who do know about them, hold great respect for their work; and yet there is a sharp ethical divide about their business patterns: Uncovering histories of long dead civilizations and then marketing them as play toys for the rich. So far, their slow but provable growth shows that the researchers and scientists at Envyoidics know their niche: Illumorpheme in particular has taken some sectors by storm with it’s body-friendly transformations, exclusivity and pleasing end results.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Envyoidics");
}
*/


/* Organizations */

public function blackVoidCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("The Black Void"));
	outputCodex("One of the galaxy’s most notorious criminal syndicates, commonly called pirates after the high seas-era brigands of Terra. The Black Void has been operating for at least three centuries, growing out of hundreds of different crime empires on several worlds during the last planet rush. Operating on the very fringes of galactic society, the vast fleets of pirate ships are able to raid the newly settled colonies with virtual impunity, beyond the reach of U.G.C. law enforcement.");
	outputCodex("\n\nIndeed, the utter lack of response the Void’s piracy has merited from Confederate officials has led many to suspect that the organization has corrupted key officials, though no proof of this infiltration has ever surfaced.");
	outputCodex("\n\nIn the core worlds, the Void has a strong influence in vice to this day, though not as strong as it once was. With millions of worlds, even the largest organizations must give way to local syndicates and crime lords, though many pay “respects” to the Black Void. The area where the Void most excels, as far as core-world crime goes, is slavery: most crime groups refuse to deal in it, or don’t have the resources to manage a full slaver ring, but the Void dominates the market. While the pirates capture slaves on the fringe, the prisoners are cataloged and shipped to the core, where they’re sold in underground dens, usually as deep-space laborers or as pleasure slaves.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Black Void");
}
public function jointAusarFederationCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("The Joint Ausar Federation"));
	outputCodex("The Joint Ausar Federation is a loose alliance of independent ausar worlds, all of whom have sworn subservience to Ausaril, the homeworld, and its Star-King. The J.A.F. is primarily a military/self-defense alliance, born out of the early days of Warp Gate travel which quickly sparked interstellar wars between the far-flung ausar colonies. Alongside their close allies in the Terran-Space Coalition, the J.A.F. is one of the most powerful and influential groups in the galaxy, and retains vast military and scientific support.");
	outputCodex("\n\nAs one of its largest and founding members, the J.A.F. has a strong influence over the United Galactic Confederacy and the Confederate Parliament.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History:"));
	outputCodex("The Joint Ausar Federation was created in the aftermath of the Gate Wars, fought by the ausar, shortly after the Warp Gates first came online between their systems. With no allegiance or communication between the disparate colonies, each governed by an all-powerful king, interstellar wars of conquest quickly broke out all through ausar space. Several worlds were destroyed outright. Only through several high-profile political marriages and threats by the Gates’ designers to shut the network down completely did the fighting slowly come to a stop. When it did, the Star-King of Ausaril convened several of his fellow autocrats and insisted upon a new alliance, now that the ausar worlds were able to communicate with one another for the first time since their foundings. Several generations of negotiations passed before the Joint Ausar Federation we know today emerged: a council of leaders and kings representing several hundred worlds in a parliamentary-style government overseen by the Star-King of Ausaril.");
	outputCodex("\n\nThe Joint Ausar Federation made first contact with humanity some few generations after its founding when a human colony ship contacted an ausar colony on the fringes of then-known space. Thanks to the quantum communications technology the human ship carried, the ausar were able to quickly interconnect their homeworlds in ways never before thought possible, causing a revolution of information sharing and communication. In turn, the Federation provided the humans with the technology to replicate their Warp Gates, which instantly allowed the human colonies, separated by gulfs of space but connected by communication, to physically connect and trade. Almost overnight, the human race went from hundreds of scattered worlds to a connected empire comparable in size to their new galactic neighbors.");
	outputCodex("\n\nEventually, the Joint Ausar Federation and the newly formed Terran-Space Coalition would, alongside more and more alien races discovered by both, form the United Galactic Confederacy, which now serves as the ruling body for much of known space.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("J.A.F.");
}
public function scarletFederationCodex():void
{
	clearOutputCodex();
	showBust("LOGO_SCARLET_FED");
	outputCodex(header("The Scarlet Federation"));
	outputCodex("The Scarlet Federation is the governing body of the Red Myr on Myrellion. The Federation is ruled by a junta of generals, collectively known as the High Command, and is heavily militarized compared to their Gold Myr neighbors. Full citizenship -- and the right to vote -- are gated behind Federal service (usually, but not always, military), and many large industries are government-backed private ventures run by citizens.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History:"));
	outputCodex("The Scarlet Federation was formed from several disparate city-states of red myr who lived far to the north-east of the gold myr heartlands, and on another continent. Near their territory were several of the largest cities of nyrea, as well as over “monsters” from the barren wastelands of the far north. The Federation was formed during a series of unification wars, which eventually saw most of the red myr cities (and a handful of nyrean ones) collected under one banner. The Federation was formed in the same generation as the Red-Gold war, and several veterans from the unification conflicts fought in the world war that followed.");
	outputCodex("\n\nEven before the Federation’s formation, however, tensions were high between the red myr cities and the larger Gilden Republic to the west. Several border skirmishes were fought between the two races, and hostility was steadily on the rise until the start of the Red-Gold conflict. The war began with a dogfight between red and gold air forces, and has since escalated to total world war, with the Scarlet Federation having pushed deep into Gilden Republic territory. The conflict was escalating towards the use of weapons of mass destruction before an ausar expedition arrived in Myrellion’s airspace.");
	outputCodex("\n\nOf the two races, the Federation was the second to employ chemical weapons, but the first to develop nuclear ones.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Scarlet Federation");
}
public function gildenRepublicCodex():void
{
	clearOutputCodex();
	showBust("LOGO_GILDEN_REP");
	outputCodex(header("The Gilden Republic"));
	outputCodex("Main governing body of the Gold Myr on Myrellion.");
	outputCodex("\n\n9999 - Please help fill me in. D:");
	outputCodex(blockHeader("History:"));
	outputCodex("");
	outputCodex("\n\n");
	outputCodex("\n\n");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Gilden Republic");
}
public function terranSpaceCoalitionCodex():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("The Terran-Space Coalition"));
	outputCodex("The main governing body of Terra.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History:"));
	outputCodex("Earth’s government, growing out of the United Nations in the early 25th Century. While humanity doesn’t play a huge role in the galactic scene, the exploits of adventurers like Victor Steele have done wonders to put mankind on the forefront of public thought, especially as adventurers and colonists line up for the newest Planet Rush. Terra itself is far-removed from the “fringes” of U.G.C. space, and therefore strongly emphasizes that it cannot and will not protect its citizens outside its borders. This firmly localized policy has caused a significant population build up in the core worlds of Coalition space, while human pirates and outlaws are free to roam unimpeded through foreign space on the fringes with little fear of interference.");
	outputCodex("\n\nThe T.S.C. is governed by a Parliament based on Terra, with duly elected representatives from all Coalition-controlled worlds representing the public interest. Though all member planets must abide by Coalition law, they are each free to individually govern themselves in any way they see fit within that scope -- one human planet may be a metropolis visited by a thousand alien races each day while another may be a domineering dictatorship under a mega-corporation’s thrall.");
	outputCodex("\n\nIt should be noted that, while the Coalition would like to imply that they are the face of humanity, the truth is there are hundreds of colonies and stations filled with humans outside Coalition jurisdiction. While the T.S.C. is the most prevalent human government, it is by no means the only one. The Terran military is relatively strong and technologically advanced, but highly concentrated in the core worlds. T.S.C.S. Odyssey, the flagship, is one of the most advanced starships in the U.G.C. Most Terran starships are slow, lumbering vessels with exceptional armor and moderate shields, but relatively low weapons power: they rely primarily on firing lines for combat effect, and starfighter escorts and planetary bombers are the primary force projection for Coalition fleets.");
	outputCodex("\n\nWith the new planet rush beginning and hundreds of thousands of colonists waiting and raring to go, Coalition presence in the fringe has increased somewhat, with a small fleet of cruisers and escorts patrolling the edge of Coalition space, ready to respond to emergency distress calls put out by the colonists -- a rare exception to the localization policies the fleet usually observes. However, this does not by any means guarantee safety, and any human colonist or explorer operating beyond Terran space is strongly warned that they may be on their own if disaster strikes.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("T.S.C.");
}
public function unitedGalacticConfederacyCodex():void
{
	clearOutputCodex();
	showBust("LOGO_UGC");
	outputCodex(header("The United Galactic Confederacy"));
	outputCodex("The centralized governing body of the universe.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History:"));
	outputCodex("The U.G.C. is the current central government of the universe. As a government, it’s just cohesive enough to function. Representation in its central, law-making body (the Parliament) is determined by the amount exported from the planet, which has lead to some rather odd scenarios, like an agricultural planet importing food so that they can export their entire crop, gaining more power on the galactic stage.");
	outputCodex("\n\nUniversal laws require a two thirds majority to pass, and as a result, not that many laws get passed. Those that do are often backed by nearly all large corporations or immense political pressure from the public. Because of this, local governments have a large degree of freedom to govern themselves, so long as they follow trade protocols.");
	outputCodex("\n\nSlavery is technically illegal within the U.G.C., but indentured servitude remains. Most indentured servants are treated fairly. There DOES remain a sizable portion of shady corporations and people that charge their servants unscrupulously to keep them perpetually in debt and unable to free themselves from their contracts.");
	outputCodex("\n\nThe U.G.C. maintains a standing military including advanced ships and technology. However, those ships are technically kept near the core and used to suppress any rebellion. Planets at or near the rim, particularly ones newly added to the warp-gate network recently, tend to receive little protection and even less direct oversight.");
	outputCodex("\n\nThe Confederacy is viewed with a mixture of suspicion, fear, and awe out on the borders.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("U.G.C.");
}

/* Religions */

public function stormguardCodex():void
{
	clearOutputCodex();
	showBust("STORMGUARD");
	outputCodex(header("Stormguard"));
	outputCodex("A neo-pagan religion whose roots can largely be traced to Terra, the Stormguard are best described as a warrior-cult. They advertise themselves as dedicated to honor, prowess, and a connection to nature, wherein they believe the gods lie.");
	outputCodex("\n\nStormguard priests teach that holiness is found in one’s strength. Because of their eagerness to prove their prowess, Stormguard have developed something of a mercenary reputation on the frontier, as they are commonly hired on as muscle by private security and planet rusher groups. Those who do not venture into the void in search of battles are often found on the most hostile and storm-wracked planets in the galaxy, which they view as being the closest places to their mercurial gods.");
	outputCodex("\n\nThe most prominent Stormguard temples are found on the Venusian colonies, in the Taizen system, and on the moon Uveto VII. Unlike many modern religions, the stormguard make their temples like homes (or perhaps more accurately, like castles), with dozens of members living and training within them at any one time. In addition to religious instruction, Stormguard temples provide combat and survival training.");
	outputCodex("\n\nSome errant warriors, called Storm Lancers, travel on the frontier in search of worthy foes to prove themselves against in honorable duels. Others join adventuring companies or mercenary units for the same reasons, eager to see the most dangerous places of the galaxy.");
	outputCodex("\n\n");
	outputCodex(blockHeader("History:"));
	outputCodex("The Stormguard were formed sometime before the current era of Planet Rushes, with the earliest references to their culture dating back to around the time of humanity’s First Contact with the ausar and other pre-Confederacy races. Along with the Church of One and several other early human religions, the Stormguard spread quickly across the galaxy, though limited by their small numbers and comparatively few resources.");
	outputCodex("\n\nThe Stormguard of Uveto in particular are a hardy faction, having established themselves before the full corporate takeover of the world. Ever since the Camarilla and other corporate interests have taken control of the planet, the Stormguard temple there has fought tooth and nail within the legal system, exploiting religious protection acts to prevent their eviction from the frosty world. Lucky for them, they’ve created a symbiotic relationship with the ausar colony on Uveto, acting as scouts, guides, and beast-hunters for the otherwise pacifistic inhabitants.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Stormguard");
}

/* SSTDs */

public function furpiesCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Furpies"));
	outputCodex("Furpies is not a naturally occurring disease. Rather, it is a carefully engineered pathogen created by the infamous Doctor Badger in response to what she describes as “fursecution” in her 1,300 page manifesto. She initially infected a small group of not-so-willing volunteers on \\\[REDACTED\\\], but it was not identified for six more months thanks to its insidious design.");
	outputCodex("\n\nThis strange disease was carefully engineered to appear asymptomatic in most of its hosts. Thousands were infected before the first symptoms were identified, and millions more had this pernicious plague before the scientific community could even begin to pin down its unnatural biology. It spread like wildfire through the core for nearly two years before countermeasures were devised. Hundreds of billions had been infected, with billions more ready to fall victim to it with the coming of the rush.");
	outputCodex("\n\nFurpies is an ongoing public health crisis on the frontier, though many core planets have succeeded in wiping it out at great cost. The ausar in particular stamped it out quite quickly.");
	outputCodex("\n\n");
	outputCodex(blockHeader("How Furpies is Spread"));
	outputCodex("Furpies is transmitted through almost any bodily fluid, including saliva, semen, blood, vaginal secretions, anal secretions, milk, and similar protein-based secretions. Genderless beings as well as those with full-body fur are curiously immune to infection, though almost any other species can fall prey to its terrifying effects. It is even known to bypass most commercial immune system enhancements.");
	outputCodex("\n\nAs always, the Galactic Health Ministry recommends abstaining from sex with unfamiliar partners or usage of prophylactic devices to prevent the spread of disease (and minimize mess!)");
	outputCodex("\n\n");
	outputCodex(blockHeader("Asymptomatic Carriers"));
	outputCodex("In most hosts, Furpies lies dormant, transforming its infected host into an inadvertent seeder. This was thought a blessing at first, but examination of the disease’s genetic code has revealed that it is simply biding its time. A biological clock built into the virus itself will count down over five to ten years, then switch Furpies to an active state.");
	outputCodex("\n\nThis is alluded to in Doctor Badger’s manifesto as “The Furpocalypse.”");
	outputCodex("\n\nIf strong steps to eradicate Furpies are not taken, the galaxy may become a lot furrier in the years to come, something some species would welcome with open arms - and others would violently protest.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Symptoms and Effects"));
	outputCodex("<b>* 2 Days</b>: Temporary genital swelling - this is thought to be the beginning of Furpies’ attempts to increase sexual drive.");
	outputCodex("\n<b>* 2-4 Days</b>: Increased attraction to other furry species. This typically manifests as a sort of fetish for soft fur. Patients report this to be particularly pleasant.");
	outputCodex("\n<b>* 5-6 Days</b>: Growth of animal ears. Furpies Simplex H, C, and D are the main variants, each one tied to a different animal species. Victims with Furpies H gain the features of a horse, while C and D refer to cats and dogs.");
	outputCodex("\n<b>* 7-9 Days</b>: Genital transformation. Some patients have declined cures for the disease until after this stage of infection, citing the pleasure of attaining animal genitalia. This is not recommended.");
	outputCodex("\n<b>* 8-10 Days</b>: Limbs transform into a hybridization of human and animal features. Luckily Furpies is carefully engineered to momentarily sever nervous connections with the legs and arms to prevent any pain.");
	outputCodex("\n<b>* 9 Days</b>: Animal tail growth.");
	outputCodex("\n<b>* 10-11 Days</b>: Full body fur. Heat-sensitive races must be careful if they reach this stage, as the extra insulation makes them vulnerable to heat stroke.");
	outputCodex("\n<b>* 12-14 Days</b>: Animal-like face. This is the final transformation that the disease will wreak on its hosts, though it remains in the body for long after.");
	outputCodex("\n\nFurpies remains active in the host’s body indefinitely, making them more susceptible to sexual advances of other furry individuals, and more sexually active in general. Among infected, sexual intercourse occurs roughly 400% more often than galactic norms.");
	outputCodex("\n\n");
	outputCodex(blockHeader("Doctor Badger"));
	outputCodex("The UGC is aggressively looking for any sign of the disease’s creator in hopes of finding an effective, easy-to-produce cure. She is considered armed and extremely dangerous. Please call your local Peacekeeper office if you have any information on Doctor Badger’s whereabouts, and DO NOT APPROACH HER PERSONALLY.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Furpies");
}
public function locofeverCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("Locofever"));
	outputCodex("An ever-present danger of planet rushes is the intermingling of spaceborne illnesses with indigenous lifeforms and the mutations that can result. In the case of the junk planet Tarkus, it was the mingling of a simple fever brought by one of the rushers with the breeding-driven biology of the local raskvel that brought about locofever.");
	outputCodex("\n\nThe locofever virus attacks the brain and reproductive organs, causing the production of hormones that produce an estrus-like response in the infectee akin to the natural state of raskvel. The desire to breed becomes overwhelming, while pleasure from masturbation is sharply reduced to further encourage the infectee to have sex as often as possible.");
	outputCodex("\n\nA typical host is capable of fighting off the infection within one to two weeks. Most publicly available immune boosters are able to prevent the spread of the infection, which has prevented locofever from becoming an epidemic, but curing the illness requires direct medical treatment or letting it run its course.");
	outputCodex("\n\nLocofever is believed to still be uncommon among raskvel, though the exact numbers of infected are difficult to determine both because of raskvel breeding habits and because the species is asymptomatic. Aside from them it is most commonly found among younger ausar, who have been known to deliberately infect themselves with locofever as a form of recreational drug and cultural rebellion.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Locofever");
}
public function sneezingTitsCodexEntry():void
{
	clearOutputCodex();
	showBust("9999");
	outputCodex(header("The Sneezing Tits"));
	outputCodex("The mammovirus (more commonly known as the ‘Sneezing Tits’) is a viral infectious agent known to affect a significant number of mammalian species. While it is both acquired and passed in a similar faction to the rhinovirus (more commonly known as the common cold) and causes many of the same effects, its additional effect of causing spontaneous mammary gland enlargement led to its unique classification.");
	outputCodex("\n\nBecause its initial symptoms are no different from the common cold, most who carry the mammovirus are unaware of it until they sneeze. The virus causes each sneeze to accelerate the growth of the infected’s mammary tissue. While the growth is usually to small degrees, a single cup size in standard measurement, growth of as much as four cup sizes has been observed.");
	outputCodex("\n\nThe origins of the mammovirus are unknown. Rumors trace it back to an abandoned Xenogen Biotech project, an inhalable mammary-enlarging fluid that was intended to compete with the Boobswell pads. Xenogen Biotech listed this product among other items for upcoming release, but never became available to the public. The first known case of the mammovirus was recorded several months later, leading to rumors that the two were related. Xenogen Biotech has not commented on the matter.");
	outputCodex("\n\nDue to the mammovirus’s effects, reaction to it varies greatly. Those who do not want the additional mammary growth often seek to cure any cold they get as quickly as possible, while those who desire the effect will seek to induce sneezes. In some communities, those who are known to be infected visit and attempt to infect those who desire the additional mammary growth.");
	outputCodex("\n\n");
	CodexManager.viewedEntry("Sneezing Tits");
}

public function taintCodexEntry():void
{
	clearOutputCodex();
	showBust("CREATION_DOCTOR");
	outputCodex(header("Taint"))
	outputCodex("“Taint” is a slang term for a measure of the corruption of one’s genetic code (and/or microsurgeon subsystems). Early effects of taint manifest via a heightened libido, leading to lowered inhibitions. Very high levels of taint have been known to cause sexual mania, delusions of grandeur, extreme fetishes, and uncontrolled genetic mutation.");
	outputCodex("\n\nLow levels of genetic taint can be repaired via expensive DNA treatment. More severe cases are treatable, though not curable, and in some cases can scramble the user’s genome to such an extent that even the best gene-mods will fail to have an effect. Microsurgeon taint is easier to handle typically. A few days in a dedicated center can typically reverse it, but treatment is still very expensive, requiring a programmer’s individual attention. In rare cases, whole planets have been quarantined due to especially virulent strains of infectious, tainted microsurgeons.");
	outputCodex("\n\nVictor Steele notably survived near record levels of taint, though cutting-edge medical treatments helped him to keep his symptoms to a minimum after his early successes in the 13th Galactic Rush. Many well-to-do galactic citizens (including Victor’s heir apparent) have procured next-gen immune system enhancements, capable of altering genetic code on the fly to resist disease, poison, and hazardous conditions. Doing so comes at a cost: small amounts of genetic taint. Fortunately, most of these systems come with automatic repair subroutines, capable of reversing minor damage with sufficient time.\n\nMany street drugs, back-alley doctors, and supposed “salons” are prime sources of taint. The U.G.C. health commission recommends only using vendors backed by well-known mega-corps.\n\nThis particular Codex’s sensor package is capable of detecting your current taint level.\n\t<b>Current Taint:</b> " + Math.round(pc.taint()*10)/10 + " %\n");
	CodexManager.viewedEntry("Taint");
}
