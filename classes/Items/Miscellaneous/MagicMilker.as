package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MagicMilker extends ItemSlotClass
	{
		//constructor
		public function MagicMilker()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "MagicMilker";
			
			//Regular name
			this.longName = "JoyCo Magic-Milker 7";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "the JoyCo Magic-Milker 7";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "<i>\"For expectant mammalian mothers or personal use. Please consult an expert in your species' physiology before inducing lactation.\"</i>\n\nThe JoyCo Magic Milker 7 looks like little more than an apple-sized sphere with an activation stud and two tiny, clear cups hanging off of metallic tubes. It seems that in order to use it, one simply needs to hold it near exposed nipples and press the button. The machine will do the rest, even reshaping the cups to accommodate multiple nipples or revealing more in the case of particularly boobilicious users.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2450;
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
			if(!kGAMECLASS.debug) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.joyCoMagicMilker7Sucks();
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the Magic-Milker 7.");
			}
			return true;
		}
	}
}
