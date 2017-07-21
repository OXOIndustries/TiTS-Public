package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.author;
	
	public class WhiffOWisp extends ItemSlotClass
	{
		//constructor
		public function WhiffOWisp()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "WffOWsp";
			//Regular name
			this.longName = "amphora of Wiff-O-Wisp";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an amphora of Wiff-O-Wisp";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A small glass amphora of reddish orange liquid. It’s completely unmarked and fits in the palm of your hand. The amphora design seems like an odd choice, certainly a choice with a reason you can’t even think of. The liquid is kept inside by a glass stopper, one that takes a fair amount of strength to twist open.\n\nAlthough it makes sense to drink it, you’re certain that the slow moving vapours present mean inhalation over ingestion. <i>It’s advised not to take more than one in a row</i>.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 250;
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
			//Decidedly 3rd in the range of original items available at The Entite. The only thing this does is give you weird dreams and some lust but it’s main reason for being is vaguely plot related. Having two within a short time frame leads to a bad end.

			//Effects/Guaranteed
			//100% of occurring.
			//Player gains status effect ‘Woozy’.
			//‘Woozy’ increases lust to max, reduces Aim by 10 and increases Int by 10 for its duration and gives Blue Balls status effect if applicable.
			//Woozy lasts for 4 hours or until the PC sleeps, whichever comes first.
			//When the PC falls asleep under the Woozy effect, trigger different ‘trips’ and an orgasm event.
			//Taking two Wiff-O-Wisp within the 4 hour time period results in an unpleasant bad end.


			//Consumption
			//Wiff-O-Wisp can be used anywhere like normal consumables and will apply the ‘Woozy’ effect. Nothing truly happens until the PC goes to sleep.
			if(target is PlayerCharacter)
			{
				var pc:Creature = target;
				if(!pc.hasStatusEffect("Woozy"))
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.showName("WHIFF-\nO-WISP");
					author("SoAndSo");
					output("With a little bit of effort, you untwist the firmly lodged glass stopper of the small amphora. The pungent smell of something like woodsmoke and burnt ginger root permeates the air around you. The odour comes with a wash of pleasant heat that warms up your nose, [pc.face] and [pc.skinFurScales]. It quickly escalates from head to bottom as you inhale more, a strange tingle accompanying it in your nerves.\n\nOo, that’s quite the arousing effect! Your [pc.groin] can’t resist the rush of blood that follows through.");
					if(pc.balls > 0) 
					{
						output(" Your [pc.balls] churn");
						if(pc.balls <= 1) output("s and aches");
						else output(" and ache");
						output(" with the need to release ");
						if(pc.balls <= 1) output("itself...");
						else output("themselves...");
					}
					output("\n\nA minute after inhaling, you’re feeling very pleasant but also pretty horny. On top of that, your vision is a little blurred... perhaps a nap will fix it? You discard the glass bottle and carry on with what you wanted to.");
					target.createStatusEffect("Woozy",0,0,0,0,false,"Icon_DizzyDrunk","You’re especially horny, sleepy, and above all woozy!\n\nLust maxxed!\n+10 Intelligence\n-10 Aim\n-10 Reflexes",false,60*4,0xB793C4);
					pc.intelligenceMod += 10;
					pc.aimMod += -10;
					pc.reflexesMod += -10;
					pc.lustMod += 9000;
				}
				//Bad End
				else
				{
					output("Damn, this Wiff-O-Wisp must be awful nice cuz you’re ready to use another. Sweet dreams are made of Wiff!");
					if(kGAMECLASS.silly) output(" Who are you to disagree, you greedy hippy?");
					output("\n\nYou repeat the inhaling ritual again, making sure to bring it even closer to your nostril for that pure, raw vapour. Oxygen is only a contaminant.");
					output("\n\nThe same heat from the first dose is rocking your [pc.face] even more than before. Oh boy, you can’t even feel your fingers! Or your knees! You’re not even sure if you had knees! You’re on the floor!");
					output("\n\nAs you desperately snort and sniff at the last few vapours left, desperately trying to understand why they’re not fixing your sudden case of decaying nervous system, you try dumping the rest of the fluid right into your nose!");
					output("\n\nWell that’s no good, you’re now a mindless gibbering wreck who didn’t read the label! You spend the rest of your years not being cognizant of the world around you in a nice little white room with a window and fresh flowers every day.");
					kGAMECLASS.badEnd("GAME OVER");
				}
			}
			else
			{
				kGAMECLASS.output(target.short + " consumes the pill to no effect.");
			}	
			return false;
		}
	}
}

