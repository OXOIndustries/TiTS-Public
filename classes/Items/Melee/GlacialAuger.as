package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Fenbutt
	 */
	public class GlacialAuger extends ItemSlotClass
	{	
		//Level 11 (Rare) Balance 2.0
		//Industrial rock drill. Freezing/Kinetic. Penetrating.
		public function GlacialAuger() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.shortName = "G.Auger";
			this.longName = "glacial auger";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a glacial auger";
			
			this.tooltip = "The exceedingly hostile environment on Dhaal’s exposed poles make mining a perpetually dangerous proposition for normal equipment. The Glacial Auger is a tool originally developed for mining out the sun-baked magma fields of the light-facing hemisphere. The corkscrewing drill is liquid cooled by proprietary Paragon Inc. chemicals guaranteed to flash-freeze and drill through even boiling iron. One can only imagine its effects on unprotected skin.";
			this.attackVerb = "stab";
			attackNoun = "freezing drill";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 150000;
			this.attack = 0;
			this.critBonus = 10;
			this.evasion = 0;
			baseDamage.kinetic.damageValue = 11.0;
			baseDamage.freezing.damageValue = 25.0;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.version = _latestVersion;
		}	
	}
}