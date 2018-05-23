/*
 * flaggo flaggies:
 *  - ZILTWINS_MET
 * 		0 - said no
 * 		1 - said fuk yea bby
 * 		no points for guessing what this does
 *  - ZILTWINS_BARCOUNTERS
 *		encounters in bar, geddit?
 *
*/

public function zilTwinsAtBar():Boolean
{
	return days % 3 == 0 || days % 5 == 0;
}

public function zilTwinsFitsInTetra(cawk:CockClass):Boolean
{
	return true;
}

//nekkidStates: 0 - not showing up, 1 - chitined, 2 - naked
//luckily, this won't be my job until someone makes busts
public function showZilTwins(nekkidTetra:int = 0, nekkidMica:int = 0, tetraInFront:Boolean = true):void
{
	/*var tetrabust:String = (nekkidTetra == 0 ? "" : (nekkidTetra == 2 ? "TETRA_NUDE": "TETRA"));
	var micabust:String = (nekkidMica == 0 ? "" : (nekkidMica == 2 ? "MICA_NUDE": "MICA"));
	if (!tetraInFront || nekkidTetra == 0) showBust(micabust, tetrabust);
	else showBust(tetrabust, micabust);
	*/
	showName("TETRA\n& MICA");
	author("HugsAlright");
}

public function zilTwinsEsbethBonus():Boolean
{
	output("zilcheck");
	if (flags["ZILTWINS_MET"] == undefined && pc.hasGenitals() && rand(5) == 0) 
	{
		zilTwinsInitialEncounter();
		return true;
	}
	return false;
}

public function zilTwinsInitialEncounter():Boolean
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Want Mica to oral u?");
	
	addButton(0, "Yes", zilTwinsInitialD, undefined, "Yes", "Let Mica " + (pc.hasCock() ? "suck you off" : "eat you out") + " and get a mouthful of your alien flavor.");
	addButton(1, "No", zilTwinsInitialDissapointment, undefined, "No", "Nah, you aren't into this kind of thing.");
	return true;
}

public function zilTwinsInitialD():void //GEEEEEEEEEET IIIIIIIIIIIIIIIT
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 2);
	
	output("Mica does");
	output(String(0 == undefined));
	
	flags["ZILTWINS_MET"] = 1;
	
	addButton(0, "Next", mainGameMenu);
}

public function zilTwinsInitialDissapointment():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("The zil are dissapointed.");
	
	flags["ZILTWINS_MET"] = 0;
	
	addButton(0, "Next", mainGameMenu);
}

public function zilTwinsBarBonus():Boolean
{
	output("\n\nIn the back, you can just barely make out the frames of Tetra and Mica, ");
	if (flags["ZILTWINS_BARCOUNTERS"] == undefined) output("those inscestuous zil twins you met before, ");
	output("sitting together in a booth. Though, it's hard to tell exactly what they're doing with the low lighting. You don't think they'd mind a visit from you.");

	addButton(1, "Tetra&Mica", zilTwinsBarcounter, undefined, "Tetra & Mica", "Pay a visit to the lusty zil siblings.");
	return false;
}

public function zilTwinsBarcounter():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	var scene:int = (flags["ZILTWINS_BARCOUNTERS"] == undefined ? 3 : rand(3));
	IncrementFlag("ZILTWINS_BARCOUNTERS");
	
	output("The zils join you in alcoholism");
	switch(scene)
	{
		case 0:
			output("\n\nFirst random scene plays");
			break;
		case 1:
			output("\n\nSecond random scene plays");
			break;
		case 2:
			output("\n\nThird random scene plays");
			break;
		case 3:
			output("\n\nFirst time scene plays");
			break;
	}
	
	zilTwinsMenu();
}

public function zilTwinsMenu():void
{
	
	
	addButton(0, "Appearance", zilTwinsAppearance);
	addButton(1, "Talk", zilTwinsTalk);
	var sextip:String = (silly ? "It's hip to fuck bees!" : "Is there anything better than sex with libidinous twins in public?");
	addButton(2, "Sex", zilTwinsFuckmenu, undefined, "Sex", sextip);
	addButton(14, "Leave", mainGameMenu);
}

public function zilTwinsAppearance():void
{
	clearMenu();
	clearOutput();
	showZilTwins(2, 2);
	
	output("Zils are pretty");
	
	addButton(0, "Next", zilTwinsBarcounter);
}

public function zilTwinsTalk():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Zils are talking to you, what about?");
	
	addButton(0, "Them", zilTwinsTalkThem);
	addButton(1, "Tetra", zilTwinsTalkTetra);
	addButton(2, "Mica", zilTwinsTalkMica);
	addButton(3, "Zil", zilTwinsTalkZil);
	addButton(14, "Leave", mainGameMenu);
}

public function zilTwinsTalkThem(scene:int):void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Zils are talking to you about themselves.");
	
	addButton(0, "Next", zilTwinsTalk);
}

public function zilTwinsTalkTetra():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Zils are talking to you about the sister.");
	
	addButton(0, "Next", zilTwinsTalk);
	
}

public function zilTwinsTalkMica():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Zils are talking to you about brother.");
	
	addButton(0, "Next", zilTwinsTalk);
	
}

public function zilTwinsTalkZil():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Zils are talking to you about their species.");
	
	addButton(0, "Next", zilTwinsTalk);
}

public function zilTwinsFuckmenu():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("eyy bby, u wun sum fuk?");
	
	addButton(0, "Tease Mica", zilTwinsFuckMicaMentally , undefined, "Tease Mica", "Have Mica dance around the table for you and his sister. There's probably going to be a lot of teasing... and blowjobs.");
	addButton(1, "Fuck Mica", zilTwinsFuckMicaForRealsies , undefined, "Fuck Mica", "Bend Mica over and fuck his cute butt while Tetra watches!");
	addButton(2, "Fuck Tetra", zilTwinsFuckTetra , undefined, "Fuck Tetra", "Get a bit subby and get your dick in that honey-leaking zil pussy.");
	addButton(3, "BBQSpitroast", zilTwinsFuckThemAll , undefined, "Honey BBQ Spitroast", "Eat Tetra out while she has her brother plow your " + (pc.hasVagina() ? "pussy" : "ass"));
}

public function zilTwinsFuckMicaMentally():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 2);
	
	output("Mica dances a lot.");
	
	zilTwinsMenu();
}

public function zilTwinsFuckMicaForRealsies():void
{
	clearMenu();
	clearOutput();
	showZilTwins(2, 2);
	
	output("U fuk Meeka.");
	
	zilTwinsMenu();
}

public function zilTwinsFuckTetra():void
{
	clearMenu();
	clearOutput();
	showZilTwins(2, 1);
	
	var doubletrouble:Boolean = pc.hasCocks();
	
	output("Tetra gets fooked with " + (doubletrouble ? "a cawk." : "2 koks."));
	
	addButton(0, "Next", zilTwinsStopFuckingTetra);
}

public function zilTwinsStopFuckingTetra():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("Tetra is tiered now but not mush");
	
	zilTwinsMenu();
}

public function zilTwinsFuckThemAll():void
{
	clearMenu();
	clearOutput();
	showZilTwins(2, 2);
	
	output("u get fooked");
	
	addButton(0, "Next", zilTwinsFuckAllAftermath);
}

public function zilTwinsFuckAllAftermath():void
{
	clearMenu();
	clearOutput();
	showZilTwins(1, 1);
	
	output("u got fooked");
	
	zilTwinsMenu();
}