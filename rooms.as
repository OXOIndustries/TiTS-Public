import roomClass;

var rooms:Array = new Array();
initializeRooms();
function initializeRooms():void {
	for(var x:int = 0; x < 10000; x++) {
		rooms[x] = new roomClass();
	}
}

//99. Ship Interior
rooms[99].roomName = "SHIP\nINTERIOR";
rooms[99].description = "The inside of your father's old Casstech Z14 is in remarkably great shape for such an old ship; the mechanics that were working on this really ought to be proud of themselves. Seats for two lie in the cockpit, and there is a servicable but small shower near the back. Three bunks are scattered around the cramped interior, providing barely ample room for you and your crew.";
rooms[99].planet = "PLANET: MHEN'GA";
rooms[99].system = "SYSTEM: ARA ARA";
rooms[99].outExit = shipLocation;
rooms[99].outText = "Exit";
rooms[99].runOnEnter = shipMenu;
rooms[99].addFlag(INDOOR);
rooms[99].addFlag(BED);

//100. Hotel Room
rooms[100].roomName = "HOTEL\nROOM";
rooms[100].description = "This small, station-bound room is attached to Anon's Bar and Board. The quarters are cramped, there are no windows, and worst of all, your cousin has a headstart on locking down your deceased father's fortune. Luckily, the galaxy is vast. Your cousin won't be claiming if anything for at least a few months if the scale of your father's challenge is anything like you expect. The door to the east is unlocked, leading back into the hallway above the bar. <b>Once you leave, it will seal shut behind you, since you only payed for one night.</b>";
rooms[100].planet = "TAVROS STATION";
rooms[100].system = "SYSTEM: KALAS";
rooms[100].eastExit = 101;
rooms[100].addFlag(INDOOR);

//101. Anon's Board Hall
rooms[101].roomName = "ANON'S BOARD\nHALL";
rooms[101].description = "Located at the top of a stairway above the bar, this short hallway stretches briefly to the north before coming to an unremarkable, metallic dead-end. Automated portals line the east and west sides, connecting to different rooms, their surfaces kept moderately clean but pitted with rust here or there. This isn't the kind of place you'd want to stay for long, if you could help it. Anon's Bar and Board lies down the steel-grated stairwell to the south.";
rooms[101].planet = "TAVROS STATION";
rooms[101].system = "SYSTEM: KALAS";
rooms[101].southExit = 102;
rooms[101].addFlag(INDOOR);

//102. Anon's Bar and Board
rooms[102].roomName = "ANON'S BAR\nAND BOARD";
rooms[102].description = "Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. A rickety metal stairway rises up to the north, leading to the board portion of the this establishment. You've already roomed there once, and the accomodations were far from great. A door to the west opens out into a central thoroughfare.";
rooms[102].planet = "TAVROS STATION";
rooms[102].system = "SYSTEM: KALAS";
rooms[102].northExit = 101;
rooms[102].westExit = 103;
rooms[102].addFlag(INDOOR);

//103. Merchant's Thoroughfare
rooms[103].roomName = "MERCHANT'S\nTHOROUGHFARE";
rooms[103].description = "The crowds in this part of the station would normally be particularly thick, but it looks like many of the local business have been shuttered, their owners likely trying their business out on the rim, profiteering off the planet rush. For now, Anon's Bar and Board looks to be open ot the east. It's interior promises cheap but delicious foods likely to broaden the waistline, but then again, what are you to expect from bar food? The express lifts have entrances here, able to take you to any level on the station if you head <b>in</b> the door.";
rooms[103].planet = "TAVROS STATION";
rooms[103].system = "SYSTEM: KALAS";
rooms[103].eastExit = 102;
rooms[103].inExit = 104;
rooms[103].addFlag(INDOOR);

//104. In The Lift - Merchant's Thoroughfare
rooms[104].roomName = "LIFT: MERCHANT\nDECK";
rooms[104].description = "Steady, mechanical thrums suffice the stuffy air inside this tube of metal and and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
rooms[104].planet = "TAVROS STATION";
rooms[104].system = "SYSTEM: KALAS";
rooms[104].outExit = 103;
rooms[104].addFlag(INDOOR);
rooms[104].runOnEnter = hangarBonus;

//105. The Hangar
rooms[105].roomName = "THE\nHANGAR";
rooms[105].description = "A sprawling, brightly lit hanger greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hanger like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.";
rooms[105].planet = "TAVROS STATION";
rooms[105].system = "SYSTEM: KALAS";
rooms[105].inExit = 106;
rooms[105].inText = "Lift";
rooms[105].addFlag(INDOOR);

//106. In The Lift - The Hangar
rooms[106].roomName = "LIFT: HANGAR\nDECK";
rooms[106].description = "Steady, mechanical thrums suffice the stuffy air inside this tube of metal and and plastic. There is a brass-hued railing to stablize oneself with during the highspeed travel through the kilometers-long station and a sturdy mechanical keypad with which to designate your target level. Much of the lift stations look to be inactive; right now, the hangar and the merchant's thoroughfare are the only areas reachable by lift.";
rooms[106].planet = "TAVROS STATION";
rooms[106].system = "SYSTEM: KALAS";
rooms[106].outExit = 105;
rooms[106].addFlag(INDOOR);
rooms[106].runOnEnter = hangarBonus;

function hangarBonus():Boolean {
	if(location == 104) {
		addButton(0,"ToHangar",move,106);
	}
	else if(location == 106) {
		addButton(0,"ToMerchant",move,104);
	}
	return false;
}


//0. Ship Hanger
rooms[0].roomName = "SHIP\nHANGAR";
rooms[0].description = "Though dubbed a hangar, this suspended platform is little more than an exposed landing pad. It's a hexagonal, steelcrete plate, one of dozens that ring the central elevator spire. Blinking lights ring the edges to guide you when taking off or landing, and to keep other ships from clipping the platform when seeking their own. An elevator door hangs open to the south, waiting for you to press the button that will take you back to the ground, while your ship remains parked here, ready to be entered.";
rooms[0].planet = "PLANET: MHEN'GA";
rooms[0].system = "SYSTEM: ARA ARA";
rooms[0].outExit = 1;
rooms[0].outText = "Down";
rooms[0].addFlag(OUTDOOR);

//1 - Spaceport Elevator
rooms[1].roomName = "SPACEPORT\nELEVATOR";
rooms[1].description = "A standard self-assembling cargo elevator towers overhead, connected to dozens of landing pads covered with brilliantly flashing lights. The supporting girders are stamped with the logo of Pyrite Heavy Industries, the subgroup of Pyrite Industries that handles the largest constructions. The whole thing still gleams like new, even in an environment so damp that the metal is sweating drops of condensation. The doors to the elevator are open, all you need to do is push the button to go back to your ship. Fences and the wall of a building to the east keep you penned in this area, but a doorway marked “Customs” to the east could be entered if you wish to explore.";
rooms[1].planet = "PLANET: MHEN'GA";
rooms[1].system = "SYSTEM: ARA ARA";
rooms[1].inExit = 0;
rooms[1].inText = "Up";
rooms[1].eastExit = 2;
rooms[1].addFlag(OUTDOOR);

//2 - Flahne’s Office
rooms[2].roomName = "CUSTOMS\nOFFICE";
rooms[2].description = "This office is one of many set up around the spaceport to process customs both coming and going. Other identical rooms can be spotted through doorways to the north, but they appear to be closed down or currently occupied at the moment. A single, large desk sits on the east side of the room, kept fairly tidy aside from a mug filled with lollipops and candy. A name placard proclaims the desk’s owner to be Flahne. A doorway to the west opens out back into the jungle at the base of an elevator. The door to the south is labelled 'Out to Esbeth.'";
rooms[2].planet = "PLANET: MHEN'GA";
rooms[2].system = "SYSTEM: ARA ARA";
rooms[2].westExit = 1;
rooms[2].southExit = 3;
rooms[2].runOnEnter = meetingFlahne;
rooms[2].addFlag(INDOOR);

//3. Esbeth’s Northern Path
rooms[3].roomName = "ESBETH'S\nNORTH PATH";
rooms[3].description = "This small jungle town, Esbeth, doesn’t even have proper roads. There’s a hard-packed path underfoot, still blackened in places from when some kind of torch was used to burn away the omnipresent overgrowth. Prefabricated buildings have sprung up on all sides of this east-west path, though the one to the north is the biggest and most secure looking by far. A sign marking it as the 'Office of Customs and Governance' hangs above the entrance, letting you know exactly what it is.";
rooms[3].planet = "PLANET: MHEN'GA";
rooms[3].system = "SYSTEM: ARA ARA";
rooms[3].northExit = 2;
rooms[3].westExit = 4;
rooms[3].eastExit = 16;
rooms[3].addFlag(OUTDOOR);

//4. The Northwest Corner of Esbeth
rooms[4].roomName = "NORTHWEST\nESBETH";
rooms[4].description = "Turning 90 degrees, the hard-packed path that serves as Esbeth’s only road hooks south and east from here, marking the northwest-most portion of town. A secure, barbed-wire-topped fence blocks off the north, though you can see the space port's cargo elevator stretching skyward on the other side. Farther to the northwest, you can see a series of towers with cannons mounted atop them, swiveling this way and that as they eye the burned-back jungle for danger.";
rooms[4].planet = "PLANET: MHEN'GA";
rooms[4].system = "SYSTEM: ARA ARA";
rooms[4].southExit = 5;
rooms[4].eastExit = 3;
rooms[4].addFlag(OUTDOOR);

//5. Esbeth’s Western Path
rooms[5].roomName = "WEST\nESBETH";
rooms[5].description = "The western side of Esbeth is barely more than the tamped down path you now tread. Self-assembling, pre-fabricated houses have been set up here and there by the settlers brave enough to try their luck on a new, untested planet. Thus far, Mhen’ga has not sent its jungles in to claim the small town, but that doesn’t mean it won’t. The path bends forther to the north and continues straight on to the south. The buildings are all closed and locked here, for now.";
rooms[5].planet = "PLANET: MHEN'GA";
rooms[5].system = "SYSTEM: ARA ARA";
rooms[5].southExit = 6;
rooms[5].northExit = 4;
rooms[5].addFlag(OUTDOOR);

//6. Esbeth’s Western Path
rooms[6].roomName = "WEST\nESBETH";
rooms[6].description = "The western path continues north and south along the western edge of town. You can see guard towers rising to the west, mounted with automated guns. The ground here is scorched black; whenever they cleared the jungle, they obviously burned this part a bit too long. You can still smell the charred carbon hanging in the air.";
rooms[6].planet = "PLANET: MHEN'GA";
rooms[6].system = "SYSTEM: ARA ARA";
rooms[6].northExit = 5;
rooms[6].southExit = 7;
rooms[6].addFlag(OUTDOOR);

//7. The Southwest Corner of Esbeth
rooms[7].roomName = "SOUTHWEST\nESBETH";
rooms[7].description = "Here, Esbeth’s single road bends north and east, wrapping around this corner of the town. There isn’t much to see here, just some locked domiciles to the south and west and the same guard towers that ring the rest of the settlement. Distantly, you can make out the spaceport that towers over the north side of the town and your ship perched high on its landing pad.";
rooms[7].planet = "PLANET: MHEN'GA";
rooms[7].system = "SYSTEM: ARA ARA";
rooms[7].northExit = 6;
rooms[7].eastExit = 8;
rooms[7].addFlag(OUTDOOR);

//8. Esbeth’s Southern Path
rooms[8].roomName = "SOUTH\nESBETH";
rooms[8].description = "The southern portion of Esbeth’s lone, circular road stretches east and west from here. To the west, it curls up to the north in a 90 degree bend. The scent of sweet alien flowers graces your nose here, a pleasant distraction from the aroma of charred-away vegetation and freshly installed plumbing that plagues most of this place. You can see the trees in the distance, dark and foreboding but undoubtedly full of life and riches. To the south is what looks like a small, rambling junkyard, overflowing with spaceship and auto scrap. There is a flat-roofed stone hut buried in the detritus - a wooden sign bolted onto the front declares it to be THE ART OF SCRAPYARD MAINTENANCE. The ‘O’ is a painted Yin-Yang symbol.";
rooms[8].planet = "PLANET: MHEN'GA";
rooms[8].system = "SYSTEM: ARA ARA";
rooms[8].westExit = 7;
rooms[8].eastExit = 9;
rooms[8].southExit = 88;
rooms[8].addFlag(OUTDOOR);

//9. Esbeth’s Southern Path
rooms[9].roomName = "SOUTH\nESBETH";
rooms[9].description = "Traffic on these hard-packed paths is light the whole way around the small town of Esbeth. No matter where you are, you usually don’t see more than a few people. Most of them appear to be townsfolk on the way to some errand or in the process of improving a ramshackle abode, but every now and again you see someone who is out hunting and prospecting like yourself, kitted out for a fight and looking at everything with sharp eyes. The buildings here do not seem to be of interest, and the road goes on to the east and west.";
rooms[9].planet = "PLANET: MHEN'GA";
rooms[9].system = "SYSTEM: ARA ARA";
rooms[9].westExit = 8;
rooms[9].eastExit = 10;
rooms[9].addFlag(OUTDOOR);

//10. Esbeth’s Southern Path
rooms[10].roomName = "SOUTH\nESBETH";
rooms[10].description = "A gust of pollen tickles a sneeze out of your nose as you traverse the southern edge of the town of Esbeth. The structures to the north and south are simple and plain, guarded with closed, locked doors that make it obvious there’s nothing to be done inside. Townspeople give you a respectful nod as they pass but otherwise want nothing to do with you. While the road goes east and west, just east of hear it doglegs north.";
rooms[10].planet = "PLANET: MHEN'GA";
rooms[10].system = "SYSTEM: ARA ARA";
rooms[10].westExit = 9;
rooms[10].eastExit = 11;
rooms[10].northExit = 89;
rooms[10].addFlag(OUTDOOR);
	
//11. The Southeast Corner of Esbeth
rooms[11].roomName = "SOUTHEAST\nESBETH";
rooms[11].description = "The packed earth of Esbeth’s only path veers north and west away from you on its circuit of the town. To the southeast, you can see a simple tower built of plain girders that supports an automated turret. It swivels this way and that, a silent sentinel that protects the town from whatever horrors lurk in the jungle. There are blessedly few craters around the burned-out periphery, indicating that they haven’t had to fire all that often, thankfully.";
rooms[11].planet = "PLANET: MHEN'GA";
rooms[11].system = "SYSTEM: ARA ARA";
rooms[11].northExit = 12;
rooms[11].westExit = 10;
rooms[11].addFlag(OUTDOOR);

//12. Esbeth’s Eastern Path
rooms[12].roomName = "EAST\nESBETH";
rooms[12].description = "There are few people around this area of town and even fewer houses. Perhaps this is due to this place’s proximity to the town’s eastern exit. Just to the north, a path splits off to the east towards the jungle. Now and again, you can see individuals like yourself venturing out to brave the dangers and discover what treasures they can. Watchtowers guard the town’s safekeeping, and the jungle has been burnt back far enough to give the autoguns on top of them a good sight line. You suppose this town is about as safe a place as you can find in the untamed wilderness.";
rooms[12].planet = "PLANET: MHEN'GA";
rooms[12].system = "SYSTEM: ARA ARA";
rooms[12].southExit = 11;
rooms[12].northExit = 13;
rooms[12].addFlag(OUTDOOR);

//13. Esbeth’s Eastern Path at the Entrance
rooms[13].roomName = "EAST ESBETH\nENTRANCE";
rooms[13].description = "The entrance to Esbeth is positioned just to the east of here. It is only an entrance in name, however. The town has no proper walls just yet, just a sets of towers providing overwatch against the ever-growing foliage. The entrance is a narrow, barely-trod path that disappears into the trees to the east. Midway towards the forest, there’s a small sign staked, though you’re still too far away to read it. Esbeth’s circuitous path continues north and south from here, following the edge of the town.";
rooms[13].planet = "PLANET: MHEN'GA";
rooms[13].system = "SYSTEM: ARA ARA";
rooms[13].southExit = 12;
rooms[13].northExit = 14;
rooms[13].eastExit = 19;
rooms[13].addFlag(OUTDOOR);

//14. The Northeastern Corner of Esbeth
rooms[14].roomName = "NORTHEAST\nESBETH";
rooms[14].description = "Esbeth’s single road twists to the south and west here, spoking out in straight lines that run in those directions. The path here is as barren and burned-out as everywhere else in town, but the houses on either side are fresh and new, though a few show places of rust already. To the south, you can see the eastern exit of town splitting off from the roadway. There are occasional other adventurers, like you on their way, but they pay you no mind.";
rooms[14].planet = "PLANET: MHEN'GA";
rooms[14].system = "SYSTEM: ARA ARA";
rooms[14].westExit = 15;
rooms[14].southExit = 13;
rooms[14].addFlag(OUTDOOR);

//15. Esbeth’s Northern Path
rooms[15].roomName = "NORTH\nESBETH";
rooms[15].description = "Prefabricated structures line this busy road to the north and south. It’s busier here than it is much further east, most likely due to the mead hall that lies northwest of here. The other buildings all appear to be residences, with closed, locked doors. Either their owners are out and about or they don’t wish to be disturbed by a random explorer. A guard tower can be seen to the northeast, looming over the city to provide protection.";
rooms[15].planet = "PLANET: MHEN'GA";
rooms[15].system = "SYSTEM: ARA ARA";
rooms[15].westExit = 16;
rooms[15].eastExit = 14;
rooms[15].addFlag(OUTDOOR);

//16. Esbeth’s Northern Path
rooms[16].roomName = "NORTH\nESBETH";
rooms[16].description = "The simple path you tread upon heads straight to the east and west from here. Foot traffic is high here, either because of the customs building to the northwest or the bar to the north. Closer inspection reveals the northern building to actually be a mead hall of some description - “Burt’s Badass Mead Hall” it says on the sign. This building actually integrates some wood from the jungle into its construction, contrasting quite noticeably with its neighbors.";
rooms[16].planet = "PLANET: MHEN'GA";
rooms[16].system = "SYSTEM: ARA ARA";
rooms[16].westExit = 3;
rooms[16].eastExit = 15;
rooms[16].addFlag(OUTDOOR);

//17. Burt’s Badass Whatever
//9999

//18. Burt’s Badass Whatever Part. II
//9999

//19. The Eastern Exit of Esbeth
rooms[19].roomName = "EAST ESBETH\nEXIT";
rooms[19].description = "This scorched path is half as wide as the ones in the town of Esbeth. Grass is already growing back along the edges of it. Jutting up alongside, a single sign post warns: <i>Danger! Do not enter the jungle unarmed. Native creatures are proven to be both hostile and extremely sexual.</i> Huge trees loom up to the east where the burn-out ends, swallowing the path as it winds between them. If you go east, you’ll be in the jungle. The town of Esbeth lies a short walk to the west.";
rooms[19].planet = "PLANET: MHEN'GA";
rooms[19].system = "SYSTEM: ARA ARA";
rooms[19].westExit = 13;
rooms[19].eastExit = 20;
rooms[19].addFlag(OUTDOOR);

//20. The Edge of the Jungle
rooms[20].roomName = "JUNGLE\nEDGE";
rooms[20].description = "The shadows of alien trees shroud you in darkness here, though your eyes soon adjust. The path, which is obviously man-made on its way back to the west. Here, it has an offshoot to the south and a simple footpath to the east. Neither seems particularly straight, perhaps due to the huge trees, some of which are well over ten feet around. Foreign howls, birdcalls, and rustling vegetation keep your nerves on end. <b>This is not a safe place.</b>";
rooms[20].planet = "PLANET: MHEN'GA";
rooms[20].system = "SYSTEM: ARA ARA";
rooms[20].eastExit = 21;
rooms[20].westExit = 19;
rooms[20].addFlag(OUTDOOR);

//21. A Bend in the Fern-Shrouded Path
rooms[21].roomName = "FERNGROWTH\nPATH";
rooms[21].description = "Stepping carefully through the brush, you do your best to stay on the trail. The foliage is so thick that if you were to leave it, you’d be lost in time. Huge, alien ferns gird the sides of the path, and you can see that something has been cutting them back to keep the path clear. Whether other adventurers from Esbeth are responsible or some of this locals is unclear. The air is humid and hot, not oppressively so. The path winds northward, deeper into the jungle, and west, back towards the open air around Esbeth.";
rooms[21].planet = "PLANET: MHEN'GA";
rooms[21].system = "SYSTEM: ARA ARA";
rooms[21].northExit = 22;
rooms[21].westExit = 20;
rooms[21].addFlag(OUTDOOR);

//22. A Fern-Shrouded Path
rooms[22].roomName = "FERNGROWTH\nPATH";
rooms[22].description = "The air here is thick with pollen, nearly bringing a sneeze to your nose as you look about. Dozens of gigantic trees stretch toward the sky, so high that you’re not even sure how high they reach. You’d need some decent equipment to even begin to hazard a guess. Ferns nearly as tall as you have grown up on all sides. The path itself is narrow and packed hard by traffic, unlike the soft earth alongside it.";
rooms[22].planet = "PLANET: MHEN'GA";
rooms[22].system = "SYSTEM: ARA ARA";
rooms[22].southExit = 21;
rooms[22].addFlag(OUTDOOR);

/*
23. A Bend in the Fern-Shrouded Path
	The claustrophobic path twists here, cocked to wind north and west around the trunk of a giant, gray-barked tree. The lower branches are covered with leaves of the deepest purple, large, wet looking leaves that seem to dip under their own weight. No sunlight reaches past the upper canopy to fall on them, but the tree is producing them all the same. The ferns around the path are tall and alien but undoubtedly similar to Earth's. Convergent evolution at work, you suppose.
24. A Fern-Shrouded Path
	Hanging ominously overhead, gigantic ferns tower over the path. While this casts the area into deep shadow, it also broadens the navigable area quite nicely, allowing you to see something besides bushy green leaves for a chance. The ground on either side is a deep, rich brown, and moist with water that constantly seems to drip from the plants above. It is bare except for the ferns and a flat, round disks that you surmise are mushroom-like in nature.
25. A Fern-Shrouded Path
	Ferns sprout up on all sides of the path, but for some reason, they haven't encroached on it just yet. These particular specimens reach up about four feet, but just to the west there is a patch of them so giant that they tower overhead. You can also see that the vegetation and terrain around the path changes wildly to the east. There, the paths are much more open and the vegetation less dense. How odd.

26. The Intersection of Ferns and Lichens
	The ferns that hug the pathway to the west die off here under the weight of some very aggressive lichens that have scoured them away. The western path fades here, but the ground is open to the north and south so that you can tread across soft earth in whichever direction you like. A copse of gray trees covered in bioluminescent lichens grows to the east, the trunks so close together that there's no decent way to travel past them. The colorful composite organisms also carpet the ground in a blanket of shifting, almost psychedelic hues.
27. A Bend in the Lichens
	Twisting away, the wall of grown-over trees curves north and east from here, leaving you free to walk in either direction unhindered. Unfortunately, thorny bushes nearly six-feet high have grown up out of the lichen-covered ground to the west and south. What little you can see beyond them seems deeper, darker, and danker than the area you now inhabit. Glowing yellow lichens bathe the area around you in gentle luminance as you weigh your options.
28. The Lichen-Covered Jungle
	Hardly anything seems to grow here but trees, thorns, and lichens, and the lichens have grown over both of the former. The trees grow so closely together to the north that it would be impossible to squeeze between, while the thorns to the south are so large and thick that getting through them would be a huge pain. Purplish lights twinkle from some of the lichens around you, and it seems like every new step exposes you to a new color or trait from the oddly earth-like, indigenous life-form.
29. The Intersection of Lichens and Giant Ironwoods
	Here, dozens of multihued lichens clash against a larger and entirely different type of jungle life. Gigantic trees, each at least a dozen feet around, tower over you. Their rusty red bark gives them a surprisingly familiar appearance until you brush your hand against one. The stuff flakes right off on your fingers! Underneath where you touched shines a silvery metallic color. These trees' bark is literally iron hard.
30. Between Lichens and Ironwoods
	There's plenty of space to explore on this north-south causeway thanks to the lichen that seems to have eaten back most of the other plant-life. Tight clusters of trees block the way west, and another gigantic variety sprouts up to the east, covered in rust-red bark that closer inspection reveals to be actual iron. The lichens bathe everything but the trees to the east in gentle bioluminescence. They can't seem to grow on the ferrous coverings of the eastern trunks and die off that way.

31. Between Lichens and Ironwoods
	Springingly lightly under your [feet] as you move, the soft soil and lichenous mulch below makes your journey surprisingly pleasant, aside from the omnipresent humidity. A wall of gray trees blocks the way west, and a trunk as big as three tanks put together blocks the east. Buzzing insects swirl around everywhere, busy on their own errands. Thankfully they don't seem to have much interest in you, perhaps due to your alien physiology.
32. Between Lichens and Ironwoods
	The jungle here is marvelously colorful. Hues of verdant green swim between vibrant yellows and lurid reds, shining up from the interwoven lichens in a rainbow of beauteous light. Whenever you press down upon some of it, the light brightens, lighting the way as you go. Ferrous trees as big as buildings rise up to the east, and smaller gray ones to the west cluster so tightly that you cannot go in that direction.
	*/
	
//88. Scrapyard Maintenance - see scrapyard.as for more info!
rooms[88].roomName = "SCRAPYARD\nMAINTENANCE";
rooms[88].description = "";
rooms[88].runOnEnter = scrapyardMaintenance;
rooms[88].planet = "PLANET: MHEN'GA";
rooms[88].system = "SYSTEM: ARA ARA";
rooms[88].northExit = 8;
rooms[88].addFlag(INDOOR);

//89. Penny's Office. See Penny.as for more info. - see scrapyard.as for more info!
rooms[89].roomName = "U.G.C. PEACE-\nKEEPERS";
rooms[89].description = "This interior of this office is painted a cool, soothing blue, but even that can't hide the fact that nobody wants to have to spend much time here. The whole place looks stoud and secure, even the doors and windows. The latter of which bear solid metal bars. A few doors occupy the far side of the room, but they're on the opposite side of a large, imposing desk. Computer equipment sits in a high pile, capped with an inactive light, the kind of which you'd expect to see on top of a hovercar or police cruiser.";
rooms[89].runOnEnter = pennysOffice;
rooms[89].planet = "PLANET: MHEN'GA";
rooms[89].system = "SYSTEM: ARA ARA";
rooms[89].southExit = 10;
rooms[89].addFlag(INDOOR);

