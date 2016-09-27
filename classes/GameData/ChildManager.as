package classes.GameData 
{
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.Containers.Genders;
	import flash.utils.getDefinitionByName;
	import classes.GameData.Pregnancy.ChildCache;
	
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
			ChildManager.CACHE = new ChildCache();
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
				var oo:Array = o.children[i];
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
			ChildManager.CACHE.updateTime(numMinutes);
		}
		
		static public function addChild(newChild:Child):void
		{
			CHILDREN.push(newChild);
			CACHE.numInvalidated = true;
			CACHE.ageInvalidated = true;
			CACHE.typeInvalidated = true;
		}
		
		/**
		 * Determine if the player has ANY children.
		 * @return
		 */
		static public function hasChildren():Boolean
		{
			return (CHILDREN.length > 0);
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
		
		/**
		 * Determine the total number of children the player has.
		 * @return
		 */
		static public function numChildren():int
		{
			return CACHE.numChildren;
		}
		
		/**
		 * Mostly placeholder for now- forward support for the concept of the players children
		 * ultimately leaving the nursery as they age-out and head off to lead their own lives.
		 * @return
		 */
		static public function numChildrenAtNursery():int
		{
			return CACHE.numChildren;
		}
		
		static public const GENDER_NEUTER:uint 		= 1;
		static public const GENDER_FEMALE:uint 		= 1 << 1;
		static public const GENDER_MALE:uint 		= 1 << 2;
		static public const GENDER_INTERSEX:uint 	= 1 << 3;

		/**
		 * Determine if the player has any children of the specified gender.
		 * @param	genderTypes
		 * @return
		 */
		static public function ofGender(genderTypes:uint):Boolean
		{
			return CACHE.ofGender(genderTypes);
		}
		
		/**
		 * Determine how many children the player has of a given gender.
		 * @param	genderType
		 * @return
		 */
		static public function numOfGender(genderType:uint):int
		{
			return CACHE.numOfGender(genderType);
		}
		
		/**
		 * Get a container detailing the sum total of genders of the players children.
		 * @return
		 */
		static public function numGenders():Genders
		{
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
			return CACHE.numInAgeRangeMonths(minAge, maxAge);
		}
		
		/**
		 * Get a list of all known child racial types.
		 * Array contains objects with type:uint and name:string props.
		 * @return
		 */
		public static function getKnownTypes():Array
		{
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
			return CACHE.getKnownBucket(typeString);
		}
		
		/**
		 * Determines if the PC has a child of a specific racial type.
		 * @param	raceType
		 * @return
		 */
		static public function ofType(raceType:int):Boolean
		{
			return CACHE.ofType(raceType);
		}
		
		/**
		 * Returns the total number of children of a specific race type.
		 * @param	raceType
		 * @return
		 */
		static public function numOfType(raceType:int):int
		{
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
		static public function numofGendersInRange(genderTypes:uint, minAge:int, maxAge:int = -1):Genders
		{
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
			return CACHE.ofTypeInRange(raceType, minAge, maxAge);
		}
		
		/**
		 * Determine how many children the player has of a specific race type
		 * between the desired age range in months.
		 * @return
		 */
		static public function numOfTypeInRange(raceType:uint, minAge:int, maxAge:int = -1):int
		{
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
			return CACHE.ofTypeAndGenderInRange(raceType, genderTypes, minAge, maxAge);
		}
		
		/**
		 * Determine how many children the player has of a specified race type, of a subset of genders
		 * that fall within a desired age range specified in months
		 * @return
		 */
		static public function numOfTypeAndGenderInRange(raceType:uint, genderTypes:uint, minAge:int, maxAge:int = -1):Genders
		{
			return CACHE.numOfTypeAndGenderInRange(raceType, genderTypes, minAge, maxAge);
		}
		
		static public function get nurseryCacheInvalid():Boolean
		{
			return CACHE.nurseryCacheInvalid;
		}
		
		static public function set nurseryCacheInvalid(v:Boolean):void
		{
			CACHE.nurseryCacheInvalid = v;
		}
		
		static public function get nurseryComputerCache():Object
		{
			return CACHE.nurseryComputerCache;
		}
		
		static public function set nurseryComputerCache(v:Object):void
		{
			CACHE.nurseryComputerCache = v;
		}
		
		static public function get nuseryComputerUniquesCache():Array
		{
			return CACHE.nurseryComputerUniquesCache;
		}
		
		static public function set nuseryComputerUniquesCache(v:Array):void
		{
			CACHE.nurseryComputerUniquesCache = v;
		}
	}

}