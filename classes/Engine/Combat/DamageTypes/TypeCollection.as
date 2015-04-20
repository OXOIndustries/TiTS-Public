package classes.Engine.Combat.DamageTypes 
{
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getQualifiedClassName;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TypeCollection implements ISaveable
	{
		private function fprint(msg:String):void
		{
			if (kGAMECLASS.debug)
			{
				trace(msg);
			}
		}
		
		private var typeCollection:Vector.<DamageType>;
		private var flagCollection:Vector.<DamageFlag>;
		
		public function getType(type:uint):DamageType { return typeCollection[type]; }
		public function getFlags():Vector.<DamageFlag>
		{
			return flagCollection;
		}
		
		public function get kinetic():DamageType { return typeCollection[DamageType.KINETIC]; }
		public function get electric():DamageType { return typeCollection[DamageType.ELECTRIC]; }
		public function get burning():DamageType { return typeCollection[DamageType.BURNING]; }
		public function get freezing():DamageType { return typeCollection[DamageType.FREEZING]; }
		public function get corrosive():DamageType { return typeCollection[DamageType.CORROSIVE]; }
		public function get poison():DamageType { return typeCollection[DamageType.POISON]; }
		public function get unresistable_hp():DamageType { return typeCollection[DamageType.UNRESISTABLE_HP]; }
		
		public function get psionic():DamageType { return typeCollection[DamageType.PSIONIC]; }
		public function get drug():DamageType { return typeCollection[DamageType.DRUG]; }
		public function get pheromone():DamageType { return typeCollection[DamageType.PHEROMONE]; }
		public function get tease():DamageType { return typeCollection[DamageType.TEASE]; }
		public function get unresistable_lust():DamageType { return typeCollection[DamageType.UNRESISTABLE_LUST]; }
		
		/**
		 * new TypeCollection({kinetic: 50, burning: 25});
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
		
		private function loadSettings(values:Object, flags:Array):void
		{
			if (values != null)
			{
				for (var key:* in values)
				{
					if (DamageType.TypeIndexes[key] === undefined) throw new Error("Undefined damage type: " + key);
					
					var idx:uint = DamageType.TypeIndexes[key];
					var val:Number = values[key];
					
					getType(idx).damageValue = val;
				}
			}
			
			if (flags.length > 0)
			{
				for (var i:uint = 0; i < flags.length; i++)
				{
					flagCollection.push(new DamageFlag(flags[i]));
				}
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
			if (hasFlag(flag))
			{
				var idx:uint = flagIndex(flag);
				if (idx != -1)
				{
					flagCollection.splice(idx, 1);
				}
			}
		}
		
		public function removeAllFlags():void
		{
			flagCollection.splice(0, flagCollection.length);
		}
		
		public function hasFlag(flag:uint):Boolean
		{
			for (var i:uint = 0; i < flagCollection.length; i++)
			{
				if (flagCollection[i].flag == flag) return true;
			}
			return false;
		}
		
		public function canTrigger(flag:uint):Boolean
		{
			for (var i:uint = 0; i < flagCollection.length; i++)
			{
				if (flagCollection[i].hasTriggerFor(flag)) return true;
			}
			return false;
		}
		
		public function getTrigger(flag:uint):DamageFlag
		{
			for (var i:uint = 0; i < flagCollection.length; i++)
			{
				if (flagCollection[i].hasTriggerFor(flag)) return flagCollection[i];
			}
			return null;
		}
		
		private function flagIndex(flag:uint):uint
		{
			for (var i:uint = 0; i < flagCollection.length; i++)
			{
				if (flagCollection[i].flag == flag) return i;
			}
			throw new Error("Flag type " + flag + " was not present. Check it is available first!");
			return uint.MAX_VALUE;
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
		
		public function add(a:*):void
		{	
			if (a is TypeCollection)
			{
				var aTC:TypeCollection = a as TypeCollection;
				
				for (var i:uint = 0; i < typeCollection.length; i++)
				{
					typeCollection[i].damageValue += aTC.getType(i).damageValue;
				}
				
				if (aTC.getFlags().length > 0)
				{
					var aF:Vector.<DamageFlag> = aTC.getFlags();
					for (var f:uint = 0; f < aF.length; f++)
					{
						if (!hasFlag(aF[f].flag))
						{
							addDamageFlag(aF[f].makeCopy());
						}
					}
				}
			}
			else
			{
				var numTypes:uint = 0;
				for (i = 0; i < typeCollection.length; i++)
				{
					if (typeCollection[i].damageValue > 0) numTypes++;
				}

				// If we can split over existing types, do
				if (numTypes > 0)
				{
					a /= numTypes;
					
					for (i = 0; i < typeCollection.length; i++)
					{
						if (typeCollection[i].damageValue > 0) typeCollection[i].damageValue += a;
					}
				}
				// Otherwise we're just going to treat it as kinetic
				else
				{
					if (hasFlag(DamageFlag.BULLET) || hasFlag(DamageFlag.CRUSHING) || hasFlag(DamageFlag.PENETRATING))
					{
						kinetic.damageValue = a;
					}
					else if (hasFlag(DamageFlag.LASER))
					{
						//electric.damageValue = a * 0.33;
						//The above makes absolutely no sense at all.
						burning.damageValue = a;
					}
					else if (hasFlag(DamageFlag.ENERGY_WEAPON))
					{
						electric.damageValue = a;
					}
					else
					{
						// Fallback
						unresistable_hp.damageValue = a;
					}
				}
			}
		}
		
		/* Treat this instance of a TypeCollection as Damage, and modify it by the values in the argument */
		public function applyResistances(resistances:TypeCollection):void
		{
			if (resistances.hasFlag(DamageFlag.EASY))
			{
				this.multiply(0.5);
			}
			
			if (flagCollection.length > 0)
			{
				for (var i:uint = 0; i < flagCollection.length; i++)
				{
					if (resistances.canTrigger(flagCollection[i].flag))
					{
						trace("Triggering Flag!");
						
						var df:DamageFlag = resistances.getTrigger(flagCollection[i].flag);
						
						switch (df.getTriggerOp(flagCollection[i].flag))
						{
							case DamageFlag.OP_MUL:
								multiply(df.getTriggerValue(flagCollection[i].flag));
								break;
							
							case DamageFlag.OP_ADD:
								add(df.getTriggerValue(flagCollection[i].flag));
								break;
								
							default:
								break;
						}
					}
				}
			}	
			
			for (i = 0; i < typeCollection.length; i++)
			{
				if (typeCollection[i].damageValue > 0)
				{
					if (resistances.getType(i).resistanceValue > 0)
					{
						typeCollection[i].damageValue *= ((100.0 - resistances.getType(i).resistanceValue) / 100.0);
					}
					else
					{
						typeCollection[i].damageValue *= ((100.0 + Math.abs(resistances.getType(i).resistanceValue)) / 100.0);
					}
				}
			}
		}
		
		public function combineResistances(resistance:TypeCollection):void
		{
			// Simply add and cap to +100
			add(resistance);
			
			for (var i:uint = 0; i < typeCollection.length; i++)
			{
				if (typeCollection[i].resistanceValue > 100) typeCollection[i].resistanceValue = 100;
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
				dt.loadSaveObject(o.values[i]);
				typeCollection[dt.damageType].damageValue = dt.damageValue;
			}
			
			for (i = 0; i < o.flags.length; i++)
			{
				var df:DamageFlag = new DamageFlag();
				df.loadSaveObject(o.flags[i]);
				flagCollection.push(df);
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