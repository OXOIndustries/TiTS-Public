package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MyrNectar extends ItemSlotClass
	{
		
		//constructor
		public function MyrNectar()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "MyrNectr";
			
			//Regular name
			this.longName = "thermos of gold myr nectar";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a thermos of gold myr nectar";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This thermos-like container is filled to the brim with the sweet nectar milked from the breasts of a gold myr female. The sweet smell reaches out even through the plastic. A cursory examination says that the nectar shouldn’t be mutagenic.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 50;
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
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			var healing:int = 55;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.output("You flip up the top of the thermos and bring the container up to your mouth. The substance inside is almost painfully sweet, burning your nose until your [pc.lips] wrap around the tip and you start sucking the contents down.");
				target.energy(healing);
				kGAMECLASS.output(" When you’ve finished the thermos off, you suck in a sharp breath as the sweet nectar drools down your throat like syrup. You feel thoroughly refreshed, energized by the delicious alien nectar.");
				kGAMECLASS.output(" (<b>+" + healing + "</b>)\n");
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " drinks the honey, getting a quick energy boost.");
				target.energy(healing);
				kGAMECLASS.output(" (<b>+" + healing + "</b>)\n");
			}
			return false;
		}
	}
}
