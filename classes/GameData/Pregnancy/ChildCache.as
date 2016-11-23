package classes.GameData.Pregnancy 
{
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Containers.Genders;
	import classes.Items.Guns.EmmysSalamanderPistol;
	import classes.kGAMECLASS;
	import flash.utils.getQualifiedClassName;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ChildCache 
	{
		public function ChildCache()
		{
			nurseryCacheInvalid = true;
			_numInvalidated = true;
			_genderCache = null;
			_numChildren = 0;
			_ageInvalidated = true;
			_dayLastUpdated = -1;
			_ageBuckets = [];
			_typeInvalidated = true;
			_knownTypes = null;
			_typeBuckets = null;
			_uniqueTypes = null;
		}
		
		public var nurseryCacheInvalid:Boolean;
		public var nurseryComputerCache:Object;
		public var nurseryComputerUniquesCache:Array;
		
		// General numerical caches for simple shit
		private var _numInvalidated:Boolean;
		public function get numInvalidated():Boolean { return _numInvalidated; }
		public function set numInvalidated(v:Boolean):void
		{ 
			_numInvalidated = v; 
			if (v)
			{
				nurseryCacheInvalid = v;
			}
		}
		
		private var _genderCache:Genders;
		private var _numChildren:int;
		
		private function updateNumCache():void
		{
			if (numInvalidated)
			{
				_numChildren = 0;
				if (_genderCache == null) _genderCache = new Genders();
				
				var c:Array = ChildManager.CHILDREN;
				for (var i:int = 0; i < c.length; i++)
				{
					var cc:Child = c[i] as Child;
					_numChildren += cc.NumMale + cc.NumFemale + cc.NumIntersex + cc.NumNeuter;
					_genderCache.Male += cc.NumMale;
					_genderCache.Female += cc.NumFemale;
					_genderCache.Intersex += cc.NumIntersex;
					_genderCache.Neuter += cc.NumNeuter;
				}
				
				numInvalidated = false;
			}
		}
		
		public function get numChildren():int
		{
			updateNumCache();
			return _numChildren;
		}
		

			
		public function ofGender(genderTypes:uint):Boolean
		{
			updateNumCache();
			
			if (genderTypes == ChildManager.ALL_GENDERS)
			{
				return _numChildren > 0;
			}
			else
			{
				if (genderTypes & ChildManager.GENDER_NEUTER   && _genderCache.Neuter   > 0) return true;
				if (genderTypes & ChildManager.GENDER_FEMALE   && _genderCache.Female   > 0) return true;
				if (genderTypes & ChildManager.GENDER_MALE     && _genderCache.Male     > 0) return true;
				if (genderTypes & ChildManager.GENDER_INTERSEX && _genderCache.Intersex > 0) return true;
			}
			
			return false;
		}
		
		public function numOfGender(genderType:uint):int
		{
			updateNumCache();
			
			if (genderType == ChildManager.GENDER_NEUTER) return _genderCache.Neuter;
			if (genderType == ChildManager.GENDER_FEMALE) return _genderCache.Female;
			if (genderType == ChildManager.GENDER_INTERSEX) return _genderCache.Intersex;
			if (genderType == ChildManager.GENDER_MALE) return _genderCache.Male;
			
			return 0;
		}
		
		public function numGenders():Genders
		{
			return new Genders(_genderCache);
		}
		
		// Some generic age related cache info
		
		// We only track this down to the day level, which helps with mid-scene potential hangs
		// relating to procesTime() calling into ChildManager, thus potentially invalidating
		// the cache and then forcing it to be re-updated.
		
		/* 
		Age buckets run such:
			0 => 0 to 3 months
			1 => 3 to 6 months
			2 => 6 to 9 months
			3 => 9 to 12 months
			4 => to 2 years
			5 => to 3
			...
			20 => to 18
			21 => 18+
		*/
		
		private var _ageInvalidated:Boolean;
		public function get ageInvalidated():Boolean { return _ageInvalidated; }
		public function set ageInvalidated(v:Boolean):void
		{
			_ageInvalidated = v;
			if (v)
			{
				nurseryCacheInvalid = v;
			}
		}
		private var _dayLastUpdated:int;
		private var _ageBuckets:Array;
		
		// Determine if the age bucket cache potentially needs an update
		public function updateTime(numMinutes:int):void
		{
			// We don't really care about the specific passage of time right now, but it's being 
			// handed down in case it potentially becomes useful in the future.
			if (!ageInvalidated && kGAMECLASS.days != _dayLastUpdated)
			{
				ageInvalidated = true;
			}
		}
		
		private function updateAgeBuckets():void
		{
			if (ageInvalidated)
			{
				// Resort the primary storage array based on age in months whenever age is invalidated.
				// This is probably the least intensive method to do this, as near-perfect order
				// should incur less performance cost than forcibly recreating an array and ensuring
				// its order.
				ChildManager.CHILDREN = ChildManager.CHILDREN.sortOn("Days", Array.DESCENDING | Array.NUMERIC);
				
				_ageBuckets = [];
				
				// Init the buckets
				for (var i:int = 0; i < 21; i++)
				{
					_ageBuckets.push([]);
				}
				
				// Fill the buckets
				for (i = 0; i < ChildManager.CHILDREN.length; i++)
				{
					var cc:Child = ChildManager.CHILDREN[i] as Child;
					var y:int = cc.Years;
					
					if (y >= 18)
					{
						_ageBuckets[21].push(cc);
					}
					else if (y >= 1)
					{
						_ageBuckets[y + 3].push(cc);
					}
					else
					{
						var m:int = Math.floor(cc.Months / 3);
						_ageBuckets[m].push(cc);
					}
				}
				
				ageInvalidated = false;
				_dayLastUpdated = kGAMECLASS.days;
			}
		}
		
		public function inAgeRangeYears(minAge:int, maxAge:int = -1):Boolean
		{
			updateAgeBuckets();
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				return ChildManager.CHILDREN.length > 0;
			}
			
			// If no Max is specified, only check the min bucket
			if (maxAge == -1)
			{
				return _ageBuckets[minAge + 3].length > 0;
			}
			
			for (var bucket:int = minAge + 3; bucket < (maxAge + 4) && bucket < 21; bucket++)
			{
				if (_ageBuckets[bucket].length > 0) return true;
			}
			
			return false;
		}
		
		public function filteredInAgeRangeYears(minAge:int, maxAge:int = -1, filters:Array = null):Boolean
		{
			updateAgeBuckets();
			
			var passedFilters:Boolean;
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					passedFilters = true;
					
					if (filters != null)
					{
						for (var f:int = 0; f < filters.length; f++)
						{
							if (!filters[f](ChildManager.CHILDREN[i] as Child))
							{
								passedFilters = false;
								break;
							}
						}
						
						if (passedFilters)
						{
							return true;
						}
					}
					else
					{
						return true;
					}
				}
			}
			
			// If no Max is specified, only check the min bucket
			if (maxAge == -1)
			{
				var b:Array = _ageBuckets[minAge + 3];
				
				for (i = 0; i < b.length; i++)
				{
					passedFilters = true;
					
					if (filters != null)
					{
						for (f = 0; f < filters.length; f++)
						{
							if (!filters[f](b[i] as Child))
							{
								passedFilters = false;
								break;
							}
						}
						
						if (passedFilters)
						{
							return true;
						}
					}
					else
					{
						return true;
					}
				}
			}
			
			for (var bucket:int = minAge + 3; bucket < (maxAge + 4) && bucket < 21; bucket++)
			{
				b = _ageBuckets[bucket];
				
				for (i = 0; i < b.length; i++)
				{
					passedFilters = true;
					
					if (filters != null)
					{
						for (f = 0; f < filters.length; f++)
						{
							if (!filters[f](b[i] as Child))
							{
								passedFilters = false;
								break;
							}
						}
						
						if (passedFilters)
						{
							return true;
						}
					}
					else
					{
						return true;
					}
				}
				
			}
			
			return false;
		}
		
		public function inAgeRangeMonths(minAge:int, maxAge:int = -1):Boolean
		{
			updateAgeBuckets();
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				return ChildManager.CHILDREN.length > 0;
			}
			
			var minBucket:int = -1;
			var maxBucket:int = -1;
			
			if (minAge < 12)
			{
				minBucket = int(minAge / 3);
			}
			else if (minAge >= 12)
			{
				minBucket = int(minAge / 12) + 3;
			}
			
			if (maxAge == -1)
			{
				return _ageBuckets[minBucket].length > 0;
			}
			else
			{
				maxBucket = int(Math.min(int(maxAge / 12) + 3, 21));
			}
			
			for (var bucket:int = minBucket; bucket < maxBucket; bucket++)
			{
				if (_ageBuckets[bucket].length > 0) return true;
			}
			
			return false;
		}
		
		public function numInAgeRangeYears(minAge:int, maxAge:int):int
		{
			updateAgeBuckets();
			
			var t:int = 0;
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					var cc:Child = ChildManager.CHILDREN[i] as Child;
					t += cc.Quantity;
				}
			}
			else if (maxAge == -1)
			{
				for (i = 0; i < _ageBuckets[minAge + 3].length; i++)
				{
					cc = _ageBuckets[minAge + 3][i] as Child;
					t += cc.Quantity;
				}
			}
			else
			{
				for (var bucket:int = minAge + 3; bucket < (maxAge + 4) && bucket < 21; bucket++)
				{
					for (i = 0; i < _ageBuckets[bucket].length; i++)
					{
						cc = _ageBuckets[bucket][i] as Child;
						t += cc.Quantity;
					}
				}
			}
			
			return t;
		}
		
		public function numInAgeRangeMonths(minAge:int, maxAge:int):int
		{
			updateAgeBuckets();
			
			var t:int = 0;
			var cc:Child = null;
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					cc = ChildManager.CHILDREN[i] as Child;
					t += cc.Quantity;
				}
			}
			else
			{
				var minBucket:int = -1;
				var maxBucket:int = -1;
				
				if (minAge < 12)
				{
					minBucket = int(minAge / 3);
				}
				else if (minAge >= 12)
				{
					minBucket = int(minAge / 12) + 3;
				}
				
				if (maxAge == -1)
				{
					for (i = 0; i < _ageBuckets[minBucket].length; i++)
					{
						cc = _ageBuckets[minBucket][i] as Child;
						t += cc.Quantity;
					}
				}
				else
				{
					maxBucket = int(Math.min(int(maxAge / 12) + 3, 21));
				
					for (var bucket:int = minBucket; bucket < maxBucket; bucket++)
					{
						for (i = 0; i < _ageBuckets[bucket].length; i++)
						{
							cc = _ageBuckets[bucket][i] as Child;
							t += cc.Quantity;
						}
					}
				}
			}
			
			return t;
		}
		
		private var _typeInvalidated:Boolean;
		public function get typeInvalidated():Boolean { return _typeInvalidated; }
		public function set typeInvalidated(v:Boolean):void
		{
			_typeInvalidated = v;
			if (v)
			{
				nurseryCacheInvalid = v;
			}
		}
		private var _knownTypes:Array;
		private var _typeBuckets:Object;
		public function updateTypeBuckets():void
		{
			if (typeInvalidated)
			{
				_typeBuckets = { };
				_knownTypes = [];
				
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					var cc:Child = ChildManager.CHILDREN[i];
					var typeString:String = String(cc.RaceType);
					
					if (_typeBuckets.hasOwnProperty(typeString) == false)
					{
						_typeBuckets[typeString] = [];
						_knownTypes.push({type: cc.RaceType, name: typeString});
					}
					
					_typeBuckets[typeString].push(cc);
				}
				
				typeInvalidated = false;
				_knownTypes.sortOn("type", Array.NUMERIC);
			}
		}
		
		public function getKnownTypes():Array
		{
			updateTypeBuckets();
			return _knownTypes;
		}
		
		public function getKnownBucket(typeString:String):Array
		{
			// This should only ever be called after a getKnownTypes() call, so we're going
			// to not update the buckets here and CROSS FINGERS
			
			return _typeBuckets[typeString];
		}
		
		public function ofType(raceType:int):Boolean
		{
			updateTypeBuckets();
			
			var typeString:String = String(raceType);
			return _typeBuckets.hasOwnProperty(typeString);
		}
		
		public function numOfType(raceType:int):int
		{
			updateTypeBuckets();
			
			var typeString:String = String(raceType);
			
			if (_typeBuckets.hasOwnProperty(typeString) == false)
			{
				return 0;
			}
			
			var t:int = 0;
			var bucket:Array = _typeBuckets[typeString];
			for (var i:int = 0; i < bucket.length; i++)
			{
				var cc:Child = bucket[i] as Child;
				t += cc.Quantity;
			}
			
			return t;
		}
		
		private function HasRequiredGender(c:Child, genderTypes:uint):Boolean
		{
			if (genderTypes & ChildManager.GENDER_NEUTER && c.NumNeuter > 0) return true;
			if (genderTypes & ChildManager.GENDER_FEMALE && c.NumFemale > 0) return true;
			if (genderTypes & ChildManager.GENDER_MALE && c.NumMale > 0) return true;
			if (genderTypes & ChildManager.GENDER_INTERSEX && c.NumIntersex > 0) return true;
			return false;
		}
		
		private function NumRequiredGenders(c:Child, genderTypes:uint, container:Genders):void
		{
			if (genderTypes == ChildManager.ALL_GENDERS)
			{
				container.add(c.NumGenders);
				return;
			}
			if (genderTypes & ChildManager.GENDER_NEUTER) container.Neuter += c.NumNeuter;
			if (genderTypes & ChildManager.GENDER_FEMALE) container.Female += c.NumFemale;
			if (genderTypes & ChildManager.GENDER_MALE) container.Male += c.NumMale;
			if (genderTypes & ChildManager.GENDER_INTERSEX) container.Intersex += c.NumIntersex;
		}
		
		public function ofGendersInRange(genderTypes:uint, minAge:int, maxAge:int):Boolean
		{
			updateAgeBuckets();
			
			var cc:Child = null;
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					cc = ChildManager.CHILDREN[i] as Child;
					if (HasRequiredGender(cc, genderTypes)) return true;
				}
			}
			else
			{
				var minBucket:int = -1;
				var maxBucket:int = -1;
				
				if (minAge < 12)
				{
					minBucket = int(minAge / 3);
				}
				else if (minAge >= 12)
				{
					minBucket = int(minAge / 12) + 3;
				}
				
				if (maxAge == -1)
				{
					for (i = 0; i < _ageBuckets[minBucket].length; i++)
					{
						cc = _ageBuckets[minBucket][i] as Child;
						if (HasRequiredGender(cc, genderTypes)) return true;
					}
				}
				else
				{
					maxBucket = int(Math.min(int(maxAge / 12) + 3, 21));
				
					for (var bucket:int = minBucket; bucket < maxBucket; bucket++)
					{
						for (i = 0; i < _ageBuckets[bucket].length; i++)
						{
							cc = _ageBuckets[bucket][i] as Child;
							if (HasRequiredGender(cc, genderTypes)) return true;
						}
					}
				}
			}
			
			return false;
		}
		
		public function numOfGendersInRange(genderTypes:uint, minAge:int, maxAge:int):Genders 
		{
			updateAgeBuckets();
			
			var t:Genders = new Genders();
			var cc:Child = null;
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					cc = ChildManager.CHILDREN[i] as Child;
					NumRequiredGenders(cc, genderTypes, t);
				}
			}
			else
			{
				var minBucket:int = -1;
				var maxBucket:int = -1;
				
				if (minAge < 12)
				{
					minBucket = int(minAge / 3);
				}
				else if (minAge >= 12)
				{
					minBucket = int(minAge / 12) + 3;
				}
				
				if (maxAge == -1)
				{
					for (i = 0; i < _ageBuckets[minBucket].length; i++)
					{
						cc = _ageBuckets[minBucket][i] as Child;
						NumRequiredGenders(cc, genderTypes, t);
					}
				}
				else
				{
					maxBucket = int(Math.min(int(maxAge / 12) + 3, 21));
				
					for (var bucket:int = minBucket; bucket < maxBucket; bucket++)
					{
						for (i = 0; i < _ageBuckets[bucket].length; i++)
						{
							cc = _ageBuckets[bucket][i] as Child;
							NumRequiredGenders(cc, genderTypes, t);
						}
					}
				}
			}
			
			return t;
		}
		
		public function filteredNumOfGendersInRange(genderTypes:uint, minAge:int, maxAge:int, filters:Array):Genders
		{
			updateAgeBuckets();
			
			var t:Genders = new Genders();
			var cc:Child = null;
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				for (var i:int = 0; i < ChildManager.CHILDREN.length; i++)
				{
					cc = ChildManager.CHILDREN[i] as Child;
					var passedFilters:Boolean = true;
					
					for (var f:int = 0; f < filters.length; f++)
					{
						if (!filters[f](cc))
						{
							passedFilters = false;
							break;
						}
					}
					
					if (passedFilters)
					{
						NumRequiredGenders(cc, genderTypes, t);
					}
				}
			}
			else
			{
				var minBucket:int = -1;
				var maxBucket:int = -1;
				
				if (minAge < 12)
				{
					minBucket = int(minAge / 3);
				}
				else if (minAge >= 12)
				{
					minBucket = int(minAge / 12) + 3;
				}
				
				if (maxAge == -1)
				{
					for (i = 0; i < _ageBuckets[minBucket].length; i++)
					{
						cc = _ageBuckets[minBucket][i] as Child;
						passedFilters = true;
						
						for (f = 0; f < filters.length; f++)
						{
							if (!filters[f](cc))
							{
								passedFilters = false;
								break;
							}
						}
						
						if (passedFilters)
						{
							NumRequiredGenders(cc, genderTypes, t);
						}
					}
				}
				else
				{
					maxBucket = int(Math.min(int(maxAge / 12) + 3, 21));
				
					for (var bucket:int = minBucket; bucket < maxBucket; bucket++)
					{
						for (i = 0; i < _ageBuckets[bucket].length; i++)
						{
							cc = _ageBuckets[bucket][i] as Child;
							passedFilters = true;
							
							for (f = 0; f < filters.length; f++)
							{
								if (!filters[f](cc))
								{
									passedFilters = false;
									break;
								}
							}
							
							if (passedFilters)
							{
								NumRequiredGenders(cc, genderTypes, t);
							}
						}
					}
				}
			}
			
			return t;
		}
		
		
		public function ofTypeInRange(raceType:uint, minAge:int, maxAge:int):Boolean
		{
			updateTypeBuckets();
			
			var typeString:String = String(raceType);
			if (_typeBuckets.hasOwnProperty(typeString) == false) return false;
			
			var t:Array = _typeBuckets[typeString];
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			if (minAge <= 0)
			{
				return _typeBuckets.length > 0;
			}
			else
			{
				for (var i:int = 0; i < t.length; i++)
				{
					var cc:Child = t[i] as Child;
					var m:int = cc.Months;
					
					if ((maxAge == -1 || m <= maxAge) && m >= minAge)
					{
						return true;
					}
				}
			}
			
			return false;
		}
		
		public function numOfTypeInRange(raceType:uint, minAge:int, maxAge:int):int
		{
			updateTypeBuckets();
			
			var num:int = 0;
			
			var typeString:String = String(raceType);
			if (_typeBuckets.hasOwnProperty(typeString) == false) return 0;
			
			var t:Array = _typeBuckets[typeString];
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			for (var i:int = 0; i < t.length; i++)
			{
				var cc:Child = t[i] as Child;
				var m:int = cc.Months;
				
				if ((maxAge == -1 || m <= maxAge) && m >= minAge)
				{
					num += cc.Quantity;
				}
			}
			
			return num;
		}
		
		public function ofTypeAndGenderInRange(raceType:uint, genderTypes:uint, minAge:int, maxAge:int):Boolean
		{
			updateTypeBuckets();
			
			var typeString:String = String(raceType);
			if (_typeBuckets.hasOwnProperty(typeString) == false) return false;
			
			var t:Array = _typeBuckets[typeString];
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			for (var i:int = 0; i < t.length; i++)
			{
				var cc:Child = t[i] as Child;
				var m:int = cc.Months;
				
				if (m >= minAge && (maxAge == -1 || m < maxAge))
				{
					return HasRequiredGender(cc, genderTypes);
				}
			}
			
			return false;
		}
		
		public function numOfTypeAndGenderInRange(raceType:uint, genderTypes:uint, minAge:int, maxAge:int):Genders
		{
			updateTypeBuckets();
			
			var num:Genders = new Genders();
			var typeString:String = String(raceType);
			if (_typeBuckets.hasOwnProperty(typeString) == false) return num;
			
			var t:Array = _typeBuckets[typeString];
			
			if (maxAge != -1 && maxAge < minAge) maxAge = -1;
			
			for (var i:int = 0; i < t.length; i++)
			{
				var cc:Child = t[i] as Child;
				var m:int = cc.Months;
				
				if (m >= minAge && (maxAge == -1 || m < maxAge))
				{
					NumRequiredGenders(cc, genderTypes, num);
				}
			}
			
			return num;
		}
		
		public function getChildrenOfType(raceType:uint):Array
		{
			updateTypeBuckets();
			
			var typeString:String = String(raceType);
			if (_typeBuckets.hasOwnProperty(typeString) == false) return null;
			
			return _typeBuckets[typeString];
		}
		
		// Store unique types in a two-tier dict:
		// _root[type_path][children]
		// type_path is the return from getQualifiedClassName() on a unique child ie a string
		private var _uniqueTypes:Object;
		private var _uniqueTypesInvalid:Boolean = true;
		public function get uniqueTypesInvalid():Boolean { return _uniqueTypesInvalid; }
		public function set uniqueTypesInvalid(v:Boolean):void { _uniqueTypesInvalid = v; }
		
		private function updateUniqueTypes():void
		{
			if (_uniqueTypesInvalid)
			{
				_uniqueTypes = [];
				
				var c:Array = ChildManager.CHILDREN;
				
				for (var i:int = 0; i < c.length; i++)
				{
					if (c[i] is UniqueChild)
					{
						var cFQN:String = getQualifiedClassName(c[i]);
						if (_uniqueTypes.hasOwnProperty(cFQN))
						{
							_uniqueTypes[cFQN].push(c);
						}
						else
						{
							_uniqueTypes[cFQN] = [c];
						}
					}
				}
				
				// This might be a performance hotspot, we'll see
				for (var key:String in _uniqueTypes)
				{
					var tA:Array = _uniqueTypes[key];
					tA.sortOn("Days", Array.DESCENDING | Array.NUMERIC);
				}
				
				_uniqueTypesInvalid = false;
			}
		}
		
		public function ofUniqueType(childClassT:Class):Boolean
		{
			updateUniqueTypes();
			
			if (_uniqueTypes.hasOwnProperty(getQualifiedClassName(childClassT)))
			{
				return true;
			}
			
			return false;
		}
		
		public function numOfUniqueType(childClassT:Class):int
		{
			updateUniqueTypes();
			
			var cFQN:String = getQualifiedClassName(childClassT);
			var num:int = 0;
			
			if (_uniqueTypes.hasOwnProperty(cFQN))
			{
				var typeArray:Array = _uniqueTypes[cFQN] as Array;
				for (var i:int = 0; i < typeArray.length; i++)
				{
					var c:UniqueChild = typeArray[i] as UniqueChild;
					num += c.Quantity;
				}
			}
			
			return num;
		}
		
		public function gendersOfUniqueTypeInRange(childClassT:Class, minAge:int, maxAge:int = -1):Genders
		{
			updateUniqueTypes();
			
			var cFQN:String = getQualifiedClassName(childClassT);
			var genderTotals:Genders = new Genders();
			
			if (_uniqueTypes.hasOwnProperty(cFQN))
			{
				
				var typeArray:Array = _uniqueTypes[cFQN] as Array;
				
				for (var i:int = 0; i < typeArray.length; i++)
				{
					var c:UniqueChild = typeArray[i] as UniqueChild;
					if (c.Months >= minAge && (maxAge == -1 || c.Months <= maxAge))
					{
						genderTotals.add(c.NumGenders);
					}
				}
			}
			
			return genderTotals;
		}
		
		public function youngestOfUniqueType(childClassT:Class):UniqueChild
		{
			updateUniqueTypes();
			
			var cFQN:String = getQualifiedClassName(childClassT);
			
			if (_uniqueTypes.hasOwnProperty(cFQN))
			{
				// This subarrays should already be sorted in ascending order of days-old
				return _uniqueTypes[cFQN][0];
			}
			
			return null;
		}
		
		/** Utility functions **/
		private function isMobile(RaceType:int):Boolean
		{
			var noRoamTypeList:Array = [
				GLOBAL.TYPE_TENTACLE,
				GLOBAL.TYPE_CUNTSNAKE,
				GLOBAL.TYPE_VENUSPITCHER,
				GLOBAL.TYPE_COCKVINE,
				GLOBAL.TYPE_WATERQUEEN,
			];
			
			if (noRoamTypeList.indexOf(RaceType) == -1) return true;
			return false;
		}
		
		public const isMobileFilter:Array = [isMobile];
	}
}