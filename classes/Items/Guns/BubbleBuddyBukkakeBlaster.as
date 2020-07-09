package classes.Items.Guns
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.Creature;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Characters.PlayerCharacter;
	import classes.kGAMECLASS;
	import classes.Items.Toys.Bubbles.*;
	import classes.Engine.Utility.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.StringUtil;
	
	public class BubbleBuddyBukkakeBlaster extends ItemSlotClass
	{
		//BBBB variables
		public var maxAmmo:int = 20
		public var currentAmmo:int = 0
		
		public var itemInstance:ItemSlotClass;
		
		//constructor
		public function BubbleBuddyBukkakeBlaster()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "B.B.B.B.";
			
			//Regular name
			this.longName = "Bubble Buddy Bukkake Blaster"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cum-thrower";
			 
			//Displayed on tooltips during mouseovers
			this.tooltip = "[altTooltip BubbleBuddyBukkakeBlaster]";
			
			this.attackVerb = "spray";
			attackNoun = "stream of cum";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 25000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.tease.damageValue = 6;
			baseDamage.addFlag(DamageFlag.NO_CRIT);
			addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			addFlag(GLOBAL.ITEM_FLAG_REQUIRES_AMMO);
			addFlag(GLOBAL.ITEM_FLAG_LUST_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);
			
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
