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
			this.longName = "focus pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pill labelled 'focus'";
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
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			if (target is PlayerCharacter) 
			{
				target.lust( -25);
				if (!target.hasStatusEffect("Focus Pill"))
				{
					target.createStatusEffect("Focus Pill", 0, 0, 0, 0, false, "PILL", "You feel shaper, more able to focus and process your senses.", false, 60);
				}
				else
				{
					target.setStatusMinutes("Focus Pill", 60);
				}
				
				output("You pop a Focus Pill out of your pack and into your mouth. It’s completely tasteless, and all but dissolves in your mouth. After a moment’s wait, you start to feel a little calmer. You let out a breath you didn't know you were holding, and focus in on the task at hand.");
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " uses the cream to no effect.");
			}
			return false;
		}
	}
}

