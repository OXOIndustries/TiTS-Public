package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class RocketHammer extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function RocketHammer()
		{
			this._latestVersion = 1;
			
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "R.Hammer";
			
			//Regular name
			this.longName = "rocket hammer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a rocket-powered hammer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Less a hammer and more the dangerous fusion of a high speed rocket and a metallic brick, complete with a pole for vague direction, this chemical-boosted sledge is perfect for beating down your enemies. When the rocket actually activates it has quite the devastating kick, too! When you have a jet powered hammer, everything <b>acts</b> like a nail!";
			this.attackVerb = "slam";
			attackNoun = "slam";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1850;
					
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 14;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			
			this.attack = -3;
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