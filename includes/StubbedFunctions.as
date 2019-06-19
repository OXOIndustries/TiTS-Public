// This is like a "Shit in here is bad, fix it asap pls.
// Ideally, we should be working to ensure this file has no actual code in it.
// It's purpose is to store "unimplemented" functions for content in the pipeline, so we know where to look when we need to "finish" something
public function daneRecruited():Boolean
{
	return false;
}
public function daneIsCrew():Boolean
{
	return false;
}
public function kiroRecruited():Boolean
{
	return false;
}
public function kiroIsCrew():Boolean
{
	return false;
}
public function PCShipName(customName:Boolean = true):String
{
	// 9999 if(customName) return ActivePlayerShip.Name;
	
	if(shits["SHIP"] != undefined) return (customName ? shits["SHIP"].short : shits["SHIP"].short);
	
	return (PCShipManufacturer() + " " + PCShipModel());
}
public function PCShipManufacturer():String
{
	// 9999 return ActivePlayerShip.Manufacturer;
	return "Casstech";
}
public function PCShipModel():String
{
	// 9999 return ActivePlayerShip.Model;
	
	if(shits["SHIP"] != undefined) return shits["SHIP"].modelDisplay;
	
	return "Z14";
}
public function PCShipCrewCapacity():int
{
	if(shits["SHIP"] != undefined) return shits["SHIP"].shipCrewCapacity();
	
	return 3;
}

public function hasCapitalShip():Boolean
{
	return false;
}