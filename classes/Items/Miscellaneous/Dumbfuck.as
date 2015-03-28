//MOST STUFF FOR THE TF IS BURIED IN includes/dumbFuckBonus.as

package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CodexManager;
	
	public class Dumbfuck extends ItemSlotClass
	{
		//constructor
		public function Dumbfuck()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Dumbfuck";
			
			//Regular name
			this.longName = "purple dumbfuck pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a purple dumbfuck pill";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "It's just a little purple pill, but it's one of the most illegal drugs in the U.G.C. You'll want to read up on it before you even consider using it. Check your codex if you haven't already.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 800;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter) {
				kGAMECLASS.clearOutput();
				//Just in case it didn't get unlocked before.
				CodexManager.unlockEntry("Dumbfuck");
				//Never read codex entry on it.
				if(!CodexManager.entryViewed("Dumbfuck"))
				{
					kGAMECLASS.output("You've heard this stuff is pretty intense. You had better look up the codex entry for it before you consider downing it.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				else
				{
					if(kGAMECLASS.flags["TIMES_TAKEN_DUMBFUCK"] == undefined)
					{
						kGAMECLASS.output("The simple, purple-pink pill in your hand looks so innocuous, so simple and harmless, yet it supposedly has the power to turn anyone who imbibes it into a sex-crazed breeder. Taking it is going to undoubtedly dim your intellect and enhance your lidido permanently, potentially to such a degree that you won't even care to bother chasing your inheritance anymore. If you do take it, every orgasm for the next twenty-four hours is going to make you dumber and hornier. You'll have to be careful to control yourself.");
						kGAMECLASS.output("\n\n<b>Do you take this pill?</b>");
						kGAMECLASS.clearMenu();
						kGAMECLASS.addButton(0,"Take It",kGAMECLASS.goAheadAndDumbfuck);
						kGAMECLASS.addButton(1,"Don't Take",dontTakeThePill);
						return true;
					}
					//Already Taken Before
					else
					{
						//Still under effects
						if(target.hasStatusEffect("Dumbfuck"))
						{
							kGAMECLASS.output("You decide that you're having a lot of fun amping up your sex drive and take another, ensuring that you'll keep this party going for the next twenty-four hours. As long as you don't cum too much and lose too many brain cells, it's no big deal, right?");
							kGAMECLASS.clearMenu();
							kGAMECLASS.addButton(0,"Take It",kGAMECLASS.goAheadAndDumbfuck);
							kGAMECLASS.addButton(1,"Don't Take",dontTakeThePill);
							return true;
						}
						//Not
						else if(kGAMECLASS.flags["DUMBFUCK_SNEEZES"] < 20)
						{
							kGAMECLASS.output("Ohhh... another round with the happy purple-pink pill and its pleasant arousal won't be too bad, will it? ");
							if(kGAMECLASS.flags["DUMBFUCK_SNEEZES"] == 0 || kGAMECLASS.flags["DUMBFUCK_SNEEZES"] == undefined)
								kGAMECLASS.output("You're mainly just doing it to test yourself at this point. After all, you didn't cum last time, and you're sure you'll make it again.");
							else kGAMECLASS.output("Cumming feels so much better when you've got something to lose, and each time is a little better than the last. You'll just have a few more of those super braingasms and then call it quits. For sure. Totally.");
							kGAMECLASS.output("\n\nDo you take another?");
							kGAMECLASS.clearMenu();
							kGAMECLASS.addButton(0,"Take It",kGAMECLASS.goAheadAndDumbfuck);
							kGAMECLASS.addButton(1,"Don't Take",dontTakeThePill);
							return true;
						}
						//Maxed out Dumbfuck effects
						else
						{
							kGAMECLASS.output("Yay! Like, another one of those yummy pinkie funfun pills! You eat it with a dopey smile on your face, too happy and horny to care that it can't do much more for you but chip away at brain-cells and ");
							if(target.libido() < target.libidoMax()) kGAMECLASS.output("keep your libido maxxed out");
							else kGAMECLASS.output("top off your libido");
							kGAMECLASS.output(".");
							kGAMECLASS.clearMenu();
							kGAMECLASS.addButton(0,"Next",kGAMECLASS.goAheadAndDumbfuck);
							return true;
						}
					}
				}
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " will not take the pill.");
			}
			return false;
		}
		public function dontTakeThePill():void
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.output("You put the pill back, thinking it best not to use it.");
			if (!kGAMECLASS.debug) kGAMECLASS.itemCollect([new Dumbfuck()]);
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}
