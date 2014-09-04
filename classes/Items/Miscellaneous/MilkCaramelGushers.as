package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MilkCaramelGushers extends ItemSlotClass
	{
		
		//constructor
		public function MilkCaramelGushers()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 50;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Milk Gushers";
			
			//Regular name
			this.longName = "milk caramel gushers";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a few milk caramel gushers";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These caramel-flavored candies are laced with a creamy mixture of sugar, hormones, and nanomachines that can give you a sudden burst of lactic fullness - even if you aren't already lactating. A warning label indicates that repeated use could cause you to lactate even without the candies.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 200;
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
				kGAMECLASS.output("You greedily unwrap the creamy brown candies and pop them into your mouth. It’s as sweet as you imagined, the taste thick and rich and... well, caramelly. You suck and lick at the thick, round candies, enjoying the taste and texture over several minutes as they slowly dissolve. As they do, the first trickles of nanomachines and hormone-laced sugar glide down your eager throat, and begin to work their magic inside of you.");
				if(target.milkFullness >= 75) kGAMECLASS.output(" You feel a mild tingle in your already full chest and little else. Perhaps these things aren't very useful to someone already so full of [pc.milk].");
				else
				{
					target.milkFullness = 75;
					kGAMECLASS.output(" Your [pc.breasts] suddenly begin to swell out, feeling weightier and... and fuller! You cup your burgeoning titflesh as your chest expands under the weight of [pc.milk] welling up inside you.");
					//Bump size!
					for(x = 0; x < target.bRows(); x++)
					{
						if(target.breastRows[x].breastRatingRaw >= 5) target.breastRows[x].breastRatingLactationMod = 1.5;
						else target.breastRows[x].breastRatingLactationMod = 1;
					}
					kGAMECLASS.output(" <b>You now have [pc.breastCupSize]s!</b>");
					kGAMECLASS.output(" You're very nearly full of [pc.milk], and your mind keeps insisting that you’re in need of a good, hard milking");
					if(target.libido() > 50) kGAMECLASS.output("<i> -- or was it fucking? --</i>");
					kGAMECLASS.output(" now.");
					target.boostLactation(10);
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
