package classes.Items.Melee 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	
	/**
	 * ...
	 * @author justadude
	 */
	 //Fen note: level 10 rare quality
	public class ShockGear extends ItemSlotClass 
	{
		
		public function ShockGear() 
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.MELEE_WEAPON;
			
			shortName = "C.S.Gear";
			longName = "custom shock gear";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a set of electrically-charged black gauntlets and greaves";
			
			tooltip = "An invention of Shizuya herself, this wicked looking weapon consists of a pair of jet-black gauntlets and greaves. It was designed with hand-to-hand combat in mind. The lining of the set is made of a lightweight, military grade fibre with a layer of non-conductive padding to keep the wearer from being electrocuted. The outer plating is made of a dense, conductive metal. It is especially dense at the back, allowing them to be used defensively. Small generators in each piece generate electricity as the wearer moves, to be discharged on impact.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "beat";
			attackNoun = "shocking punch";
			
			basePrice = 340;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 15;
			baseDamage.electric.damageValue = 10;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			critBonus = 6;
			evasion = 3;
			fortification = 10;
			
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_EFFECT_FLURRYBONUS);

			version = _latestVersion;
		}
		
	}

}