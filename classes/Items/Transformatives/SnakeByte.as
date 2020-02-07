//[BEFORE ANYTHING ELSE] Grows tits to C cup before all else.
//[FIRST DOSE ALWAYS] Start lactation on full bore
//Increase libido
//Tits grow 3-4 rating at a time.
//Bad-end if taken above a certain cup-size. R?

package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CodexManager;
	
	public class SnakeByte extends ItemSlotClass
	{
		//constructor
		public function SnakeByte()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			//Used on inventory buttons
			this.shortName = "SnakeByte";
			//Regular name
			this.longName = "SnakeByte";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a syringe of SnakeByte";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A glass syringe with an incredibly fine point, filled to capacity with transparent liquid. Were it not for the bright label assuring you of the drastic side effects, you could easily mistake it for water. There’s a stylized picture of a grinning snakewoman with a cobra hood on the front with lines emphasizing her throat. Looks like it ‘enhances oral ability’, and you’re pretty sure it doesn’t mean speech.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
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
			if(target is PlayerCharacter) {
				var pc:PlayerCharacter = target as PlayerCharacter;
				//Already taken some~
				if(kGAMECLASS.flags["USED_SNAKEBYTE"] != undefined)
				{
					output("You’ve already taken a dose of SnakeByte and reaped the throat-elasticizing rewards. More won’t do anything for you.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				else
				{
					/*
					- No gag reflex.
					- Can fit your lips and throat around a cock of any size.
					- Makes your throat an erogenous zone. Cum from oral, and cum hard.
					- Makes your throat ribbed. The recipient of your oral services will notice how good fucking your throat feels.
					- Endows you with fine muscular control of your throat, in the most basic of cases allowing you to squeeze a cockhead deep inside you and in the more extreme, allowing you to perform feats like milking a cumming cock with an undulating motion while held completely stationary.
					*/

					author("Wsan");
					output("You eye the syringe slightly nervously - and with good reason. It says you’re meant to inject it directly into the site, otherwise known as your own throat. Seems a tad risky even to you, but if people had turned back at the first sign of danger you suppose no progress would ever be made. Lifting your chin, you lay the point of it against your throat and gently depress it with your thumb.");

					output("\n\nThe effect is immediate. The moment it’s empty you suddenly gasp and clutch at your throat, the syringe clattering to the floor and miraculously not breaking. It feels like you’re about to suffer the hardest coughing fit you’ve ever experienced when, suddenly, the feeling dissipates and you heave a sigh of relief. In fact, you’re not sure you’ll ever have a coughing fit after inhaling food down the wrong pipe again. It seems like <b>your gag reflex is now completely absent</b>!");

					if(pc.isBimbo()) output("\n\nBut that’s like, whatever. You could suck down half the galaxy without issue. Maybe you’ll do that later, now that your throat’s like, double-prepped for blowjobs. Yay!");

					output("\n\nSpeaking of fitting things into your mouth - food and otherwise - it feels like that’ll never be an issue, either. You’re not inclined to show off the full effect right now, but you know that when the time comes you’ll be <b>able to fit your lips around any long, hard object, no matter how thick and veiny it is</b>.");

					output("\n\nSomehow, you feel hyper-aware of the muscles involved in moving your throat. Experimentally swallowing and flexing, you gradually come to grips with a couple of realizations - <b>not only is the inside of your throat is now ribbed, you have extremely fine muscular control over it</b>!");

					output("\n\nIn addition, it feels <i>good</i> to do all of this. You hazard a guess that <b>your throat is now an erogenous zone</b>, akin to a clitoris or even a pussy. All you really know is that if you were to get facefucked right now, you might cum on the spot.");

					output("\n\nYou lick your lips unconsciously and grin. You can hardly wait to see the expression of surprise and bliss on some gorgeous hung bombshell’s face when you put all of this potent cocktail to good use. You pick up the syringe off the floor and, shaking your head in subdued awe, dispose of it safely. Amazing to think there could be so much good packed into such a small package.");
					
					pc.changeLust(10);
					kGAMECLASS.flags["USED_SNAKEBYTE"] = 1;
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the SnakeByte syringe to no effect.");
			}
			return false;
		}
	}
}

