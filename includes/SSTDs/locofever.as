/*

By Couch

-The Idea: SSTD that puts you in heat/rut. Obligation fulfilled, now we never have to write an SSTD again. Ever.

-Locofever [SSTD]
	Location: Fuck a raskvel
	Incubation Period: 1 day
	Duration: 7-14 days
	Status Name: Locofever
	Tooltip Description: You’ve come down with a case of locofever, setting your mating instincts into overdrive. Your immune boosters should keep you from spreading it around any further.

Effects
PCs with a cock are put in rut for the duration. PCs with a vagina are put in heat for the duration. PCs with both get both at once. Neuters are immune, you degenerates. Masturbation, including shower masturbation, does not reduce lust for the duration.

*/

// Infection Text
public function locofeverProcs(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var msg:String = "";
	var x:int = 0;
	var y:int = 0;
	
	// Upon infection
	if(effect.value4 == 0 && effect.minutesLeft < 17280)
	{
		msg += "You feel a little warmer than usual after that encounter. Must have been all the exertion.";
		pc.lust(15);
		effect.value4 = 1;
	}
	// Halfway through incubation
	else if(effect.value4 == 1 && effect.minutesLeft < (17280 - 720))
	{
		msg += "Stars, it’s warm here! You fan yourself with one hand in an effort to cool down, but it’s just not working. The other strays unbidden towards your groin, though the touch is oddly lacking in pleasure. <b>Maybe you should see a doctor if this keeps up. You might be coming down with something.</b>";
		pc.lust(30);
		effect.value1 = 5;
		effect.value4 = 2;
	}
	// Didn’t listen, now you’re sick
	// Requires genitalia
	else if(effect.value4 >= 2 && pc.hasGenitals())
	{
		if(effect.minutesLeft < (17280 - (1440 * (effect.value4 - 1))))
		{
			var noRut:Boolean = (!pc.hasCock() || pc.virility() <= 0);
			var noHeat:Boolean = (!pc.hasVagina() || pc.isFullyWombPregnant() || pc.fertility() <= 0);
			
			if(effect.value4 == 2 || !noRut || !noHeat)
			{
				msg += "The heat just isn’t letting up! Trying to cool down isn’t doing anything to help. To make matters worse, your hands keep straying to";
				if(pc.hasCock()) msg += ParseText(" [pc.eachCock]");
				if(pc.isHerm()) msg += " and";
				if(pc.hasVagina()) msg += ParseText(" [pc.eachCunt]");
				msg += ", but you can’t get off no matter how much touching you do. You can cum, but it’s not satisfying in the slightest.";
				msg += "\n\nFantasies rush unbidden through your head. You don’t just need to cum, you need to";
				if(pc.hasCock()) msg += " pump your steaming hot seed into a pussy ripe and ready for breeding";
				if(pc.isHerm()) msg += ", and ";
				if(pc.hasVagina()) msg += " flood your womb with cum to quench the fire raging inside you";
				msg += ".";
				
				if(!noRut)
				{
					// Rut
					if(!pc.inRut())
					{
						msg += " <b>You are now in rut.</b>";
						
						pc.createStatusEffect("Rut", 5, 25, 1000, 4, false, "LustUp", "Your body is driven for aggressive breeding, increasing your libido and virility, as well as boosting your minimum cum output.\n\n+5 Libido\n+25 Minimum Lust\n+1000mLs Minimum Cum\n+400% Virility",false,28800,0xB793C4);
					}
					// Already in Rut
					else if(pc.rutMinutes() < 22 * 24 * 60)
					{
						msg += " <b>Your rut has been extended.</b>";
						pc.extendRut(7 * 24 * 60);
					}
				}
				if(!noHeat)
				{
					// Heat
					if(!pc.inHeat())
					{
						msg += " <b>You are now in heat.</b>";
						
						pc.createStatusEffect("Heat", 5, 25, 10, 3, false, "LustUp", "Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage", false, 28800, 0xB793C4);
					}
					// Deep Heat
					else if(!pc.inDeepHeat())
					{
						msg += " <b>You are in a deep heat.</b>";
						
						pc.setStatusValue("Heat", 1, 10);
						pc.setStatusValue("Heat", 2, 35);
						pc.setStatusValue("Heat", 3, 25);
						pc.setStatusValue("Heat", 4, 5);
						pc.setStatusTooltip("Heat", "<b>You are in a deep heat!</b> Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+" + pc.statusEffectv1("Heat") * 100 + "% Fertility\n+" + pc.statusEffectv2("Heat") + " Minimum Lust\n+" + pc.statusEffectv3("Heat") + " Libido\n+" + pc.statusEffectv4("Heat") + " Tease Damage");
						pc.extendHeat(7 * 24 * 60);
					}
					// Already in Deep Heat
					else if(pc.heatMinutes() < 22 * 24 * 60)
					{
						msg += " <b>Your heat has been extended.</b>";
						pc.extendHeat(7 * 24 * 60);
					}
				}
				
				pc.lust(50);
				
				if(effect.value4 == 2)
				{
					msg += "\n\nYou barely notice the beep of your Codex warning that <b>you’ve come down with locofever</b> and that your microsurgeons will be busy battling it to keep you from spreading it around. That doesn’t matter. All that matters is that you go out and fuck right <i>now</i>.";
					
					CodexManager.unlockEntry("Locofever");
				}
			}
			
			var dayMult:int = 1;
			if(deltaT >= 1440) dayMult = Math.floor(deltaT / 1440);
			effect.value4 += (1 * dayMult);
			effect.value1 += (5 * dayMult);
			
			effect.storageName = "Locofever";
			effect.tooltip = ("You’ve come down with a case of locofever, setting your mating instincts into overdrive. Your immune boosters should keep you from spreading it around any further.\n\n+" + effect.value1 + " Libido");
			effect.iconShade = 0xFF69B4;
			effect.hidden = false;
		}
	}
	// Failsafe
	else if(effect.value4 >= 2 && !pc.hasGenitals())
	{
		msg += "The heat just isn’t letting up! Trying to cool down isn’t doing anything to help. To make matters worse, you seem to have a bad case of runny nose...";
		msg += ParseText("You grab a wet cleaning wipe and swipe your [pc.face], finding a huge string of goo flow from your nostrils and into the tissue.");
		if(pc.isBimbo()) msg += " <i>Like, ew.</i>";
		else msg += " <i>Disgusting.</i>";
		msg += " Not only did the wipe cool you off, but it pulled out a nasty collection of mucus buildup. Looks like you caught some kind of infection that your body rejected...";
		pc.removeStatusEffect("Undetected Locofever", true);
		pc.removeStatusEffect("Locofever", true);
	}
	
	if (msg.length > 0) AddLogEvent(msg, "passive", maxEffectLength);
}

// Sickness over
public function locofeverFinish(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var msg:String = "";
	msg += "<b>Your body finally calms down and cools off, your libido returning to its normal levels";
	if(pc.hasGenitals())
	{
		if(pc.inRut() || pc.inHeat())
		{
			msg += " despite still being in";
			if(pc.inRut()) msg += " rut";
			if(pc.inRut() && pc.inHeat()) msg += " and";
			if(pc.inHeat()) msg += " heat";
		}
	}
	else
	{
		pc.clearRut();
		pc.clearHeat();
	}
	msg += ". You must have gotten over your case of locofever.</b>";
	if (msg.length > 0) AddLogEvent(msg, "passive", maxEffectLength);
	
	pc.removeStatusEffect("Undetected Locofever", true);
	pc.removeStatusEffect("Locofever", true);
}

