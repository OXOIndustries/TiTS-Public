import classes.Characters.PlayerCharacter;
import flash.utils.Dictionary;
public function initializeNPCs(justUpdate:Boolean = false):void 
{
	if (!justUpdate)
	{
		chars = new Object();
		charDict = new Dictionary();
		shits = new Object();
		shitDict = new Dictionary();
		
		var nPC:PlayerCharacter = new PlayerCharacter();
		chars["PC"] = nPC;
		charDict[nPC] = "PC";
	}
	
	prepChar(justUpdate, "CELISE", Celise);
	prepChar(justUpdate, "RIVAL", Rival);
	prepChar(justUpdate, "PC_BABY", PlayerOffspring);
	prepChar(justUpdate, "GEOFF", Geoff);
	prepChar(justUpdate, "FLAHNE", Flahne);
	prepChar(justUpdate, "ZILPACK", ZilPack);
	prepChar(justUpdate, "ZIL", ZilMale);
	prepChar(justUpdate, "PENNY", Penny);
	prepChar(justUpdate, "BURT", Burt);
	prepChar(justUpdate, "ZILFEMALE", ZilFemale);
	prepChar(justUpdate, "CUNTSNAKE", CuntSnake);
	prepChar(justUpdate, "NALEEN", Naleen);
	prepChar(justUpdate, "VENUSPITCHER", VenusPitcher);
	prepChar(justUpdate, "ELDERVENUSPITCHER", ElderVenusPitcher);
	prepChar(justUpdate, "SYRI", Syri);
	prepChar(justUpdate, "NALEEN_MALE", NaleenMale);
	prepChar(justUpdate, "CARL", Carl);
	prepChar(justUpdate, "MACHINA", CarlsRobot);
	prepChar(justUpdate, "JADE", Jade);
	prepChar(justUpdate, "REAHA", Reaha);
	prepChar(justUpdate, "DANE", Dane);
	prepChar(justUpdate, "SERA", Sera);
	prepChar(justUpdate, "MIMBRANE", Mimbrane);
	prepChar(justUpdate, "RASKVEL_FEMALE", RaskvelFemale);
	prepChar(justUpdate, "RASKVEL_MALE", RaskvelMale);
	prepChar(justUpdate, "VKO", VKo);
	prepChar(justUpdate, "SEXBOT", SexBot);
	prepChar(justUpdate, "GRAYGOO", GrayGoo);
	prepChar(justUpdate, "LAPINARAFEMALE", LapinaraFemale);
	prepChar(justUpdate, "SYDIANMALE", SydianMale);
	prepChar(justUpdate, "DELILAH", Delilah);
	prepChar(justUpdate, "ALISS", Aliss);
	prepChar(justUpdate, "SHEKKA", Shekka);
	prepChar(justUpdate, "ANNO", Anno);
	prepChar(justUpdate, "DRBADGER", DrBadger);
	prepChar(justUpdate, "COLENSO", Colenso);
	prepChar(justUpdate, "KELLY", Kelly);
	prepChar(justUpdate, "FIREWALL", HandSoBot);
	prepChar(justUpdate, "PHOENIXPIRATES", PhoenixPirates);
	prepChar(justUpdate, "AUTOTURRETS", GunTurrets);
	prepChar(justUpdate, "ROCKETPODS", RocketTurrets);
	prepChar(justUpdate, "CAPTAINKHORGANMECH", CaptainKhorganMech);
	prepChar(justUpdate, "CAPTAINKHORGAN", CaptainKhorgan);
	prepChar(justUpdate, "KASKA", Kaska);
	prepChar(justUpdate, "KIRO", Kiro);
	prepChar(justUpdate, "SAENDRA", Saendra);
	prepChar(justUpdate, "AMMA", Amma);
	prepChar(justUpdate, "HUNTRESS_VANAE", HuntressVanae);
	prepChar(justUpdate, "MAIDEN_VANAE", MaidenVanae);
	prepChar(justUpdate, "SECURITYDROIDS", SecurityDroids);
	prepChar(justUpdate, "GRAYPRIME", GrayPrime);
	prepChar(justUpdate, "GIGAGOO", GigaGoo);
	prepChar(justUpdate, "ELLIE", Ellie);
	prepChar(justUpdate, "GIANNA", Gianna);
	prepChar(justUpdate, "BRYNN", Brynn);
	prepChar(justUpdate, "VARMINT", Varmint);
	prepChar(justUpdate, "KARA", Kara);
	prepChar(justUpdate, "SHADE", Shade);
	prepChar(justUpdate, "EMBRY", Embry);
	prepChar(justUpdate, "LANE", Lane);
	prepChar(justUpdate, "RENVRA", Renvra);
	prepChar(justUpdate, "COCKVINE", Cockvine);
	prepChar(justUpdate, "XANTHE", Xanthe);
	prepChar(justUpdate, "NYREA ALPHA", NyreaAlpha);
	prepChar(justUpdate, "NYREA BETA", NyreaBeta);
	prepChar(justUpdate, "FROG_GIRL", FrogGirl);
	prepChar(justUpdate, "WETRA HOUND", WetraHound);
	prepChar(justUpdate, "WETRAXXEL BRAWLER", WetraxxelBrawler);
	prepChar(justUpdate, "MERCHANT QUEEN", MerchantQueen);
	prepChar(justUpdate, "ANARRIE", Anarrie);
	prepChar(justUpdate, "GOO", gooArmor);
	prepChar(justUpdate, "SEIFYN", Seifyn);
	prepChar(justUpdate, "INFECTED MYR FEMALE", MyrInfectedFemale);
	prepChar(justUpdate, "NEVRIE", Nevrie);
	prepChar(justUpdate, "DRLASH", DoctorLash);
	prepChar(justUpdate, "CERIA", Ceria);
	prepChar(justUpdate, "QUEENOFTHEDEEP", QueenOfTheDeep);
	prepChar(justUpdate, "RED_DESERTER", MyrRedFemaleDeserter);
	prepChar(justUpdate, "GOLD_DESERTER", MyrGoldFemaleDeserter);
	prepChar(justUpdate, "NYREAN_PRAETORIANS", NyreanPraetorians);
	prepChar(justUpdate, "GOOCUBATOR", Goocubator);
	prepChar(justUpdate, "SX1GROUPPIRATES", SX1GroupPirates);
	prepChar(justUpdate, "SX1SHOTGUARD", SX1Shotguard);
	prepChar(justUpdate, "SX1TECHGUARD", SX1Techguard);
	prepChar(justUpdate, "TAIVRA", Taivra);
	prepChar(justUpdate, "QUEENSGUARD", Queensguard);
	prepChar(justUpdate, "PRINCESS", Princess);
	prepChar(justUpdate, "GENE", Gene);
	prepChar(justUpdate, "BESS", Bess);
	prepChar(justUpdate, "EMMY", Emmy);
	prepChar(justUpdate, "INESSA", Inessa);
	prepChar(justUpdate, "GARDEBOT", GardeBot);
	prepChar(justUpdate, "CRYSTALSHOPKEEP", CrystalShopkeep);
	prepChar(justUpdate, "CRYSTALKNIGHT", GooKnight);
	prepChar(justUpdate, "PETR", Petr);
	prepChar(justUpdate, "VI", Vi);
	prepChar(justUpdate, "FYN", Fyn);
	prepChar(justUpdate, "SEMITH", Semith);
	prepChar(justUpdate, "LIRIEL", Liriel);
	prepChar(justUpdate, "LERRIS", Lerris);
	prepChar(justUpdate, "NERRASA", Nerrasa);
	prepChar(justUpdate, "JEROME", Jerome);
	prepChar(justUpdate, "KIRILA", Kirila);
	prepChar(justUpdate, "EDAN", Edan);
	prepChar(justUpdate, "ILARIA", Ilaria);
	prepChar(justUpdate, "WULFE", Siegwulfe);
	prepChar(justUpdate, "BUSKY", Busky);
	prepChar(justUpdate, "KALLY", Kally);
	prepChar(justUpdate, "DRLESSAU", DrLessau);
	prepChar(justUpdate, "NYMFOE", NymFoe);
	prepChar(justUpdate, "DOLLMAKER", Dollmaker);
	prepChar(justUpdate, "PEXIGA", Pexiga);
	prepChar(justUpdate, "MILODAN_MALE", MilodanMale);
	prepChar(justUpdate, "VENDINGMACHINE", VendingMachine);
	prepChar(justUpdate, "ARAKEI", AraKei);
	prepChar(justUpdate, "GWEN", Gwen);
	prepChar(justUpdate, "BEA", Bea);
	prepChar(justUpdate, "CHRYSALISDRONE", ChrysalisDrone);
	prepChar(justUpdate, "KAZRA", Kazra);
	prepChar(justUpdate, "PIPPA", Pippa);
	prepChar(justUpdate, "JERYNN", Jerynn);
	prepChar(justUpdate, "MABBS", Mabbs);
	prepChar(justUpdate, "CYNTHIA", Cynthia);
	prepChar(justUpdate, "CHAURMINE", Chaurmine);
	prepChar(justUpdate, "MIRRIN", Mirrin);
	prepChar(justUpdate, "YAMMI", Yammi);
	prepChar(justUpdate, "FISIANNA", Fisianna);
	prepChar(justUpdate, "NALEENBROA", NaleenBrotherA);
	prepChar(justUpdate, "NALEENBROB", NaleenBrotherB);
	prepChar(justUpdate, "AZRA", Azra);
	prepChar(justUpdate, "ZIL9TAILS", Zil9Tail);
	prepChar(justUpdate, "GRYVAINAGENT", GryvainAgent);
	prepChar(justUpdate, "LUCA", Luca);
	prepChar(justUpdate, "KRYM", Krym);
	prepChar(justUpdate, "PAIGE", Paige);
	prepChar(justUpdate, "CIARAN", Ciaran);
	prepChar(justUpdate, "KATTON", KattomOsgood);
	prepChar(justUpdate, "TAMTAM", TamTam);
	prepChar(justUpdate, "ERIKA", Erika);
	prepChar(justUpdate, "LIEVE", Lieve);
	prepChar(justUpdate, "STORMGUARD_MALE", StormguardMale);
	prepChar(justUpdate, "HEIDRUN", Heidrun);
	prepChar(justUpdate, "NENNE", Nenne);
	prepChar(justUpdate, "TUUVA", Tuuva);
	prepChar(justUpdate, "ALEX_SURF", AlexSurf);
	prepChar(justUpdate, "MITZI", Mitzi);
	prepChar(justUpdate, "URBOLG", Urbolg);
	prepChar(justUpdate, "FROSTWYRM", Frostwyrm);
	prepChar(justUpdate, "SECURITY_ROBOTS", AkkadiSecurityRobots);
	prepChar(justUpdate, "SCHORA", CommanderSchora);
	prepChar(justUpdate, "TORRA", Torra);
	prepChar(justUpdate, "DRCALNOR", DrCalnor);
	prepChar(justUpdate, "THAREDRONE", ThareDrone);
	prepChar(justUpdate, "LAH", RKLah);
	prepChar(justUpdate, "KANE", Kane);
	prepChar(justUpdate, "SHIZUYA", Shizuya);
	prepChar(justUpdate, "ARDIA", Ardia);
	prepChar(justUpdate, "MRFOX", EMMrFox);
	prepChar(justUpdate, "REDD", EMRedd);
	prepChar(justUpdate, "PONYLUVER", EMPonyLuver);
	prepChar(justUpdate, "SEXYYDADDYY", EMSexyyDaddyy);
	prepChar(justUpdate, "BOUNTIFULBOTANY", EMBountifulBotany);
	prepChar(justUpdate, "SNEAKYSNEK", EMSneakySnek);
	prepChar(justUpdate, "RIPPED4YOURPLEASURE", EMRipped4YourPleasure);
	prepChar(justUpdate, "STORMDRAGON", EMStormDragon);
	prepChar(justUpdate, "MAIKE", Maike);
	prepChar(justUpdate, "AINA", Aina);
	prepChar(justUpdate, "DRYAD", Dryad);
	prepChar(justUpdate, "VARMINTPET", VarmintPet);
	prepChar(justUpdate, "QUAELLE", Quaelle);
	prepChar(justUpdate, "ZEA", Zea);
	prepChar(justUpdate, "LOLA", Lola);
	prepChar(justUpdate, "SIMONE", Simone);
	prepChar(justUpdate, "BETSY", Betsy);
	prepChar(justUpdate, "VICTORIA", Victoria);
	prepChar(justUpdate, "MARION", Marion);
	prepChar(justUpdate, "LURELING", Lureling);
	prepChar(justUpdate, "ROXY", Roxy);
	prepChar(justUpdate, "LORELEI", Lorelei);
	prepChar(justUpdate, "VELTA", Velta);
	prepChar(justUpdate, "BIANCA", Bianca);
	prepShip(justUpdate, "SHIP", Casstech);
	prepChar(justUpdate, "KIONA", Kiona);
	prepChar(justUpdate, "NYKKE", Nykke);
	prepChar(justUpdate, "VAHN", Vahn);
	prepChar(justUpdate, "DOCKMASTER", Dockmaster);
	prepChar(justUpdate, "SYNPHIA", Synphia);
	prepChar(justUpdate, "FOCALOR", Focalor);
	prepChar(justUpdate, "OLYMPIA", Olympia);
	
	// Check all characters have version information set
	for (var prop:String in chars)
	{
		if (chars[prop].version == 0)
		{
			throw new Error("Character class '" + prop + "' has no version information set!");
		}
		else
		{
			//trace("Creature '" + prop + "' Game Version " + chars[prop].version);
		}
	}
}

public function prepChar(justUpdate:Boolean, index:String, classT:Class):void
{
	if (!justUpdate || (justUpdate && chars[index] == undefined))
	{
		var objInst:Object = new classT();
		chars[index] = objInst;
		charDict[objInst] = index;
	}
}
public function prepShip(justUpdate:Boolean, index:String, classT:Class):void
{
	if (!justUpdate || (justUpdate && shits[index] == undefined))
	{
		var objInst:Object = new classT();
		shits[index] = objInst;
		shitDict[objInst] = index;
	}
}