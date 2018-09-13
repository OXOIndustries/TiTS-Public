package classes.Items.Melee 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class DancingFlashblade extends ItemSlotClass 
	{
		
		public function DancingFlashblade() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "D.Flash";
			this.longName = "dancing flashblade";
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a flashblade";
			
			this.tooltip = "Marked as ‘CV-x808: Dancing Flashblade’ along the back of the hilt, this unique prototype puts a spin on popular hardlight weapons. The 2\' long blade is perfectly straight when triggered with";
			this.tooltip += " a glowing white shimmer covering its near-transparent edge. The ornate black-and-gold hilt appears to be custom fitted for someone else but still slides very comfortably into your hands all the same.";
			this.tooltip += " \n\nWhen wielding it, the weapon is ultra-light and easy to use but the low-substance blade is brittle and poor for parrying. It appears to be made of some nano-thin hardlight configuration and";
			this.tooltip += " when contact with an object is made, the blade discharges in brilliant white light only to shatter and reform in a split second.";

			this.attackVerb = "slash";
			attackNoun = "slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 154000;
			this.attack = 8;
			
			this.baseDamage = new TypeCollection();
			this.baseDamage.kinetic.damageValue = 18;
			this.baseDamage.electric.damageValue = 18;
			this.baseDamage.addFlag(DamageFlag.PENETRATING);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.critBonus = 10;
		}
		
	}

}