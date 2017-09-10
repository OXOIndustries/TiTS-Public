package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class CavalrySaber extends ItemSlotClass
	{
		//constructor
		//Level 6 (Common). Balance 2.0
		public function CavalrySaber()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "C.Saber";
			
			//Regular name
			this.longName = "cavalry saber";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cavalry saber";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Lengthy and slender, with an auspicious arch designed to not get caught in your target. However, it’s just a hunk of sharpened metal these days and not very effective when you aren’t on some expedient mount. The hilt and pommel are both very ornamental, though, and the image of this mounted on someone’s mantle is an alluring one. At least you could rattle it when you’re raring for a scrap.";
			//Shitty sword that isn’t much better than basic knifes and other starting junk. It’s a gimmick weapon. Slashing, obviously!
			this.attackVerb = "slash";
			attackNoun = "slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3200;
			
			baseDamage.kinetic.damageValue = 13;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 2;
			this.critBonus = 6;
			this.evasion = 1;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}