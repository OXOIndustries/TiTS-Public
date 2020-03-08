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
	
	public class SmallEgg extends ItemSlotClass
	{
		
		//constructor
		public function SmallEgg()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 12;
			this.type = GLOBAL.FOOD;
			//Used on inventory buttons
			this.shortName = "SmallEgg";
			//Regular name
			this.longName = "small, brightly-colored egg";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a small, brightly-colored egg";
			//Displayed on tooltips during mouseovers
			this.tooltip = "As a result of genetic engineering and biological experimentation, these eggs can be produced by almost any species. Sweet and nourishing, they’re quite good for when you’re feeling down.\n\n(Small HP recovery.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 20;
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
			var healing:int = 10;
			if(target.HP() + healing > target.HPMax())
			{
				healing = target.HPMax() - target.HP();
			}
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				if(!inCombat())
				{
					kGAMECLASS.showBust("");
					if (kGAMECLASS.silly) kGAMECLASS.showName("\nYUM!");
					else kGAMECLASS.showName("SNACK\nBREAK");
				}
				//Usage text:
				kGAMECLASS.output("You chomp down on the delicious, almost sugary egg.");
				if(healing > 0) kGAMECLASS.output(" You feel better almost immediately!");
				else kGAMECLASS.output(" Nothing changes except for the taste in your mouth.");
				target.changeHP(healing);
			}
			//Not player!
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " eats a brightly-colored egg");
				if(healing > 0) kGAMECLASS.output(" and instantly regains a little health!");
				else kGAMECLASS.output(" to no effect.");
				target.changeHP(healing);
			}
			return false;
		}
	}
}

