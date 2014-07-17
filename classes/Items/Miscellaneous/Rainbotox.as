package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Rainbotox extends ItemSlotClass
	{
		
		//constructor
		public function Rainbotox()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "Rainbotox";
			
			//Regular name
			this.longName = "medipen full of Rainbotox";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen full of Rainbotox";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This small injector houses the extranet's favorite pranking tool: Rainbotox. Based on the same powerful microsurgeon technology as permanent hair colorations sold by other companies, Rainbotox is comprised of serums rejected for improper color quality mixed together at random. You can find hundreds of holos of upperclass teenagers pranking their friends by swapping it in place of other treatments.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
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
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				kGAMECLASS.output("You press the medipen against your [pc.skin] and activate its trigger stud. There's a quick, almost imperceptible 'snick' followed by the pen flashing red. Now you've done it! You wonder what color you're about to turn... and where.");
				var targets:Array = new Array();
				var choices:Array = new Array();
				var newColor:String = "";
				for(var effects:int = rand(3) + 1; effects > 0; effects--)
				{
					//Build up a list of choices that aren't used yet

					choices = new Array();
					if(targets.indexOf(7) == -1) choices[choices.length] = 7;
					if(targets.indexOf(6) == -1 && (target.isNaga() || target.skinType == GLOBAL.SKIN_TYPE_SCALES)) choices[choices.length] = 6;
					if(targets.indexOf(5) == -1 && target.skinType == GLOBAL.SKIN_TYPE_FUR) choices[choices.length] = 5;
					if(targets.indexOf(4) == -1) choices[choices.length] = 4;
					if(targets.indexOf(3) == -1) 
					{
						choices[choices.length] = 3;
					}
					if(targets.indexOf(2) == -1) 
					{
						choices[choices.length] = 2;
					}
					if(targets.indexOf(1) == -1 && target.hasHair()) choices[choices.length] = 1;
					//Pick a random one to append
					if(choices.length > 0) targets[targets.length] = choices[rand(choices.length)];
				}
				//Go through targets one at a time, execute them then remove from list
				while(targets.length > 0)
				{
					newColor = randomString("green","cerulean","blue","emerald","teal","crimson","red","pink","purple","violet","yellow","silver","copper","gold","amber","orange","rose","sable","lavender","peach");
					//hair color
					if(targets[targets.length-1] == 1)
					{
						if(target.hairColor == newColor) kGAMECLASS.output("\n\nYour scalp itches, but your [pc.hair] doesn't change at all. Maybe it selected the same color you already had.");
						else
						{
							kGAMECLASS.output("\n\nYour [pc.hair] rapidly shifts, turning " + newColor + " starting at the roots and rapidly spreading outward to the tips. <b>You have " + newColor + " hair.</b>");
							target.hairColor = newColor;
						}
					}
					//skin color
					else if(targets[targets.length-1] == 2)
					{
						if(target.skinTone == newColor) kGAMECLASS.output("\n\nYour [pc.skin] itches, but the sensation soon passes. A closer inspection reveals no noticeable difference. You guess the random color must have matched your current pigmentation.")
						else
						{
							newColor = randomString("albino","fair","tanned","olive","brown","pink","onyx","ebony","dark","pale green","emerald","sapphire","azure","purple","amethyst","copper","silver","gold","cherry","ruby","scarlet","yellow","amber","orange");
							kGAMECLASS.output("\n\nYour [pc.skin] briefly itches. You look down to watch it changing to a " + newColor + " pigmentation. At first, there's just a spot here and there, but they expand until they're joining together into one seemless coat of new color. <b>You now have " + newColor + " skin.</b>");
							target.skinTone = newColor;
						}
					}
					//eye color
					else if(targets[targets.length-1] == 3)
					{
						if(target.eyeColor == newColor) kGAMECLASS.output("\n\nA flash of " + target.eyeColor + " momentarily obscures your vision. When it passes, you check your appearance with your codex's camera only to find that nothing has changed. It likely tried to change your eyes to their existing color.");
						else
						{
							kGAMECLASS.output("\n\nA flash of " + target.eyeColor + " momentarily obscures your vision. You excitedly pull up your codex's holocam to check yourself once it clears and discover that your eyes have changed color. <b>They're now " + newColor + ".</b>");
							target.eyeColor = newColor;
						}
					}
					//nipple color
					else if(targets[targets.length-1] == 4)
					{
						newColor = randomString("white","brown","pink","onyx","ebony","sable","green","emerald","sapphire","azure","purple","amethyst","copper","silver","gold","cherry","ruby","scarlet","yellow","amber","orange");
						if(target.nippleColor == newColor) kGAMECLASS.output("\n\nA flash of irritation causes you to scratch at your [pc.nipples], but nothing seems different.");
						else
						{
							kGAMECLASS.output("\n\nYou scratch at your nipples for a second before realizing the potential significance of the act. A closer look confirms that <b>your [pc.nipples] are now " + newColor + "!</b>")
							target.nippleColor = newColor;
						}
					}
					//fur color
					else if(targets[targets.length-1] == 5)
					{
						if(target.furColor != newColor)
						{
							kGAMECLASS.output("\n\nA barely-discernable tingling runs through your [pc.skin], but its most intense around the roots of your [pc.skinFurScales]. Before your eyes, new coloration spreads out towards the tips, <b>turning your fur " + newColor + ".</b>");
							target.furColor = newColor;
						}
						else kGAMECLASS.output("\n\nThere's some itching around your [pc.skinFurScales], but nothing seems to change. Odd. Maybe you got ripped off?");
					}
					//scale color
					else if(targets[targets.length-1] == 6)
					{
						if(target.scaleColor == newColor) kGAMECLASS.output("\n\nYour scales click as if something irritated them, yet you can't spot reason why. There could be a slim chance that the Rainbotox tried changing their color to your existing complexion.")
						else
						{
							kGAMECLASS.output("\n\nYour scales click, feeling almost like they're standing up on end. Then, they all begin to change color in perfect synchronization, shifting hue from one side to the other until <b>your scales are a glittering " + newColor + ".</b>")
							target.scaleColor = newColor;
						}
					}
					//lip color
					else if(targets[targets.length-1] == 7)
					{
						if(target.lipColor == newColor) kGAMECLASS.output("\n\nYour [pc.lips] tingle, but they remain unchanged by Rainbotox's random effects.");
						else
						{
							newColor = randomString("cerulean","glossy blue","emerald","teal","crimson","slut red","bubblegum-pink","glittering purple","violet","yellow","silver","copper","gold","amber","orange","rose","sable","peach");
							kGAMECLASS.output("\n\nYour [pc.lips] itch. You immediately bring up your codex to check on your reflection. It's just in time to show you blotches of " + newColor + " spreading across them, forever changing their natural pigmentation.");
							target.lipColor = newColor;
						}
					}
					targets.splice(targets.length-1,1);
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " injects the Rainbotox to no effect.");
			}
			return false;			
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		protected function randomString(... args):String
		{
			return args[rand(args.length)];
		}
	}
}
