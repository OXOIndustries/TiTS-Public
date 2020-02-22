package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Interfaces.*;
	
	public class RoastedZhorBeast extends ItemSlotClass
	{
		
		//constructor
		public function RoastedZhorBeast()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "Roast Z.B";
			
			//Regular name
			this.longName = "roasted zhor beast";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a spear of roasted zhor beast meat";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A spear of roasted meat, bought steaming off of Lorre’s cookfire and covered in native Uvetan spices. Sure to ward off the cold and fill your belly.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 100;
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
			var heatEffect:StorageClass = target.getStatusEffect("Hot Meal");
			if (heatEffect == null)
			{
				target.createStatusEffect("Hot Meal", 0, 0, 0, 0, false, "Icon_Cooking", ((target is PlayerCharacter) ? "A hearty meal sat heavily in your belly helps to warm you through." : "A hearty meal that warms the body."), false, 240, 0xFFFFFF);
			}
			else
			{
				heatEffect.minutesLeft = 240;
			}
				
			if (target is PlayerCharacter)
			{
				clearOutput();
				output("You tear into the roast meat kebab, warmth oozing from your mouth with every bite. Juicy and tender, every mouthful is a delicious slice of heaven that sits warmly in your [pc.belly]. Yum!");
				target.changeHP(target.HPMax() * 0.1);
				target.changeEnergy(20);
			}
			else
			{
				return true;
			}
			return false;
		}
	}
}
