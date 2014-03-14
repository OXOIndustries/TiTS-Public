package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HorsePill extends ItemSlotClass
	{
		
		//constructor
		public function HorsePill()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "HorsePill";
			
			//Regular name
			this.longName = "literal horse pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a literal horse pill";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "True to its name, this pill is large enough you have to question how anything short of a terran work-horse would manage it. It's more of a gel-capsule than a proper pill, you suppose. The mixture of hormones, microscopic robots, and chemicals is a dull brown, utterly plain except for an embossed manufacturer label on the side. It reads, <i>\"Equinum.\"</i> What a stupid name for a transformation drug. A little research turns up that it's a slow-acting but potent transformative. <b>The effects take up to twelve hours to fully manifest.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.output("With more than a little bit of discomfort, you knock back the pill. It weighs heavy in your belly, but nothing changes just yet. The effects are supposed to take some time to manifest.");
				if(target.hasTail()) output(" You flick your [pc.tails] in irritation, waiting.");
				//Already under the effects? Strengthen and reset cooldown
				if(target.hasStatusEffect("Horse Pill"))
				{
					//If already under effects, refill timer to shortly before next change
					target.setStatusMinutes("Horse Pill",680+rand(10));
					//Increment odds of bigass changes!
					if(target.statusEffectv2("Horse Pill") < 4) target.addStatusValue("Horse Pill",2,1);
				}
				//Initial horsepill setup.
				else
				{
					target.createStatusEffect("Horse Pill",720,1,0,0, false,"Horse Pill", "You are under the effects of at least one horse pill. Flashes of heat and tingly sensations randomly run across your body as you're slowly transformed into a more equine shape.",false,720);
				
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " swallows the pill to no effect.");
			}
			return false;
		}
		public function pillTF
	}
}
