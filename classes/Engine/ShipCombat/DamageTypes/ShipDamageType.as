package classes.Engine.ShipCombat.DamageTypes 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipDamageType 
	{
		public static const EM:uint = 0;
		public static const KIN:uint = 1;
		public static const EXP:uint = 2;
		public static const THRM:uint = 3;
		public static const UNRES:uint = 4;
		
		public static const NUMTYPES:uint = 5;
		public static const UNSET:uint = uint.MAX_VALUE;
		
		public static const TypeShortNames:Array = [
			"em",
			"kntc",
			"expl",
			"thrml",
			"unres"
		];
		
		public static const TypeLongNames:Array = [
			"Electromagnetic",
			"Kinetic",
			"Explosive",
			"Thermal"
			"Unresistable"
		];
		
		public static const TypeIndexes:Object = {
			em: ShipDamageType.EM, 
			kin: ShipDamageType.KIN,
			exp: ShipDamageType.EXP,
			thrm: ShipDamageType.THRM,
			unres: ShipDamageType.UNRES
		};
		
		private var _damageType:uint;
		private var _damageValue:Number;
		
		public function get DamageType():uint { return _damageType; }
		
		public function get DamageValue():Number { return _damageValue; }
		public function set DamageValue(v:Number):void { _damageValue = v; }
		
		public function get ShortName():String { return TypeShortNames[DamageType]; }
		public function get LongName():String { return TypeLongNames[DamageType]; }
		
		public function ShipDamageType(type:uint = UNSET, value:Number = 0) 
		{
			_damageType = type;
			_damageValue = value;
		}
		
	}

}