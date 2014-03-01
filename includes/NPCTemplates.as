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
	// Check all characters have version information set
	for (var prop in chars)
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