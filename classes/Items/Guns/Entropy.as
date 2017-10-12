package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Entropy extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		//constructor
		public function Entropy()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Entropy";
			
			//Regular name
			this.longName = "LM19 “Entropy” kinetic decelerator";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a freeze gun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The LM19 was originally created to produce rapid cooling necessary for the successful creation of several varieties of superhard alloys. In practice, it has found more use taming hostile, cold-blooded races. When you are capable of arresting the movement of atomic particles to instantly induce a state of hypothermia, bloodlessly putting down rebellion is a cakewalk.";
			this.attackVerb = "shoot";
			attackNoun = "cold beam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27000;
			this.attack = 6;
			
			baseDamage = new TypeCollection();
			baseDamage.freezing.damageValue = 27;
			//baseDamage.addFlag(DamageFlag.BULLET);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			//baseDamage.addFlag(DamageFlag.LASER);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
