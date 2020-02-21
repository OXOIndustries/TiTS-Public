//Doing it this way seemed to make more sense than setting his _neverSerialize to false because AFAIK
//that increases load time and whether he has a cock is the only thing you can change about him
public function isSydianHerm():Boolean
{
	if (flags["SYDIAN_CBOY_HAS_COCK"]) return true;
	return false;
}
public function encounterSydianCboy():void
{

}