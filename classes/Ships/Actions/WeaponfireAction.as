package classes.Ships.Actions 
{
	import classes.Ships.Actions.ShipAction;
	import classes.Engine.ShipCombat.ShipDamageResult;
	import classes.Ships.Modules.UpgradeModules.WeaponModule;
	import classes.Ships.SpaceShip;
	import classes.Engine.Interfaces.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class WeaponfireAction extends ShipAction
	{
		
		public function WeaponfireAction() 
		{
			UniqueName = "Fire";
			ButtonName = "Fire";
			TooltipTitle = "Fire";
			TooltipBody = "Fire";
			RequiresTarget = false;
		}
		
		override public function IsAvailable(usingShip:SpaceShip):Boolean
		{
			return true;
		}
		
		override public function Implementor(user:SpaceShip, target:SpaceShip, playerGroup:Array, hostileGroup:Array):void
		{
			// We're gonna set this up for the potential per-weapon target information discussed
			// in the design.
			
			/*
			 * So the rough idea is every weapon system can provide its own internal implementation with a basic one
			 * in the base weapon module system.
			 * 
			 * This implementor is just a wrapper to bundle all of the "basic" weapon shots together into one big lump.
			 * 
			 * For each weapon system, call child implementation.
			 * Each child implementation deals with miss chance, damage buffs and defense reductions:
			 * pkg-funcs, user.DealDamage, target.TakeDamage
			 */
			
			var weapons:Array = user.GetWeaponModules();
			var sumDamage:ShipDamageResult = new ShipDamageResult();
			
			for (var i:int = 0; i < weapons.length; i++)
			{
				var weapon:WeaponModule = weapons[i] as WeaponModule;
				
				if (weapon.Disabled == true || weapon.CanFire == false) continue;				
				
				var sdr:ShipDamageResult;
				if (weapon.TargetOverride == null) sdr = weapon.Attack(target, playerGroup, hostileGroup, true);
				else sdr = weapon.Attack(weapon.TargetOverride, playerGroup, hostileGroup, true);
				
				if (sdr != null) sumDamage.addResult(sdr);
			}
			
			output("\n\n" + user.Name + " fired a bunch and did " + sumDamage.totalDamage + " in " + sumDamage.totalAttacks + " shots.");
		}
	}

}