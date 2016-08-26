package classes.Engine.Combat 
{
	/**
	 * Takes a dynamic object with string key references to Class types, and returns a new dynamic object with the same keys referencing the instances of those
	 * classes inside the provided array of characters.
	 * @author Gedan
	 */
	public function GetCharacterStructure(characters:Array, structure:Object):Object
	{
		var outObject:Object = { };
		
		for (var key:String in structure)
		{
			if (!(structure[key] is Class))
			{
				throw new Error("GetCharacterStructure contained a non-class-type reference.");
			}
			
			for (var i:int = 0; i < characters.length; i++)
			{
				if (characters[i] is structure[key])
				{
					outObject[key] = characters[i];
				}
			}
		}
		
		return outObject;
	}
}