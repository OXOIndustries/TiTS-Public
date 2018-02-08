package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SaviciteLightMaul extends ItemSlotClass
	{
		//Level 7 (Common) Balance 2.0
		//constructor
		public function SaviciteLightMaul()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Sav.Maul";
			
			//Regular name
			this.longName = "light savicite maul";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a lightweight maul with a pure savicite head.";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A rustic, unassuming steel handle that ends in a blunt head made of glowing, green stone. It’s about the size of a watermelon, and is smoothed into a rough circle. It won’t deal that much damage, but the lust-inducing properties of Savicite mean it’ll take down your enemies in another way.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "smash";
			attackNoun = "shocking smash";
			
			//Information
			this.basePrice = 7000;
			
			baseDamage = new TypeCollection();
			baseDamage.psionic.damageValue = 5;
			baseDamage.kinetic.damageValue = 5;
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			baseDamage.addFlag(DamageFlag.CRUSHING);
			//addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			
			this.attack = -3;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
