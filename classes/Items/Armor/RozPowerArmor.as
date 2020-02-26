package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Fennykins
	 */
	public class RozPowerArmor extends ItemSlotClass
	{
		//Level 10 (Very Rare). Balance 2.0
		public function RozPowerArmor() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "R.PwrArmr";
			
			this.longName = "ramshackle power armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a suit of ramshackle power armor";
			
			this.tooltip = "A suit of power armor put together by the hand of a cunning Galotian mercenary. Though it's built on a cheap labor frame, the suit's got quite a bit of armor and high-tech gadgetry bolted onto it, sealing the wearer in nigh-impervious armor plating and providing an advanced head's-up display for targeting. It's bulky and cumbersome, though, and sure isn't pretty by anyone's definition...";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 170000;
			this.attack = 5;
			this.defense = 20;
			this.shieldDefense = 0;
			this.sexiness = -5;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = -10;
			this.fortification = 50;
			
			this.resistances.kinetic.resistanceValue = 15;
			this.resistances.electric.resistanceValue = -5;
			/*this.resistances.burning.resistanceValue = 10;
			this.resistances.freezing.resistanceValue = 10;
			this.resistances.corrosive.resistanceValue = 10;
			this.resistances.poison.resistanceValue = 3;*/
			
			//this.resistances.addFlag(DamageFlag.MIRRORED);
			//this.resistances.addFlag(DamageFlag.GROUNDED);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			this.version = this._latestVersion;
		}
		
	}

}
