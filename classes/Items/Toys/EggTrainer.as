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
	
	public class EggTrainer extends ItemSlotClass
	{
		//constructor
		public function EggTrainer()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "EggTrnr";
			
			//Regular name
			this.longName = "TamaniCorp Egg Trainer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a TamaniCorp Egg Trainer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A bright pink box about a yard long, emblazoned with the TamaniCorp logo on either side. The Egg Trainer advertises itself as your one-stop-shop for your oviposition needs. The trainer, as its name suggests, induces artificial pregnancy via inserted eggs that swell to huge sizes, or helps to train your body to take gargantuan loads of alien eggs. Satisfaction guaranteed with every use!";
			
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
				kGAMECLASS.eggTrainerInstallation();
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the Egg Trainer.");
			}
			return true;
		}
	}
}
