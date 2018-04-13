package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class AvengerSMG extends ItemSlotClass
	{
		//Level 4 (Rare). Balance 2.0
		//constructor
		public function AvengerSMG()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "A.SMG";
			
			//Regular name
			this.longName = "Avenger SMG"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an Avenger SMG";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Avenger SMG is well known for featuring a high capacity magazine and rapid rate of fire on a compact and efficient package, albeit at the cost of range and quality materials.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 13;
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 3;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
