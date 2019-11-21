package classes.Items.Toys.Bubbles
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	
	public class ArdiasCum extends ItemSlotClass
	{
		//constructor
		public function ArdiasCum()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.POTION;

			//Used on inventory buttons
			this.shortName = "Ardia's Cum";
			
			//Regular name
			this.longName = "condom with Ardia's cum";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a condom with Ardia's cum";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A latex condom full of your alpha's still-warm cum, imprinted with a blue lipstick mark that makes sure that everyone knows just whose spunk you're drinking. Use to sate your cravings.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 0;

			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);

			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Savin");
			if (target is PlayerCharacter)
			{
				if (kGAMECLASS.ardiaWithdrawal())
				{
					output("You can't fight off the cravings anymore. Your mind keeps racing back to the thought of your alpha's [ardia.balls] crushing your [pc.face] while she force-feeds you every inch of life-giving cock, filling your belly with warmth and contentment... stars, you <b>need</b> it! ");
					output("\n\nThe cum-filled condom is already in your hand and halfway untied by the time you realize what your body's been doing. Your hands are practically trembling with anticipation by the time you've undone the knot and brought the filled cum-bubble to your [pc.lipsChaste]. Eagerly, you open it wide, pinning it between lip and tooth and tilting the jiggling goodie-bag up. The first taste of still-warm cum hits you like a shot of espresso, a wake up call to ever neuron in your body -- and an object reminder of your utter reliance on Ardia's cock to feel this alive. You don't just crave her cum: you <b>need</b> it.");
					output("\n\nBefore you know it, you've completely emptied her condom down your throat, feeling it settling in a warm, sloshing knot in your stomach. Oh, stars, that feels so good...");
					output("\n\nA moment later and the shakes have passed from your hands, and a pleasant warmth has spread through your fingers" + (target.hasToes() ? " and toes." : "."));
					kGAMECLASS.drinkArdiasCum();
					kGAMECLASS.itemConsume(this);
				}
				else output("You are not desperate enough to drink this. Not when you could get some straight from the source!");
			}
			else output(target.capitalA + target.short + " is not interested in " + (kGAMECLASS.ardiaDomLevel() < 4 ? "Ardia" : "your alpha") + "'s cum.\n\n");
			return false;
		}
	}
}
