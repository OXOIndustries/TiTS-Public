package classes.Items.Toys
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CodexManager;
	
	public class BubbleBuddy extends ItemSlotClass
	{
		//constructor
		public function BubbleBuddy()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "B.Buddy";
			
			//Regular name
			this.longName = "Bubble Buddy";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Bubble Buddy";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This purplish onahole is considerably thinner than most sex toys of its type. The wobbling, gelatinous surface is semi-transparent and perpetually beads with its own internal lubrication. While one end is open, the other appears to be sealed over by a very thin membrane.\n\nA fat sticker has been slapped on its side: \"Contain and Sustain with the Bubble Buddy! Keeping your loads warm, fresh, and potent in detachable bubbles!\" A second, slightly larger sticker proclaims a corporate guarantee: if you are dissatisfied, send a bubble of your cum to TamaniCorp for inspection. If your seed isn't perfectly preserved and potent, they promise to send you a full refund.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 7500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (target is PlayerCharacter) 
			{
				kGAMECLASS.clearOutput();
				if(!target.canMasturbate() || target.lust() < 33)
				{
					kGAMECLASS.output("You’re not really in the mood to masturbate right now....");
				}
				else if(!target.hasCock())
				{
					kGAMECLASS.output("You don’t have the proper genitals to use this!");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.NOFAP))
				{
					kGAMECLASS.output("Masturbating here would be impossible.");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL))
				{
					kGAMECLASS.output("Public masturbation is illegal here. Trying to masturbate would almost certainly land you in jail.");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) && target.exhibitionism() < 33 && target.libido() < 70)
				{
					kGAMECLASS.output("You cannot use the Bubble Buddy at this time!");
				}
				else
				{
					kGAMECLASS.jackIntoDaBubbleBooty();
				}
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the bubble buddy.");
			}
			return true;
		}
	}
}
