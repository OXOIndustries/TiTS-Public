package classes.GameData.Pregnancy.Containers 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class Genders 
	{
		public function Genders(o:Genders = null)
		{
			if (o != null)
			{
				Male = o.Male;
				Female = o.Female;
				Intersex = o.Intersex;
				Neuter = o.Neuter;
			}
			else
			{
				Male = 0;
				Female = 0;
				Intersex = 0;
				Neuter = 0;
			}
		}
		
		public var Male:int;
		public var Female:int;
		public var Intersex:int;
		public var Neuter:int;
	}

}