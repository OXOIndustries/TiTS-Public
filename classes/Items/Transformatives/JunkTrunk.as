package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class JunkTrunk extends ItemSlotClass
	{
		public function JunkTrunk()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "J.Trunk";
			longName = "Junk In The Trunk";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a plain white pill labeled “Junk In The Trunk”";
			tooltip = "This small white pill contains all you need to expand your backside. Displayed on its packaging is the phrase: <i>“For those with an affection for callipygean derrieres...”</i> Interesting...";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 720;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("JohanLitvisk");
			
			if(target is PlayerCharacter)
			{
				// On Use
				output("Welp, here goes! You pop the pill into your maw and wait to see what happens. You notice the pill has an odd fruity taste to it. You can’t help but feel a little fuzzy at the prospect of gaining a bigger booty...");
				
				if(target.buttRatingRaw < 20)
				{
					var buttInc:int = (1 + rand(3));
					
					switch(buttInc)
					{
						// [pc.butt] increases by 1
						case 1:
							output("\n\nYour [pc.butt] tingles delightfully. Getting more than a little excited, you grab hold of your");
							if(target.isAssExposed()) output(" bare ass");
							else output(" clothed behind");
							output(". To your amazement, you [pc.butt] puffs up and expands in your hands. <b>You give you newly enlarged cheeks a gentle rub. Success!</b>");
							break;
						// [pc.butt] increases by 2
						case 2:
							output("\n\nSuddenly, your [pc.butt] is alight with sensation! You take hold of your");
							if(target.isAssExposed()) output(" bare ass");
							else output(" clothed behind");
							output(" and feel your cheeks expand rapidly. You can’t help but moan and give your butt a few caresses and light smacks in its greatly enlarged state.");
							target.changeLust(5);
							break;
						// [pc.butt] increases by 3
						case 3:
							output("\n\nYou almost fall to the ground in pleasure at the wondrous sensation in your [pc.butt]. It almost feels like you’re having a booty quaking orgasm. Quickly taking hold of your");
							if(target.isAssExposed()) output(" bare ass");
							else output(" clothed behind");
							output(", you moan out in ecstasy as");
							if(target.hasGenitals())
							{
								if(target.hasCock()) output(" [pc.eachCock] hardens");
								if(target.isHerm()) output(" and");
								if(target.hasVagina()) output(" [pc.eachVagina] moistens");
							}
							else output(" your [pc.asshole] pulsates");
							output(" in unadulterated joy. You grope and smack your rapidly expanding [pc.butt] until it reaches its maximum capacity. <b>You take a moment to compose yourself and give a few more admirative smacks to your massively expanded ass.</b>");
							target.changeLust(10);
							break;
					}
					
					target.buttRating(buttInc);
				}
				// TF Duds
				else
				{
					output("\n\nUnfortunately for you, your [pc.butt] seems to do nothing but tingle annoyingly. You sigh and let out muffled curse. So much for that...");
				}
				
				return false;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " swallows the pill but to no effect.");
			}
			return false;
		}
	}
}

