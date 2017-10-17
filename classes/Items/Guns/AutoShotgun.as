package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class AutoShotgun extends ItemSlotClass
	{
		//Level 4 (Rare). Balance 2.0
		//constructor
		public function AutoShotgun()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "A.S.G.";
			
			//Regular name
			this.longName = "auto shotgun"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an auto shotgun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "One of the best civilian shotguns available in the market. The CF22 offers outstanding firepower combined with an impressive rate of fire and a large drum magazine. It’s high modularity and adaptability has made this shotgun a very popular piece of equipment, as it can be quickly converted from a roomsweeper to a shot-mid range assault weapon by simple exchanging barrels, muzzles and ammunition.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1300;
			this.attack = 10;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 20;
			baseDamage.addFlag(DamageFlag.BULLET);
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -3;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
