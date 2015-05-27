package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class BoltActionRifle extends ItemSlotClass
	{
		//constructor
		public function BoltActionRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "B.Rifle";
			
			//Regular name
			this.longName = "bolt-action rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bolt-action rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An ancient design by terran standards, this rifle actually packs a surprising wallop. Built by myr and designed to kill the tank-ish, resilient troopers, too, this weapon is a bit terrifying - to use. Using rounds designed for heavy steel guns to poke holes in tanks, it generates more recoil than two limbs can handle. You might be able to carry it around and crack off a few shots, but there's a good chance you won't hit anything.";
			//Possibly breaks whatever tradition we had going for rifles; high piercing damage, but incredibly shitty accuracy. A gimmick gun.
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2500;
			this.attack = -30;
			
			baseDamage.kinetic.damageValue = 20;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 3;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}