package classes.Ships.Actions 
{
	import classes.Ships.Modules.UpgradeModules.WeaponModule;
	import classes.Ships.SpaceShip;
	import classes.kGAMECLASS;
	/**
	 * Ship actions are things that can consume a turn. We can "select" one and actually execute it later.
	 * @author Gedan
	 */
	public class ShipAction 
	{
		public function Implementor(user:SpaceShip, target:SpaceShip, playerGroup:Array, hostileGroup:Array):void
		{
			throw new Error("Implementor has not been overridden");
		}
		
		public var UniqueName:String;
		public var ButtonName:String;
		public var TooltipTitle:String;
		protected var TooltipBody:String;
		
		public var CapacitorCost:Number = 0;
		public var RequiresTarget:Boolean = true;
		
		// These two will probably be refactored into something else, they're mostly placeholders for now.
		public var RequiresDamageFlags:Array = []; // Ship requires (a) weapon(s) with damage flags. ANY of the present flags.
		public var RequiresModules:Array = []; // Ship requires (a) fitted module(s) of these classes.
		
		public var RequiresMinimumRange:uint; // CurrentRange >= this
		public var RequiresMaximumRange:uint; // CurrentRange <= this
		
		public var DisabledIfEffectedBy:Array = [];
		
		public function IsAvailable(usingShip:SpaceShip):Boolean
		{
			if (CapacitorCost != 0 && usingShip.Capacitor < usingShip.CalculateCapacitorCostForAction(this)) return false;
			
			if (DisabledIfEffectedBy.length > 0)
			{
				for (var i:int = 0; i < DisabledIfEffectedBy.length; i++)
				{
					if (usingShip.GetStatusEffect(DisabledIfEffectedBy[i]) != null) return false;
				}
			}
			
			if (RequiresDamageFlags.length > 0)
			{
				var wepMods:Array = usingShip.GetWeaponModules();
				
				for (i = 0; i < wepMods.length; i++)
				{
					var wp:WeaponModule = wepMods[i] as WeaponModule;
					
					for (var ii:int = 0; ii < RequiresDamageFlags.length; i++)
					{
						if (wp.BaseDamage.HasFlag(RequiresDamageFlags[ii])) return true;
					}
				}
				
				return false;
			}
			
			if (RequiresModules.length > 0)
			{
				var mods:Array = usingShip.FittedModules;
				
				for (i = 0; i < mods.length; i++)
				{
					for (ii = 0; i < RequiresModules.length; ii++)
					{
						if (mods[i] is RequiresModules[ii]) return true;
					}
				}
				
				return false;
			}
			
			return true;
		}
		
		public function Execute(user:SpaceShip, target:SpaceShip, playerGroup:Array, hostileGroup:Array):void
		{
			kGAMECLASS.SetAttackerShip(user);
			kGAMECLASS.SetTargetShip(target);
			kGAMECLASS.SetEnemyShip(user == kGAMECLASS.shipDb.ActivePlayerShip ? target : user);
			
			Implementor(user, target, playerGroup, hostileGroup);
			user.Capacitor -= user.CalculateCapacitorCostForAction(this);
		}
		
		public function GenerateMenuTooltip(user:SpaceShip):String
		{
			var s:String = TooltipBody;
			
			if (IsAvailable(user) == false)
			{
				s += "\n\nThis action is currently unavailable.";
			}
			else
			{
				s += "\n\nEnergy Cost: " + user.CalculateCapacitorCostForAction(this);
			}
			
			return s;
		}
		
		public function ShipAction() 
		{
			
		}
		
	}

}