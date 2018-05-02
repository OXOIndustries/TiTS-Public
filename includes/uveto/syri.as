public function syriAtFreeezer():Boolean
{
	if ((syriQuestRunning() && flags["SYRIQUEST_MET_SYRI_AT_MAGLEV_STATION"] == 1) || syriQuestComplete()) return true;
	return false;
}

public function syriAtFreezerFirePitBonus(btnSlot:int = 0):void
{
	output("\n\nYou can see Syri hanging out at one of the trestle tables down here in the common room, enjoying a drink and messing around on a handheld holo-tablet. She's gotten buttoned up under her blue navy coat, with a pair of fluffy mitts covering her inner ears.");
	addButton(btnSlot,"Syri",syriQuestFreezer);
}
