package classes.Items.Miscellaneous 
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.rand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Lactaid extends ItemSlotClass
	{
		
		public function Lactaid() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Lactaid";
			//Regular name
			this.longName = "medipen labeled “Lactaid”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen labeled “Lactaid”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "TamaniCorp’s last ditch effort to recover their losses from the Gush fiasco, Lactaid is a simplistic one-use medipen that will cause the user to begin a natural lactation cycle. Unlike its predecessor, Lactaid has few side effects and a low risk of addiction.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2000;
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
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Savin");

			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " injects the Lactaid to no effect.");
				return false;
			}

			output("You take out the white plastic-wrapped medipen marked LACTAID from your pack and rip the packaging open, revealing a needle capped in another plastic sheathe, swimming in a localized anesthetic and disinfectant. The cap pops off easily, treating you to a very clinical odor. Following the practices you’ve seen on extranet holos - and the very sparse instructions on the side of the needle, you squirt out a tiny amount of the fluid to clear the needle’s point before placing the point against the");
			if (target.biggestTitSize() > 0)
			{
				output(" top of your");
				if (target.breastRows.length > 1) output(" top");
				output(" left breast.");
			}
			else output(" flat plane of your chest.");

			output("\n\nYou take a deep breath to steady yourself before plunging the needle down. There’s a slight pressure on your chest, but no real pain to speak of - that’s good, at least. You press the tab down half way, injecting yourself with a surge of specialist nanomachines that quickly go right where they need to. You pull the needle out, move to the other side of your chest, and repeat the process with the remainder of the medipen’s contents.");

			if (target.isLactating() && target.milkType == GLOBAL.FLUID_TYPE_MILK && (target.milkStorageMultiplier < 4 || target.milkFullness < target.milkFullnessMax()))
			{
				//Fill to capacity. Increase max milk capacity. 
				output("\n\nWith that done, you toss the pen aside and grope at your milky tits, waiting for the lactation aid to take effect. The microbots announce their success in the most bombastic way possible - after a few moments, your chest clenches as a squirt of [pc.milk] shoots out of your [pc.nipples], splattering all over you!");
				//target.milkFullness = 100;

				if (target.milkStorageMultiplier < 4)
				{
					output("\n\nYou giggle to yourself as your tits squirt and fill up again, swelling to their full capacity and ejecting a great deal more milk than that! When the shower stops, you heft your breasts up and give them an affectionate squeeze - <b>they definitely feel fuller than before!</b>");
					target.milkStorageMultiplier += 0.5;
					if (target.milkStorageMultiplier > 4) target.milkStorageMultiplier = 4;
				}
			}
			else if (target.isLactating() && !target.milkType == GLOBAL.FLUID_TYPE_MILK && target.milkTypeUnlocked(GLOBAL.FLUID_TYPE_MILK))
			{
				// If PC is lactating already, not milk tho:
				//Chance milkType to milk. Fill to capacity.
				output("\n\nNow that you’ve filled yourself with the nanomachine treatment, you toss the pen aside and grope at your chest, waiting for them to take effect. Doesn’t take long, it turns out - mere moments later, you feel an intense clenching in your [pc.chest], and you barely have enough time to squeeze your breasts before they start to geyser out, splattering you and the ground and everything around you in [pc.milk].");

				output("\n\nThe shower just keeps going - there’s so much pressure in your chest you think you’re surely going to be left <i>empty</i> by the Lactaid! This isn’t what you signed up for!");

				output("\n\nThankfully, the squirts come to a stop after a few moments. You don’t feel empty, either, despite how much [pc.milk] you splashed yourself with. A few experimental squeezes do indeed draw out a few more drops - but not the same kind as you’re used to. It looks like <b>you’re lactating normal, human milk now!</b>");
				target.milkType = GLOBAL.FLUID_TYPE_MILK;
				//target.milkFullness = 100;
			}
			else if (!target.isLactating())
			{
				if (!target.canLactate())
				{
					target.milkMultiplier = 75;
				}
				//target.milkFullness = 100;

				//Start lactation. +Lust.
				output("\n\nWith that done, you toss the pen aside and wait for it to take effect - a very short wait, it turns out. A few moments after you’ve injected yourself, you feel a clenching in your [pc.chest], followed by a stretching sensation that leaves you groaning. After a few moments, you glance down at your [pc.nipples] and see that they’re beading with [pc.milk].");

				output("\n\nYou grin ear to ear as your chest swells with liquid bounty, ready to be suckled out at your leisure. Mmm, and playing with your milky tits sure feels nice, too... maybe you ought to take a few minutes off and really enjoy yourself first...");
				target.changeLust(25);
			}
			else
			{
				output("\n\nA few moments after you’ve injected yourself, you feel a clenching in your [pc.chest], followed by a stretching sensation that leaves you groaning. After a few moments, you glance down at your [pc.nipples] and see that they’re beading with [pc.milk]. You giggle to yourself as your tits squirt and fill up again, swelling to their full capacity!");
				//target.milkFullness = 100;
			}
			
			// Filling to capacity
			target.milkFillToCapacity(25, 100, false);

			return false;
		}
	}
}