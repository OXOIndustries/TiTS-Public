package classes.Items.Drinks
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	
	public class HoneyWine extends ItemSlotClass
	{
		
		//constructor
		public function HoneyWine()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "H.Wine";
			//Regular name
			this.longName = "honey wine";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bottle of honey wine";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A big, glass bottle full of honey wine - a delicacy on Myrellion, with each bottle bearing the signature of the queen whose honey was used in its brewing. While not as potent as drinking from the tap, this special wine has a high alcohol content and is as sweet as candy.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (target is PlayerCharacter) 
			{
				clearOutput();
				output("You heft the big, dark bottle of gold myr Honey Wine out of your pack. It feels heavier than any wine bottle you've handled before, and the contents slosh with viscous languidity. That's a lot of booze, you start to think as you pop the cork. Rather than fizzing, the Honey Wine makes a burbling sound as you uncork it.\n\nWell, no better time to start your career as an interstellar wino than now, right? Bottoms up!\n\nYou drink as much of the honey-sweet booze as you can stomach, and find yourself feeling more energized for having done it. That Honey Wine gives you a hell of a rush: you feel like you could take on the world now... or at least do some exercises.");
				target.createStatusEffect("Royal Nectar",30,0,0,0,false,"Charmed","That honey wine packs a punch! You're feeling a lot peppier now.",false,2880)
				target.energy(30);
			}
			//Not player!
			else
			{
				if(kGAMECLASS.inCombat()) output("\n");
				else clearOutput();
				output(target.capitalA + target.short + " chugs down the wine, and looks a lot peppier afterward!\n");
				target.createStatusEffect("Royal Nectar",30,0,0,0,false,"Charmed","That honey wine packs a punch! You're feeling a lot peppier now.",false,2880)
				target.energy(30);
			}
			target.imbibeAlcohol(35);
			return false;
		}
	}
}

