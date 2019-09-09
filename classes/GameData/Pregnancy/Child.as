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
			c.BornTimestamp = kGAMECLASS.GetGameTimestamp(); // Might just switch this to whole days passed, as a resolution "better" than that is kinda irrelevant
			
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
				var type:uint = possGenders[0].v;
				
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
		public var NumGenders:Genders = new Genders();
		
		public function get NumNeuter():int { return NumGenders.Neuter; }
		public function get NumFemale():int { return NumGenders.Female; }
		public function get NumMale():int { return NumGenders.Male; }
		public function get NumIntersex():int { return NumGenders.Intersex; }
		
		public function set NumNeuter(v:int):void { NumGenders.Neuter = v; }
		public function set NumFemale(v:int):void { NumGenders.Female = v; }
		public function set NumMale(v:int):void { NumGenders.Male = v; }
		public function set NumIntersex(v:int):void { NumGenders.Intersex = v; }
		
		private function childAge():int
		{
			// Avoid negative number crashes
			return Math.max((kGAMECLASS.GetGameTimestamp() - BornTimestamp), 0);
		}
		public function get Years():int
		{
			// ((now - born) * rate of maturity) / minutes in a year
			return int(int(childAge() * MaturationRate) / 525600);
		}
		
		public function get Months():int
		{
			// ((now - born) * rate of maturity) / minutes in a month
			return int(int(childAge() * MaturationRate) / 43200);
		}
		
		public function get Days():int
		{
			// ((now - born) * rate of maturity / minutes in a day
			return int(int(childAge() * MaturationRate) / 1440);
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
		
		public function randomApplicableGender(m:String, f:String, i:String, n:String):String
		{
			var ws:Array = [];
			
			if (NumGenders.Male > 0) ws.push( { v: m, w: NumGenders.Male } );
			if (NumGenders.Female > 0) ws.push( { v: f, w: NumGenders.Female } );
			if (NumGenders.Intersex > 0) ws.push( { v: i, w: NumGenders.Intersex } );
			if (NumGenders.Neuter > 0) ws.push( { v: n, w: NumGenders.Neuter } );
			
			return weightedRand(ws);
		}
		
		public function describeCollection(m:String, f:String, many:String):String
		{
			if (NumGenders.total > 1) return many;
			if (NumMale > 0 || NumNeuter > 0) return m;
			return f;
		}
	}

}