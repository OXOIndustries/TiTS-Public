import classes.Characters.JaneriaCore;
import classes.Engine.Utility.num2Text;

//written by Couch
//gigantic jelly fish that is healed by electrical attacks.  any janeria spawn alive will make it stronger.  turning off the generator removes its most deadly attack
/**
* @author DrunkZombie
*/

public function showJaneriaCore(nude:Boolean = false):void
{
	showName("JANERIA\nCORE");
	showBust("JANERIACORE");
	author("Couch");
}
//Encounter Text
public function encounterJaneriaCore():Boolean
{
	clearOutput();
	showJaneriaCore();
	var spawnLeft:int = flags["UVETO_DEEPSEALAB_SPAWN"];
	
	output("You pass through the final airlock into the generator room, not that it matters much when the room beyond is flooded. A huge gash in the far side of the wall is the cause, through which a gigantic jellyfish has emerged, several of its tentacles wrapped around the main generator. Power flows in a constant stream up those tendrils, leaving the main body blazing bright even underwater like this.");
	output("\n\nAs the jellyfish notices you, you feel a powerful psionic pressure form in the air. It’s not just strong, it’s <i>growing</i>. Every draw of electricity from the generator makes the alien noticeably stronger. Who knows where it’ll end if you don’t stop it?");
	output("\n\n<i>Creature...wants to take the power?</i>");
	output("\n\nThe pressure becomes a booming roar, and even as you grit your teeth under the mental assault. You feel a psychic call focused towards the facility. " + (spawnLeft > 0 ? num2Text(spawnLeft,true) + " smaller jellyfish slip" + (spawnLeft == 1 ? "s through the crack in the door and swims over to meld with its parent," : " through the crack in the door and swim over to meld with their parent,") + " increasing its size still further." : "To the monster’s annoyance, nobody comes."));
	output("\n\n<i>This one is...<b>I am</b> Janeria. You will not prevent my flowering!</i>");
	output("\n\nJaneria’s glow intensifies as it looms over you, its tendrils beginning to crackle with fresh lightning. You ready your [pc.mainWeapon] - it’s time to end this!");

	clearMenu();
	addButton(0, "Next", fightJaneriaCore);
	return true;
}

public function fightJaneriaCore():void
{
	var tEnemy:JaneriaCore = new JaneriaCore();
	CodexManager.unlockEntry("Janeria");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(janeriaCoreWin);
	CombatManager.lossScene(janeriaCoreLoss);
	CombatManager.displayLocation("JANERIA CORE");
	CombatManager.beginCombat();
}
//adds buttons to the combat menu so player can choose to take cover or turn off generator during the charge attack
public function janeriaCoreChargeupBonusMenu():void
{	
	output("\n\nJaneria seems to be sucking power from the generator even harder. Energy is building up within the monster’s core, brighter and brighter. <b>You probably should take cover, but you could also try to turn off the generator.</b>");
	addButton(10, "Take Cover", janeriaCoreElectricFloodChargingTakeCover,undefined,"Take Cover","Take cover to avoid the worst of the attack.");
	addButton(11, "Generator", janeriaCoreElectricFloodChargingGenerator,undefined,"Generator","Rush up and hit the emergency off button to shut the generator down.  You will take the full brunt of Janeria's attack.");
}
//gives pc cover status to lesson damage from electric flood attack
public function janeriaCoreElectricFloodChargingTakeCover():void
{
	clearOutput();
	showJaneriaCore();
	output("You run for cover, diving behind an upturned table just as the light reaches its fever pitch.");
	
	pc.createStatusEffect("Electric Flood Cover",0,0,0,0);		
	CombatManager.processCombat();
}
//shuts the generator down but this is going to hurt		
public function janeriaCoreElectricFloodChargingGenerator():void
{
	clearOutput();
	showJaneriaCore();
	output("You decide it’s worth the risk, running towards Janeria rather than away. The pressure in the air is filled with a sense of confusion, followed by white-hot rage as it realizes what you’re doing. Tentacles slam down to bar your path, but your [pc.mainWeapon] clears just enough room for you to slip past.");
	output("\n\nJust as the light reaches its peak, you slam your hand down on the emergency shutdown button, the generator grinding to a halt.");
	
	pc.createStatusEffect("Generator Off",0,0,0,0);
	CombatManager.processCombat();
}

public function janeriaCoreLoss():void
{
	clearOutput();
	showJaneriaCore();
	
	output("You can’t keep up. Janeria’s growing too quickly, and you’re just too overwhelmed by the pressure. You sink to your knees as you’re forced into submission by the behemoth’s power. It pauses in its assault, tentacles idly waving, before reaching out with one towards your face. You reflexively recoil, but too late; it wraps the tendril around your head, the flat pad morphing into a mass of smaller tentacles that form a tight net. You struggle, but a shock from the jellyfish knocks you unconscious.");
	
	processTime(30);
	clearMenu();
	addButton(0,"Next",janeriaCoreLoss2);
}
public function janeriaCoreLoss2():void
{
	clearOutput();
	showJaneriaCore();
	
	output("You feel adrift, as if you were floating in a void. You try to move your limbs, but they don’t respond. You realize with a shock that you have no limbs, no body at all. You’re nothing but a bare and naked consciousness, alone in the void. But not alone for long. Soon a presence reaches out to you, vast and overwhelming. It reaches in and begins sifting through your memories, drawing them into itself and tearing them from you in the process. Your adventures, your mission, your childhood, all of it starts to slip away from you. You try to resist, but there’s nothing you can do to defend yourself. Yourself...who are you again?");
	output("\n\nYou struggle to hold on, to remember just one thing as memory after memory slips away from you. You are [pc.name] Steele. You are [pc.name] Steele. You are...you are...");
	output("\n\nYou are part of Janeria. Your thoughts, your memories, will help me grow. And such delicious thoughts they are, a far cry from any fish I’ve had before. I can feel my intellect expanding tremendously with the addition of yours. You say there are whole worlds of beings like you, whole swathes of experiences I have yet to taste? Fascinating. And you produce such delicious lightning as well, far more than I’ve ever had the pleasure of tasting at once before. I’ll be able to sustain my current intellect for decades on this much alone. Once I’ve finished with my meal, perhaps I’ll take a look at the surface I’ve neglected for so long.");
	output("\n\nThank you for your contribution, Captain Steele.");
	
	badEnd("GAME OVER");
}
public function janeriaCoreWin():void
{
	clearOutput();
	showJaneriaCore();
	var genOff:Boolean = false;
	if (pc.hasStatusEffect("Generator Off"))
	{
		genOff = true;
		pc.removeStatusEffect("Generator Off");
	}
	
	output("Janeria shudders as you strike the final blow. It’s lost a lot of its mass, losing still more as chunks of its body fall away and the rest rearranges into a smaller shape.");
	output("\n\n<i>You...creature...will not...</i> The pressure is fading, Janeria’s intellect dimming as it loses its strength and shrinks, down to maybe a quarter of its original size now. Even so reduced it looms over you, letting go of the generator and lunging towards you with its whole body. You roll to the side, barely avoiding it slamming into the wall behind you. Its tentacles flail, lashing out at you and managing to land a grazing hit as you scramble away. You need to find a way to finish it off! You look around, spotting some fuel cells overturned against the east wall.");
	if (genOff) output("\n\nYou push off the wall and towards the generator, hoping Janeria has become stupid enough that it won’t realize what you’re doing. You dodge its tentacles as you cancel the emergency shutdown. The generator whirs to life, starting to pump the water from the room and activating an emergency shield to keep more water out. Before it can drain completely you make a dash for the fuel cells, praying Janeria goes after you rather than latch onto the generator again. Thankfully its rage towards you seems to have overwhelmed its desire for power, and it pursues, its tentacles lashing out in an effort to grab you. You stop on top of the pile of fuel cells just as the water finishes draining, spreading your arms in a taunting gesture.");
	else output("\n\nFreed of the power drain, the generator starts up once more. The water begins to be pumped from the room as a shield springs up around the damaged section to prevent more water from spilling in. Before it can drain completely you push off the wall you’re against and towards the fuel cells, swimming with all your might. Janeria pursues, a more agile swimmer than you are but starting to run on animal instinct once more. You stop on top of the pile of fuel cells just as the water finishes draining, spreading your arms in a taunting gesture.");
	output("\n\n<i>“Come get me!”</i>");
	output("\n\nJaneria’s mind roars, lunging once more at you. You bring up your [pc.rangedWeapon] as you roll out of the way, bracing yourself. A shot strikes the pile of fuel cells, producing a plume of orange fire as they explode right under Janeria. The blast is powerful enough to send you flying, knocking you against the corner of the room with enough force that you black out for a second.");
	output("\n\nWhen you come to it’s to the sound of shrieking. You look up to see Janeria writhing in agony, the flames turning its flesh charred and pitted. This is the first time you’ve heard it say anything aloud and it’s a screech that will haunt your nightmares. Parts of its body crumble off, others ooze and droop as they blacken.");
	output("\n\nTo your horror the monster manages to stagger out of the fire, reaching out towards you with one last tentacle. You try to get up, to little avail with how your body is aching, but inches before the tentacle reaches your face it, like the rest of Janeria, falls apart into ash.");
	output("\n\nYou take a moment just to catch your breath, half-expecting it to rise up again somehow, but there’s no sign of life from the mass cast off during the battle. You use your torch to burn the rest of its remains just to be sure.");
	output("\n\nWell, you’ve certainly got a story to tell when you get back to the surface. Time to get out of here.");
	output("\n\n");
	
	flags["UVETO_DEEPSEALAB_JANERIACORE"] = 1;
	if (flags["UVETO_DEEPSEALAB_JANERIACORE"] == 1 && flags["UVETO_DEEPSEALAB_TYPHON"] >= 1) flags["UVETO_DEEPSEALAB_QUEST"] = 3;
	flags["UVETO_DEEPSEALAB_SPAWN"] = 0;
	processTime(5);
	//if nova is in inventory or being worn (not possible unless she has airtight and pressurized flags), get the Janeria upgrade
	if (hasGooArmorOnSelf()) addButton(0, "Next", steeleBioDeepSeaNovaUpgrade);
	else CombatManager.genericVictory();
}