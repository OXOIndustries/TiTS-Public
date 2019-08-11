package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	
	public class Condensol extends ItemSlotClass
	{
		//constructor
		public function Condensol()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Condensol";
			//Regular name
			this.longName = "Condensol pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a package containing a single pill of Condensol";
			//Displayed on tooltips during mouseovers
			this.tooltip = "<i>Gotten a bit too big for your britches? Feeling like you just can’t find a partner who can handle your size? You could use gene mods to get smaller, but you don’t want to give up being the biggest man in the room. And now, thanks to your friends at J’ejune Pharmaceutical, you don’t have to. Now there’s Condensol! Using patented techniques derived from ancient alchemical practices, Condensol is guaranteed to give you four hours of a smaller package without permanently reducing your size. Now you can satisfy partners of all sizes, and still have that third leg that gets you respect.\n\nCondensol: So you’re always a perfect fit!</i>\n\nBelow this, in much smaller text, is a warning informing you not to take Condensol more than twice every four hours, if your penis is less than four inches in length, or if you don’t have a penis. It also lists off a long string of minor potential side effects. Within the colorful packaging featuring the stamp of approval from some holovid sales guy is a dull green pill.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 300;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			//Effects
			//When used as directed the first time:
			//Applies status Condensol-A with a timer of four hours. The status reduces the size of all of the PC’s cocks to half of their original value. When the status timer expires, the PC’s cock size is multiplied by 2 to restore it to its original value, assuming the PC’s cock hasn’t been adjusted while under the influence.

			//When used as directed the second time:
			//Ends status Condensol-A and applies status Condensol-B with a timer of four hours. The status reduces the size of all of the PC’s cocks to a quarter of their original value. When the status timer expires, the PC’s cock size is multiplied by 4 to restore it to its original value, assuming the PC’s cock hasn’t been adjusted while under the influence.

			//Overdose:
			//Ends status Condensol-A or Condensol-B, then reduces the size of all of the PC’s cocks by a random value between 1 and 4 inches.

			//Use with a cock of four inches or less:
			//Ends status Condensol-A or Condensol-B, then removes any sufficiently small cock and returns all others to their original sizes. If the PC no longer has any cocks after this but would still have balls, remove balls.

			//Use without a cock:
			//Randomly select between reducing breast size by 1-3 cups, reducing height by 3-6 inches to a minimum of 40 inches, reducing clit size to a minimum of 0.1 inches, reducing nipple size to some appropriate minimum, reducing vaginal looseness by 1, reducing ass looseness by 1, or a dud result.

			//Consumption Text
			//When using as directed first time:
			var pc:Creature = target;
			var x:int = 0;
			kGAMECLASS.clearOutput();
			if(target == kGAMECLASS.pc)
			{
				//When using without a cock:
				if(!pc.hasCock())
				{
					if(inCombat()) kGAMECLASS.output("You swallow a Condensol pill and shudder as its payload swims throughout your body. The tingling quickly fades... Apparently it doesn’t do anything if you don’t have a cock.");
					else kGAMECLASS.output("Yeah, you don’t have a dick, but directions are for chumps. You swallow one of the dick-shrinking pills and shudder as its payload swims throughout your body, confused by the absence of its usual target. Finally the tingling fades as the Condensol expires. Apparently it doesn’t do anything if you don’t have a cock.");
				}
				else if(!pc.hasStatusEffect("Condensol-A") && !pc.hasStatusEffect("Condensol-B") && pc.shortestCockLength() <= 4)
				{
					if (pc.cocks.length == 1 && (!pc.removeCockUnlocked(0, 1) || inCombat()))
					{
						if(inCombat()) kGAMECLASS.output("You gulp down a Condensol pill, and immediately regret it as you feel an intense pain in [pc.cockShortest]. The feeling passes after a moment, with no immediately evident changes.");
						else kGAMECLASS.output("Ignoring the directions about not using it with a dick that’s too small, you gulp down the Condensol, and immediately regret it as you feel an intense pain in [pc.cockShortest]. You hurriedly check your groin and watch as your cock throbs to attention. The feeling passes after a moment, with no immediately evident changes.");
					}
					else
					{
						//When using with a cock under four inches long:
						kGAMECLASS.output("Ignoring the directions about not using it with a dick that’s too small, you gulp down the Condensol, and immediately regret it as you feel an intense pain in [pc.cockShortest]. You hurriedly check your groin and watch helplessly as your member shrinks and shrinks until it vanishes entirely");
						if(pc.cockTotal() == 1 && pc.balls > 0) 
						{
							pc.removeBalls();
							pc.resetCumProduction();
							kGAMECLASS.output(", taking your [pc.balls] with it");
						}
						kGAMECLASS.output(". At least the moment it disappears brings a blessed relief to the pain.");
						pc.removeCock(pc.shortestCockIndex(), 1);
					}
				}
				else if(!pc.hasStatusEffect("Condensol-A") && !pc.hasStatusEffect("Condensol-B"))
				{
					kGAMECLASS.output("You gulp down the Condensol, feeling the “patented techniques” get to work as [pc.eachCock] tingles.");
					if(inCombat()) kGAMECLASS.output(" Y");
					else kGAMECLASS.output(" Upon checking y");
					kGAMECLASS.output("ou find that the dose has cut the size of your member");
					if(pc.cockTotal() > 1) kGAMECLASS.output("s roughly in half from their usual size.");
					else kGAMECLASS.output(" roughly half its usual size.");
					pc.createStatusEffect("Condensol-A", 0, 0, 0, 0, false, "Icon_Penis", "Any and all phalli are reduced in size by 50%.", false, 240,0xB793C4);
					for(x = 0; x < pc.cockTotal(); x++)
					{
						pc.cocks[x].cLengthRaw /= 2;
					}
				}
				//When using as directed second time:
				else if(pc.hasStatusEffect("Condensol-A") && !pc.hasStatusEffect("Condensol-B"))
				{
					if(!inCombat()) kGAMECLASS.output("You’re big enough that you probably need a double dose. ");
					kGAMECLASS.output("You gulp down a second Condensol, the tingle in [pc.eachCock] intensifying to just on the edge of uncomfortable. You can feel how you’re now a mere quarter of your usual length.");
					if(inCombat()) kGAMECLASS.output(" T");
					else kGAMECLASS.output(" Given how tight you’re feeling right now, t");
					kGAMECLASS.output("aking another would probably be a bad idea.");
					pc.createStatusEffect("Condensol-B", 0, 0, 0, 0, false, "Icon_Penis", "Any and all phalli are reduced in size by 75%.", false, 240,0xB793C4);
					pc.removeStatusEffect("Condensol-A");
					for(x = 0; x < pc.cockTotal(); x++)
					{
						pc.cocks[x].cLengthRaw /= 2;
					}
				}
				//When overdosing with a cock:
				else
				{
					kGAMECLASS.output("Ignoring the directions, you swallow another of the cock-shrinking pills. Immediately your groin complains, [pc.eachCock] feeling so tight it’s like a spring being forced down.");
					if(inCombat()) kGAMECLASS.output(" Y");
					else kGAMECLASS.output(" After a moment you feel a snapping sensation, and y");
					kGAMECLASS.output("ou briefly panic before looking down to see [pc.eachCock] spring back to ");
					if(pc.cockTotal() == 1) kGAMECLASS.output("its");
					else kGAMECLASS.output("their");
					kGAMECLASS.output(" normal size, or close. It seems overdosing has undone the normal effect of the Condensol, but also made you permanently smaller. Damn, that hurt.");

					pc.removeStatusEffect("Condensol-B");
					for(x = 0; x < pc.cockTotal(); x++)
					{
						pc.cocks[x].cLengthRaw *= 4;
					}

					for(x = 0; x < pc.cockTotal(); x++)
					{
						pc.cocks[x].cLengthRaw--;
						if(pc.cocks[x].cLengthRaw > 10) pc.cocks[x].cLengthRaw -= 1 + rand(3);
						if(pc.cocks[x].cLengthRaw > 20) pc.cocks[x].cLengthRaw -= 2 + rand(3);
						if(pc.cocks[x].cLengthRaw > 30) pc.cocks[x].cLengthRaw -= 3 + rand(4);
						if(pc.hasPerk("Mini")) pc.cocks[x].cLengthRaw *= 0.75;
					}
				}
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.short + " consumes the Condensol pill to no effect.");
			}
			return false;
		}
	}
}

