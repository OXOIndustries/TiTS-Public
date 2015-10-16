package classes.GameData 
{
	import classes.Creature;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SingleCombatAttack 
	{
		public var Implementor:Function = null; // Function that implements attack (dmg, txt)
		
		public var ButtonName:String = "UNSET"; // Text for the button element
		public var TooltipTitle:String = "UNSET";
		public var TooltipBody:String = "UNSET";
		
		public var EnergyCost:Number = 0; // Base energy cost of the attack
		public var RequiresTarget:Boolean = true; // Require a target to be selected
		
		public var RequiresClass:int = -1; // If not -1, limit to specific class
		public var RequiresPerk:String = null; // If not null, require perk
		public var RequiresLevel:int = -1; // If not -1, require minimum level
		public var RequiresItemFlags:Array = []; // Collection of flags on ItemSlotClass- presence of any flag = acceptable
		public var RequiresDamageFlags:Array = []; // Collection of flags on the items BaseDamage- presence of any flag = acceptable
		
		public var IsRangedBased:Boolean = false; // If set, use ranged combat calcs/lookups
		public var IsMeleeBased:Boolean = false; // Or melee
		
		public var DisabledIfEffectedBy:Array = []; // StatusEffects that, if present, will disable attack
		
		// Special function to inject unique checks, f.ex sillymode lookups
		public var ExtendedDisplayabilityCheck:Function = null; // Display anything
		public var ExtendedAvailabilityCheck:Function = null;
		
		// Functions should be of format:
		// function(target:Creature):Boolean {}
		
		// If true, *A* button should be displayed for this attack
		public function IsDisplayable(target:Creature):Boolean
		{
			if (RequiresPerk != null && !target.hasPerk(RequiresPerk)) return false;
			if (RequiresClass != -1 && target.characterClass != RequiresClass) return false;
			if (RequiresLevel != -1 && target.level < RequiresLevel) return false;
			if (ExtendedDisplayabilityCheck != null && !ExtendedDisplayabilityCheck(target)) return false;
			return true;
		}
		
		// If true, the displayed button should be enabled, otherwise disabled.
		public function IsAvailable(target:Creature):Boolean
		{
			if (EnergyCost != 0 && target.energy() < target.CalculateEnergyCost(this)) return false;
			if (DisabledIfEffectedBy.length > 0)
			{
				for (var i:int = 0; i < DisabledIfEffectedBy.length; i++)
				{
					if (target.hasStatusEffect(DisabledIfEffectedBy[i])) return false;
				}
			}
			
			if (RequiresItemFlags.length > 0)
			{
				var f:Array;
				
				if ((!IsMeleeBased && !IsRangedBased) || (IsMeleeBased && IsRangedBased))
				{
					f = target.meleeWeapon.itemFlags.slice(0, -1);
					f.concat(target.rangedWeapon.itemFlags.slice(0, -1));
				}
				else if (IsMeleeBased && !IsRangedBased)
				{
					f = target.meleeWeapon.itemFlags.slice(0, -1);
				}
				else if (IsRangedBased && !IsMeleeBased)
				{
					f = target.rangedWeapon.itemFlags.slice(0, -1);
				}
				
				var gotItemFlag:Boolean = false;
				for (var i:int = 0; i < f.length; i++)
				{
					if (RequiresItemFlags.indexOf(f[i]) != -1) gotItemFlag = true;
				}
				
				if (!gotItemFlag) return false;
			}
			
			if (RequiresDamageFlags.length > 0)
			{
				var df:Array;
				
				if ((!IsMeleeBased && !IsRangedBased) || (IsMeleeBased && IsRangedBased))
				{
					f = target.meleeWeapon.baseDamage.getFlags().slice(0, -1);
					f.concat(target.rangedWeapon.baseDamage.getFlags().slice(0, -1));
				}
				else if (IsMeleeBased && !IsRangedBased)
				{
					f = target.meleeWeapon.baseDamage.getFlags().slice(0, -1);
				}
				else if (IsRangedBased && !IsMeleeBased)
				{
					f = target.rangedWeapon.baseDamage.getFlags().slice(0, -1);
				}
				
				var gotDamageFlag:Boolean = false;
				for (var i:int = 0; i < df.length; df++)
				{
					if (RequiresDamageFlags.indexOf(df[i]) != -1) gotDamageFlag = true;
				}
				
				if (!gotDamageFlag) return false;
			}
			
			if (ExtendedAvailabilityCheck != null && !ExtendedAvailabilityCheck(target)) return false;
			
			return true;
		}
	}
}