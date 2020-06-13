import classes.Characters.JaneriaSpawn;

//written by Couch
//man sized jellyfish that are healed by electrical attacks.  they broke off from the janeria core.  any alive when fighting the core will make it stronger
/**
* @author DrunkZombie
*/

public function showJaneriaSpawn(nude:Boolean = false):void
{
	showName("JANERIA\nSPAWN");
	showBust("JANERIASPAWN");
	author("Couch");
}
//Encounter Text
public function encounterJaneriaSpawn():Boolean
{
	clearOutput();
	showJaneriaSpawn();
	var spawnLeft:int = flags["UVETO_DEEPSEALAB_SPAWN"];
	
	if(spawnLeft >= 4)
	{
		output("You hear a crackling sound as you enter the room, prompting you to get down and away from the door. Just as you do, a bolt of lightning streaks overhead, scorching the door you just came through. As you look up you see the source: an odd creature is hovering near the other door, resembling an oversized jellyfish. Its whole body pulses with an eerie green and blue light, while lightning flickers along the tentacles that hang under its body.");
		output("\n\nWell, it looks like you’ve found the invaders! You ready your [pc.mainWeapon] and prepare to fight!");
	}
	//Repeat Encounter
	else
	{
		output("You hear the same crackling sound from before as you enter the room. Sure enough, another one of those jellyfish is lying in wait, its tentacles hanging limp under its body. As it spots you those tendrils billow outward in an aggressive posture, the glow of its body intensifying.");
		output("\n\nThis is the " + (spawnLeft > 1 ? (spawnLeft > 2 ? "second of four" : "third of four") : "last one") + ", you think. You ready your [pc.mainWeapon] and get ready to fight!");
	}

	clearMenu();
	addButton(0, "Next", fightJaneriaSpawn);
	return true;
}

public function fightJaneriaSpawn():void
{
	var tEnemy:JaneriaSpawn = new JaneriaSpawn();
	CodexManager.unlockEntry("Janeria");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(tEnemy);
	CombatManager.victoryScene(janeriaSpawnWin);
	CombatManager.lossScene(janeriaSpawnLoss);
	CombatManager.displayLocation("JANERIASPAWN");
	CombatManager.beginCombat();
}

public function janeriaSpawnLoss():void
{
	clearOutput();
	showJaneriaSpawn();
	
	output("Overwhelmed by the bizarre alien creature, you sink to your knees. It pauses in its assault, tentacles idly waving, before reaching out with one towards your face. You reflexively recoil, but too late; it wraps the tendril around your head, the flat pad morphing into a mass of smaller tentacles that form a tight net. You struggle, but a shock from the jellyfish knocks you unconscious.");
	
	processTime(30);
	clearMenu();
	addButton(0,"Next",janeriaSpawnLoss2);
}
public function janeriaSpawnLoss2():void
{
	clearOutput();
	showJaneriaSpawn();
	
	output("You feel adrift, as if you were floating in a void. You try to move your limbs, but they don’t respond. You realize with a shock that you have no limbs, no body at all. You’re nothing but a bare and naked consciousness, alone in the void. But not alone for long. Soon a presence reaches out to you, vast and overwhelming. It reaches in and begins sifting through your memories, drawing them into itself and tearing them from you in the process. Your adventures, your mission, your childhood, all of it starts to slip away from you. You try to resist, but there’s nothing you can do to defend yourself. Yourself...who are you again?");
	output("\n\nYou struggle to hold on, to remember just one thing as memory after memory slips away from you. You are [pc.name] Steele. You are [pc.name] Steele. You are...you are...");
	output("\n\n<i>“You are part of my being. Your thoughts, your memories, will help me grow. And such delicious thoughts they are, a far cry from any fish I’ve had before. I can feel my intellect expanding tremendously with the addition of yours; I should even be able to assert dominance over my parent form when we rejoin. You say there are whole worlds of beings like you, whole swathes of experiences I have yet to taste? Fascinating. And you produce such delicious lightning as well, far more than I’ve ever had the pleasure of tasting at once before. I’ll be able to sustain my current intellect for decades on this much alone. Once I’ve finished with my meal, perhaps I’ll take a look at the surface I’ve neglected for so long.”</i>");
	output("\n\n<i>“Thank you for your contribution, Captain Steele.”</i>");
	
	badEnd("GAME OVER");
}
public function janeriaSpawnWin():void
{
	clearOutput();
	showJaneriaSpawn();
	flags["UVETO_DEEPSEALAB_SPAWN"] -= 1;
	var spawnLeft:int = flags["UVETO_DEEPSEALAB_SPAWN"];
	
	output("The jellyfish quivers with your last attack, its glow fading to a dull gray. It hovers in the air a moment longer as its body turns dry and cracked, before finally the whole creature falls apart. Taking no chances, you set fire to the remains, ensuring nothing but ash is left behind.");
	output("\n\nThe facility is a little quieter now, at least" + (spawnLeft > 0 ? ", though there’s still the sounds of more of these things in the building." : ". It sounds like you might have gotten them all."));
	output("\n\n");
	
	processTime(5);
	CombatManager.genericVictory();
}