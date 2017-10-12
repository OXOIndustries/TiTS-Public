package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Crucifer extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		//constructor
		public function Crucifer()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Crucifer";
			
			//Regular name
			this.longName = "Crucifer spitter"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Crucifer spitter";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Crucifer is an organism vagely resembling a gun. This little fella only needs a bit of your delicious internal fluids and it will happily fuction as a living, breathing acid-spitting gun.";
			this.attackVerb = "shoot";
			attackNoun = "acid";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 40000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.poison.damageValue = 30;
			//baseDamage.kinetic.damageValue = 16;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			//baseDamage.addFlag(DamageFlag.VAMPIRIC);
			//baseDamage.addFlag(DamageFlag.PENETRATING);

			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 10;
			this.evasion = 0;
			this.fortification = -10;

			this.version = _latestVersion;
		}
	}
}
