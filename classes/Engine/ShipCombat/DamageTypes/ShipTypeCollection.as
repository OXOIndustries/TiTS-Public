package classes.Engine.ShipCombat.DamageTypes 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipTypeCollection 
	{
		private var _typeCollection:Vector.<ShipDamageType>;
		private var _flagCollection:Vector.<ShipDamageFlag>;
		
		public function GetType(type:uint):ShipDamageType { return _typeCollection[type]; }
		public function GetFlags():Vector.<ShipDamageFlag> { return _flagCollection; }
		
		public function get em():ShipDamageType { return _typeCollection[ShipDamageType.EM]; }
		public function get kin():ShipDamageType { return _typeCollection[ShipDamageType.KIN]; }
		public function get exp():ShipDamageType { return _typeCollection[ShipDamageType.EXP]; }
		public function get therm():ShipDamageType { return _typeCollection[ShipDamageType.THRM]; }
		
		public function ShipTypeCollection(values:Object = null, ... flags) 
		{
			_typeCollection = new Vector.<ShipDamageType>();
			_flagCollection = new Vector.<ShipDamageFlag>();
			
			for (var i:uint = 0; i < ShipDamageType.NUMTYPES; i++)
			{
				_typeCollection.push(new ShipDamageType(i, 0));
			}
			
			if (values != null || flags.length > 0)
			{
				LoadSettings(values, flags);
			}
		}
		
		private function LoadSettings(values:Object, flags:Array):void
		{
			if (values != null)
			{
				for (var key:* in values)
				{
					if (ShipDamageType.TypeIndexes[key] === undefined) throw new Error("Undefined damage type lookup: " + key);
					
					var idx:uint = ShipDamageType.TypeIndexes[key];
					var val:Number = values[key];
					
					GetType(idx).DamageValue = val;
				}
			}
			
			if (flags.length > 0)
			{
				for (var i:uint = 0; i < flags.length; i++)
				{
					_flagCollection.push(new ShipDamageFlag(flags[i]));
				}
			}
		}
		
		public function AddFlag(flag:uint):void
		{
			if (HasFlag(flag)) RemoveFlag(flag);
			AddDamageFlag(new ShipDamageFlag(flag));
		}
		
		public function AddDamageFlag(df:ShipDamageFlag):void
		{
			if (HasFlag(df.Flag)) RemoveFlag(df.Flag);
			_flagCollection.push(df);
		}
		
		public function RemoveFlag(flag:uint):void
		{
			if (HasFlag(flag))
			{
				var idx:uint = FlagIndex(flag);
				if (idx != uint.MAX_VALUE)
				{
					_flagCollection.splice(idx, 1);
				}
			}
		}
		
		public function RemoveAllFlags():void
		{
			_flagCollection.splice(0, _flagCollection.length);
		}
		
		public function HasFlag(flag:uint):Boolean
		{
			for (var i:uint = 0; i < _flagCollection.length; i++)
			{
				if (_flagCollection[i].Flag == flag) return true;
			}
			return false;
		}
		
		public function GetFlagsArray():Array
		{
			var a:Array = [];
			for (var i:int = 0; i < _flagCollection.length; i++)
			{
				a.push(_flagCollection[i].Flag);
			}
			return a;
		}
		
		public function CanTrigger(flag:uint):Boolean
		{
			for (var i:uint = 0; i < _flagCollection.length; i++)
			{
				if (_flagCollection[i].HasTriggerFor(flag)) return true;
			}
			return false;
		}
		
		public function GetTrigger(flag:uint):ShipDamageFlag
		{
			for (var i:uint = 0; i < _flagCollection.length; i++)
			{
				if (_flagCollection[i].HasTriggerFor(flag)) return _flagCollection[i];
			}
			return null;
		}
		
		private function FlagIndex(flag:uint):uint
		{
			for (var i:uint = 0; i < _flagCollection.length; i++)
			{
				if (_flagCollection[i].Flag == flag) return i;
			}
			return uint.MAX_VALUE;
		}
		
		public function Multiply(m:*):void
		{
			if (m is Number || m is int || m is uint)
			{
				for (var i:uint = 0; i < _typeCollection.length; i++)
				{
					if (_typeCollection[i].DamageValue > 0) _typeCollection[i].DamageValue *= m;
				}
			}
			else if (m is ShipTypeCollection)
			{
				var tc:ShipTypeCollection = m as ShipTypeCollection;
				for (i = 0; i < _typeCollection.length; i++)
				{
					if (_typeCollection[i].DamageValue > 0) _typeCollection[i].DamageValue *= tc.GetType(i).DamageValue;
				}
			}
		}
		
		public function Add(a:*):void
		{
			if (a is ShipTypeCollection)
			{
				var aTC:ShipTypeCollection = a as ShipTypeCollection;
				
				for (var i:int = 0; i < _typeCollection.length; i++)
				{
					_typeCollection[i].DamageValue += aTC.GetType(i).DamageValue;
				}
				
				if (aTC.GetFlags().length > 0)
				{
					var aF:Vector.<ShipDamageFlag> = aTC.GetFlags();
					for (i = 0; i < aF.length; i++)
					{
						if (!HasFlag(aF[i].Flag))
						{
							AddDamageFlag(aF[i].MakeCopy());
						}
					}
				}
			}
			else
			{
				var numTypes:uint = 0;
				for (i = 0; i < _typeCollection.length; i++)
				{
					if (_typeCollection[i].DamageValue > 0) numTypes++;
				}
				
				if (numTypes > 0)
				{
					a /= numTypes;
					
					for ( i = 0; i < _typeCollection.length; i++)
					{
						if (_typeCollection[i].DamageValue > 0) _typeCollection[i].DamageValue += a;
					}
				}
				else
				{
					kin.DamageValue += a;
				}
			}
		}
		
		public function ApplyResistances(resistances:ShipTypeCollection):void
		{
			if (resistances.HasFlag(ShipDamageFlag.EASY))
			{
				Multiply(0.5);
			}
			
			if (_flagCollection.length > 0)
			{
				for (var i:uint = 0; i < _flagCollection.length; i++)
				{
					if (resistances.CanTrigger(_flagCollection[i].Flag))
					{
						var df:DamageFlagTrigger = resistances.GetTrigger(_flagCollection[i].Flag).GetTriggerValues(_flagCollection[i].Flag);
						
						switch(df.Operation)
						{
							case ShipDamageFlag.OP_MUL:
								Multiply(df.Value);
								break;
							case ShipDamageFlag.OP_ADD:
								Add(df.Value);
								break;
							default:
								break;
						}
					}
				}
			}
			
			for (i = 0; i < _typeCollection.length; i++)
			{
				if (_typeCollection[i].DamageValue > 0)
				{
					if (resistances.GetType(i).DamageValue > 0)
					{
						_typeCollection[i].DamageValue *= ((100.0 - resistances.GetType(i).DamageValue) / 100.0);
					}
					else
					{
						_typeCollection[i].DamageValue *= ((100.0 + Math.abs(resistances.GetType(i).DamageValue)) / 100.0);
					}
				}
			}
		}
		
		public function CombineResistances(resistances:ShipTypeCollection):void
		{
			Add(resistances);
			
			for (var i:uint = 0; i < _typeCollection.length; i++)
			{
				if (_typeCollection[i].DamageValue > 100) _typeCollection[i].DamageValue = 100;
			}
		}
		
		public function GetTotal():Number
		{
			var total:Number = 0;
			for (var i:uint = 0; i < _typeCollection.length; i++)
			{
				total += _typeCollection[i].DamageValue;
			}
			return total;
		}
		
		public function MakeCopy():ShipTypeCollection
		{
			var tc:ShipTypeCollection = new ShipTypeCollection();
			
			for (var i:uint = 0; i < _typeCollection.length; i++)
			{
				tc._typeCollection[i].DamageValue = _typeCollection[i].DamageValue;
			}
			
			for (i = 0; i < _flagCollection.length; i++)
			{
				tc._flagCollection.push(_flagCollection[i].MakeCopy());
			}
			
			return tc;
		}
	}

}