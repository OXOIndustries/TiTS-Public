package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Utility.num2Text;
	
	public class GaloMax extends ItemSlotClass
	{
		
		//constructor
		public function GaloMax()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "GaloMax";
			//Regular name
			this.longName = "GaloMax pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a GaloMax pill";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Inspired by the unique physiology of Galotians, GaloMax is one of Xenogen’s first products specializing in a complete change in the user’s physiology. Approved for use in over 80% of known galactic sapients, this product is guaranteed to reorganize biological structures into a hyper-efficient, highly-morphic goo.\n\nIt comes with a warning in big, bold print: <b>MAY BE IRREVERSIBLE</b>. It must be harder to turn a goo-person into a regular person than the other way around...";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 10000;
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
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Fenoxo");
			var pc:Creature = target;
			if(target is PlayerCharacter) {
				//Already waiting on effects
				if(target.hasStatusEffect("GaloMax"))
				{
					output("Nope. You’re still waiting for the effects of the last one to kick in. You’re not going to risk turning into a puddle.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				//Dose 1!
				if(kGAMECLASS.flags["GALOMAX_DOSES"] == undefined)
				{
					//Take this shit
					output("It’s amazing what they can fit into pills these days, though this particular pill is more of a potion-packing gelcap. The thing is big enough to make you wonder if you’ll be able to swallow it at all");
					if(pc.isBimbo()) output(", but then your spaced-out mind daydreams about taking far bigger... veinier packages into your throat. This’ll be no trouble at all");
					output(". Oh well, if you want to ");
					if(kGAMECLASS.flags["RECRUITED_CELISE"] == undefined) output("gain the advantages of a galotian");
					else output("get as gooey as Celise");
					output(", you’ll need to do it.");

					output("\n\nDown the hatch.");
					output("\n\nIt... it wasn’t that bad. It didn’t feel nearly as big as it looked. You barely even felt it! Nothing to do now but wait for that lump in your belly to dissolve and work its magic. Just how long is this stuff supposed to take anyway?");
					output("\n\nArticles on the Codex peg it somewhere between thirty minutes and an hour. Time to wait.");
				}
				//Repeat take this shit
				else
				{
					output("Another day, another gelcap full of transformative possibilities. You roll the pill around in your palm as you wonder what it’ll do to you, then knock it back before doubts can overcome your courage. All that’s left is to wait a little while for the gelcap to dissolve and release the pre-packed mutagenic agents into your system.");
				}
				pc.createStatusEffect("GaloMax",0,0,0,0,true,"","",false,30+rand(10));
				IncrementFlag("GALOMAX_DOSES");
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " eats the pill to no effect.");
			}
			return false;
		}
	}
}

