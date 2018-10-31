package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SpitterPistol extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function SpitterPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Spitter";
			
			//Regular name
			this.longName = "Ashei acid spitter";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an Ashei acid spitter";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Ashei acid spitter is a small living weapon, about the size of a pistol, capable of firing acid streams at short range. The spitter is a simple weapon, farmed in mass quantities from Ashei Hives, yet cheap and effective, although it does not offer much firepower. Of course it does consume extra small quantities of the user’s blood for fuel, but power comes at a cost, does it not?";
			this.attackVerb = "shoot";
			attackNoun = "acid";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 215;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.corrosive.damageValue = 8;
			//baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = -4;

			this.version = _latestVersion;
		}
	}
}
