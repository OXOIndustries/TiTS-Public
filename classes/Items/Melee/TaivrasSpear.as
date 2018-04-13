package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TaivrasSpear extends ItemSlotClass
	{	
		//Level 8 (Very Rare). Balance 2.0
		public function TaivrasSpear() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "T.Spear";
			this.longName = "queen nyrean spear";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a two-handed combat spear that once belonged to a nyrean Queen";
			
			this.tooltip = "A two-handed spear once carried by Queen Taivra herself.\n\nThe length of the shaft is wrapped in tight bindings- the same material the Nyrean hunting nets are made of- from tip to tail, obscuring the underlying structure, but making for superior grip. The business end is tipped with a marvelous blade of unfamiliar metal, the edges razor sharp.";
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 19000;
			this.attack = 5;
			this.critBonus = 9;
			this.evasion = 6;
			baseDamage.kinetic.damageValue = 20.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}