package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class VampBlade extends ItemSlotClass
	{
		//constructor
		public function VampBlade()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "V.Blade";
			
			//Regular name
			this.longName = "Vamp Blade";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Vamp Blade";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This Kiha-brand melee weapon resembles an old-time arming sword, though the blade is made of ultra-tough modern materials, and covered in a series of small ports and recessed power amps. With a flip of a button, the blade coats itself in crackling electricity. When the blade strikes a shielded opponent, not only does it do damage, but it leeches power from the target’s shield belt and creates a secondary kinetic barrier around the user.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "strike";
			attackNoun = "crackling slice";
			
			//Information
			this.basePrice = 15499;
			this.attack = 6;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 7;
			baseDamage.electric.damageValue = 12;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.DRAINING);
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