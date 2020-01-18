package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class IceCappers extends ItemSlotClass
	{
		//Level 11 (Rare). Balance 2.0
		//constructor
		public function IceCappers()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "I.Cappers";
			
			//Regular name
			this.longName = "ice cappers"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "ice cappers";
			//Street Sweeper: Shotgun with explosive chlorine shells. Kinetic/Corrosive
			//Displayed on tooltips during mouseovers
			this.tooltip = "Inspired by the necessities of keeping the peace in their lavish hotels and clubs, the Utopian Skies zaibatsu developed a fairly unique take on the classic question of collateral damage. These paired pistols use internal super condensers to collect and freeze ambient moisture into icicle bullets. The guns’ internal propellant provides enough power to punch through flesh yet shatter harmlessly against valuable decor. Never worry about having to spackle up bullet holes again!";
			this.attackVerb = "shoot";
			attackNoun = "ice bullets";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 155000;
			this.attack = 30;
			
			baseDamage = new TypeCollection();
			baseDamage.freezing.damageValue = 26;
			baseDamage.kinetic.damageValue = 5;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			this.addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			this.addFlag(GLOBAL.ITEM_FLAG_PISTOL_WEAPON);
			
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 10;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
