package classes.Engine.Combat.DamageTypes 
{
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getQualifiedClassName;
	
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
		public static const UNSET:uint = uint.MAX_VALUE;
		
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
			"Kinetic",
			"Electric",
			"Burning",
			"Freezing",
			"Corrosive",
			"Poison",
			"True Damage",
			"Psionic",
			"Drug",
			"Pheromone",
			"Tease",
			"True Lust"
		];
		
		public static const TypeIndexes:Object = {
			kinetic: DamageType.KINETIC,
			electric: DamageType.ELECTRIC,
			burning: DamageType.BURNING,
			freezing: DamageType.FREEZING,
			corrosive: DamageType.CORROSIVE,
			poison: DamageType.POISON,
			unresistablehp: DamageType.UNRESISTABLE_HP,
			truedamage: DamageType.UNRESISTABLE_HP,
			psionic: DamageType.PSIONIC,
			drug: DamageType.DRUG,
			pheromone: DamageType.PHEROMONE,
			tease: DamageType.TEASE,
			unresistablelust: DamageType.UNRESISTABLE_LUST,
			truelust: DamageType.UNRESISTABLE_LUST
		}
		
		private var _damageType:uint;
		private var _damageValue:Number;
		
		public function get damageType():uint { return _damageType; }
		
		public function get damageValue():Number 
		{
			return _damageValue; 
		}
		public function set damageValue(v:Number):void 
		{

			_damageValue = v; 
		}
		
		public function get resistanceValue():Number 
		{
			return _damageValue; 
		}
		public function set resistanceValue(v:Number):void 
		{ 
			_damageValue = v; 
		}
		
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
		
		public function DamageType(type:uint = UNSET, value:Number = 0) 
		{
			_damageType = type;
			_damageValue = value;
		}
		
		public function getSaveObject():Object
		{
			var d:Object = { };
			
			d.classInstance = getQualifiedClassName(this);
			
			d.type = _damageType;
			d.value = _damageValue;
			
			if (isNaN(d.value)) throw new Error("Attempted to produce a NaN DamageType instance.");
			
			return d;
		}
		
		public function loadSaveObject(o:Object):void
		{
			_damageType = o.type;
			if (isNaN(o.value))
			{
				o.value = 0;
				trace("Correcting a previously NaN Damage/Resistance type present in a save file...");
			}
			_damageValue = o.value;
		}
		
		public function makeCopy():*
		{
			var ndt:DamageType = new DamageType();
			ndt.loadSaveObject(this.getSaveObject);
			return ndt;
		}
	}

}