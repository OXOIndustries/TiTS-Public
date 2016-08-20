package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmmysVampBlade extends ItemSlotClass
	{
		//constructor
		public function EmmysVampBlade()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E's Blade";
			
			//Regular name
			this.longName = "tweaked Vamp Blade";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Emmy’s Vamp Blade";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This Kiha-brand melee weapon resembles an old-time arming sword, though the blade is made of ultra-tough modern materials, and covered in a series of small ports and recessed power amps. With a flip of a button, the blade coats itself in crackling electricity. When the blade strikes a shielded opponent, not only does it do damage, but it leeches power from the target’s shield belt and creates a secondary kinetic barrier around the user.\n\nEmmy upgraded its ability to drain shields from a foe at a slight expense to its base damage. It should be an exceptional weapon against shielded foes.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "strike";
			attackNoun = "crackling slice";
			
			//Information
			this.basePrice = 15499;
			this.attack = 6;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 5;
			baseDamage.electric.damageValue = 10;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.GREATER_DRAINING);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
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
