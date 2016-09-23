package classes.GameData.Pregnancy 
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import flash.utils.getQualifiedClassName;
	import classes.GameData.ChildManager;
	import classes.Engine.Utility.weightedRand;
	import classes.GameData.Pregnancy.Containers.Genders;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Child 
	{
		public static function NewChildWeights(raceType:uint, matRate:Number, numChildren:int, genderWeights:Genders):Child
		{
			return Child.NewChild(raceType, matRate, numChildren, genderWeights.Male, genderWeights.Female, genderWeights.Intersex, genderWeights.Neuter);
		}
		
		public static function NewChild(raceType:uint, matRate:Number, numChildren:int, maleChance:int = 50, femaleChance:int = 50, intersexChance:int = 0, neuterChance:int = 0):Child
		{
			var c:Child = new Child();
			c.RaceType = raceType;
			c.MaturationRate = matRate;
			c.BornTimestamp = kGAMECLASS.GetGameTimestamp(); // Might just switch this to whole days passed, as a resolution "better" than that is kinda irrelevent
			
			var possGenders:Array = [];
			if (maleChance > 0) possGenders.push( { w: maleChance, v: ChildManager.GENDER_MALE } );
			if (femaleChance > 0) possGenders.push( { w: femaleChance, v: ChildManager.GENDER_FEMALE } );
			if (intersexChance > 0) possGenders.push( { w: intersexChance, v: ChildManager.GENDER_INTERSEX } );
			if (neuterChance > 0) possGenders.push( { w: neuterChance, v: ChildManager.GENDER_NEUTER } );
			
			if (possGenders.length <= 0)
			{
				throw new Error("No possible genders selectable for child.");
			}
			else if (possGenders.length == 1)
			{
				var type:uint = possGenders[0].w;
				
				switch (type)
				{
					case ChildManager.GENDER_MALE: c.NumMale = numChildren; break;
					case ChildManager.GENDER_FEMALE: c.NumFemale = numChildren; break;
					case ChildManager.GENDER_INTERSEX: c.NumIntersex = numChildren; break;
					case ChildManager.GENDER_NEUTER: c.NumNeuter = numChildren; break;
					default:
						throw new Error("Invalid gender specifier.");
						break;
				}
			}
			else
			{
				for (var i:int = 0; i < numChildren; i++)
				{
					type = weightedRand(possGenders);
					
					switch (type)
					{
						case ChildManager.GENDER_MALE:
							c.NumMale++;
							break;
						case ChildManager.GENDER_FEMALE:
							c.NumFemale++;
							break;
						case ChildManager.GENDER_INTERSEX:
							c.NumIntersex++;
							break;
						case ChildManager.GENDER_NEUTER:
							c.NumNeuter++;
							break;
						default:
							
					}
				}	
			}
			
			return c;
		}
		
		public function Child()
		{
			
		}
		
		public var RaceType:uint;
		public var BornTimestamp:uint;
		public var MaturationRate:Number;
		
		public function get Quantity():int { return NumNeuter + NumFemale + NumMale + NumIntersex; }
		public var NumNeuter:int = 0;
		public var NumFemale:uint = 0;
		public var NumMale:uint = 0;
		public var NumIntersex:uint = 0;
		
		public function get Years():int
		{
			// ((now - born) * rate of maturity) / minutes in a year
			return int(int((kGAMECLASS.GetGameTimestamp() - BornTimestamp) * MaturationRate) / 525600);
		}
		
		public function get Months():int
		{
			// ((now - born) * rate of maturity) / minutes in a month
			return int(int((kGAMECLASS.GetGameTimestamp() - BornTimestamp) * MaturationRate) / 43200);
		}
		
		public function get Days():int
		{
			// ((now - born) * rate of maturity / minutes in a month
			return int(int((kGAMECLASS.GetGameTimestamp() - BornTimestamp) * MaturationRate) / 1440);
		}
		
		public function GetSaveObject():Object
		{
			var o:Object = { };
			o.RaceType = RaceType;
			o.BornTimestamp = BornTimestamp;
			o.MaturationRate = MaturationRate;
			o.NumNeuter = NumNeuter;
			o.NumFemale = NumFemale;
			o.NumMale = NumMale;
			o.NumIntersex = NumIntersex;
			o.classInstance = getQualifiedClassName(this);
			return o;
		}
		
		public function LoadSaveObject(o:Object):void
		{
			RaceType = o.RaceType;
			BornTimestamp = o.BornTimestamp;
			MaturationRate = o.MaturationRate;
			NumNeuter = o.NumNeuter;
			NumFemale = o.NumFemale;
			NumMale = o.NumMale;
			NumIntersex = o.NumIntersex;
		}
	}

}