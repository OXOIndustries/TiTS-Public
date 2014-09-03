package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MilkmaidsAid extends ItemSlotClass
	{
		
		//constructor
		public function MilkmaidsAid()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 50;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Milk. Aid";
			
			//Regular name
			this.longName = "milkmaid's aid";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a dose of milkmaid's aid";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This bottle contains milk-white pills, and the label shows several New Texan girls reclining against what look like industrial-strength milkers, their nudity tastefully hidden by foreground objects. The listed effects include a massive one-time surge in lactation: perfect for “<i>stocking up</i>” before a long, happy session in the milk barn.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 10;
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
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var x:int = 0;
			var y:Number = 0;
			var choices:Array = new Array();
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//First use
				kGAMECLASS.author("Savin");
				//Consume:
				if(!target.canLactate())
				{
					kGAMECLASS.output("You pop the bottle open and tap a few of the milk-colored pills into your hand. Before you consume them, however, you take a peek at the health and safety warnings, which tells you that there’s no known effect on persons not currently lactatings. You’d better start lactating before you fill up on it.");
					if(!kGAMECLASS.debug) quantity++;
				}
				//Use, PC is lactating
				else
				{
					kGAMECLASS.output("You pop the bottle open and tap a few of the milk-colored pills into your hand, and swallow them down. They go down easily, small as they are, and leave a creamy after-taste as they make their way down. A few moments pass before you feel a slight, weighty shift in your chest. You give a little gasp a liquid rush surges in your tits. Your breasts seem to swell with [pc.milk], heavier and heavier until they feel about as full as they’ve ever been! <b>Your breasts are now completely swollen with [pc.milk]!</b> Time to find a nice, vigorous milker....");
					target.milkFullness = 175;
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " consumes the pill to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}
