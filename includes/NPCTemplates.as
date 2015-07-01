import classes.Characters.Anarrie;
import classes.Characters.Brynn;
import classes.Characters.GigaGoo;
import classes.Characters.gooArmor;
import classes.Characters.GrayPrime;
import classes.Characters.HuntressVanae;
import classes.Characters.Kiro;
import classes.Characters.Lane;
import classes.Characters.MaidenVanae;
import classes.Characters.Nevrie;
import classes.Characters.NyreaAlpha;
import classes.Characters.NyreaBeta;
import classes.Characters.PhoenixPirates;
import classes.Characters.GunTurrets;
import classes.Characters.Saendra;
import classes.Characters.SecurityDroids;
public function initializeNPCs(justUpdate:Boolean = false):void 
{
	trace("initializeNPCs Called, just doing cleanup?", justUpdate)
	
	if (!justUpdate || (justUpdate && chars["CELISE"] == undefined))
	{
		chars["CELISE"] = new classes.Characters.Celise();
	}
	//Rival!
	if (!justUpdate || (justUpdate && chars["RIVAL"] == undefined))
	{
		//Rival!
		chars["RIVAL"] = new classes.Characters.Rival();
	}
	
	if (!justUpdate || (justUpdate && chars["GEOFF"] == undefined))
	{
		chars["GEOFF"] = new classes.Characters.Geoff();
	}
	//GEOFF UPGRADE HAX
	if(chars["GEOFF"].version == 2) {
		chars["GEOFF"].inventory = new Array();
		chars["GEOFF"].inventory.push(new classes.Items.Melee.Knife());
		chars["GEOFF"].inventory.push(new classes.Items.Guns.HoldOutPistol());
		chars["GEOFF"].inventory.push(new classes.Items.Guns.EagleHandgun());
		chars["GEOFF"].inventory.push(new classes.Items.Guns.ScopedPistol());
		chars["GEOFF"].inventory.push(new classes.Items.Apparel.ComfortableClothes());
		chars["GEOFF"].inventory.push(new classes.Items.Apparel.PlainUndershirt());
		chars["GEOFF"].inventory.push(new classes.Items.Apparel.PlainBra());
		chars["GEOFF"].inventory.push(new classes.Items.Apparel.PlainPanties());
		chars["GEOFF"].inventory.push(new classes.Items.Apparel.PlainBriefs());
		chars["GEOFF"].version = 3;
	}
	//GEOFF UPGRADE HAX
	if(chars["GEOFF"].version == 3) {
		chars["GEOFF"].inventory.push(new LeatherArmor());
		chars["GEOFF"].inventory.push(new NaleenArmor());
		chars["GEOFF"].inventory.push(new Knife());
		chars["GEOFF"].inventory.push(new HoldOutPistol());
		chars["GEOFF"].inventory.push(new EagleHandgun());
		chars["GEOFF"].inventory.push(new ScopedPistol());
		chars["GEOFF"].inventory.push(new ComfortableClothes());
		chars["GEOFF"].inventory.push(new PlainUndershirt());
		chars["GEOFF"].inventory.push(new PlainBra());
		chars["GEOFF"].inventory.push(new PlainPanties());
		chars["GEOFF"].inventory.push(new PlainBriefs());
		chars["GEOFF"].version = 4;
	}
	if (!justUpdate || (justUpdate && chars["FLAHNE"] == undefined))
	{
		chars["FLAHNE"] = new classes.Characters.Flahne();
	}	
	if (!justUpdate || (justUpdate && chars["ZILPACK"] == undefined))
	{
		chars["ZILPACK"]  = new classes.Characters.ZilPack();

	}
	if (!justUpdate || (justUpdate && chars["ZIL"] == undefined))
	{
		chars["ZIL"] = new classes.Characters.ZilMale();
	}
	
	if (!justUpdate || (justUpdate && chars["PENNY"] == undefined))
	{
		chars["PENNY"] = new classes.Characters.Penny();
	}
	if (!justUpdate || (justUpdate && chars["BURT"] == undefined))
	{
		chars["BURT"] = new classes.Characters.Burt();

	}
	if (!justUpdate || (justUpdate && chars["ZILFEMALE"] == undefined))
	{
		chars["ZILFEMALE"] = new classes.Characters.ZilFemale();
	}
	if (!justUpdate || (justUpdate && chars["CUNTSNAKE"] == undefined))
	{
		chars["CUNTSNAKE"] = new classes.Characters.CuntSnake();
	}
	if (!justUpdate || (justUpdate && chars["NALEEN"] == undefined))
	{
		chars["NALEEN"] = new classes.Characters.Naleen();
	}
	if (!justUpdate || (justUpdate && chars["VENUSPITCHER"] == undefined))
	{
		chars["VENUSPITCHER"] = new classes.Characters.VenusPitcher();
	}
	if (!justUpdate || (justUpdate && chars["ELDERVENUSPITCHER"] == undefined))
	{
		chars["ELDERVENUSPITCHER"] = new classes.Characters.ElderVenusPitcher();
	}
	if (!justUpdate || (justUpdate && chars["SYRI"] == undefined))
	{
		chars["SYRI"] = new classes.Characters.Syri();
	}
	if (!justUpdate || (justUpdate && chars["NALEEN_MALE"] == undefined))
	{
		chars["NALEEN_MALE"] = new classes.Characters.NaleenMale();
	}
	if (!justUpdate || (justUpdate && chars["MACHINA"] == undefined))
	{
		chars["MACHINA"] = new classes.Characters.CarlsRobot();
	}
	if (!justUpdate || (justUpdate && chars["JADE"] == undefined))
	{
		chars["JADE"] = new classes.Characters.Jade();
	}
	if (!justUpdate || (justUpdate && chars["REAHA"] == undefined))
	{
		chars["REAHA"] = new classes.Characters.Reaha();
	}
	if (!justUpdate || (justUpdate && chars["DANE"] == undefined))
	{
		chars["DANE"] = new classes.Characters.Dane();
	}
	if (!justUpdate || (justUpdate && chars["SERA"] == undefined))
	{
		chars["SERA"] = new classes.Characters.Sera();
	}
	if (!justUpdate || (justUpdate && chars["MIMBRANE"] == undefined))
	{
		chars["MIMBRANE"] = new classes.Characters.Mimbrane();
	}
	if (!justUpdate || (justUpdate && chars["RASKVEL_FEMALE"] == undefined))
	{
		chars["RASKVEL_FEMALE"] = new classes.Characters.RaskvelFemale();
	}
	if (!justUpdate || (justUpdate && chars["RASKVEL_MALE"] == undefined))
	{
		chars["RASKVEL_MALE"] = new classes.Characters.RaskvelMale();
	}
	if (!justUpdate || (justUpdate && chars["VKO"] == undefined))
	{
		chars["VKO"] = new classes.Characters.VKo();
	}
	if (!justUpdate || (justUpdate && chars["SEXBOT"] == undefined))
	{
		chars["SEXBOT"] = new classes.Characters.SexBot();
	}
	if (!justUpdate || (justUpdate && chars["GRAYGOO"] == undefined))
	{
		chars["GRAYGOO"] = new classes.Characters.GrayGoo();
	}
	if (!justUpdate || (justUpdate && chars["LAPINARAFEMALE"] == undefined))
	{
		chars["LAPINARAFEMALE"] = new classes.Characters.LapinaraFemale();
	}
	if (!justUpdate || (justUpdate && chars["SYDIANMALE"] == undefined))
	{
		chars["SYDIANMALE"] = new classes.Characters.SydianMale();
	}
	if (!justUpdate || (justUpdate && chars["DELILAH"] == undefined))
	{
		chars["DELILAH"] = new classes.Characters.Delilah();
	}
	if (!justUpdate || (justUpdate && chars["ALISS"] == undefined))
	{
		chars["ALISS"] = new classes.Characters.Aliss();
	}
	if (!justUpdate || (justUpdate && chars["SHEKKA"] == undefined))
	{
		chars["SHEKKA"] = new classes.Characters.Shekka();
	}
	if (!justUpdate || (justUpdate && chars["ANNO"] == undefined))
	{
		chars["ANNO"] = new classes.Characters.Anno();
	}
	if (!justUpdate || (justUpdate && chars["DRBADGER"] == undefined))
	{
		chars["DRBADGER"] = new classes.Characters.DrBadger();
	}
	if (!justUpdate || (justUpdate && chars["COLENSO"] == undefined))
	{
		chars["COLENSO"] = new classes.Characters.Colenso();
	}
	if (!justUpdate || (justUpdate && chars["KELLY"] == undefined))
	{
		chars["KELLY"] = new classes.Characters.Kelly();
	}
	if (!justUpdate || (justUpdate && chars["FIREWALL"] == undefined))
	{
		chars["FIREWALL"] = new classes.Characters.HandSoBot();
	}
	if (!justUpdate || (justUpdate && chars["PHOENIXPIRATES"] == undefined))
	{
		chars["PHOENIXPIRATES"] = new PhoenixPirates();
	}
	if (!justUpdate || (justUpdate && chars["AUTOTURRETS"] == undefined))
	{
		chars["AUTOTURRETS"] = new GunTurrets();
	}
	if (!justUpdate || (justUpdate && chars["ROCKETPODS"] == undefined))
	{
		chars["ROCKETPODS"] = new RocketTurrets();
	}
	if (!justUpdate || (justUpdate && chars["CAPTAINKHORGANMECH"] == undefined))
	{
		chars["CAPTAINKHORGANMECH"] = new CaptainKhorganMech();
	}
	if (!justUpdate || (justUpdate && chars["CAPTAINKHORGAN"] == undefined))
	{
		chars["CAPTAINKHORGAN"] = new CaptainKhorgan();
	}
	if (!justUpdate || (justUpdate && chars["KASKA"] == undefined))
	{
		chars["KASKA"] = new Kaska();
	}
	if (!justUpdate || (justUpdate && chars["KIRO"] == undefined))
	{
		chars["KIRO"] = new Kiro();
	}
	if (!justUpdate || (justUpdate && chars["SAENDRA"] == undefined))
	{
		chars["SAENDRA"] = new Saendra();
	}
	if (!justUpdate || (justUpdate && chars["AMMA"] == undefined))
	{
		chars["AMMA"] = new Amma();
	}
	if (!justUpdate || (justUpdate && chars["HUNTRESS_VANAE"] == undefined))
	{
		chars["HUNTRESS_VANAE"] = new HuntressVanae();
	}
	if (!justUpdate || (justUpdate && chars["MAIDEN_VANAE"] == undefined))
	{
		chars["MAIDEN_VANAE"] = new MaidenVanae();
	}
	if (!justUpdate || (justUpdate && chars["SECURITYDROIDS"] == undefined))
	{
		chars["SECURITYDROIDS"] = new SecurityDroids();
	}
	if (!justUpdate || (justUpdate && chars["GRAYPRIME"] == undefined))
	{
		chars["GRAYPRIME"] = new GrayPrime();
	}
	if (!justUpdate || (justUpdate && chars["GIGAGOO"] == undefined))
	{
		chars["GIGAGOO"] = new GigaGoo();
	}
	if (!justUpdate || (justUpdate && chars["ELLIE"] == undefined))
	{
		chars["ELLIE"] = new Ellie();
	}
	if (!justUpdate || (justUpdate && chars["GIANNA"] == undefined))
	{
		chars["GIANNA"] = new Gianna();
	}
	if (!justUpdate || (justUpdate && chars["BRYNN"] == undefined))
	{
		chars["BRYNN"] = new Brynn();
	}
	if (!justUpdate || (justUpdate && chars["VARMINT"] == undefined))
	{
		chars["VARMINT"] = new Varmint();
	}
	if (!justUpdate || (justUpdate && chars["KARA"] == undefined))
	{
		chars["KARA"] = new Kara();
	}
	if (!justUpdate || (justUpdate && chars["SHADE"] == undefined))
	{
		chars["SHADE"] = new Shade();
	}
	if (!justUpdate || (justUpdate && chars["EMBRY"] == undefined))
	{
		chars["EMBRY"] = new Embry();
	}
	if (!justUpdate || (justUpdate && chars["LANE"] == undefined))
	{
		chars["LANE"] = new Lane();
	}
	if (!justUpdate || (justUpdate && chars["RENVRA"] == undefined))
	{
		chars["RENVRA"] = new Renvra();
	}
	if (!justUpdate || (justUpdate && chars["COCKVINE"] == undefined))
	{
		chars["COCKVINE"] = new Cockvine();
	}
	if (!justUpdate || (justUpdate && chars["XANTHE"] == undefined))
	{
		chars["XANTHE"] = new Xanthe();
	}
	if (!justUpdate || (justUpdate && chars["NYREA ALPHA"] == undefined))
	{
		chars["NYREA ALPHA"] = new NyreaAlpha();
	}
	if (!justUpdate || (justUpdate && chars["NYREA BETA"] == undefined))
	{
		chars["NYREA BETA"] = new NyreaBeta();
	}
	if (!justUpdate || (justUpdate && chars["FROG_GIRL"] == undefined))
	{
		chars["FROG_GIRL"] = new FrogGirl();
	}
	if (!justUpdate || (justUpdate && chars["WETRA HOUND"] == undefined))
	{
		chars["WETRA HOUND"] = new WetraHound();
	}
	if (!justUpdate || (justUpdate && chars["WETRAXXEL BRAWLER"] == undefined))
	{
		chars["WETRAXXEL BRAWLER"] = new WetraxxelBrawler();
	}
	if (!justUpdate || (justUpdate && chars["MERCHANT QUEEN"] == undefined))
	{
		chars["MERCHANT QUEEN"] = new MerchantQueen();
	}
	if (!justUpdate || (justUpdate && chars["ANARRIE"] == undefined))
	{
		chars["ANARRIE"] = new Anarrie();
	}
	if (!justUpdate || (justUpdate && chars["GOO"] == undefined))
	{
		chars["GOO"] = new gooArmor();
	}
	if (!justUpdate || (justUpdate && chars["SEIFYN"] == undefined))
	{
		chars["SEIFYN"] = new Seifyn();
	}
	if (!justUpdate || (justUpdate && chars["INFECTED MYR FEMALE"] == undefined))
	{
		chars["INFECTED MYR FEMALE"] = new MyrInfectedFemale();
	}
	if (!justUpdate || (justUpdate && chars["NEVRIE"] == undefined))
	{
		chars["NEVRIE"] = new Nevrie();
	}
	if (!justUpdate || (justUpdate && chars["DRLASH"] == undefined))
	{
		chars["DRLASH"] = new DoctorLash();
	}
	if (!justUpdate || (justUpdate && chars["CERIA"] == undefined))
	{
		chars["CERIA"] = new Ceria();
	}
	// Check all characters have version information set
	for (var prop:String in chars)
	{
		if (chars[prop].version == 0)
		{
			throw new Error("Character class '" + prop + "' has no version information set!");
		}
		else
		{
			trace("Creature '" + prop + "' Game Version " + chars[prop].version);
		}
	}
	this.foes[0] = new Creature();
}