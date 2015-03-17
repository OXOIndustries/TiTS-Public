package classes.Engine.Combat.DamageTypes 
{
	import classes.DataManager.Serialization.ISaveable;
	/**
	 * ...
	 * @author Gedan
	 */
	public class DamageType implements ISaveable
	{	
		/* Type Definitions */		
		public static const KINETIC:uint = 0;
		public static const ELECTRIC:uint = 1;
		public static const BURNING:uint = 2;
		public static const FREEZING:uint = 3;
		public static const CORROSIVE:uint = 4;
		public static const POISON:uint = 5;
		public static const UNRESISTABLE_HP:uint = 6;
		public static const PSIONIC:uint = 7;
		public static const DRUG:uint = 8;
		public static const PHEROMONE:uint = 9;
		public static const TEASE:uint = 10;
		public static const UNRESISTABLE_LUST:uint = 11
		public static const NUMTYPES:uint = 12;
		
		/* Type 'categories' */
		public static const HPDamageTypes:Array = [
			KINETIC, 
			ELECTRIC, 
			BURNING, 
			FREEZING, 
			CORROSIVE, 
			POISON, 
			UNRESISTABLE_HP
		];
		
		public static const LustDamageTypes:Array = [
			PSIONIC, 
			DRUG, 
			PHEROMONE, 
			TEASE,
			UNRESISTABLE_LUST
		];
		
		/* Type display names */
		public static const TypeShortNames:Array = [
			"kntc",
			"elc",
			"brn",
			"cld",
			"crr",
			"psn",
			"trdam",
			"psi",
			"drg",
			"prmn",
			"tse",
			"trlst"
		];
		
		public static const TypeLongNames:Array = [
			"kinetic",
			"electric",
			"burning",
			"freezing",
			"corrosive",
			"poison",
			"true damage",
			"psionic",
			"drug",
			"pheromone",
			"tease",
			"true lust"
		];
		
		public var damageType:uint;
		public var damageValue:Number;
		
		public function get shortName():String { return TypeShortNames[damageType]; }
		public function get longName():String { return TypeLongNames[damageType]; }
		public function get isHPDamage():Boolean 
		{
			if (HPDamageTypes.indexOf(damageType) != -1) return true;
			return false;
		}
		public function get isLustDamage():Boolean
		{
			if (LustDamageTypes.indexOf(damageType) != -1) return true;
			return false;
		}
		
		public function DamageType(type:uint, value:Number) 
		{
			damageType = type;
			damageValue = value;
		}
		
	}

}