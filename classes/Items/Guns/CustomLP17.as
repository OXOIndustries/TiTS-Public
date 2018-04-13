package classes.Items.Guns 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CustomLP17 extends ItemSlotClass
	{
		//Level 2 (Rare). Balance 2.0
		public function CustomLP17() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Custom LP-17";
			
			//Regular name
			this.longName = "custom LP-17 laser pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Kiro’s customized LP-17 laser pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This customized Reaper Armaments LP-17 is a sleek, trimmed down version of the civilian-bought model. This particular version is stacked with an extended magazine, heat sink and a top-mounted holographic sight keyed to a half-trigger pull: in effect, making the weapon highly accurate and rapid-firing. A perfect solution for boarding parties and close quarters entanglements, packing the power and accuracy of a carbine while leaving one hand free to wield a melee weapon.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			//Information
			this.basePrice = 1; // Intentionally giving the items from Kiro a shit value so that they won't outweigh the 1k credit reward from /not/ taking any items.
			this.attack = 2;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 8;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
	}

}
