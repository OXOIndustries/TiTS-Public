// This is like a "Shit in here is bad, fix it asap pls.
// Ideally, we should be working to ensure this file has no actual code in it.
// It's purpose is to store "unimplemented" functions for content in the pipeline, so we know where to look when we need to "finish" something
public function reahaIsCured():Boolean
{
	return false;
}

public function daneIsCrew():Boolean
{
	return false;
}

// 9999 - Bust display functions for New Candania stuffs! (move when implemented)
public function mountmeBustDisplay(attire:String = "normal"):String
{
	var bustName:String = "MOUNTME";
	
	switch(attire)
	{
		case "nude": bustName += "_NUDE"; break;
		case "bra": bustName += "_BRA"; break;
	}
	
	return bustName;
}

public function syriAtTheFreezer():Boolean
{
	return false;
}