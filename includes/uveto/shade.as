public function showShadeBust(nude:Boolean = false):void
{
	if(nude) showBust("SHADE_NUDE");
	//else if(9999) showBust("SHADE_JEANS");
	//else if(9999) showBust("SHADE_SHIRT");
	//else if(9999) showBust("SHADE_SWEATER");
	else showBust("SHADE");
}

/* Shade Expansion 1: Ballad of the Ice Queen */
// by Savin

// Shade Settings
// So, Shade's a fairly complex character! She's got a lot of settings/states that have come up already in her adventures, so let's round them all up!

// Alive / Dead. Obviously, DeadShade isn't going to be doing much, though she'll affect Astra a lot.
public function shadeIsDead():Boolean
{
	if(flags["KQ2_SHADE_DEAD"] != undefined) return true;
	return false;
}
// Enemy / Not Friend / Friend / Lover. If Shade was never interacted with in a positive way (ie, you fought her in KaraQuest 1), she's an Enemy. If the player betrayed Shade in KQ2 and didn't make a good case to her afterwards, she's Not Friend. If you've been buddy-buddy with her so far (Helped her out in KQ1 or didn't do KQ2), she'll be your Friend. And of course, if you've fucked before and would otherwise be Friends, she's a Lover.
public function shadeIsFriend():Boolean
{
	if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined || flags["LOST_TO_SHADE_WITH_KARA"] != undefined) return false;
	if(flags["SHADE_DISABLED"] == 1) return false;
	return true;
}
public function shadeIsLover():Boolean
{
	if(shadeIsFriend() && flags["SEXED_SHADE"] != undefined) return true;
	return false;
}
// Enemy / Not Friend Shade don't want anything to do with you, and won't appear much here. She might show up in Astra's content, though.
public function shadeIsEnemy():Boolean
{
	if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined || flags["LOST_TO_SHADE_WITH_KARA"] != undefined) return true;
	return false;
}
public function shadeIsNotFriend():Boolean
{
	return (!shadeIsFriend());
}
// Siblings / SecretSiblings / NotSiblings. If both Shade and the PC know they're related, they're Siblings. If only the PC knows, they're SecretSiblings. Shade might find out later, though! Of course, if neither knows, they're effectively NotSiblings.
public function shadeIsSiblings():Boolean
{
	return (flags["TOLD_SHADE_SHES_YER_SIS"] == 1 || flags["SHADE_IS_YER_SIS"] != undefined);
}
public function shadeIsSecretSiblings():Boolean
{
	return (flags["TOLD_SHADE_SHES_YER_SIS"] == -1);
}
public function shadeIsNotSiblings():Boolean
{
	return (flags["TOLD_SHADE_SHES_YER_SIS"] == undefined);
}


