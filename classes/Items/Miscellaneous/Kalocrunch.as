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
	
	public class Kalocrunch extends ItemSlotClass
	{
		
		//constructor
		public function Kalocrunch()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "K.Crunch";
			
			//Regular name
			this.longName = "silver-wrapped Kalocrunch";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a silver-wrapped Kalocrunch";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This Camarilla-brand high-calorie snack food might be delicious, but is probably terrible for you. The silver packet displays a picture of a happy kui-tan stuffing her cheeks with tiny shapes. The “crunch” comes from the fact that it’s a blend of salt, solidified fat, and crystallized sugar. <b>Now in Teriyaki!</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 60;
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
			var healing:int = 30;
			if(target.energy() + healing > target.energyMax())
			{
				healing = target.energyMax() - target.energy();
			}
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				kGAMECLASS.output("You crunch down on a mouthful of geometrically-shaped Kalocrunch, moderately surprised at the burst of flavor across your tongue. You wouldn’t say it’s delicious - it’s salty and sweet and crunchy at the same time. But despite that, you keep eating until you’ve finished the bag. You’re not particularly proud of yourself, and that probably wasn’t good for you, but you are immensely satisfied.");
				if(healing > 0) kGAMECLASS.output("\n\nYou even feel like you could go longer before needing to sleep. Is there caffeine in this stuff?");
				//[+2 thickness, -2 tone +30 Energy.]");
				kGAMECLASS.output(target.modTone(-2, true));
				kGAMECLASS.output(target.modThickness(2,true));
				target.changeEnergy(healing);
			}
			else
			{
				if(inCombat()) kGAMECLASS.output("\n\n");
				else kGAMECLASS.clearOutput();
				kGAMECLASS.output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " opens the Kalocrunch and downs it.");
				if(healing > 0) kGAMECLASS.output(", getting a quick energy boost.");
				else kGAMECLASS.output(" to no effect.");
				target.changeEnergy(healing);
			}
			return false;
		}
	}
}
