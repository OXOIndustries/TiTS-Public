package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection; 
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Zavos
	 */
	
	public class TrickBracer extends ItemSlotClass
	{
		//Level 9 (common). Balance 2.0
		public function TrickBracer()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "T. Brace";
			
			//Regular name
			this.longName = "Trick Bracer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a trick bracer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A single, seemingly mundane fibromesh bracer, similar to those used by Asuril duelists. This device conceals twin secrets: a retractable bayonet and an array of deflector shell emitters. Together, these hidden defenses allow the wielder to deflect blade and bullet alike at a moment’s notice.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "stab";
			attackNoun = "stab";
			
			//Information
			this.basePrice = 40000;
			this.attack = 0; 
			this.defense = 0;
			this.shieldDefense = 3;
			this.shields = 20;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 5;
			this.fortification = 0;
			
			
			this.baseDamage = new TypeCollection();
			this.baseDamage.kinetic.damageValue = 10;
			this.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			
			this.version = _latestVersion;
		}
	}
}