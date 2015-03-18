package classes.Engine.Combat.DamageTypes 
{
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TypeCollection implements ISaveable
	{
		private var typeCollection:Vector.<DamageType>;
		private var flagCollection:Vector.<DamageFlag>;
		
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
		
		/**
		 * new TypeCollection({DamageType.KINETIC: 50, DamageType.THERMAL: 25}, 
		 * @param	values
		 * @param	flags
		 */
		public function TypeCollection(values:Object = null, ... flags) 
		{
			typeCollection = new Vector.<DamageType>();
			flagCollection = new Vector.<DamageFlag>();
			
			/* Init the collection */
			for (var i:uint = 0; i < DamageType.NUMTYPES; i++)
			{
				typeCollection.push(new DamageType(i, 0));
			}
			
			/* If a settings object was given to us, override defaults with it */
			if (values != null || flags.length > 0)
			{
				loadSettings(values, flags);
			}
		}
		
		private function loadSettings(values:Object, flags:Array)
		{
			if (values != null)
			{
				for (var key:* in values)
				{
					var idx:uint = key;
					var val:Number = values[key];
					
					getType(idx).damageValue = val;
				}
			}
			
			if (flags.length > 0)
			{
				flagCollection.push(new DamageFlag(flags[i]));
			}
		}
		
		public function addFlag(flag:uint):void
		{
			if (hasFlag(flag)) removeFlag(flag);
			addDamageFlag(new DamageFlag(flag));
		}
		
		public function addDamageFlag(df:DamageFlag):void
		{
			if (hasFlag(df.flag)) removeFlag(df.flag);
			flagCollection.push(df);
		}
		
		public function removeFlag(flag:uint):void
		{
			var idx:uint = flagIndex(flag);
			if (idx != -1)
			{
				flagCollection.splice(idx, 1);
			}
		}
		
		public function removeAllFlags():void
		{
			flagCollection.splice(0, flagCollection.length);
		}
		
		public function hasFlag(flag:uint):void
		{
			for (var i:uint = 0; i < flagCollection.length; i++)
			{
				if (flagCollection[i].flag == flag) return true;
			}
			return false;
		}
		
		private function flagIndex(flag:uint):void
		{
			for (var i:uint = 0; i < flagCollection.length; i++)
			{
				if (flagCollection[i].flag == flag) return i;
			}
			return -1;
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
		
		public function getSaveObject():Object
		{
			var d:Object = new Object();
			
			d.classInstance = getQualifiedClassName(this);
			
			d.values = [];
			for (var i:uint = 0; i < typeCollection.length; i++)
			{
				d.values.push(typeCollection[i].getSaveObject());
			}
			
			d.flags = [];
			for (i = 0; i < flagCollection.length; i++)
			{
				d.flags.push(flagCollection[i].getSaveObject());
			}
			
			return d;
		}
		
		public function loadSaveObject(o:Object):void
		{
			for (var i:uint = 0; i < o.values.length; i++)
			{
				var dt:DamageType = new DamageType();
				dt.loadSaveObject(o.values[o]);
				typeCollection[dt.damageType].damageValue = dt.damageValue;
			}
			
			for (i = 0; i < o.flags.length; i++)
			{
				var df:DamageFlag = new DamageFlag();
				flagCollection.push(df.loadSaveObject(o.flags[i]));
			}
		}
		
		public function makeCopy():*
		{
			var tc:TypeCollection = new TypeCollection();
			tc.loadSaveObject(this.getSaveObject());
			return tc;
		}
	}

}