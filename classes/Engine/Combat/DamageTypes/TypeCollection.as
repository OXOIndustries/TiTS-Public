package classes.Engine.Combat.DamageTypes 
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TypeCollection extends UnversionedSaveable
	{
		private var typeCollection:Vector.<DamageType>;
		
		public function getType(type:uint):DamageType { return typeCollection[type]; }
		
		public function get kinetic():Number { return typeCollection[DamageType.KINETIC]; }
		public function get electric():Number { return typeCollection[DamageType.ELECTRIC]; }
		public function get burning():Number { return typeCollection[DamageType.BURNING]; }
		public function get freezing():Number { return typeCollection[DamageType.FREEZING]; }
		public function get corrosive():Number { return typeCollection[DamageType.CORROSIVE]; }
		public function get poison():Number { return typeCollection[DamageType.POISON]; }
		public function get unresistable():Number { return typeCollection[DamageType.UNRESISTABLE]; }
		
		public function get psionic():Number { return typeCollection[DamageType.PSIONIC]; }
		public function get drug():Number { return typeCollection[DamageType.DRUG]; }
		public function get pheromone():Number { return typeCollection[DamageType.PHEROMONE]; }
		public function get tease():Number { return typeCollection[DamageType.TEASE]; }
		
		
		public function TypeCollection(... settings) 
		{
			typeCollection = new Vector.<DamageType>();
			
			/* Init the collection */
			for (var i:uint = 0; i < DamageType.NUMTYPES; i++)
			{
				typeCollection.push(new DamageType(i, 0));
			}
			
			/* If a settings object was given to us, override defaults with it */
			if (settings.length > 0)
			{
				loadSettings(settings);
			}
		}
		
		private function loadSettings(settings:Array)
		{
			if (settings.length % 2 != 0) throw new Error("TypeCollection created with a mis-matched argument list: " + settings);
			
			var typeIndex:uint;
			var typeValue:Number;
			
			for (var i:uint = 0; i < settings.length; i += 2)
			{
				typeIndex = settings[i];
				typeValue = settings[i + 1];
				
				if (typeIndex < 0 || typeIndex >= DamageType.NUMTYPES) throw new Error("TypeCollection created with an invalid argument list: " + settings + " (" + typeIndex + ")");
				
				typeCollection[typeIndex].damageValue = typeValue;
			}
		}
		
		public function multiply(m:*):void
		{
			if (m is Number || m is int || m is uint)
			{
				for (var i:uint = 0; i < typeCollection.length; i++)
				{
					if (typeCollection[i].damageValue > 0) typeCollection[i].damageValue *= m;
				}
			}
			else if (m is TypeCollection)
			{
				var tc:TypeCollection = m as TypeCollection;
				for (i = 0; i < typeCollection.length; i++)
				{
					if (typeCollection[i].damageValue > 0) typeCollection[i].damageValue *= tc.getType(i).damageValue;
				}
			}
		}
		
		public function add(obj:TypeCollection):void
		{	
			for (var i:uint = 0; i < typeCollection.length; i++)
			{
				typeCollection[i].damageValue += (obj as TypeCollection).getType(i).damageValue;
			}
		}
		
		/* Treat this instance of a TypeCollection as Damage, and modify it by the values in the argument */
		public function applyResistances(resistances:TypeCollection):void
		{
			for (var i:uint = 0; i < typeCollection.length; i++)
			{
				typeCollection[i].damageValue *= ((100.0 - resistances.getType(i).damageValue) / 100.0);
			}
		}
		
		public function getTotal():Number
		{
			var total:Number = 0;
			for (var i:uint = 0; i < typeCollection.length; i++)
			{
				total += typeCollection[i].damageValue;
			}
			return total;
		}
	}

}