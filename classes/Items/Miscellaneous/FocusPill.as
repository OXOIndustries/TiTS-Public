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
	
	public class FocusPill extends ItemSlotClass
	{
		
		//constructor
		public function FocusPill()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "FocusPill";
			//Regular name
			this.longName = "Focus pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pill labeled ‘Focus’";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Created in joint venture between JoyCo and Xenogen to help their scientists on important projects, Focus Pills give you a momentary sense of calm and emotionless insight. Reduces active lust, and grants a short-term bonus to Intelligence.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 50;
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
				var changeAmt:Number = 0;
				if (!target.hasStatusEffect("Focus Pill"))
				{
					target.createStatusEffect("Focus Pill", 0, 0, 0, 0, false, "Pill", "You feel sharper, more able to focus and process your senses.", false, 60);
					changeAmt = -25;
				}
				else
				{
					target.setStatusMinutes("Focus Pill", 60);
					changeAmt = -5;
				}
				clearOutput();
				if(inCombat()) output("You pop a Focus Pill into your mouth. As it dissolves, you start to feel a little calmer and more focused in on the task at hand.");
				else output("You pop a Focus Pill out of your pack and into your mouth. It’s completely tasteless, and all but dissolves in your mouth.\n\nAfter a moment’s wait, you start to feel a little calmer. You let out a breath you didn’t know you were holding, and focus in on the task at hand.");
				target.changeLust(changeAmt);
			}
			//Not player!
			else
			{
				if(inCombat()) output("\n\n");
				else clearOutput();
				output(target.capitalA + target.short + " swallows a focus pill to no effect.");
			}
			return false;
		}
	}
}

