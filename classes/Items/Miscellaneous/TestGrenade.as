package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestGrenade extends ItemSlotClass
	{
		public function TestGrenade()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.;
			
			this.shortName = "Test Grenade";
			
			this.longName = "test grenade consumable";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a test grenade consumable";
			
			this.tooltip = "This is an item designed to test combat-item utilization.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 100;
			this.attack = 0;
			this.damage = 15;
			this.damageType = GLOBAL.THERMAL;
			this.defense = 0;
			this.shieldDefense = 1;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(targetCreature:Creature):Boolean
		{
			clearOutput();
			output("Pulling the pin on a grenade without a target to throw the thing at would be pretty stupid now, wouldn't it?");
		}
		
		override public function combatUseFunction(targetCreature:Creature):Boolean
		{
			
		}
		
	}

}