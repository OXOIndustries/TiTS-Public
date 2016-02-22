package classes.GameData 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.kGAMECLASS;
	
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
		
		public static const ATF_MELEE:uint = 1;
		public static const ATF_RANGED:uint = 2;
		public static const ATF_TEASE:uint = 3;
		public static const ATF_SQUIRT:uint = 4;
		public static const ATF_SPECIAL:uint = 5;
		public static const ATF_AOE:uint = 6;
		public static const ATF_WAIT:uint = 7;
		public static const ATF_STAND:uint = 8;
		public static const ATF_FANTASIZE:uint = 9;
		public static const ATF_FLEE:uint = 10;
		
		private var AttackTypeFlags:Object;
		public function SetAttackTypeFlags(... args):void
		{
			AttackTypeFlags = { };
			for each (var elem:uint in args)
			{
				switch (elem)
				{
					case ATF_MELEE: AttackTypeFlags["isMelee"] = true; break;
					case ATF_RANGED: AttackTypeFlags["isRanged"] = true; break;
					case ATF_TEASE: AttackTypeFlags["isTease"] = true; break;
					case ATF_SQUIRT: AttackTypeFlags["isSquirt"] = true; break;
					case ATF_SPECIAL: AttackTypeFlags["isSpecial"] = true; break;
					case ATF_AOE: AttackTypeFlags["isAOE"] = true; break;
					case ATF_WAIT: AttackTypeFlags["isWait"] = true; break;
					case ATF_STAND: AttackTypeFlags["isStand"] = true; break;
					case ATF_FANTASIZE: AttackTypeFlags["isFantasize"] = true; break;
					case ATF_FLEE: AttackTypeFlags["isFlee"] = true; break;
					default: trace("Unknown attack type flag value: " + elem); break;
					
				}
			}
		}
		public function GetAttackTypeFlags():Object
		{
			if (AttackTypeFlags == null) return { };
			
			var o:Object = { };
			for (var key:String in AttackTypeFlags)
			{
				if (AttackTypeFlags[key] == true)
				{
					o[key] = true;
				}
			}
			return o;
		}
		
		
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
					f = target.meleeWeapon.itemFlags.slice();
					f.concat(target.rangedWeapon.itemFlags.slice());
				}
				else if (IsMeleeBased && !IsRangedBased)
				{
					f = target.meleeWeapon.itemFlags.slice();
				}
				else if (IsRangedBased && !IsMeleeBased)
				{
					f = target.rangedWeapon.itemFlags.slice();
				}
				
				var gotItemFlag:Boolean = false;
				for (i = 0; i < f.length; i++)
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
					df = target.meleeWeapon.baseDamage.getFlagsArray().slice();
					df.concat(target.rangedWeapon.baseDamage.getFlagsArray().slice());
				}
				else if (IsMeleeBased && !IsRangedBased)
				{
					df = target.meleeWeapon.baseDamage.getFlagsArray().slice();
				}
				else if (IsRangedBased && !IsMeleeBased)
				{
					df = target.rangedWeapon.baseDamage.getFlagsArray().slice();
				}
				
				var gotDamageFlag:Boolean = false;
				for (i = 0; i < df.length; i++)
				{
					if (RequiresDamageFlags.indexOf(df[i]) != -1) gotDamageFlag = true;
				}
				
				if (!gotDamageFlag) return false;
			}
			
			if (ExtendedAvailabilityCheck != null && !ExtendedAvailabilityCheck(target)) return false;
			
			return true;
		}
		
		public function execute(fGroup:Array, hGroup:Array, attacker:Creature, target:Creature):void
		{
			kGAMECLASS.setAttacker(attacker);
			kGAMECLASS.setTarget(target);
				
			if (fGroup.indexOf(kGAMECLASS.pc) != -1) kGAMECLASS.setEnemy(target);
			else kGAMECLASS.setEnemy(attacker);
			
			this.Implementor(fGroup, hGroup, attacker, target);
			attacker.energy( -(attacker.CalculateEnergyCost(this)));
		}
	}
}