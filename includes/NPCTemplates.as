function initializeNPCs(justUpdate:Boolean = false):void {
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
	if (!justUpdate || (justUpdate && chars["CSNAKE"] == undefined))
	{
		chars["CSNAKE"] = new classes.Characters.CuntSnake();

	}

	this.foes[0] = new Creature();

}