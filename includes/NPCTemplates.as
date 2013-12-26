function initializeNPCs(justUpdate:Boolean = false):void {
	if (!justUpdate || (justUpdate && characters["CELISE"] == undefined))
	{
		characters["CELISE"] = new classes.Characters.Celise();

	
	}
	//Rival!
	if (!justUpdate || (justUpdate && characters["RIVAL"] == undefined))
	{
		//Rival!
		characters["RIVAL"] = new classes.Characters.Rival();
	}
	
	if (!justUpdate || (justUpdate && characters["GEOFF"] == undefined))
	{
		characters["GEOFF"] = new classes.Characters.Geoff();
	
	}
	if (!justUpdate || (justUpdate && characters["FLAHNE"] == undefined))
	{
		characters["FLAHNE"] = new classes.Characters.Flahne();
	}	
	if (!justUpdate || (justUpdate && characters["ZILPACK"] == undefined))
	{
		characters["ZILPACK"]  = new classes.Characters.ZilPack();

	}
	if (!justUpdate || (justUpdate && characters["ZIL"] == undefined))
	{
		characters["ZIL"] = new classes.Characters.ZilMale();
	}
	
	if (!justUpdate || (justUpdate && characters["PENNY"] == undefined))
	{
		characters["PENNY"] = new classes.Characters.Penny();

	}
	if (!justUpdate || (justUpdate && characters["BURT"] == undefined))
	{
		characters["BURT"] = new classes.Characters.Burt();

	}
	if (!justUpdate || (justUpdate && characters["ZILFEMALE"] == undefined))
	{
		characters["ZILFEMALE"] = new classes.Characters.ZilFemale();
	}
	if (!justUpdate || (justUpdate && characters["CSNAKE"] == undefined))
	{
		characters["CSNAKE"] = new classes.Characters.CuntSnake();

	}

	// CHRIST WHY?
	this.characters["PC"] = new Creature()
	this.pc = characters["PC"];
	this.celise = characters["CELISE"];
	this.rival = characters["RIVAL"];
	this.geoff = characters["GEOFF"];
	this.flahne = characters["CELISE"];
	this.zilpack = characters["ZILPACK"];
	this.zil = characters["ZIL"];
	this.penny = characters["PENNY"];
	this.burt = characters["BURT"];
	this.zilFemale = characters["ZILFEMALE"];
	this.cuntsnake = characters["CSNAKE"];

	this.foes[0] = new Creature();

}