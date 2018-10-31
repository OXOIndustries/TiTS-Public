package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.inCombat;
	
	public class TarkusJokeBook extends ItemSlotClass
	{
		
		//constructor
		public function TarkusJokeBook()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			//Used on inventory buttons
			this.shortName = "JokeBook";
			//Regular name
			this.longName = "joke book";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a joke book";
			//Displayed on tooltips during mouseovers
			this.tooltip = "<i>Diverting Jokes and Jests</i>, by Jaskel Nuch.\n\nA faded reader card encoded with an old compilation of Tarkus’s most popular jokes. It should still interface with your codex and translate correctly.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 80;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = false;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (target is PlayerCharacter) 
			{
				clearOutput();
				output("How did you do this? You’re breaking the game, fool! -Fenoxo");
			}
			//Not player!
			else
			{
				if(inCombat()) output("\n\n");
				else clearOutput();
				output(target.capitalA + target.short + " has no use for this.");
			}
			return false;
		}
	}
}

