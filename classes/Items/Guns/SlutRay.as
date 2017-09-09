package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	public class SlutRay extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function SlutRay()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "SlutRay";
			
			//Regular name
			this.longName = "slut ray";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a compact ‘slut ray’ gun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This tiny, unassuming handgun-like device is designed to be hidden. When fired at a subject, it causes their mind to be flooded with graphic sexual fantasies, though they still retain free will. The fantasies can be custom selected by the user or set to random. Nobody knows how it works; the gun’s contents are hidden behind a tamper-proof black casing.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "sexual fantasy";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			baseDamage.tease.damageValue = 4;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
			
			attackImplementor = CombatAttacks.SlutRayAttackImpl;
		}
	}
}
