import classes.Characters.Typhon;

//written by Couch
//insane ai that attacks steele with laser turrets and a sonic attack
/**
* @author DrunkZombie
*/

public function showTyphon(nude:Boolean = false):void
{
	showName("\nTYPHON");
	showBust("TYPHON");
	author("Couch");
}
//Encounter Text
public function encounterTyphon():Boolean
{
	clearOutput();
	showTyphon();
	
	output("You hear someone talking as you approach the door of the mainframe chamber. The words are frantic and hard to make out, prompting you to open the door.");
	output("\n\nWhat you see makes your heart skip a beat. The silver holoavatar of the facility’s AI looks like someone tore it apart and crudely glued it back together again. One limb hangs outward at an odd angle, another looks like it’s been stapled to his chest. Render errors leave swathes of what may have once been a polished appearance looking jagged, cracked, or just missing entirely. His jaw hangs impossibly far down whenever he opens his mouth, a nonsense string of words gushing forth in a voice layered thick with ear-grating static and random volume changes. What the hell did this invader <i>do</i> to him?!");
	output("\n\nSeeing you agitates the broken AI, which lets out a garbled scream. Sentry turrets deploy from the floors and ceiling, listing and spinning oddly in their docks. It would almost be comical if they weren’t also spooling up to fire. You’d better stop this now before he tears the whole base apart!");
	output("\n\nThere are four laser turrets remaining.");
	
	clearMenu();
	addButton(0, "Next", fightTyphon);
	return true;
}
public function fightTyphon():void
{
	var tEnemy:Typhon = new Typhon();
	CodexManager.unlockEntry("AISystemsCodexEntry");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(typhonWin);
	CombatManager.lossScene(typhonLoss);
	CombatManager.displayLocation("TYPHON");
	CombatManager.beginCombat();
}
public function typhonLoss():void
{
	clearOutput();
	showTyphon();
	
	output("It only takes one stray shot catching you in the knee to send you tumbling to the floor. All of the turrets round on you, to the cackling of the insane AI. At least you think it’s cackling, but it’s getting hard to tell. Everything’s starting to get pretty dark right about now, could be the bloodloss.");
	output("\n\nYou try to get to your feet, but your legs give out. Your shields are exhausted and your gear in ruins. The last thing you hear is the sound of gunfire, and then the world goes black.");
	
	badEnd("GAME OVER");
}
public function typhonWin():void
{
	clearOutput();
	showTyphon();
	
	output("The last turret shuts down, leaving Typhon at your mercy. Not that the AI seems to notice, it’s practically on the verge of breaking down.");
	output("\n\n<i>“KiLL killkillkillkillkillk-k-k-k-k-”</i>");
	output("\n\nYou flinch at stepping through the hologram, but reach the console and swiftly eject the AI core.");
	output("\n\n<i>“meEeee-”</i> The broken holoprojection instantly vanishes, leaving the room blessedly silent. A moment passes before there’s a soft whirr from the mainframe console, a data bead emerging from an access panel.");
	output("\n\nYou take the bead, pondering what to do with its occupant. The AI looked very far gone, well beyond anyone’s capacity to repair. Do you want to prolong its existence in the hopes of maybe extracting some data from it, or end its suffering now?");
	output("\n\nWhat do you do?");
	
	processTime(2);
	clearMenu();
	addButton(0, "Kill It",typhonWinKillIt,undefined);
	addButton(1, "Take It",typhonWinTakeIt,undefined);
}
//kill the ai as it requested
public function typhonWinKillIt():void
{
	clearOutput();
	showTyphon();

	output("You drop the data bead and stomp down on it, crushing it until there’s nothing left of it but some loose bits of silicon. At least the AI won’t be in constant agony anymore. You hope your decision was a merciful one.");
	output("\n\n");
	
	flags["UVETO_DEEPSEALAB_TYPHON"] = 2;
	processTime(1);
	CombatManager.genericVictory();
}
//keep the bead to give to Lessau
public function typhonWinTakeIt():void
{
	clearOutput();
	showTyphon();

	output("You pocket the data bead, making a note to give it to Lessau when you get back to the surface. Maybe he can recover some of what Typhon was before the invader scrambled it. You hope your decision doesn’t prolong the AI’s suffering.");
	output("\n\n");
	
	pc.addHard(1);
	flags["UVETO_DEEPSEALAB_TYPHON"] = 1;
	if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == 1 && flags["UVETO_DEEPSEALAB_TYPHON"] >= 1) flags["UVETO_DEEPSEALAB_QUEST"] = 3;
	processTime(1);
	CombatManager.genericVictory();
}