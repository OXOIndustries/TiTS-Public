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
	
	if(attire == "nude") bustName += "_NUDE";
	else if(attire == "bra") bustName += "_BRA";
	
	return bustName;
}
public function rileyBustDisplay(attire:String = "normal"):String
{
	var bustName:String = "RILEY";
	
	if(attire == "nude") bustName += "_NUDE";
	else if(attire == "bra") bustName += "_BRA";
	
	// Tone phases
	if(flags["RILEY_TONE"] >= 90) bustName += "_3";
	else if(flags["RILEY_TONE"] >= 66) bustName += "_2";
	else if(flags["RILEY_TONE"] >= 33) bustName += "_1";
	else bustName += "_0";
	
	return bustName;
}

