package classes.Engine.Combat 
{
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.Characters.*;
	import classes.Engine.Utility.rand;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function teaseReactions(damage:Number, target:Creature):String 
	{
		var pc:Creature = kGAMECLASS.pc;
		
		var buffer:String = "";
		var textRands:Array = [];

		if(target is KQSexdollGeneric && damage > 0) { if(!target.hasStatusEffect("Cheerleader")) target.createStatusEffect("Cheerleader"); }
		
		if (target is PlayerCharacter)
		{
			if (damage == 0) buffer = "You seem unimpressed.";
			else if (damage < 4) buffer = "You look a little intrigued by what you see.";
			else if (damage < 10) buffer = "You definitely seem to be enjoying the show.";
			else if (damage < 15) buffer = "You openly touch yourself as you watch lustfully.";
			else if (damage < 20) buffer = "You flush hotly with desire, your eyes filled with longing.";
			else buffer = "You lick your lips in anticipation, your hands idly stroking your own body.";
		}
		else if (target is HuntressVanae)
		{
			if (damage == 0)
			{
				textRands = [
					"The blind huntress snorts at your display and makes a quick jab at you with her spear. You leap out of the way just in time. <i>“All you’re doing is leaving yourself open, " + ((pc.zilScore() >= 4 || pc.naleenScore() >= 5) ? "[pc.race]" : "outsider") + "!”</i> she exclaims.",
					"You utterly fail to entice the huntress. You barely dodge an attack that causes you to cease your efforts. You’re going to have to do better, or try something else...",
					"The alien huntress seems to be getting into it, moving towards you... only to swipe her spear at your head. You barely duck in time. Seems she didn’t go for it at all!"
				];
				
				buffer = textRands[rand(textRands.length)];
			}
			else if (damage < 4) buffer = "The busty huntress moans and begins cupping one of her " + target.breastDescript(0) + ", clearly titillated by your performance.";
			else if (damage < 10) buffer = "Your stacked opponent huskily moans and slips a webbed hand between her thighs, lewdly stroking her slit. She snaps out of it a few seconds later, biting her lip.";
			else if (damage < 20) buffer = "The alien huntress clenches her thighs together as she watches you, rubbing them together as she desperately tries to hide her arousal. Clearly you’re having an effect on her!"
			else buffer = "The busty amazon parts her thighs and begins to stroke her twin clits to your lewd display, unable to stop herself. A few seconds later she jerks her webbed hand back, flushing wildly.";
		}
		else if (target is KorgonneFemale)
		{
			//Teased
			buffer = "Clearly delighted, the raider’s mouth hangs open in a dopey grin; her tongue lolls from the side of her mouth as she holds one arm tightly across her prodigious chest. She becomes aware of her licentious weakness and swallows her tongue again with a gulp." + ((kGAMECLASS.silly) ? " <i>“So seduce. Such flirt. Much babies. Wow.”</i>" : "");
		}
		else if (target is MaidenVanae)
		{
			if (damage == 0)
			{
				textRands = [
					"The young alien huntress jabs at you with her spear, forcing you to leap out of the way. <i>“Hey, this may be my first time, but I’m not </i>that<i> easy!”</i> she exclaims.",
					"The virgin huntress quirks her head, clearly baffled by your actions. It seems you utterly failed to entice her....",
					"The alien huntress fans her face with a webbed hand and moves closer to you. <i>“Oooh, I think I’m getting the vapors... </i>psyche<i>!”</i>",
				];
				
				buffer = textRands[rand(textRands.length)];
			}
			else if (damage < 4) buffer = "The virgin huntress blushes and begins eagerly touching one of her [vanaeMaiden.nipples]. She’s clearly aroused by your performance.";
			else if (damage < 10) buffer = "The virgin huntress lets out a little moan and slips one of her webbed hands between her thighs. She awkwardly teases her glistening slit, getting all worked up.";
			else if (damage < 20) buffer = "The young alien huntress places a hand over her loins and rubs her thighs together. She’s desperately trying to hide her rather obvious arousal. The sweet scent of her arousal fills the air.";
			else buffer = "The wispy amazon parts her thighs and begins to stroke her twin clits to your lewd display, unable to stop herself. A few seconds later she jerks her webbed back, flushing wildly.";
		}
		else if (target.isPlural) {
			if (damage == 0) buffer = StringUtil.capitalize(target.getCombatName(), false) + " seem unimpressed.";
			else if (damage < 4) buffer = StringUtil.capitalize(target.getCombatName(), false) + " look intrigued by what they see.";
			else if (damage < 10) buffer = StringUtil.capitalize(target.getCombatName(), false) + " definitely seem to be enjoying the show.";
			else if (damage < 15) buffer = StringUtil.capitalize(target.getCombatName(), false) + " openly stroke themselves as they watch you.";
			else if (damage < 20) buffer = StringUtil.capitalize(target.getCombatName(), false) + " flush hotly with desire, their eyes filled with longing.";
			else buffer = StringUtil.capitalize(target.getCombatName(), false) + " lick their lips in anticipation, their hands idly stroking their bodies.";
		}
		else {
			if (damage == 0) buffer = StringUtil.capitalize(target.getCombatName(), false) + " seems unimpressed.";
			else if (damage < 4) buffer = StringUtil.capitalize(target.getCombatName(), false) + " looks a little intrigued by what " + target.getCombatPronoun("heshe") + " sees.";
			else if (damage < 10) buffer = StringUtil.capitalize(target.getCombatName(), false) + " definitely seems to be enjoying the show.";
			else if (damage < 15) buffer = StringUtil.capitalize(target.getCombatName(), false) + " openly touches " + target.getCombatPronoun("himher") + "self as " + target.getCombatPronoun("heshe") + " watches you.";
			else if (damage < 20) buffer = StringUtil.capitalize(target.getCombatName(), false) + " flushes hotly with desire, " + target.getCombatPronoun("hisher") + " eyes filled with longing.";
			else buffer = StringUtil.capitalize(target.getCombatName(), false) + " licks " + target.getCombatPronoun("hisher") + " lips in anticipation, " + target.getCombatPronoun("hisher") + " hands idly stroking " + target.getCombatPronoun("hisher") + " own body.";
		}
		return buffer;
	}

}