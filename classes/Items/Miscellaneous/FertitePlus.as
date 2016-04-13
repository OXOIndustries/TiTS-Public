package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class FertitePlus extends ItemSlotClass
	{
		public function FertitePlus()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Fertite+";
			longName = "Fertite+ pill";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pill labeled ‘Fertite+’";
			tooltip = "A friendly pink pill wrapped in a plastic container that identifies it as “Fertite Plus: A TamaniCorp product.” Underneath the TamaniCorp logo is a short description, advertising the pill as a one-step treatment to dramatically increase female fertility, male virility -- or both, depending on your personal biology! Guaranteed to work on most galactic-core races!";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 200;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Savin");
			kGAMECLASS.showName("\bFERTITE+");
			
			if(target is PlayerCharacter)
			{
				output("You pull the bright pink Fertite pill out and peel it out of its packaging. It looks harmless enough, about the size of your thumbnail and smooth as can be. After a moment's consideration, you pop the pill into your mouth and wash it down with your canteen."); 

				output("\n\nA few minutes pass, and you don't really feel any different. Your stomach is a little tight, but otherwise the pill doesn't seem to be altering you in any perceptible way.");
				if (target.hasCock() || target.hasVagina() || target.hasTailCock() || target.hasTailCunt())
				{
					output(" Your Codex beeps, though, informing you that it's detecting a change in your reproductive genes: <b>you're more");
					if (target.hasVagina() || target.hasTailCunt())
					{
						output(" fertile");
						if (target.fertilityRaw < 2) target.fertilityRaw += 0.2;
						else target.fertilityRaw += 0.1;
					}
					if ((target.hasVagina() || target.hasTailCunt()) && (target.hasCock() || target.hasTailCock())) output(" and");
					if (target.hasCock() || target.hasTailCock())
					{
						output(" virile");
						if (target.cumQualityRaw < 2) target.cumQualityRaw += 0.2;
						else target.cumQualityRaw += 0.1;
					}
					output(" now!");
					
					// Kill whatever Sterelix stacks are present
					if (target.hasStatusEffect("Infertile")) target.removeStatusEffect("Infertile");
					if (target.hasPerk("Firing Blanks") || target.hasPerk("Sterile"))
					{
						output(" Something warms deep inside your groin, down in the very core of your body, imagined heat building and building into a scorching, broiling heat.");
						var removedBlanks:Boolean = false;
						if (target.hasPerk("Firing Blanks"))
						{
							removedBlanks = true;
							target.removePerk("Firing Blanks");
							if (target.balls > 0) output(" Your [pc.balls] feel as though they're churning- something gives you the impression <b>you won't be having any more trouble knocking up any floozy that comes your way</b>.");
						}
						if (target.hasPerk("Sterile"))
						{
							target.removePerk("Sterile");
							if (removedBlanks) output(" The boiling warmth shifts deeper into your being");
							else output(" The boiling warmth focuses deep in your [pc.belly]");
							output(", spreading through your womb. The heat refocuses itself into a barely present itch, a suggestion that <b>you're fertile once again</b>.");
						}
					}
				}
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " takes the drug to no effect.");
			}
			return false;
		}
	}
}

