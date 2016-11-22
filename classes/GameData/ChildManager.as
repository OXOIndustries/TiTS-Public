package classes.GameData 
{
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.Containers.Genders;
	import flash.utils.getDefinitionByName;
	import classes.GameData.Pregnancy.ChildCache;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ChildManager 
	{
		public function ChildManager() 
		{
			
		}
		
		// Base data layer
		public static var CHILDREN:Array;
		private static var CACHE:ChildCache;
		
		// Static initializer.
		{
			ChildManager.CHILDREN = new Array();
		}
		
		public static function getSaveObject():Object
		{
			var o:Object = { };
			
			// Generic children
			o["children"] = [];
			for (var i:int = 0; i < CHILDREN.length; i++)
			{
				o.children.push(CHILDREN[i].GetSaveObject());
			}
			
			return o;
		}
		
		public static function loadSaveObject(o:Object):void
		{
			resetChildren();
			
			for (var i:int = 0; i < o.children.length; i++)
			{
				var oo:Object = o.children[i];
				var classT:Class = getDefinitionByName(oo.classInstance) as Class;
				var classInstance:Child = new classT();
				classInstance.LoadSaveObject(oo);
				ChildManager.CHILDREN.push(classInstance);
			}
			
			CACHE.numInvalidated = true;
			CACHE.ageInvalidated = true;
			CACHE.typeInvalidated = true;
		}
		
		public static function resetChildren():void
		{
			ChildManager.CHILDREN = [];
			ChildManager.CACHE = new ChildCache();
		}
		
		// Generic interface
		static public function updateTime(numMinutes:int):void
		{
			if (CACHE == null) CACHE = new ChildCache();
			ChildManager.CACHE.updateTime(numMinutes);
		}
		
		static public function addChild(newChild:Child):void
		{
			CHILDREN.push(newChild);
			
			if (CACHE == null) CACHE = new ChildCache();
			CACHE.numInvalidated = true;
			CACHE.ageInvalidated = true;
			CACHE.typeInvalidated = true;
			if (newChild is UniqueChild)
			{
				CACHE.uniqueTypesInvalid = true;
			}
		}
		
		/**
		 * Determine if the player has ANY children.
		 * @return
		 */
		static public function hasChildren():Boolean
		{
			return (CHILDREN.length > 0);
		}
		static public function hasUniqueChildren():Boolean
		{
			return (numUniqueChildren() > 0);
		}
		
		/**
		 * Mostly placeholder for now- forward support for the concept of the players children
		 * ultimately leaving the nursery as they age-out and head off to lead their own lives.
		 * @return
		 */
		static public function hasChildrenAtNursery():Boolean
		{
			return (CHILDREN.length > 0);
		}
		static public function hasUniqueChildrenAtNursery():Boolean
		{
			return (numUniqueChildrenAtNursery() > 0);
		}
		
		/**
		 * Determine the total number of children the player has.
		 * @return
		 */
		static public function numChildren(uniqueOnly:Boolean = false):int
		{
			//TODO: This test should be moved up into the cache handler methods rather than here
			if (uniqueOnly)
			{
				var numUnique:int = 0;
				for(var i:int = 0; i < CHILDREN.length; i++)
				{
					if(CHILDREN[i] is UniqueChild) numUnique++;
				}
				return numUnique;
			}
			
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numChildren;
		}
		static public function numUniqueChildren():int
		{
			return numChildren(true);
		}
		
		/**
		 * Mostly placeholder for now- forward support for the concept of the players children
		 * ultimately leaving the nursery as they age-out and head off to lead their own lives.
		 * @return
		 */
		static public function numChildrenAtNursery(uniqueOnly:Boolean = false):int
		{
			if (uniqueOnly)
			{
				var numUnique:int = 0;
				for(var i:int = 0; i < CHILDREN.length; i++)
				{
					if(CHILDREN[i] is UniqueChild) numUnique++;
				}
				return numUnique;
			}
			
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numChildren;
		}
		static public function numUniqueChildrenAtNursery():int
		{
			return numChildrenAtNursery(true);
		}
		
		static public const GENDER_NEUTER:uint 		= 1;
		static public const GENDER_FEMALE:uint 		= 1 << 1;
		static public const GENDER_MALE:uint 		= 1 << 2;
		static public const GENDER_INTERSEX:uint 	= 1 << 3;
		static public const ALL_GENDERS:uint		= ChildManager.GENDER_NEUTER | ChildManager.GENDER_FEMALE
													| ChildManager.GENDER_MALE   | ChildManager.GENDER_INTERSEX;

		/**
		 * Determine if the player has any children of the specified gender.
		 * @param	genderTypes
		 * @return
		 */
		static public function ofGender(genderTypes:uint):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.ofGender(genderTypes);
		}
		
		/**
		 * Determine how many children the player has of a given gender.
		 * @param	genderType
		 * @return
		 */
		static public function numOfGender(genderType:uint):int
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numOfGender(genderType);
		}
		
		/**
		 * Get a container detailing the sum total of genders of the players children.
		 * @return
		 */
		static public function numGenders():Genders
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numGenders();
		}

		/**
		 * Determine if the player has any children in the specified age range in years.
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		public static function inAgeRangeYears(minAge:int, maxAge:int = -1):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.inAgeRangeYears(minAge, maxAge);
		}
		
		/**
		 * Determine if the player has any children in the specified age range in months.
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		public static function inAgeRangeMonths(minAge:int, maxAge:int = -1):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.inAgeRangeMonths(minAge, maxAge);
		}
		
		// Ideally, only ever call any of the remaining methods once per scene
		// per argument, and store the result temporarily in the scene
		// as it executes. These are all potentially very heavy,
		// and whilst I could also cache these queries, it creates a combinatorial
		// issue with code support...
		
		/**
		 * Determine how many children the player has within a specified age range in years.
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		public static function numInAgeRangeYears(minAge:int, maxAge:int = -1):int
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numInAgeRangeYears(minAge, maxAge);
		}
		
		/**
		 * Determine how many children the player has within a specified age range in months.
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		public static function numInAgeRangeMonths(minAge:int, maxAge:int = -1):int
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numInAgeRangeMonths(minAge, maxAge);
		}
		
		/**
		 * Get a list of all known child racial types.
		 * Array contains objects with type:uint and name:string props.
		 * @return
		 */
		public static function getKnownTypes():Array
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.getKnownTypes();
		}
		
		/**
		 * Get a bucket from the cache of a single racial type of children. Note this 
		 * uses the name property from getknownTypes() list, as the buckets are string-indexed
		 * as a dictionary.
		 * @param	type
		 * @return
		 */
		public static function getBucketOfType(typeString:String):Array
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.getKnownBucket(typeString);
		}
		
		/**
		 * Determines if the PC has a child of a specific racial type.
		 * @param	raceType
		 * @return
		 */
		static public function ofType(raceType:int):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.ofType(raceType);
		}
		
		/**
		 * Returns the total number of children of a specific race type.
		 * @param	raceType
		 * @return
		 */
		static public function numOfType(raceType:int):int
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numOfType(raceType);
		}
		
		/**
		 * Determines if the player has children of a specific gender within a 
		 * certain age range, provided in months.
		 * Can specify multiple potential genders with "GENDER_FEMALE | GENDER_MALE" etc
		 * If you want to actually get a break down of the available genders, use numOfGenderInRange
		 * @param	genderTypes
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		static public function ofGendersInRange(genderTypes:uint, minAge:int, maxAge:int = -1):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.ofGendersInRange(genderTypes, minAge, maxAge);
		}
		
		/**
		 * Get a container specifying the genders of all children that fall within the
		 * desired age range.
		 * @param	genderTypes
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		static public function numOfGendersInRange(genderTypes:uint, minAge:int, maxAge:int = -1):Genders
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numOfGendersInRange(genderTypes, minAge, maxAge);
		}
		
		/**
		 * Determine if the player has any children of a specific racial type
		 * between the desired age range in months.
		 * @param	raceType
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		static public function ofTypeInRange(raceType:uint, minAge:int, maxAge:int):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.ofTypeInRange(raceType, minAge, maxAge);
		}
		
		/**
		 * Determine how many children the player has of a specific race type
		 * between the desired age range in months.
		 * @return
		 */
		static public function numOfTypeInRange(raceType:uint, minAge:int, maxAge:int = -1):int
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numOfTypeInRange(raceType, minAge, maxAge);
		}
		
		/**
		 * Determine if the player has any children of a specified race type, of a subset of genders
		 * that fall within a desired age range specified in months.
		 * @param	raceType
		 * @param	genderTypes
		 * @param	minAge
		 * @param	maxAge
		 * @return
		 */
		static public function ofTypeAndGenderInRange(raceType:uint, genderTypes:uint, minAge:int, maxAge:int = -1):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.ofTypeAndGenderInRange(raceType, genderTypes, minAge, maxAge);
		}
		
		/**
		 * Determine how many children the player has of a specified race type, of a subset of genders
		 * that fall within a desired age range specified in months
		 * @return
		 */
		static public function numOfTypeAndGenderInRange(raceType:uint, genderTypes:uint, minAge:int, maxAge:int = -1):Genders
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numOfTypeAndGenderInRange(raceType, genderTypes, minAge, maxAge);
		}
		
		static public function get nurseryCacheInvalid():Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.nurseryCacheInvalid;
		}
		
		static public function set nurseryCacheInvalid(v:Boolean):void
		{
			if (CACHE == null) CACHE = new ChildCache();
			CACHE.nurseryCacheInvalid = v;
		}
		
		static public function get nurseryComputerCache():Object
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.nurseryComputerCache;
		}
		
		static public function set nurseryComputerCache(v:Object):void
		{
			if (CACHE == null) CACHE = new ChildCache();
			CACHE.nurseryComputerCache = v;
		}
		
		static public function get nuseryComputerUniquesCache():Array
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.nurseryComputerUniquesCache;
		}
		
		static public function set nuseryComputerUniquesCache(v:Array):void
		{
			if (CACHE == null) CACHE = new ChildCache();
			CACHE.nurseryComputerUniquesCache = v;
		}
		
		static public function getChildrenOfType(ofType:uint):Array
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.getChildrenOfType(ofType);
		}
		
		// Check to see if child can actually roam freely in the nursery!
		static public function canRoam(RaceType:int):Boolean
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
		
		/* Proto-unique-children handling */
		static public function ofUniqueType(childClassT:Class):Boolean
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.ofUniqueType(childClassT);
		}
		
		static public function numOfUniqueType(childClassT:Class):int
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.numOfUniqueType(childClassT);
		}
		
		/**
		 * Get the number of children of a specific descendent of UniqueChild types in the
		 * target age range, specified in months.
		 * @param	childClassT		Class type reference to specific child type.
		 * @param	minAge			Minimum age
		 * @param	maxAge			Maximum age, -1 if no max.
		 * @return
		 */
		static public function gendersOfUniqueTypeInRange(childClassT:Class, minAge:int, maxAge:int = -1):Genders
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.gendersOfUniqueTypeInRange(childClassT, minAge, maxAge);
		}
		
		static public function youngestOfUniqueType(childClassT:Class):UniqueChild
		{
			if (CACHE == null) CACHE = new ChildCache();
			return CACHE.youngestOfUniqueType(childClassT);
		}
	}

}