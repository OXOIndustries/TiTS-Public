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
		trace("INITIALIZED NEW VENUS PITCHER");
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