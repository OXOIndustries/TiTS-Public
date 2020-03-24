package classes.Engine.ShipCombat 
{
	import classes.Ships.Actions.ShipAction;
	import classes.Ships.SpaceShip;
	import classes.Ships.StatusEffectPayload;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipCombatOrderContainer 
	{
		//{ region Action Settings
		public var SelectedAction:ShipAction;
		public var SelectedTarget:SpaceShip;
		
		public var WeaponTargetOverride:Array;
		//}
	
		//{ region Range Settings
		public static const RANGE_POINTBLANK:uint = 0;
		public static const RANGE_CLOSE:uint = 1;
		public static const RANGE_MID:uint = 2;
		public static const RANGE_FAR:uint = 3;
		public static const RANGE_EVADE:uint = 4;
		
		public static const RANGE_NAMES:Array = [
			"point-blank range",
			"close range",
			"mid-range",
			"long range",
			"{{PLACEHOLDER}} Evasion, this should never be displayed!"
		];
		
		public static const RANGE_BUTTON_NAMES:Array = [
			"Point-blank",
			"Close",
			"Mid",
			"Long"
		];
		
		public var DesiredRange:uint = 0;
		//}
		
		//{ region Overcharge Settings
		public static const OVERCHARGE_NONE:uint 		= 0;
		public static const OVERCHARGE_GUNNERY:uint 	= 1;
		public static const OVERCHARGE_AUTOLOADERS:uint = 1 << 1;
		public static const OVERCHARGE_CONDUITS:uint 	= 1 << 2;
		public static const OVERCHARGE_POWERCORE:uint 	= 1 << 3;
		public static const OVERCHARGE_ENGINES:uint 	= 1 << 4;
		public static const OVERCHARGE_THRUSTERS:uint 	= 1 << 5;
		public static const OVERCHARGE_SHIELDING:uint 	= 1 << 6;
		
		public var DesiredOverchargeStation:uint = OVERCHARGE_NONE;
		
		private static function RegisterOverchargeToShip(tarShip:SpaceShip, ovrMask:uint):void
		{
			var ovrEffect:StatusEffectPayload = tarShip.GetStatusEffect("Overcharge States");
			if (ovrEffect == null)
			{
				tarShip.AddStatusEffect(new StatusEffectPayload(
					"Overcharge States", 
					{ overchargeStates: ovrMask }, 
					-1,
					StatusEffectPayload.DURATION_PERM,
					null,
					true,
					true));
			}
			else
			{
				ovrEffect.Payload.overchargeStates |= ovrMask;
			}
		}
		
		{
			// Keep these in the same order as the detail entries- lookups for exec
			OVERCHARGE_STATION_MASKS = [
				OVERCHARGE_GUNNERY,
				OVERCHARGE_AUTOLOADERS,
				OVERCHARGE_CONDUITS,
				OVERCHARGE_POWERCORE,
				OVERCHARGE_ENGINES,
				OVERCHARGE_THRUSTERS,
				OVERCHARGE_SHIELDING
			];
			
			OVERCHARGE_STATION_DETAILS = [
				new OverchargeStationDetails(
					"Gunnery Station", 
					"Gunnery", 
					OVERCHARGE_GUNNERY, 
					"Overcharge to double weapon accuracy.", 
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						tarShip.AddBonusWeaponEffect(0, 0, 0, 0.4, 0, 0, 0, 0.4);
						RegisterOverchargeToShip(tarShip, OVERCHARGE_GUNNERY);
					}),
				new OverchargeStationDetails(
					"Autoloaders",
					"Autoloaders",
					OVERCHARGE_AUTOLOADERS,
					"Overcharge to increase kinetic weapon damage by 40%.",
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						tarShip.AddBonusWeaponEffect(0, 0.4, 0, 0, 0, 0, 0, 0);
						RegisterOverchargeToShip(tarShip, OVERCHARGE_AUTOLOADERS);
					}),
				new OverchargeStationDetails(
					"Energy Conduits",
					"E. Conduits",
					OVERCHARGE_CONDUITS,
					"Overcharge to increase energy weapon damage by 40%.",
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						tarShip.AddBonusWeaponEffect(0, 0, 0, 0, 0, 0.4, 0, 0);
						RegisterOverchargeToShip(tarShip, OVERCHARGE_CONDUITS);
					}),
				new OverchargeStationDetails(
					"Power Core",
					"P. Core", 
					OVERCHARGE_POWERCORE,
					"Overcharge to increase capacitor power recharge rate by 100%.",
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						tarShip.AddBonusCapacitorEffect(0, 0, 0, 1.0, 0);
						RegisterOverchargeToShip(tarShip, OVERCHARGE_POWERCORE);
					}),
				new OverchargeStationDetails(
					"Engines",
					"Engines",
					OVERCHARGE_ENGINES,
					"Overcharge to increase maximum engine speed by 100%.",
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						tarShip.AddBonusManeuveringEffect(0, 1.0, 0, 0);
						RegisterOverchargeToShip(tarShip, OVERCHARGE_ENGINES);
					}),
				new OverchargeStationDetails(
					"Thrusters",
					"Thrusters",
					OVERCHARGE_THRUSTERS,
					"Overcharge to increase agility by 40%.",
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						tarShip.AddBonusManeuveringEffect(0, 0, 0, 0.4);
						RegisterOverchargeToShip(tarShip, OVERCHARGE_THRUSTERS);
					}),
				new OverchargeStationDetails(
					"Shielding",
					"Shielding",
					OVERCHARGE_SHIELDING,
					"Overcharge to immediately restore 50% shield power. If shield power is already at maximum, provides a 50% damage reduction.",
					"<b>\\\[<span class='bad'>Overheating</span>\\\]</b>",
					"<b>\\\[<span class='good'>SELECTED</span>\\\]</b>",
					function(tarShip:SpaceShip):void {
						if (tarShip.ShieldPercent >= 1)
						{
							tarShip.AddBonusShieldResistances(0, 0, 0, 0, 50.0);
						}
						else
						{
							tarShip.Shields += (tarShip.ShieldsMax * 0.5);
							if (tarShip.Shields > tarShip.ShieldsMax) tarShip.Shields = tarShip.ShieldsMax;
						}
						RegisterOverchargeToShip(tarShip, OVERCHARGE_SHIELDING);
					})
			];
		}
		
		public static var OVERCHARGE_STATION_MASKS:Array;
		public static var OVERCHARGE_STATION_DETAILS:Array;
		
		//}
	}

}