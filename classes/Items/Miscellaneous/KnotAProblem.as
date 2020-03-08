package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	
	public class KnotAProblem extends ItemSlotClass
	{
		//constructor
		public function KnotAProblem()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "KnotAProb";
			//Regular name
			this.longName = "pill called Knot a Problem";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pill called ‘Knot a Problem’";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Designed by an infamous ausar playgirl-scientist, this designer gene-therapy pill has a precise focus: upon consumption, it will mutate any cock into growing a canine knot. If a knot is already present, the consumer will be gifted with a thicker, girthier bitch-breaker.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 3000;
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
			var changes:int = 0;
			var x:int = -1;
			var i:int = 0;
			var choices:Array = new Array();
			//Lets find a dick that works!
			if(target.hasCock())
			{
				//Prioritize giving knots first.
				for(i = 0; i < target.cockTotal(); i++)
				{
					//Add every dick that needs a knot to the array!
					if(!target.hasKnot(i)) choices[choices.length] = i;
				}
				//Pick one of those dicks to be our lucky chode.
				if(choices.length > 0) x = choices[rand(choices.length)];
				//If there were none selected, pick randomly to embiggen a knot.
				if(x < 0)
				{
					x = rand(target.cockTotal());
				}				
			}

			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				author("Savin");
				kGAMECLASS.output("You pop the small, spherical red pill from the plastic container and into your palm. It’s barely smaller than your little finger’s nail, and has a slick, almost wet texture against your [pc.skinFurScales]. After a moment’s consideration, you plant the pill on your tongue and swallow it down. It goes down easily enough, leaving a meaty taste lingering in your mouth that has you salivating. Surprisingly delicious!\n\nYou’re left waiting for a few long, anxious minutes before ");

				//if PC has no dicks, but has a clit
				if(target.totalClits() > 0 && target.hasVagina() && x < 0)
				{
					kGAMECLASS.output("you feel a rush of heat on your [pc.clits]. A shudder of pleasure escapes you as the nanomachine treatment finally finds its target - though without a dick, what could they even be doing? Your thoughts meet an abrupt end when you suddenly feel your sex flushing with heat and arousal, moisture dripping from your [pc.vaginas] as the masculine drug works your cunt over. Your hand slips through your [pc.gear] of its own accord, your instinctive need to pleasure yourself too strong to resist. As your digits brush along the slick, drooling folds of your sex, you feel an unfamiliar bulge riding from the hood of your [pc.clits]. As your feverishly work yourself through the rising pleasure coming from within your sex, you feel your [pc.clits] swelling, growing as the nanomachines affect the closest thing to a cock they can find.\n\n<b>Your clitoris has grown!</b>");
					if(target.clitLength < 2) target.clitLength++;
					if(target.clitLength < 4) target.clitLength++;
					if(target.clitLength < 12) target.clitLength++;
					else target.clitLength += 0.5;
					//Possible secondary effect:
					if(rand(3) == 0 && target.driestVaginalWetness() < 5)
					{
						kGAMECLASS.output("\n\nAs you masturbate, you feel the wetness of your cunt only increasing. You feel like a bucket’s been unloaded from inside you, and it isn’t stopping! <b>You’re permanently wetter, now, and more able to easily take large insertions like knots.</b>");
						for(i; i < target.totalVaginas(); i++)
						{
							if(target.vaginas[0].wetnessRaw < 5) target.vaginas[0].wetnessRaw++;
						}
					}
					target.changeLust(330);
				}
				//if PC has a dick that can be affected
				else if(x >= 0)
				{
					kGAMECLASS.output("you finally feel a shiver work its way up your spine as your [pc.cock " + x + "] stiffens, blood rushing to your member as the nanomachines finally find their way down to it. You give a little moan as your cock is altered from the inside. The gene-mods go about fulfilling their tailor-made purpose, swelling and bulging the inside of your ");
					if(!target.hasKnot(x)) kGAMECLASS.output("[pc.cock " + x + "]");
					else kGAMECLASS.output("already-existing knot");
					kGAMECLASS.output(". You watch with glee as your cockflesh grows, the base of your cock <b>");
					if(!target.hasKnot(x)) kGAMECLASS.output("twisting into a thick, bulbous knot");
					else kGAMECLASS.output("expanding as your knot grows and grows");
					kGAMECLASS.output("</b>.");

					kGAMECLASS.output("\n\nAs the gene mods work, you feel the unmistakable draw of your own growing arousal. Your hands wander down, ");
					if(target.isCrotchGarbed()) kGAMECLASS.output("pushing aside your [pc.lowerGarment] and ");
					kGAMECLASS.output("grabbing the turgid length of your shaft. You start at the over-sensitive swell of your ");
					if(!target.hasKnot(x)) kGAMECLASS.output("new ");
					kGAMECLASS.output("[pc.knot " + x + "], fingers exploring the modified girth of the meaty bitch-breaker. It responds to your touch, throbbing with new and irresistible need, your newborn flesh aching for sensation. You give it eagerly, starting to stroke your meat - gently at first, but quickly picking up to a quick pace, hand moving quickly across your length and lavishing your knot with attention. You’re immediately greeted with almost overwhelming waves of pleasure, threatening to barrel you to the ground. Damn, you’re sensitive now! You can practically feel the cum rushing through your vein, swelling your knot even further; the faster you move, the more intense the sensation, until you can’t take it anymore.");
					kGAMECLASS.output("\n\nWith a grunt, you let loose the first load of jizz with your newly modded cock, slumping back and breathing hard as your growing member spasms and throbs, ");
					if(target.cumQ() > 8) kGAMECLASS.output("[pc.cumColor] seed shooting from it and across the ground.");
					else kGAMECLASS.output("a single droplet of your exhausted [pc.cumNoun] dripping to the ground.") ;
					kGAMECLASS.output(" Unsteadily, you slump to your [pc.knees], desperately trying to catch your breath. This ");
					if(!target.hasKnot(x)) kGAMECLASS.output("new");
					else kGAMECLASS.output("new and improved");
					kGAMECLASS.output(" knot is going to be a hell of a lot of fun....");
					target.changeLust(500);
					//Actual TF
					//No knot yet!
					if(!target.hasKnot(x)) 
					{
						target.cocks[x].knotMultiplier = 1.25;
						target.cocks[x].addFlag(GLOBAL.FLAG_KNOTTED);
					}
					//Growknot
					else
					{
						if(target.cocks[x].knotMultiplier < 2) target.cocks[x].knotMultiplier += 0.25;
						else if(target.cocks[x].knotMultiplier < 3) target.cocks[x].knotMultiplier += 0.1;
						else target.cocks[x].knotMultiplier += 0.05;
					}
					target.orgasm();
				}
				else
				{
					kGAMECLASS.output("you sigh, finally accepting that the pill isn’t having any effect on you. Maybe you need a dick for Knot a Problem to work.");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " eats the pill to no effect.");
			}
			return false;
		}
	}
}

