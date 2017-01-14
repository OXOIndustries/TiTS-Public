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
	import classes.Engine.Map.InShipInterior;
	
	public class DongDesigner extends ItemSlotClass
	{
		//constructor
		public function DongDesigner()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			//Used on inventory buttons
			this.shortName = "Dong D.";
			//Regular name
			this.longName = "TamaniCorp Dong Designer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Hora Series Dong Designer";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Lettering in luminescent paint declares it to be a TamaniCorp Dong Designer. These things are incredibly expensive, even in the core. You’ve seen them in less savory holos - they get installed in elite nightclubs or exclusive spas, particularly along the human/ausar border worlds where the two races mix.\n\nWith only a few button presses, you can use this to change the appearance of your penis to be satisfying to a partner of almost any race. Of course, you found this one on a junkyard, so maybe there’s something strange about it.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Not in ship.
				if(!InShipInterior())
				{
					kGAMECLASS.output("You can’t make use of it without any power. Maybe take it back to your ship?");
				}
				//In ship
				else
				{
					//No room - pending ship upgrade system
					if(9999 == 0)
					{
						kGAMECLASS.output("There’s not any room to install this in your ship. You’ll have to clear out some space if you want to try and put this baby to use.");
					}
					//Else
					else
					{
						kGAMECLASS.output("Now that you’ve got it on your ship, it’s time to plug in this Dong Designer thing and make sure it’s still in working order. Finding a clear spot with good access to a suitable power port takes a few minutes. You can’t just have it propped up anywhere, particularly if ");
						if(target.hasCock()) kGAMECLASS.output("you’re gonna be sticking your dick in it.");
						else kGAMECLASS.output("someone is going to wind up sticking their dick in it.");
						kGAMECLASS.output(" Finally, you settle on a quiet corner. It’ll be a good home for it if it works and give you plenty of room to work on it if it doesn’t.");
						kGAMECLASS.output("\n\nThe original cable is long gone, but machines like this have used standardized power cabling for years. Moment of truth time. You plug it in.");
						kGAMECLASS.output("\n\n...And nothing happens.");
						kGAMECLASS.output("\n\nGrunting in irritation, you notice a button on the back and depress it. It gives way with a satisfyingly meaty click, and you hear the soft whine of long-dormant machinery coming to life. Flickering at first, a purple-tinted holoscreen projects above it at about chest height");
						if(target.tallness < 60 || target.tallness >= 84) kGAMECLASS.output(" for most galactic races");
						kGAMECLASS.output(", displaying a three-dimensional view of an astounding array of potential erections. It looks like it works!");
						if(target.characterClass != GLOBAL.CLASS_ENGINEER) kGAMECLASS.output(" A good thing too. You didn’t exactly spend a lot of time learning about tech repair growing up.");
						kGAMECLASS.output("\n\nJust to be sure, you tap through the settings screen and summon up a self-diagnostic routine. A mechanical whirring rises from deep inside the box, the mechanical parts humming busily as they verify their integrity. It clicks a few times, and then displays a notification of full functionality.");
						kGAMECLASS.output("\n\n<b>You’ve installed a TamaniCorp Hora Series Dong Designer in your ship! You can access it from the storage menu.</b>");
						kGAMECLASS.flags["DONG_DESIGNER_INSTALLED"] = 1;
						this.quantity--;
						if (this.quantity <= 0 && target.inventory.indexOf(this) != -1)
						{
							target.inventory.splice(target.inventory.indexOf(this), 1);
						}
					}
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " takes a look at the box, then shakes " + target.mf("his","her") + " head.");
			}
			return false;
		}
	}
}

