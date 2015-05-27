package classes.Items.Melee 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GooeyPsuedopod extends ItemSlotClass
	{
		
		public function GooeyPsuedopod() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "psuedopod";
			
			//Regular name
			this.longName = "gooey psuedopod";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a gooey psuedopod";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Wacky Waving Gooey Armflailing Tubeman";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "slap";
			
			//Information
			this.basePrice = 150;
			this.attack = 0;
			
			baseDamage.kinetic.damageValue = 4;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			
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