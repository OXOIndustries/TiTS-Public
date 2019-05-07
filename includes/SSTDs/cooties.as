/* Cooties Disease! */

public function cootiesProcGoooo(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var textBuff:String = "";
	var x:int = 0;
	var y:int = 0;
	//textBuff += "COOTIES PROC";
	//trace("COOTIES STUFF HABBENIN");
	//Day 1 - Itchboi
	if(effect.value4 < 1 && effect.minutesLeft < (4320 - 1*24*60))
	{
		effect.value4 = 1;
		if(pc.hasVagina())
		{
			textBuff += "Your [pc.vaginas] seem" + (!pc.hasVaginas() ? "s":"") + " inflamed and sensitive - not painfully so but enough to let you know that something strange is going on down there. You just don’t know what. Maybe you should see a medical professional?"
		}
		else 
		{
			textBuff += "An unwelcome itch between your thighs keeps causing drawing you to";
			if(!pc.isTaur()) textBuff += " scratch yourself" + (InPublicSpace(pc) ? " even though you’re in public!":". At least you’re not in public.");
			else textBuff += " squirm and rub your haunches on things. Anything to do with the maddening need.";
			textBuff += " Perhaps you should seek out a doctor?";
		}
	}
	//Day 2 - Spots!
	if(effect.value4 < 2 && effect.minutesLeft < (4320 - 2*24*60))
	{
		textBuff += "As you’re wiping your brow, you notice something strange on the back of your hand - a crescent-shaped spot!" + ((pc.hasFur() || pc.hasScales() || pc.hasFeathers()) ? " Visible even on your [pc.skinFurScalesNoun], the marking appeared with disturbing speed.":" It must have appeared with disturbing speed.") + " It wasn’t there a few minutes ago.";
		textBuff += " You gingerly reach to poke it, only to have the spot vanish is quickly as it appeared.\n\nThis is getting too weird.";
		effect.value4 = 2;
		textBuff += "\n\n<i>BEEP!</i> An irritating tone from your Codex interrupts your thoughts. <i>“Alert! Infection detected! Preliminary scans identify a variant of Cooties";
		textBuff += " in your bloodstream, a virulent sexually transmitted disease. Your enhanced immune system should prevent contagious infection, but removal will require the assistance of a medical installation.”</i>";
		textBuff += "\n\nShit.";
		textBuff += "\n\n<i>“Symptoms include: arousal, itchy genital region, bitchiness, spontaneous vaginal growth, and queefing. Cooties usually runs its course in approximately three days. <b>Prompt treatment is recommended to avoid unwanted transformations.</b>”</i>";
		if(pc.hasVagina()) textBuff += "\n\nBetter find a doctor if you don’t want... bitchiness?";
		else textBuff += "\n\nBetter find a doctor if you don’t want to grow a vagina.";

		effect.storageName = "Cooties";
		effect.iconName = "Icon_Poison";
		effect.tooltip = "You’ve been infected with Cooties! If left untreated, it is likely to cause the growth of a vagina or the expansion of vaginal lips... and an uptick in libido.";
		//Change from hidden status to perm status.
		effect.hidden = false;
		effect.combatOnly = false;
		effect.iconShade = 0xFF69B4;
	}
	//Day 3 - vagina!
	if(effect.value4 < 3 && effect.minutesLeft <= 0)
	{
		effect.value4 = 3;
		if(!pc.hasVagina())
		{
			textBuff += "You break out in sudden sweat as the air temperature suddenly seems to ratchet up a dozen degrees. Shivers wrack your arms and [pc.legOrLegs], nearly doubling you over. The feeling of a single droplet of sweat gliding along the skin " + (!pc.hasCock() ? "of your loins":"just below your [pc.cocks]") + " bathes away the force your discomfort. It feels... <b>good</b>. Good enough to make you whimper.";
			textBuff += "\n\nYour hand flies down there before you can stop it, and the skin-to-skin press doubles you over with sudden delight, instinctively rubbing and squirming. Suddenly, a digit slips through <i>something</i>. Your finger is inside you, and it feels amazing. It plumbs the depth of a tender slit with rapacious delight, and you’re helpless to stop it. You ride the that pleasure higher until it morphs into ecstasy, then an explosion of passionate, clenching bliss.";
			textBuff += "\n\nYou don’t remember falling down or pulling your hand away, but your fingers are soaked with [pc.girlCum] from <b>your new vagina.</b>.\n\n<b>At least the Cooties have run their course.</b>";
			pc.createVagina();
			pc.setNewVaginaValues(0);
			pc.orgasm();
			pc.clitLength = .25;
		}
		//swell up
		else if(pc.flattestVaginalPuffiness(true) < 2)
		{
			textBuff += "[pc.Walking] gets a whole lot harder - not because something goes wrong with your [pc.legOrLegs] but because <b>your vaginal lips are plump and swollen</b>. It’s impossible to travel more than a few steps without noticing them rubbing against one another in a distractingly bothersome way!";
			textBuff += "\n\nAt least <b>the Cooties have run their course</b>. You don’t need to worry about them transforming you any further.";
			for(var i:int = 0; i < pc.totalVaginas(); i++)
			{
				if(!pc.vaginalPuffiness(i, true) < 2) pc.inflateVagina(i); 
			}
		}
		//General bitchiness + queef.
		else
		{
			textBuff += "There are few things more annoying than being sick, but being sick with a pathogen designed to give you a fat cunt there’s nothing for it to do but annoy you is even worse. You sneeze and wipe your nose, but aside from a consistent desire to simultaneously rage at everyone while jilling off nonstop, the symptoms seem to be on the wane.";
			textBuff += "\n\n<b>With nothing to change, your Cooties are fading.</b>";
			pc.lust(20);
			
			// special sneeze actions
			var sneezeTits:StorageClass = pc.getStatusEffect("Sneezing Tits");
			if(sneezeTits != null) textBuff += sneezingTitsSneeze(pc, sneezeTits, sneezeTits.value4);
		}
		pc.libido(5);
	}
	if (textBuff.length > 0)
	{
		AddLogEvent(ParseText(textBuff), "passive", maxEffectLength);
	}
}