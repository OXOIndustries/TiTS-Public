package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SecureMP extends ItemSlotClass
	{
		//Level 6 (Rare). Balance 2.0
		//constructor
		public function SecureMP()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "SecureMP";
			
			//Regular name
			this.longName = "Secure MP";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Secure machine pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The SecureMP is a high-capacity machine pistol with an attached stock and optics, offering a great deal of firepower in a package that can be easily concealed in a jacket or briefcase. Because of this, it’s become a fast favorite among personal and corporate security forces.\n\n<b>Special Effect:</b> This weapons light-weight, easy-to-handle nature greatly increases your ability to hit multiple times with a single attack.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3400;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 19;
			baseDamage.addFlag(DamageFlag.BULLET);
			itemFlags = [GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS];
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 4;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
