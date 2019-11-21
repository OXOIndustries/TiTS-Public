import classes.RoomClass;
public function initTavrosRooms():void
{
	//Room for holding PC with no exits for oddball locations that are not mapped
	rooms["TAVROS_TEMPO"] = new RoomClass(this);
	rooms["TAVROS_TEMPO"].roomName = "\nROOM";
	rooms["TAVROS_TEMPO"].description = "";
	rooms["TAVROS_TEMPO"].planet = "TAVROS STATION";
	rooms["TAVROS_TEMPO"].system = "SYSTEM: KALAS";
	rooms["TAVROS_TEMPO"].moveMinutes = 1;
	rooms["TAVROS_TEMPO"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS_TEMPO"].addFlag(GLOBAL.PRIVATE);

	rooms["HOTEL ROOM"] = new RoomClass(this);
	rooms["HOTEL ROOM"].roomName = "HOTEL\nROOM";
	rooms["HOTEL ROOM"].description = "This small, station-bound room is attached to Anon’s Bar and Board. The quarters are cramped, there are no windows, and worst of all, your cousin has a headstart on locking down your deceased father’s fortune. Luckily, the galaxy is vast. Your cousin won’t be claiming anything for at least a few months if the scale of your father’s challenge is anything like you expect. The door to the east is unlocked, leading back into the hallway above the bar. <b>Once you leave, it will seal shut behind you, since you only paid for one night.</b>";
	rooms["HOTEL ROOM"].planet = "TAVROS STATION";
	rooms["HOTEL ROOM"].system = "SYSTEM: KALAS";
	rooms["HOTEL ROOM"].eastExit = "ANON'S BOARD HALL";
	rooms["HOTEL ROOM"].moveMinutes = 1;
	rooms["HOTEL ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["HOTEL ROOM"].addFlag(GLOBAL.PRIVATE);
	
	// SX1 Rooms
	rooms["SX1 FAKE ELEVATOR"] = new RoomClass(this);
	rooms["SX1 FAKE ELEVATOR"].eastExit = "SX1 FAKE FIGHT ROOM";
	rooms["SX1 FAKE ELEVATOR"].addFlag(GLOBAL.INDOOR);
	rooms["SX1 FAKE ELEVATOR"].addFlag(GLOBAL.LIFTDOWN);
	
	rooms["SX1 FAKE FIGHT ROOM"] = new RoomClass(this);
	rooms["SX1 FAKE FIGHT ROOM"].westExit = "SX1 FAKE ELEVATOR";
	rooms["SX1 FAKE FIGHT ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["SX1 FAKE FIGHT ROOM"].addFlag(GLOBAL.PRIVATE);
	
	rooms["HOTEL CORRIDOR"] = new RoomClass(this);
	rooms["HOTEL CORRIDOR"].roomName = "\nCORRIDOR";
	rooms["HOTEL CORRIDOR"].description = "A small, cramped corridor connects many of the rooms-for-rent offered at Anon’s Bar and Board, locked away behind a security acccess door to keep out ‘undesireables’. The furnishings are cheap, the walls are dank and horrible, and the floor is a mess. Not that it matters much; not like you’d willingly spend much time in a corridor.";
	rooms["HOTEL CORRIDOR"].planet = "TAVROS STATION";
	rooms["HOTEL CORRIDOR"].system = "SYSTEM: KALAS";
	rooms["HOTEL CORRIDOR"].moveMinutes = 1;
	rooms["HOTEL CORRIDOR"].westExit = "ANON'S BOARD HALL";
	rooms["HOTEL CORRIDOR"].southExit = "CALLGIRL ROOM";
	rooms["HOTEL CORRIDOR"].eastExit = "SX1 RESCUE ROOM";
	rooms["HOTEL CORRIDOR"].addFlag(GLOBAL.INDOOR);
	rooms["HOTEL CORRIDOR"].addFlag(GLOBAL.PRIVATE);
	
	// Basically decoration room, player (should) never actually be able to enter it properly.
	rooms["CALLGIRL ROOM"] = new RoomClass(this);
	rooms["CALLGIRL ROOM"].roomName = "CALLGIRL’S\nROOM";
	rooms["CALLGIRL ROOM"].planet = "TAVROS STATION";
	rooms["CALLGIRL ROOM"].system = "SYSTEM: KALAS";
	rooms["CALLGIRL ROOM"].northExit = "HOTEL CORRIDOR";
	rooms["CALLGIRL ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["CALLGIRL ROOM"].addFlag(GLOBAL.PRIVATE);
	rooms["CALLGIRL ROOM"].addFlag(GLOBAL.NPC);
	
	rooms["SX1 RESCUE ROOM"] = new RoomClass(this);
	rooms["SX1 RESCUE ROOM"].roomName = "\nROOM";
	rooms["SX1 RESCUE ROOM"].planet = "TAVROS STATION";
	rooms["SX1 RESCUE ROOM"].system = "SYSTEM: KALAS";
	rooms["SX1 RESCUE ROOM"].westExit = "HOTEL CORRIDOR";
	rooms["SX1 RESCUE ROOM"].moveMinutes = 1;
	rooms["SX1 RESCUE ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["SX1 RESCUE ROOM"].addFlag(GLOBAL.PRIVATE);

	//101. Anon's Board Hall
	rooms["ANON'S BOARD HALL"] = new RoomClass(this);
	rooms["ANON'S BOARD HALL"].roomName = "ANON’S BOARD\nHALL";
	rooms["ANON'S BOARD HALL"].description = "Located at the top of a stairway above the bar, this short hallway stretches briefly to the north before coming to an unremarkable, metallic dead-end. Automated doorways line the east and west sides, connecting to different rooms, their surfaces kept moderately clean but pitted with rust here or there. This isn’t the kind of place you’d want to stay for long, if you could help it. Anon’s Bar and Board lies down the steel-grated stairwell to the south.";
	rooms["ANON'S BOARD HALL"].planet = "TAVROS STATION";
	rooms["ANON'S BOARD HALL"].system = "SYSTEM: KALAS";
	rooms["ANON'S BOARD HALL"].southExit = "ANON'S BAR AND BOARD";
	rooms["ANON'S BOARD HALL"].runOnEnter = anonsBoardBonus;
	rooms["ANON'S BOARD HALL"].moveMinutes = 1;
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.INDOOR);
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.PUBLIC);
	rooms["ANON'S BOARD HALL"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	//102 "ANON'S BAR AND BOARD". Anon's Bar and Board
	rooms["ANON'S BAR AND BOARD"] = new RoomClass(this);
	rooms["ANON'S BAR AND BOARD"].roomName = "ANON’S BAR\nAND BOARD";
	rooms["ANON'S BAR AND BOARD"].description = "Heady alcoholic scents combine with drug-laced smoke and salty food to give this place the unquestionable aroma of a seedy bar. Three-breasted waitresses balancing trays full of drinks one-handed sashay around in short skirts and sheer tops, their gait made awkward by their three legs and small feet. A rickety metal stairway rises up to the north, leading to the board portion of this establishment. You’ve already roomed there once, and the accomodations were far from great. A door to the west opens out into a central thoroughfare. To the east is a quieter back room.";
	rooms["ANON'S BAR AND BOARD"].planet = "TAVROS STATION";
	rooms["ANON'S BAR AND BOARD"].system = "SYSTEM: KALAS";
	rooms["ANON'S BAR AND BOARD"].northExit = "ANON'S BOARD HALL";
	rooms["ANON'S BAR AND BOARD"].westExit = "MERCHANT'S THOROUGHFARE";
	rooms["ANON'S BAR AND BOARD"].eastExit = "ANON'S BACK END";
	rooms["ANON'S BAR AND BOARD"].runOnEnter = anonsBarAddendums;
	rooms["ANON'S BAR AND BOARD"].moveMinutes = 1;
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.INDOOR);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.BAR);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.PUBLIC);
	rooms["ANON'S BAR AND BOARD"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	//103 "MERCHANT'S THOROUGHFARE". Merchant's Thoroughfare
	rooms["MERCHANT'S THOROUGHFARE"] = new RoomClass(this);
	rooms["MERCHANT'S THOROUGHFARE"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE"].description = "The crowds in this part of the station are particularly thick thanks to the rush. You hear talk of old shops closing, their owners out trawling the rim, trying to strike it rich, while newer stores have opened their doors to take their place. For now, Anon’s Bar and Board is ready for your business to the east. Its interior promises cheap but delicious foods likely to broaden the waistline, but then again, what are you to expect from bar food?";
	rooms["MERCHANT'S THOROUGHFARE"].planet = "TAVROS STATION";
	rooms["MERCHANT'S THOROUGHFARE"].system = "SYSTEM: KALAS";
	rooms["MERCHANT'S THOROUGHFARE"].eastExit = "ANON'S BAR AND BOARD";
	rooms["MERCHANT'S THOROUGHFARE"].westExit = "";
	rooms["MERCHANT'S THOROUGHFARE"].southExit = "MERCHANT'S THOROUGHFARE2";
	rooms["MERCHANT'S THOROUGHFARE"].northExit = "110";
	rooms["MERCHANT'S THOROUGHFARE"].moveMinutes = 2;
	//rooms["MERCHANT'S THOROUGHFARE"].inExit = "LIFT: MERCHANT DECK";
	//rooms["MERCHANT'S THOROUGHFARE"].inText = "Lift";
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.INDOOR);
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.PUBLIC);
	rooms["MERCHANT'S THOROUGHFARE"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	rooms["MERCHANT'S THOROUGHFARE2"] = new RoomClass(this);
	rooms["MERCHANT'S THOROUGHFARE2"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE2"].description = "The busy merchant’s deck sprawls out before you. Arranged in a circular pattern, it winds its way around the entire station filled with shops of every style and variety. A cornucopia of races attend to their business here, forming a crowd as dense and multicultered as any you’ve seen before. People of all walks of life have come together here, united by the Rush, or at least united by a desire to eke a profit out of it.";

	//OLD DESC: UPDATE WITH TAVROS EXPACKThe station curves away to the north and east from here, though the eastern passages are presently shuttered for maintenance. ";
	rooms["MERCHANT'S THOROUGHFARE2"].planet = "TAVROS STATION";
	rooms["MERCHANT'S THOROUGHFARE2"].system = "SYSTEM: KALAS";
	rooms["MERCHANT'S THOROUGHFARE2"].westExit = "LIFT: MERCHANT DECK";
	rooms["MERCHANT'S THOROUGHFARE2"].northExit = "MERCHANT'S THOROUGHFARE";
	rooms["MERCHANT'S THOROUGHFARE2"].southExit = "9018";
	rooms["MERCHANT'S THOROUGHFARE2"].eastExit = "";
	rooms["MERCHANT'S THOROUGHFARE2"].moveMinutes = 2;
	//rooms["MERCHANT'S THOROUGHFARE2"].inExit = "LIFT: MERCHANT DECK";
	//rooms["MERCHANT'S THOROUGHFARE2"].inText = "Lift";
	rooms["MERCHANT'S THOROUGHFARE2"].addFlag(GLOBAL.INDOOR);
	rooms["MERCHANT'S THOROUGHFARE2"].addFlag(GLOBAL.PUBLIC);
	rooms["MERCHANT'S THOROUGHFARE2"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["MERCHANT'S THOROUGHFARE2"].runOnEnter = merchantThoroughfareBonus;

	rooms["SHEAR BEAUTY"] = new RoomClass(this);
	rooms["SHEAR BEAUTY"].roomName = "SHEAR\nBEAUTY";
	rooms["SHEAR BEAUTY"].description = "";
	rooms["SHEAR BEAUTY"].planet = "TAVROS STATION";
	rooms["SHEAR BEAUTY"].system = "SYSTEM: KALAS";
	rooms["SHEAR BEAUTY"].southExit = "9015";
	rooms["SHEAR BEAUTY"].moveMinutes = 1;
	rooms["SHEAR BEAUTY"].runOnEnter = shearBeautyBonusFunc;
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.INDOOR);
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.PUBLIC);
	//rooms["SHEAR BEAUTY"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["SHEAR BEAUTY"].addFlag(GLOBAL.COMMERCE);

	//104 "LIFT: MERCHANT DECK". In The Lift - Merchant's Thoroughfare
	rooms["LIFT: MERCHANT DECK"] = new RoomClass(this);
	rooms["LIFT: MERCHANT DECK"].roomName = "LIFT:\nMERCHANT";
	rooms["LIFT: MERCHANT DECK"].description = "";
	rooms["LIFT: MERCHANT DECK"].planet = "TAVROS STATION";
	rooms["LIFT: MERCHANT DECK"].system = "SYSTEM: KALAS";
	rooms["LIFT: MERCHANT DECK"].eastExit = "MERCHANT'S THOROUGHFARE2";
	rooms["LIFT: MERCHANT DECK"].moveMinutes = 1;
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.INDOOR);
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.PUBLIC);
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.LIFTDOWN);
	rooms["LIFT: MERCHANT DECK"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["LIFT: MERCHANT DECK"].runOnEnter = hangarBonus;

	//105 "TAVROS HANGAR". The Hangar
	rooms["TAVROS HANGAR"] = new RoomClass(this);
	rooms["TAVROS HANGAR"].roomName = "THE\nHANGAR";
	rooms["TAVROS HANGAR"].description = "A sprawling, brightly lit hangar greets your eyes, empty save for a single ship near the back. Your gaze is pulled away from the distant craft by the sheer size of the enclosure. A hangar like this must have cost your father a veritable fortune to buy out - not much considering how wealthy he was, but no insignificant chunk of change. Magnetically-bounded plasma shields hold in the atmosphere while remaining transparent enough for you to view the nearby warp gate and inky blackness beyond. Perhaps the only thing this place couldn’t hold would be a capital ship, but a number of moorings with connective umbilicals stand by to tether one outside in that extreme scenario.";
	rooms["TAVROS HANGAR"].planet = "TAVROS STATION";
	rooms["TAVROS HANGAR"].system = "SYSTEM: KALAS";
	rooms["TAVROS HANGAR"].westExit = "TAVROS LIFT";
	rooms["TAVROS HANGAR"].moveMinutes = 2;
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.PUBLIC);
	rooms["TAVROS HANGAR"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["TAVROS HANGAR"].runOnEnter = tavrosHangarStuff;

	//106"TAVROS LIFT". In The Lift - The Hangar
	rooms["TAVROS LIFT"] = new RoomClass(this);
	rooms["TAVROS LIFT"].roomName = "LIFT:\nHANGAR";
	rooms["TAVROS LIFT"].description = "";
	rooms["TAVROS LIFT"].planet = "TAVROS STATION";
	rooms["TAVROS LIFT"].system = "SYSTEM: KALAS";
	rooms["TAVROS LIFT"].eastExit = "TAVROS HANGAR";
	rooms["TAVROS LIFT"].moveMinutes = 1;
	//rooms["TAVROS LIFT"].inExit = "LIFT: MERCHANT DECK";
	//rooms["TAVROS LIFT"].inText = "ToMerchant";
	rooms["TAVROS LIFT"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS LIFT"].addFlag(GLOBAL.LIFTUP);
	rooms["TAVROS LIFT"].addFlag(GLOBAL.PUBLIC);
	rooms["TAVROS LIFT"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["TAVROS LIFT"].runOnEnter = hangarBonus;

	//107 The Dark Chrysalis
	rooms["DARK CHRYSALIS"] = new RoomClass(this);
	rooms["DARK CHRYSALIS"].roomName = "SHOP: DARK\nCHRYSALIS";
	rooms["DARK CHRYSALIS"].description = "";
	rooms["DARK CHRYSALIS"].planet = "TAVROS STATION";
	rooms["DARK CHRYSALIS"].system = "SYSTEM: KALAS";
	rooms["DARK CHRYSALIS"].westExit = "9018";
	rooms["DARK CHRYSALIS"].moveMinutes = 1;
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.INDOOR);
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.COMMERCE);
	rooms["DARK CHRYSALIS"].addFlag(GLOBAL.PUBLIC);
	rooms["DARK CHRYSALIS"].runOnEnter = seraBonusFunction;

	//108 "FUR EFFECT" Fur Effect
	rooms["FUR EFFECT"] = new RoomClass(this);
	rooms["FUR EFFECT"].roomName = "SHOP:\nFUR EFFECT";
	rooms["FUR EFFECT"].description = "";
	rooms["FUR EFFECT"].planet = "TAVROS STATION";
	rooms["FUR EFFECT"].system = "SYSTEM: KALAS";
	rooms["FUR EFFECT"].eastExit = "9018";
	rooms["FUR EFFECT"].moveMinutes = 1;
	rooms["FUR EFFECT"].addFlag(GLOBAL.INDOOR);
	rooms["FUR EFFECT"].addFlag(GLOBAL.COMMERCE);
	rooms["FUR EFFECT"].addFlag(GLOBAL.PUBLIC);
	rooms["FUR EFFECT"].runOnEnter = furEffectBonusFunction;

	//109 "BETHS BROADS" Beth's Busty Broads
	rooms["BETHS BROADS"] = new RoomClass(this);
	rooms["BETHS BROADS"].roomName = "BETH’S\nBUSTY BROADS";
	rooms["BETHS BROADS"].description = "";
	rooms["BETHS BROADS"].planet = "TAVROS STATION";
	rooms["BETHS BROADS"].system = "SYSTEM: KALAS";
	rooms["BETHS BROADS"].westExit = "9012";
	rooms["BETHS BROADS"].moveMinutes = 1;
	rooms["BETHS BROADS"].addFlag(GLOBAL.INDOOR);
	rooms["BETHS BROADS"].addFlag(GLOBAL.NPC);
	rooms["BETHS BROADS"].addFlag(GLOBAL.PUBLIC);
	rooms["BETHS BROADS"].runOnEnter = bethsBonusFunction;

	//109 "BETHS BROADS" Beth's Busty Broads
	rooms["MI AMOUR"] = new RoomClass(this);
	rooms["MI AMOUR"].roomName = "MI\nAMOUR";
	rooms["MI AMOUR"].description = "";
	rooms["MI AMOUR"].planet = "TAVROS STATION";
	rooms["MI AMOUR"].system = "SYSTEM: KALAS";
	rooms["MI AMOUR"].southExit = "9005";
	rooms["MI AMOUR"].moveMinutes = 1;
	rooms["MI AMOUR"].addFlag(GLOBAL.INDOOR);
	//rooms["MI AMOUR"].addFlag(GLOBAL.NPC);
	rooms["MI AMOUR"].addFlag(GLOBAL.PUBLIC);
	rooms["MI AMOUR"].addFlag(GLOBAL.COMMERCE);
	rooms["MI AMOUR"].runOnEnter = miAmoreBonusShit;
	
	rooms["TAVROS TAMANICORP SHOP"] = new RoomClass(this);
	rooms["TAVROS TAMANICORP SHOP"].roomName = "TAMANI\nCORP";
	rooms["TAVROS TAMANICORP SHOP"].description = "The inside of the TamaniCorp shop is brightly lit and friendly, an inviting pink covering the walls beneath shelf after shelf lined with designer gene mods and cosmetic transformatives. Some of the products on display do catch your eye: fertility treatments, lactation inducers and modifiers, and even some sex toys. Almost everything here is pastel shades of purple, pink, and mixes of the two. The rug is so soft that your [pc.feet] sink in with every step, and a sultry smell is in the air, like a rich cologne.";
	rooms["TAVROS TAMANICORP SHOP"].planet = "TAVROS STATION";
	rooms["TAVROS TAMANICORP SHOP"].system = "SYSTEM: KALAS";
	rooms["TAVROS TAMANICORP SHOP"].southExit = "9007";
	rooms["TAVROS TAMANICORP SHOP"].moveMinutes = 1;
	rooms["TAVROS TAMANICORP SHOP"].addFlag(GLOBAL.INDOOR);
	//rooms["TAVROS TAMANICORP SHOP"].addFlag(GLOBAL.NPC);
	rooms["TAVROS TAMANICORP SHOP"].addFlag(GLOBAL.PUBLIC);
	rooms["TAVROS TAMANICORP SHOP"].addFlag(GLOBAL.COMMERCE);
	rooms["TAVROS TAMANICORP SHOP"].runOnEnter = tavrosTamaniCorpStoreEntry;

	//9003 - 110 MERCHANT'S THOROUGHFARE
	rooms["110"] = new RoomClass(this);
	rooms["110"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["110"].description = "The merchant’s thoroughfare twists through the station on its circular route, bending gradually to the east the further north you go. The shops in the immediate area have all been shuttered for now, left vacant until a brave soul makes an attempt at mercantilism.";
	rooms["110"].planet = "TAVROS STATION";
	rooms["110"].system = "SYSTEM: KALAS";
	rooms["110"].northExit = "9004";
	rooms["110"].southExit = "MERCHANT'S THOROUGHFARE";
	rooms["110"].westExit = "";
	rooms["110"].moveMinutes = 1;
	//rooms["110"].westExit = "DARK CHRYSALIS";
	rooms["110"].addFlag(GLOBAL.INDOOR);
	rooms["110"].addFlag(GLOBAL.PUBLIC);
	rooms["110"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["110"].runOnEnter = akaneCeleritasVeritasTheLegitimateBusinessBonus;

	//9004
	rooms["9004"] = new RoomClass(this);
	rooms["9004"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9004"].description = "The walls in this section of the merchant deck are suspiciously bare, though you wager the lack of open storefronts has more to do with the awkward curvature of the station hall than a lack of business. Sapients of all descriptions pass by on all sides, hurrying along to their destinations. You’re very clearly reminded of why they call it a “rush.”";
	rooms["9004"].planet = "TAVROS STATION";
	rooms["9004"].system = "SYSTEM: KALAS";
	rooms["9004"].eastExit = "9005";
	rooms["9004"].southExit = "110";
	rooms["9004"].westExit = "";
	rooms["9004"].moveMinutes = 1;
	rooms["9004"].addFlag(GLOBAL.INDOOR);
	rooms["9004"].addFlag(GLOBAL.PUBLIC);
	rooms["9004"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9004"].runOnEnter = breedwellPremiumBootyCallsCheckTavrosAusar;

	//9005
	rooms["9005"] = new RoomClass(this);
	rooms["9005"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9005"].description = "Glass windows along the north of the passage brazenly display a series of mannequins in undergarments both fashionable and enticing. “Mi Amour” is the name of it, judging by the red-glowing sign above. It’s door is open for business, but there are many other shops to peruse on the merchant deck.";
	rooms["9005"].planet = "TAVROS STATION";
	rooms["9005"].system = "SYSTEM: KALAS";
	rooms["9005"].northExit = "MI AMOUR";
	rooms["9005"].eastExit = "9006";
	rooms["9005"].westExit = "9004";
	rooms["9005"].moveMinutes = 1;
	rooms["9005"].addFlag(GLOBAL.INDOOR);
	rooms["9005"].addFlag(GLOBAL.PUBLIC);
	rooms["9005"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9005"].runOnEnter = undefined;

	//9006
	rooms["9006"] = new RoomClass(this);
	rooms["9006"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9006"].description = "A spacious window (or convincing display) lines the curving wall to the north. The view is magnificent. You can see the sun drift across your view as the station spins, and just as it passes beyond sight, the faint sparkles of the system’s ice belt light up like shining diamonds against the glimmering starfield behind. A few kaithrit have their noses pressed up against the glass, their doubled tails curled up in excitement.";
	rooms["9006"].planet = "TAVROS STATION";
	rooms["9006"].system = "SYSTEM: KALAS";
	rooms["9006"].eastExit = "9007";
	rooms["9006"].westExit = "9005";
	rooms["9006"].moveMinutes = 1;
	rooms["9006"].addFlag(GLOBAL.INDOOR);
	rooms["9006"].addFlag(GLOBAL.PUBLIC);
	rooms["9006"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9006"].runOnEnter = veltaShowVeltaJogging;

	//9007
	rooms["9007"] = new RoomClass(this);
	rooms["9007"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9007"].description = "Holographic cow-girls cover the walls of this passage, imploring you to visit scenic New Texas, “The reason they call this galaxy the milky way!” A display with buff-looking bull-boys flanks the bovine lasses, unsubtly appealing to another demographic. Both sections of hall have attentive crowds of curious onlookers.\n\nNeon green and pink light spills across the deck plating from a store to the north, the infamous logo of the Tamani Corporation above the door advising potential patrons of the establishment what lays inside.";
	rooms["9007"].planet = "TAVROS STATION";
	rooms["9007"].system = "SYSTEM: KALAS";
	rooms["9007"].northExit = "TAVROS TAMANICORP SHOP";
	rooms["9007"].eastExit = "9008";
	rooms["9007"].westExit = "9006";
	rooms["9007"].moveMinutes = 1;
	rooms["9007"].addFlag(GLOBAL.INDOOR);
	rooms["9007"].addFlag(GLOBAL.PUBLIC);
	rooms["9007"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9007"].runOnEnter = undefined;

	//9008
	rooms["9008"] = new RoomClass(this);
	rooms["9008"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9008"].description = "Bending away to the south and west, the merchant’s thoroughfare snakes its way around the circumference of the station, blazing a wide path between seemingly endless storefronts. Many in the immediate area are closed, shuttered and covered with temporary advertisements. “Visit beautiful Bogrum 12! Luxurious mud baths, sulfur springs, and exotic slug women await you!”";
	rooms["9008"].planet = "TAVROS STATION";
	rooms["9008"].system = "SYSTEM: KALAS";
	rooms["9008"].southExit = "9009";
	rooms["9008"].westExit = "9007";
	rooms["9008"].moveMinutes = 1;
	rooms["9008"].addFlag(GLOBAL.INDOOR);
	rooms["9008"].addFlag(GLOBAL.PUBLIC);
	rooms["9008"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9008"].addFlag(GLOBAL.NPC);
	rooms["9008"].runOnEnter = riyaBonus;

	//9009
	rooms["9009"] = new RoomClass(this);
	rooms["9009"].roomName = "RED\nLIGHT ZONE";
	rooms["9009"].description = "No matter how far along the merchant deck you travel, the crowds never really dissipate. Rahn shoulder by ausar while grinning leithans threaten to trample over everyone else. Crimson luminance spills from plastic stripes along the corners of the passage to the south, bathing this otherwise dim segment of the merchant’s thoroughfare in hazy, bedroom lighting.";
	rooms["9009"].planet = "TAVROS STATION";
	rooms["9009"].system = "SYSTEM: KALAS";
	rooms["9009"].southExit = "9010";
	rooms["9009"].northExit = "9008";
	rooms["9009"].eastExit = "ACQUISITIONS";
	rooms["9009"].moveMinutes = 1;
	rooms["9009"].addFlag(GLOBAL.INDOOR);
	rooms["9009"].addFlag(GLOBAL.PUBLIC);
	rooms["9009"].runOnEnter = redlightNEBonus;

	//9010
	rooms["9010"] = new RoomClass(this);
	rooms["9010"].roomName = "RED\nLIGHT ZONE";
	rooms["9010"].description = "You’re deep in Tavros Station’s red light district now. Foot traffic here is a little thinner than elsewhere on the merchant deck, but what’s here is far more lurid. Nude or barely-clothed bodies are frequently on display, stretching the taboo against public sex to the breaking point.\n\nThere is a long storefront here, though you cannot see inside. Instead, the walls to either side of the door are lined with holo projections wearing risque BDSM outfits. They’re paddling each other or playing with long, phallic objects for your pleasure. As you watch on, a shimmering model gives you a coquettish wink, gesturing for you to get inside.\n\nThe sign over the door reads ‘The Happy Tails’, with the name underlined by a gigantic glowing whip.";
	rooms["9010"].planet = "TAVROS STATION";
	rooms["9010"].system = "SYSTEM: KALAS";
	rooms["9010"].southExit = "9011";
	rooms["9010"].northExit = "9009";
	rooms["9010"].eastExit = "INESSA";
	rooms["9010"].moveMinutes = 1;
	rooms["9010"].addFlag(GLOBAL.INDOOR);
	rooms["9010"].addFlag(GLOBAL.PUBLIC);
	rooms["9010"].runOnEnter = undefined;

	//9011
	rooms["9011"] = new RoomClass(this);
	rooms["9011"].roomName = "RED\nLIGHT ZONE";
	rooms["9011"].description = "One of the displays catches your attention, glaring and purple: “De-Stress For Less! Beth’s Broads: They’re built to please!” It’s quite clear what they’re selling: a service that would be illegal in more prudish places. Here on the frontier? Companionship can be had few credits - or a few thousand. Crimson lighting paves the way north and south through the red light section of the merchant deck.";
	rooms["9011"].planet = "TAVROS STATION";
	rooms["9011"].system = "SYSTEM: KALAS";
	rooms["9011"].southExit = "9012";
	rooms["9011"].northExit = "9010";
	rooms["9011"].moveMinutes = 1;
	rooms["9011"].addFlag(GLOBAL.INDOOR);
	rooms["9011"].addFlag(GLOBAL.PUBLIC);
	rooms["9011"].runOnEnter = undefined;

	//9012
	rooms["9012"] = new RoomClass(this);
	rooms["9012"].roomName = "RED\nLIGHT ZONE";
	rooms["9012"].description = "A glowing pink sign announces that “Beth’s Busty Broads” is open for business to the east. Skimpy girls and broad-chested males alike pass through doors that proudly proclaim “Never closed!” You can imagine why. Sexual needs don’t keep hours of operation, and neither does this brothel. The other side of the passage houses a simplistic laser light show and thumping sound system, designed to draw the eye to Beth’s.";
	rooms["9012"].planet = "TAVROS STATION";
	rooms["9012"].system = "SYSTEM: KALAS";
	rooms["9012"].southExit = "9013";
	rooms["9012"].northExit = "9011";
	rooms["9012"].eastExit = "BETHS BROADS";
	rooms["9012"].moveMinutes = 1;
	rooms["9012"].addFlag(GLOBAL.INDOOR);
	rooms["9012"].addFlag(GLOBAL.PUBLIC);
	rooms["9012"].runOnEnter = redlightSEBonus;

	//9013
	rooms["9013"] = new RoomClass(this);
	rooms["9013"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9013"].description = "The gradually arcing curve of the merchant deck bends away to the north and the west from here. In the former direction is a tunnel lighted in a hazy, ruby glow - the red light zone. Many shops of ill repute conduct business in that area, and holograms warn away any sapients below their species’ age of consent. The other direction wraps back around, eventually leading to the lift, where more mundane boutiques ply their wares.";
	rooms["9013"].planet = "TAVROS STATION";
	rooms["9013"].system = "SYSTEM: KALAS";
	rooms["9013"].westExit = "9014";
	rooms["9013"].northExit = "9012";
	rooms["9013"].moveMinutes = 1;
	rooms["9013"].addFlag(GLOBAL.INDOOR);
	rooms["9013"].addFlag(GLOBAL.PUBLIC);
	rooms["9013"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9013"].runOnEnter = shukuchiFoxBonus;

	//9014
	rooms["9014"] = new RoomClass(this);
	rooms["9014"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9014"].description = "There’s no substitute for seeing the kind of racial diversity that the rush brings on. Daynar and ovir alike fill the corridor, mixed with more humans and ausar than you care to count. A party of burly thraggen part the mismatched races more effectively than any wall of hardlight ever could. Nobody wants to mess with a few hundred pounds of green-skinned fury. The shops in the immediate area are all shut down, barricaded up by the health department, but glowing signs still declare, “Reduce protonic thruster buildup with SKREMULAX! Now in blue!”";
	rooms["9014"].planet = "TAVROS STATION";
	rooms["9014"].system = "SYSTEM: KALAS";
	rooms["9014"].westExit = "9015";
	rooms["9014"].eastExit = "9013";
	rooms["9014"].moveMinutes = 1;
	rooms["9014"].addFlag(GLOBAL.INDOOR);
	rooms["9014"].addFlag(GLOBAL.PUBLIC);
	rooms["9014"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9014"].runOnEnter = breedwellPremiumBootyCallsCheckTavrosDomme;

	//9015
	rooms["9015"] = new RoomClass(this);
	rooms["9015"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9015"].description = "";
	rooms["9015"].planet = "TAVROS STATION";
	rooms["9015"].system = "SYSTEM: KALAS";
	rooms["9015"].westExit = "9016";
	rooms["9015"].eastExit = "9014";
	rooms["9015"].northExit = "SHEAR BEAUTY";
	rooms["9015"].moveMinutes = 1;
	rooms["9015"].addFlag(GLOBAL.INDOOR);
	rooms["9015"].addFlag(GLOBAL.PUBLIC);
	rooms["9015"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9015"].runOnEnter = merchantThoroughfareBonus;

	//9016
	rooms["9016"] = new RoomClass(this);
	rooms["9016"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9016"].description = "The cold metal flooring gives way to a high-dollar screen under your [pc.feet], advertising the latest “Sphinxes of Arachnu” flick, subtitled, “This Time, It’s Purrsonal.” It looks like the kind of movie that spent half its budget on special effects and the other half on feminine eye-candy. You doubt they spent more than twenty credits on the script.";
	rooms["9016"].planet = "TAVROS STATION";
	rooms["9016"].system = "SYSTEM: KALAS";
	rooms["9016"].westExit = "9017";
	rooms["9016"].eastExit = "9015";
	rooms["9016"].southExit = "TAVROS_BEACH";
	rooms["9016"].moveMinutes = 1;
	rooms["9016"].addFlag(GLOBAL.INDOOR);
	rooms["9016"].addFlag(GLOBAL.PUBLIC);
	rooms["9016"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9016"].runOnEnter = beachNSurfOutsideBonus;

	rooms["TAVROS_BEACH"] = new RoomClass(this);
	rooms["TAVROS_BEACH"].roomName = "BEACH \n‘N SURF";
	rooms["TAVROS_BEACH"].description = "";
	rooms["TAVROS_BEACH"].planet = "TAVROS STATION";
	rooms["TAVROS_BEACH"].system = "SYSTEM: KALAS";
	rooms["TAVROS_BEACH"].northExit = "9016";
	rooms["TAVROS_BEACH"].moveMinutes = 1;
	rooms["TAVROS_BEACH"].addFlag(GLOBAL.INDOOR);
	rooms["TAVROS_BEACH"].addFlag(GLOBAL.PUBLIC);
	rooms["TAVROS_BEACH"].addFlag(GLOBAL.POOL);
	rooms["TAVROS_BEACH"].addFlag(GLOBAL.NPC);
	rooms["TAVROS_BEACH"].runOnEnter = approachBeachSurfNSurf;

	//9017
	rooms["9017"] = new RoomClass(this);
	rooms["9017"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9017"].description = "You’ve reached the epicenter of north and east on Tavros Station’s merchant deck. The curving gray corridor arcs away in both directions, filled with the sights and sounds of a hundred different worlds. Gleaming holograms advertise, “You can keep scrubbing, but you’ll never erase those drives the way E-Horizons can!” while women in skimpy leotards offer free samples of something only a galotian or rahn could hope to digest.";
	rooms["9017"].planet = "TAVROS STATION";
	rooms["9017"].system = "SYSTEM: KALAS";
	rooms["9017"].northExit = "9018";
	rooms["9017"].eastExit = "9016";
	rooms["9017"].moveMinutes = 1;
	rooms["9017"].addFlag(GLOBAL.INDOOR);
	rooms["9017"].addFlag(GLOBAL.PUBLIC);
	rooms["9017"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9017"].runOnEnter = merchantThoroughfareBonus;

	//9018
	rooms["9018"] = new RoomClass(this);
	rooms["9018"].roomName = "MERCHANT’S\nTHOROUGHFARE";
	rooms["9018"].description = "Crowds are thick this close to the lifts, and the preponderance of nearby shops isn’t helping matters. Most stores closed down, either to get away from the Rush madness or to try to strike it rich themselves. Yet the storefronts in this area are as lively as ever. New businesses have sprung up in the bones of the old, and there’s more than enough clientele to keep them busy.";
	rooms["9018"].planet = "TAVROS STATION";
	rooms["9018"].system = "SYSTEM: KALAS";
	rooms["9018"].northExit = "MERCHANT'S THOROUGHFARE2";
	rooms["9018"].southExit = "9017";
	rooms["9018"].westExit = "FUR EFFECT";
	rooms["9018"].eastExit = "DARK CHRYSALIS";
	rooms["9018"].moveMinutes = 1;
	rooms["9018"].addFlag(GLOBAL.INDOOR);
	rooms["9018"].addFlag(GLOBAL.PUBLIC);
	rooms["9018"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["9018"].runOnEnter = merchantThoroughfareBonus;

	// SENTIENT ACQUISITIONS
	rooms["ACQUISITIONS"] = new RoomClass(this);
	rooms["ACQUISITIONS"].roomName = "SENTIENT\nACQUISITIONS";
	rooms["ACQUISITIONS"].description = "";
	rooms["ACQUISITIONS"].planet = "TAVROS STATION";
	rooms["ACQUISITIONS"].system = "SYSTEM: KALAS";
	rooms["ACQUISITIONS"].westExit = "9009";
	rooms["ACQUISITIONS"].moveMinutes = 1;
	rooms["ACQUISITIONS"].addFlag(GLOBAL.INDOOR);
	rooms["ACQUISITIONS"].addFlag(GLOBAL.PUBLIC);
	rooms["ACQUISITIONS"].addFlag(GLOBAL.NPC);
	rooms["ACQUISITIONS"].runOnEnter = sentientAcquisitionsBonus;

	//INESSA
	rooms["INESSA"] = new RoomClass(this);
	rooms["INESSA"].roomName = "SHOP:\nHAPPY TAILS";
	rooms["INESSA"].description = "";
	rooms["INESSA"].planet = "TAVROS STATION";
	rooms["INESSA"].system = "SYSTEM: KALAS";
	rooms["INESSA"].westExit = "9010";
	rooms["INESSA"].moveMinutes = 1;
	rooms["INESSA"].addFlag(GLOBAL.INDOOR);
	rooms["INESSA"].addFlag(GLOBAL.PUBLIC);
	rooms["INESSA"].addFlag(GLOBAL.COMMERCE);
	rooms["INESSA"].runOnEnter = happyTailsBonus;
	
	rooms["LIFT: RESIDENTIAL DECK"] = new RoomClass(this);
	rooms["LIFT: RESIDENTIAL DECK"].roomName = "LIFT:\nRESIDENTIAL";
	rooms["LIFT: RESIDENTIAL DECK"].description = "";
	rooms["LIFT: RESIDENTIAL DECK"].planet = "TAVROS STATION";
	rooms["LIFT: RESIDENTIAL DECK"].system = "SYSTEM: KALAS";
	rooms["LIFT: RESIDENTIAL DECK"].northExit = "RESIDENTIAL DECK 6";
	rooms["LIFT: RESIDENTIAL DECK"].southExit = "RESIDENTIAL DECK 2";
	rooms["LIFT: RESIDENTIAL DECK"].westExit = "";
	rooms["LIFT: RESIDENTIAL DECK"].eastExit = "";
	rooms["LIFT: RESIDENTIAL DECK"].moveMinutes = 1;
	rooms["LIFT: RESIDENTIAL DECK"].addFlag(GLOBAL.INDOOR);
	rooms["LIFT: RESIDENTIAL DECK"].addFlag(GLOBAL.LIFTDOWN);
	rooms["LIFT: RESIDENTIAL DECK"].addFlag(GLOBAL.PUBLIC);
	rooms["LIFT: RESIDENTIAL DECK"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["LIFT: RESIDENTIAL DECK"].runOnEnter = hangarBonus;
	
	//1002 South Plaza
	rooms["RESIDENTIAL DECK 2"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 2"].roomName = "SOUTH\nPLAZA";
	rooms["RESIDENTIAL DECK 2"].description = "You’re in front of a row of elevator shafts surrounded by a large plaza area. The design reminds you of a city square, but instead of a fountain feature, the lifts are the centerpiece. Still, there’s all the common fare of a common space; there are decorative garden beds with exotic yet harmless shrubbery and park benches to sit on.\n\nBeyond the sprawling public space and in each of the four cardinal directions are residential arcades; high-roofed walkways marked by countless successive arches.";
	rooms["RESIDENTIAL DECK 2"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 2"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 2"].northExit = "LIFT: RESIDENTIAL DECK";
	rooms["RESIDENTIAL DECK 2"].southExit = "RESIDENTIAL DECK 16";
	rooms["RESIDENTIAL DECK 2"].westExit = "RESIDENTIAL DECK 9";
	rooms["RESIDENTIAL DECK 2"].eastExit = "RESIDENTIAL DECK 3";
	rooms["RESIDENTIAL DECK 2"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 2"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 2"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 2"].addFlag(GLOBAL.OBJECTIVE);
	rooms["RESIDENTIAL DECK 2"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 2"].runOnEnter = tavrosResidentialDeckNoticeBoard;
	
	//1003 South-East Plaza
	rooms["RESIDENTIAL DECK 3"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 3"].roomName = "SOUTH-EAST\nPLAZA";
	rooms["RESIDENTIAL DECK 3"].description = "This corner of the residential plaza is quite busy. The foot traffic is between the large elevator shafts in the center of the plaza and people’s dwellings. There are apartments lining the plaza, a premium spot for anyone in a rush.\n\nThere are some large trees here casting shade upon the paved ground. The only breeze is from the deck’s air conditioning systems, which keep everything at a nice, mild temperature.\n\nYou can follow the curve of the plaza here northward, towards the bridge to the western ward. You can also head west where the entrance to the deck’s elevators are.";
	rooms["RESIDENTIAL DECK 3"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 3"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 3"].northExit = "RESIDENTIAL DECK 4";
	rooms["RESIDENTIAL DECK 3"].westExit = "RESIDENTIAL DECK 2";
	rooms["RESIDENTIAL DECK 3"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 3"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 3"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 3"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	
	//1004 East Plaza
	rooms["RESIDENTIAL DECK 4"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 4"].roomName = "EAST\nPLAZA";
	rooms["RESIDENTIAL DECK 4"].description = "There’s a large lush patch of purple plants here in the plaza. They’re covered in patchy blue spots. Soft, cyan blossoms are poking out from them on long, dangly stems. They smell fresh and crisp rather than floral.\n\nThe plaza stretches out north to south, but there’s a large residential arcade to the east. It seems to head all the way out to a residential ward, though the thoroughfare itself is lined with doors to residential apartments.";
	rooms["RESIDENTIAL DECK 4"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 4"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 4"].northExit = "RESIDENTIAL DECK 5";
	rooms["RESIDENTIAL DECK 4"].southExit = "RESIDENTIAL DECK 3";
	rooms["RESIDENTIAL DECK 4"].eastExit = "RESIDENTIAL DECK 10";
	rooms["RESIDENTIAL DECK 4"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 4"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 4"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 4"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	
	//1005 North-East Plaza
	rooms["RESIDENTIAL DECK 5"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 5"].roomName = "NORTH-EAST\nPLAZA";
	rooms["RESIDENTIAL DECK 5"].description = "This part of the plaza is marked by large, leafy ferns, and by their distinctly green look, they’re likely terran. Some station tourists are stopping to take photos; they must be authentic palm trees. They lack coconuts, either through rigorous pruning or selective breeding, making it safe for pedestrians to pass beneath.\n\nThe plaza continues east and south in a wide curve.";
	rooms["RESIDENTIAL DECK 5"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 5"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 5"].southExit = "RESIDENTIAL DECK 4";
	rooms["RESIDENTIAL DECK 5"].westExit = "RESIDENTIAL DECK 6";
	rooms["RESIDENTIAL DECK 5"].runOnEnter = northEastPlazaBonus;
	rooms["RESIDENTIAL DECK 5"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 5"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 5"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 5"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	
	//1006 North Plaza
	rooms["RESIDENTIAL DECK 6"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 6"].roomName = "NORTH\nPLAZA";
	rooms["RESIDENTIAL DECK 6"].description = "You’re standing on the north side of the plaza and in front of a large row of elevator shafts. All around you is a massive public plaza, filled with scenic shrubbery and paved walkways. There’s a few park benches as well, which residents seem to be making full use of.\n\nAt each of the cardinal points are gigantic residential arcades that continue out as far as the eye can see. Just like the walls of the plaza, the arcades are lined with residential entrances. It must be nice to walk right out your door and into such a nice garden-filled space.\n\nYou can head in any direction, with south heading back into the elevators and north heading into one of the residential thoroughfares. East and west heads around the plaza.";
	rooms["RESIDENTIAL DECK 6"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 6"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 6"].northExit = "RESIDENTIAL DECK 12";
	rooms["RESIDENTIAL DECK 6"].southExit = "LIFT: RESIDENTIAL DECK";
	rooms["RESIDENTIAL DECK 6"].westExit = "RESIDENTIAL DECK 7";
	rooms["RESIDENTIAL DECK 6"].eastExit = "RESIDENTIAL DECK 5";
	rooms["RESIDENTIAL DECK 6"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 6"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 6"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 6"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	
	//1007 North-West Plaza
	rooms["RESIDENTIAL DECK 7"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 7"].roomName = "NORTH-WEST\nPLAZA";
	rooms["RESIDENTIAL DECK 7"].description = "It’s hard not to be dazzled by this portion of the plaza. Between the walkways are clusters of prismatic crystals, ranging in size from tiny gem-like shrubs to twenty-foot monoliths. Artificial light flows from above, striking the stones and causing them to sparkle.\n\nA few water features run over the crystals, causing their scintillating light to flurry about beneath the ripples. It’s almost hypnotic, but very relaxing. Understandably, there’s a lot of public seating about. Among the normal tables, and nestled beneath some of the larger crystals, are 4D chess tables - square, black and white cage-like objects floating in mid-air, each flanked by a pair of chairs.\n\nThe plaza curves here from west to south, lined by various residential apartments.";
	rooms["RESIDENTIAL DECK 7"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 7"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 7"].southExit = "RESIDENTIAL DECK 8";
	rooms["RESIDENTIAL DECK 7"].eastExit = "RESIDENTIAL DECK 6";
	rooms["RESIDENTIAL DECK 7"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 7"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 7"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 7"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 7"].runOnEnter = playSemithChessScene;
	
	//1008 West Plaza
	rooms["RESIDENTIAL DECK 8"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 8"].roomName = "WEST\nPLAZA";
	rooms["RESIDENTIAL DECK 8"].description = "This part of the plaza is filled with shielded aviaries housing all kinds of colorful winged creatures. When they’re not hovering about, they’re resting in their nests, most of which are built in hollowed out trees. A rainbow-hued, six-winged bird seems to have pride of place at the top of the largest tree.\n\nThere’s a large arcade-like thoroughfare to the west, stretching out all the way to a far off residential ward. Identical to the plaza, the side-walls are lined with residential entryways, each decorated as the owner sees fit.\n\nBesides the west walkway, you can head north or south here and circle around the plaza. This side doesn’t seem to have an entry point to the elevators.";
	rooms["RESIDENTIAL DECK 8"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 8"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 8"].northExit = "RESIDENTIAL DECK 7";
	rooms["RESIDENTIAL DECK 8"].southExit = "RESIDENTIAL DECK 9";
	rooms["RESIDENTIAL DECK 8"].westExit = "RESIDENTIAL DECK 14";
	rooms["RESIDENTIAL DECK 8"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 8"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 8"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 8"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	//1009 South-West Plaza
	rooms["RESIDENTIAL DECK 9"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 9"].roomName = "SOUTH-WEST\nPLAZA";
	rooms["RESIDENTIAL DECK 9"].description = "This area has a lot of strange interpretive art. There are a number of residents dwelling near them, each arguing about what exactly the messy-looking statues are. It’s like an inkblot test; everyone seems to see something a little different.\n\nThe plaza curves around here from north to west. The latter leads to the front of the deck’s elevators.";
	rooms["RESIDENTIAL DECK 9"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 9"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 9"].northExit = "RESIDENTIAL DECK 8";
	rooms["RESIDENTIAL DECK 9"].eastExit = "RESIDENTIAL DECK 2";
	rooms["RESIDENTIAL DECK 9"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 9"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 9"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 9"].addFlag(GLOBAL.NUDITY_ILLEGAL);

	//1010 East Walkway 1
	rooms["RESIDENTIAL DECK 10"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 10"].roomName = "EAST\nWALKWAY";
	rooms["RESIDENTIAL DECK 10"].description = "The eastern thoroughfare is massive and multi-laned, with some residents opting to take small hover-carts between the plaza elevators and the outer wards. Thankfully, the small yet speedy vehicles don’t share the same routes as the pedestrians, only scooting along the inner lanes.\n\nThere are many residential estates located in the plaza, some with vehicles parked out front and console locked.\n\nTo the south is a tall but narrow apartment, its facade decorated in understated dull red and slate trimmings, mimicking an old-fashioned brick townhouse. Its door and windows are slightly smaller and lower than seems to be the norm around here. The holo-number next to the door reads 107.";
	rooms["RESIDENTIAL DECK 10"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 10"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 10"].southExit = "RESIDENTIAL DECK SEMITHS APARTMENT";
	rooms["RESIDENTIAL DECK 10"].westExit = "RESIDENTIAL DECK 4";
	rooms["RESIDENTIAL DECK 10"].eastExit = "RESIDENTIAL DECK 11";
	rooms["RESIDENTIAL DECK 10"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 10"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 10"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 10"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 10"].runOnEnter = updateDescriptionWithSemithsEventualPresence;
	
	//Semith Apartment
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].roomName = "SEMITH’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].description = "Semith’s home is a series of cozy spaces orientated quite vertically. A circular lift in the middle of the tall apartment can soundlessly transport you from a plush lounge stuffed with squashy settees, to a spice-scented kitchen, to an incredibly untidy study, to who knows what else. Semith likes synth-mahogany, and it shows. Every space is furnished in rich red-brown, with pieces of artwork straddling the line between tasteful and unsettling here and there.";
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].northExit = "RESIDENTIAL DECK 10";
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].addFlag(GLOBAL.PRIVATE);
	rooms["RESIDENTIAL DECK SEMITHS APARTMENT"].runOnEnter = playSemithsApartmentScene
	
	//1011 East Walkway 2
	rooms["RESIDENTIAL DECK 11"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 11"].roomName = "EAST\nWALKWAY";
	rooms["RESIDENTIAL DECK 11"].description = "There are a number of double story apartments here with balconies, easily fitting into the high-roofed residential arcade. There’s also a dock for hover carts and a small payment terminal, for those not wishing to walk back and forth down the thoroughfare.\n\nThere’s a particularly large apartment to the north of here. The classy pillars and archways mix with the lascivious color scheme of red and gold, making it look like an upper-class bordello more than a residence. The holo-sign next to the door reads 112.\n\nThere’s a large steel wall to the east. West leads back in the direction of the central plaza.";
	rooms["RESIDENTIAL DECK 11"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 11"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 11"].northExit = "RESIDENTIAL DECK 19";
	rooms["RESIDENTIAL DECK 11"].westExit = "RESIDENTIAL DECK 10";
	rooms["RESIDENTIAL DECK 11"].southExit = "RES DECK BIG TIDDY GOTH GF";
	rooms["RESIDENTIAL DECK 11"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 11"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 11"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 11"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 11"].runOnEnter = resDeck11Func;

	rooms["RES DECK BIG TIDDY GOTH GF"] = new RoomClass(this);
	rooms["RES DECK BIG TIDDY GOTH GF"].roomName = "EAST\nWALKWAY";
	rooms["RES DECK BIG TIDDY GOTH GF"].description = "There are a number of double story apartments here with balconies, easily fitting into the high-roofed residential arcade. There’s also a dock for hover carts and a small payment terminal, for those not wishing to walk back and forth down the thoroughfare.\n\nThere’s a particularly large apartment to the north of here. The classy pillars and archways mix with the lascivious color scheme of red and gold, making it look like an upper-class bordello more than a residence. The holo-sign next to the door reads 112.\n\nThere’s a large steel wall to the east. West leads back in the direction of the central plaza.";
	rooms["RES DECK BIG TIDDY GOTH GF"].planet = "TAVROS STATION";
	rooms["RES DECK BIG TIDDY GOTH GF"].system = "SYSTEM: KALAS";
	rooms["RES DECK BIG TIDDY GOTH GF"].northExit = "RESIDENTIAL DECK 11";
	rooms["RES DECK BIG TIDDY GOTH GF"].moveMinutes = 1;
	rooms["RES DECK BIG TIDDY GOTH GF"].addFlag(GLOBAL.INDOOR);
	rooms["RES DECK BIG TIDDY GOTH GF"].addFlag(GLOBAL.NPC);
	
	//1012 North Walkway 1
	rooms["RESIDENTIAL DECK 12"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 12"].roomName = "NORTH\nWALKWAY";
	rooms["RESIDENTIAL DECK 12"].description = "The northward walkway is huge both longways and upward, making it easier for larger species to get about. Hover-carts are for rent here, allowing easy travel around the residential deck. You notice some of them have different steering wheels and seating, allowing for all sorts of species to make use of them.\n\nThe residential buildings lining this part of the deck aren’t very decorated, and those that are have been done with cheap holos. You can easily see through the flickering facades, making such holo-decor all but pointless.\n\nTo the north, the walkway continues for quite some time. The central plaza lies to the south, along with the elevators that allow deck transit.";
	rooms["RESIDENTIAL DECK 12"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 12"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 12"].northExit = "RESIDENTIAL DECK 13";
	rooms["RESIDENTIAL DECK 12"].southExit = "RESIDENTIAL DECK 6";
	rooms["RESIDENTIAL DECK 12"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 12"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 12"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 12"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 12"].addFlag(GLOBAL.NPC);
	rooms["RESIDENTIAL DECK 12"].runOnEnter = liammeBonus;
	
	//1013 North Walkway 2
	rooms["RESIDENTIAL DECK 13"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 13"].roomName = "NORTH\nWALKWAY";
	rooms["RESIDENTIAL DECK 13"].description = "This largely unlived in part of the deck is almost achingly quiet, each footstep echoing down the incredibly tall and long walkway. Each room has ridiculously cheap pricing on it. There are also a few advertising boards up, mostly displaying the latest movies and soft-drink products.\n\nSouth leads towards the central plaza. To the north, there’s a big block of cheap apartments, grav shafts enabling access to the identikit steel boxes further up.";
	rooms["RESIDENTIAL DECK 13"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 13"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 13"].southExit = "RESIDENTIAL DECK 12";
	rooms["RESIDENTIAL DECK 13"].westExit = "RESIDENTIAL DECK FISIS APARTMENT";
	rooms["RESIDENTIAL DECK 13"].eastExit = "RESIDENTIAL DECK KASES APARTMENT";
	rooms["RESIDENTIAL DECK 13"].northExit = "BIZZY STUDIO ROOM";
	rooms["RESIDENTIAL DECK 13"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 13"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 13"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 13"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 13"].runOnEnter = northWalkwayBonus;

	rooms["BIZZY STUDIO ROOM"] = new RoomClass(this);
	rooms["BIZZY STUDIO ROOM"].roomName = "BIZZY & CO\nSTUDIOS";
	rooms["BIZZY STUDIO ROOM"].description = "BIZZYS BIG PORN HOUSE";
	rooms["BIZZY STUDIO ROOM"].planet = "TAVROS STATION";
	rooms["BIZZY STUDIO ROOM"].system = "SYSTEM: KALAS";
	rooms["BIZZY STUDIO ROOM"].southExit = "RESIDENTIAL DECK 13";
	rooms["BIZZY STUDIO ROOM"].addFlag(GLOBAL.INDOOR);
	rooms["BIZZY STUDIO ROOM"].runOnEnter = null;
	
	//Fisianna's Apartment - Doesn't do much for now.
	rooms["RESIDENTIAL DECK FISIS APARTMENT"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].roomName = "FISIANNA’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].description = "";
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].eastExit = "RESIDENTIAL DECK 13";
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK FISIS APARTMENT"].addFlag(GLOBAL.PRIVATE);
	
	//Kase's Apartment if he's been evicted.
	rooms["RESIDENTIAL DECK KASES APARTMENT"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK KASES APARTMENT"].roomName = "KASE’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK KASES APARTMENT"].description = "";
	rooms["RESIDENTIAL DECK KASES APARTMENT"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK KASES APARTMENT"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK KASES APARTMENT"].westExit = "RESIDENTIAL DECK 13";
	rooms["RESIDENTIAL DECK KASES APARTMENT"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK KASES APARTMENT"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK KASES APARTMENT"].addFlag(GLOBAL.PRIVATE);
	
	//1014 West Walkway 1
	rooms["RESIDENTIAL DECK 14"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 14"].roomName = "WEST\nWALKWAY";
	rooms["RESIDENTIAL DECK 14"].description = "The western walkway has a lot of glitzy looking apartments. It’s only a <i>very</i> close look and touch that reveals they’re all covered in hard-light holos, not designed out of gold and marble. By the look of the few who haven’t ‘covered up’, they’re actually exceptionally plain; probably why their owners invested in the hard-light flourish. The walkway continues west for quite a while. It’s a considerably shorter walk back east and to the deck’s public plaza.";
	rooms["RESIDENTIAL DECK 14"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 14"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 14"].westExit = "RESIDENTIAL DECK 15";
	rooms["RESIDENTIAL DECK 14"].eastExit = "RESIDENTIAL DECK 8";
	rooms["RESIDENTIAL DECK 14"].northExit = "PAIGE_HOUSE";
	rooms["RESIDENTIAL DECK 14"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 14"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 14"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 14"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 14"].runOnEnter = breedwellPremiumBootyCallsCheckTavrosCouple;
	
	//1015 West Walkway 2
	rooms["RESIDENTIAL DECK 15"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 15"].roomName = "WEST\nWALKWAY";
	rooms["RESIDENTIAL DECK 15"].description = "";
	rooms["RESIDENTIAL DECK 15"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 15"].system = "SYSTEM: KALAS";
	//rooms["RESIDENTIAL DECK 15"].southExit = "RESIDENTIAL DECK 18"; -> added to game.as
	rooms["RESIDENTIAL DECK 15"].eastExit = "RESIDENTIAL DECK 14";
	rooms["RESIDENTIAL DECK 15"].northExit = "YOGA_HOUSE";
	rooms["RESIDENTIAL DECK 15"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 15"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 15"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 15"].addFlag(GLOBAL.NPC);
	rooms["RESIDENTIAL DECK 15"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 15"].runOnEnter = resDeck15Func;

	//Yoga palace!
	rooms["YOGA_HOUSE"] = new RoomClass(this);
	rooms["YOGA_HOUSE"].roomName = "PAIGE’S\nYOGA";
	rooms["YOGA_HOUSE"].description = "";
	rooms["YOGA_HOUSE"].planet = "TAVROS STATION";
	rooms["YOGA_HOUSE"].system = "SYSTEM: KALAS";
	rooms["YOGA_HOUSE"].southExit = "RESIDENTIAL DECK 15";
	rooms["YOGA_HOUSE"].moveMinutes = 1;
	rooms["YOGA_HOUSE"].addFlag(GLOBAL.INDOOR);
	rooms["YOGA_HOUSE"].addFlag(GLOBAL.PUBLIC);
	rooms["YOGA_HOUSE"].addFlag(GLOBAL.COMMERCE);
	rooms["YOGA_HOUSE"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["YOGA_HOUSE"].runOnEnter = yogaIntro;

	//Paige's Place
	rooms["PAIGE_HOUSE"] = new RoomClass(this);
	rooms["PAIGE_HOUSE"].roomName = "PAIGE’S\nPLACE";
	rooms["PAIGE_HOUSE"].description = "";
	rooms["PAIGE_HOUSE"].planet = "TAVROS STATION";
	rooms["PAIGE_HOUSE"].system = "SYSTEM: KALAS";
	rooms["PAIGE_HOUSE"].southExit = "RESIDENTIAL DECK 14";
	rooms["PAIGE_HOUSE"].moveMinutes = 1;
	rooms["PAIGE_HOUSE"].addFlag(GLOBAL.INDOOR);
	rooms["PAIGE_HOUSE"].addFlag(GLOBAL.PUBLIC);
	rooms["PAIGE_HOUSE"].addFlag(GLOBAL.NPC);
	rooms["PAIGE_HOUSE"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["PAIGE_HOUSE"].runOnEnter = paigesUnitDurhurrrrrrrrrrFenWroteUNIT;
	
	//1016 South Walkway 1
	rooms["RESIDENTIAL DECK 16"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 16"].roomName = "SOUTH\nWALKWAY";
	rooms["RESIDENTIAL DECK 16"].description = "The considerably large southern arcade stretches out as far as the eye can see, but many of the residences are for sale. By the looks of things, they’re unlived in, which means this part of the deck must be brand new. Given the Rush started not long ago, it’s not surprising—galactic expansion <i>is</i> the name of the game right now. You can head south and along the walkway, or north and towards the public plaza.";
	rooms["RESIDENTIAL DECK 16"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 16"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 16"].northExit = "RESIDENTIAL DECK 2";
	rooms["RESIDENTIAL DECK 16"].southExit = "RESIDENTIAL DECK 17";
	rooms["RESIDENTIAL DECK 16"].eastExit = "BUNBAKERY";
	rooms["RESIDENTIAL DECK 16"].westExit = "RESIDENTIAL DECK ZHENIYA";
	rooms["RESIDENTIAL DECK 16"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 16"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 16"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 16"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 16"].runOnEnter = resDeck16Func;
	
	rooms["RESIDENTIAL DECK ZHENIYA"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK ZHENIYA"].roomName = "ZHENIYA’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK ZHENIYA"].description = "The inside of Zheniya’s apartment is cozy and warm. Silk and bead curtains hang from the walls and doorways, and the lights have been tuned down to a low, sensual red glow throughout. The heat is above station standard, mimicking the musky humidity of her native planet’s jungles. A few incense candles are burning on shelves and tables, though the scent is nowhere near as overwhelming as you remember from Zheniya’s last abode.";
	rooms["RESIDENTIAL DECK ZHENIYA"].eastExit = "RESIDENTIAL DECK 16";
	rooms["RESIDENTIAL DECK ZHENIYA"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK ZHENIYA"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK ZHENIYA"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK ZHENIYA"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK ZHENIYA"].addFlag(GLOBAL.PRIVATE);
	rooms["RESIDENTIAL DECK ZHENIYA"].runOnEnter = zheniyasApartmentFunc;

	//BAKERY
	rooms["BUNBAKERY"] = new RoomClass(this);
	rooms["BUNBAKERY"].roomName = "BUNNY\nBUNS";
	rooms["BUNBAKERY"].description = "";
	rooms["BUNBAKERY"].planet = "TAVROS STATION";
	rooms["BUNBAKERY"].system = "SYSTEM: KALAS";
	rooms["BUNBAKERY"].westExit = "RESIDENTIAL DECK 16";
	rooms["BUNBAKERY"].moveMinutes = 1;
	rooms["BUNBAKERY"].runOnEnter = bunnyBunsCumfectionaryBonus;
	rooms["BUNBAKERY"].addFlag(GLOBAL.INDOOR);
	rooms["BUNBAKERY"].addFlag(GLOBAL.PUBLIC);
	rooms["BUNBAKERY"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["BUNBAKERY"].addFlag(GLOBAL.COMMERCE);
	
	//1017 South Walkway 2
	rooms["RESIDENTIAL DECK 17"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 17"].roomName = "SOUTH\nWALKWAY";
	rooms["RESIDENTIAL DECK 17"].description = "This part of the thoroughfare shines with countless holo-decorated apartments. The light-projected exteriors spruce up the otherwise plain exteriors, transforming this region into a shimmering cultural hotpot. One of the apartments to the west doesn’t have a virtual exterior, but it <i>does</i> have a rather pimped-out looking hoverbike. Black, sleek looking plates cover its outside, with constantly shifting flame-paint on the sides; must be digital. Looks like a two-seater.\n\nA fair way north is the central plaza and the deck elevators. There’s a large steel wall to the south with ‘under construction’ written on it.";
	rooms["RESIDENTIAL DECK 17"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 17"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 17"].northExit = "RESIDENTIAL DECK 16";
	rooms["RESIDENTIAL DECK 17"].eastExit = "RESIDENTIAL DECK VELTA";
	rooms["RESIDENTIAL DECK 17"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 17"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 17"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL DECK 17"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL DECK 17"].runOnEnter = resDeck17Func;
	
	//velta's apartment
	rooms["RESIDENTIAL DECK VELTA"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK VELTA"].roomName = "VELTA’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK VELTA"].description = "";
	rooms["RESIDENTIAL DECK VELTA"].westExit = "RESIDENTIAL DECK 17";
	rooms["RESIDENTIAL DECK VELTA"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK VELTA"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK VELTA"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK VELTA"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK VELTA"].addFlag(GLOBAL.PRIVATE);
	rooms["RESIDENTIAL DECK VELTA"].runOnEnter = veltaApartmentFunc;

	//1018 Aina's Apartment
	//Added in variableRoomUpdateCheck() in game.as since the room is only available 
	//if the PC helped Aina - and adding it in her code was not enough as it persisted
	//onload for other characters.

	//1019 Fyn's Apartment
	rooms["RESIDENTIAL DECK 19"] = new RoomClass(this);
	rooms["RESIDENTIAL DECK 19"].roomName = "FYN’S\nAPARTMENT";
	rooms["RESIDENTIAL DECK 19"].description = "";
	rooms["RESIDENTIAL DECK 19"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL DECK 19"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL DECK 19"].southExit = "RESIDENTIAL DECK 11";
	rooms["RESIDENTIAL DECK 19"].moveMinutes = 1;
	rooms["RESIDENTIAL DECK 19"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL DECK 19"].addFlag(GLOBAL.PRIVATE);
	rooms["RESIDENTIAL DECK 19"].addFlag(GLOBAL.NPC);
	rooms["RESIDENTIAL DECK 19"].runOnEnter = finsApartmentBonus;
	
	//Sera's Disco:3000 Side Quest
	rooms["RES DECK EAST ESTATE"] = new RoomClass(this);
	rooms["RES DECK EAST ESTATE"].roomName = "EAST\nESTATE";
	rooms["RES DECK EAST ESTATE"].description = "";
	rooms["RES DECK EAST ESTATE"].planet = "TAVROS STATION";
	rooms["RES DECK EAST ESTATE"].system = "SYSTEM: KALAS";
	rooms["RES DECK EAST ESTATE"].moveMinutes = 1;
	rooms["RES DECK EAST ESTATE"].addFlag(GLOBAL.INDOOR);
	rooms["RES DECK EAST ESTATE"].addFlag(GLOBAL.PUBLIC);

	// Nursery
	rooms["NURSERYELEVATOR"] = new RoomClass(this);
	rooms["NURSERYELEVATOR"].roomName = "ELEVATOR:\nNURSERY";
	rooms["NURSERYELEVATOR"].description = "";
	rooms["NURSERYELEVATOR"].runOnEnter = hangarBonus;
	rooms["NURSERYELEVATOR"].northExit = "NURSERYE14";
	rooms["NURSERYELEVATOR"].planet = "TAVROS STATION";
	rooms["NURSERYELEVATOR"].system = "SYSTEM: KALAS";
	rooms["NURSERYELEVATOR"].moveMinutes = 1;
	rooms["NURSERYELEVATOR"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYELEVATOR"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYELEVATOR"].addFlag(GLOBAL.LIFTDOWN);
	rooms["NURSERYELEVATOR"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYELEVATOR"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYSTAIRS1F"] = new RoomClass(this);
	rooms["NURSERYSTAIRS1F"].roomName = "NURSERY:\n1F STAIRWELL";
	rooms["NURSERYSTAIRS1F"].description = "";
	rooms["NURSERYSTAIRS1F"].runOnEnter = nurseryStairs1F;
	rooms["NURSERYSTAIRS1F"].eastExit = "NURSERYE14";
	rooms["NURSERYSTAIRS1F"].inExit = "NURSERYSTAIRS2F";
	rooms["NURSERYSTAIRS1F"].inText = "Up";
	rooms["NURSERYSTAIRS1F"].planet = "TAVROS STATION";
	rooms["NURSERYSTAIRS1F"].system = "SYSTEM: KALAS";
	rooms["NURSERYSTAIRS1F"].moveMinutes = 1;
	rooms["NURSERYSTAIRS1F"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYSTAIRS1F"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYSTAIRS1F"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYSTAIRS1F"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYSTAIRS1F"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYE14"] = new RoomClass(this);
	rooms["NURSERYE14"].roomName = "NURSERY\nFOYER";
	rooms["NURSERYE14"].description = "You’re standing in the vaulted entrance of your personal nursery, an entire sub-deck dedicated to taking in and caring for your children. ";
	rooms["NURSERYE14"].runOnEnter = nurseryFoyerFunc;
	rooms["NURSERYE14"].southExit = "NURSERYELEVATOR";
	rooms["NURSERYE14"].westExit = "NURSERYSTAIRS1F";
	rooms["NURSERYE14"].northExit = "NURSERYE12";
	rooms["NURSERYE14"].eastExit = "NURSERYG14";
	rooms["NURSERYE14"].planet = "TAVROS STATION";
	rooms["NURSERYE14"].system = "SYSTEM: KALAS";
	rooms["NURSERYE14"].moveMinutes = 1;
	rooms["NURSERYE14"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYE14"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYE14"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYE14"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYE14"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYE12"] = new RoomClass(this);
	rooms["NURSERYE12"].roomName = "NURSERY:\nCOMMON AREA";
	rooms["NURSERYE12"].description = "The nursery’s common area is a large, open room painted a rainbow of bright colors and equipped with a myriad of entertainment: holoscreens, video game consoles, toys of all descriptions, and racks of Codex tablets loaded with every book and educational program known to Man -- and most other galactic species.";
	rooms["NURSERYE12"].runOnEnter = nurseryCommonAreaFunc;
	rooms["NURSERYE12"].southExit = "NURSERYE14";
	rooms["NURSERYE12"].eastExit = "NURSERYG12";
	rooms["NURSERYE12"].planet = "TAVROS STATION";
	rooms["NURSERYE12"].system = "SYSTEM: KALAS";
	rooms["NURSERYE12"].moveMinutes = 1;
	rooms["NURSERYE12"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYE12"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYE12"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYE12"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYE12"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYG12"] = new RoomClass(this);
	rooms["NURSERYG12"].roomName = "NURSERY\nCAFETERIA";
	rooms["NURSERYG12"].description = "You’re standing in the nursery’s cafeteria, a cozy structure modelled after a posh cafe on one side -- for the older children, no doubt -- and that of a play palace on the other, replete with benches and an animatronic servant that distributes the food. The two sides are separated by a small divide, just enough to keep the noise down.";
	rooms["NURSERYG12"].runOnEnter = nurseryCafeteriaFunc;
	rooms["NURSERYG12"].westExit = "NURSERYE12";
	rooms["NURSERYG12"].planet = "TAVROS STATION";
	rooms["NURSERYG12"].system = "SYSTEM: KALAS";
	rooms["NURSERYG12"].moveMinutes = 1;
	rooms["NURSERYG12"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYG12"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYG12"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYG12"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYG12"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYG14"] = new RoomClass(this);
	rooms["NURSERYG14"].roomName = "\nNURSERY";
	rooms["NURSERYG14"].description = "";
	rooms["NURSERYG14"].runOnEnter = nurseryG14Func;
	rooms["NURSERYG14"].eastExit = "NURSERYI14";
	rooms["NURSERYG14"].westExit = "NURSERYE14";
	rooms["NURSERYG14"].planet = "TAVROS STATION";
	rooms["NURSERYG14"].system = "SYSTEM: KALAS";
	rooms["NURSERYG14"].moveMinutes = 1;
	rooms["NURSERYG14"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYG14"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYG14"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYG14"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYG14"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYI14"] = new RoomClass(this);
	rooms["NURSERYI14"].roomName = "\nNURSERY";
	rooms["NURSERYI14"].description = "You’re standing at a T-bone intersection of corridors, connecting the foyer back west to a huge complex to the east marked ‘Education Center’, and another branch south that leads into dozens of other, smaller halls and the bedrooms.";
	rooms["NURSERYI14"].runOnEnter = nurseryI14Func;
	rooms["NURSERYI14"].eastExit = "NURSERYK14";
	rooms["NURSERYI14"].westExit = "NURSERYG14";
	rooms["NURSERYI14"].southExit = "NURSERYI16";
	rooms["NURSERYI14"].planet = "TAVROS STATION";
	rooms["NURSERYI14"].system = "SYSTEM: KALAS";
	rooms["NURSERYI14"].moveMinutes = 1;
	rooms["NURSERYI14"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYI14"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYI14"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYI14"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYI14"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYI16"] = new RoomClass(this);
	rooms["NURSERYI16"].roomName = "NURSERY:\nCHILDREN";
	rooms["NURSERYI16"].description = "";
	rooms["NURSERYI16"].runOnEnter = nurseryKidsDormsFunc;
	rooms["NURSERYI16"].northExit = "NURSERYI14";
	rooms["NURSERYI16"].southExit = "NURSERYI18";
	rooms["NURSERYI16"].planet = "TAVROS STATION";
	rooms["NURSERYI16"].system = "SYSTEM: KALAS";
	rooms["NURSERYI16"].moveMinutes = 1;
	rooms["NURSERYI16"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYI16"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYI16"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYI16"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYI16"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYI18"] = new RoomClass(this);
	rooms["NURSERYI18"].roomName = "NURSERY:\nSPECIALIST";
	rooms["NURSERYI18"].description = "";
	rooms["NURSERYI18"].runOnEnter = nurserySpecialistRooms;
	rooms["NURSERYI18"].northExit = "NURSERYI16";
	rooms["NURSERYI18"].planet = "TAVROS STATION";
	rooms["NURSERYI18"].system = "SYSTEM: KALAS";
	rooms["NURSERYI18"].moveMinutes = 1;
	rooms["NURSERYI18"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYI18"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYI18"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYI18"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYI18"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYK14"] = new RoomClass(this);
	rooms["NURSERYK14"].roomName = "NURSERY:\nEDU. CENTER";
	rooms["NURSERYK14"].description = "The nursery’s education center greets you with a sprawling, circular chamber dominated by a rounded desk and several holoscreens along the walls, displaying curriculums and after-school opportunities. Several doors branch off from the main chamber, into individual sets of classrooms for each grade -- from preschool all the way to 12th grade, and even including a few technical and shop classes.";
	rooms["NURSERYK14"].runOnEnter = nurseryEducationCenterFunc;
	rooms["NURSERYK14"].westExit = "NURSERYI14";
	rooms["NURSERYK14"].planet = "TAVROS STATION";
	rooms["NURSERYK14"].system = "SYSTEM: KALAS";
	rooms["NURSERYK14"].moveMinutes = 1;
	rooms["NURSERYK14"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYK14"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYK14"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYK14"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYK14"].addFlag(GLOBAL.NURSERY);

	// Second floor
	rooms["NURSERYSTAIRS2F"] = new RoomClass(this);
	rooms["NURSERYSTAIRS2F"].roomName = "NURSERY:\n2F STAIRWELL";
	rooms["NURSERYSTAIRS2F"].description = "";
	rooms["NURSERYSTAIRS2F"].runOnEnter = nurseryStairs2F;
	rooms["NURSERYSTAIRS2F"].northExit = "NURSERYC6";
	rooms["NURSERYSTAIRS2F"].outExit = "NURSERYSTAIRS1F";
	rooms["NURSERYSTAIRS2F"].outText = "Down";
	rooms["NURSERYSTAIRS2F"].planet = "TAVROS STATION";
	rooms["NURSERYSTAIRS2F"].system = "SYSTEM: KALAS";
	rooms["NURSERYSTAIRS2F"].moveMinutes = 1;
	rooms["NURSERYSTAIRS2F"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYSTAIRS2F"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYSTAIRS2F"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYSTAIRS2F"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYSTAIRS2F"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYC6"] = new RoomClass(this);
	rooms["NURSERYC6"].roomName = "NURSERY:\nSTAFF ROOM";
	rooms["NURSERYC6"].description = "Immediately off the stairs once you reach the second floor is a small, cozy break room. A few chairs, a JoyCo vending machine, and a full-suite kitchen make sure that the nursery’s staff and permanent residents have everything they need to stay sane when off the clock.";
	rooms["NURSERYC6"].runOnEnter = nurseryC6Func;
	rooms["NURSERYC6"].southExit = "NURSERYSTAIRS2F";
	rooms["NURSERYC6"].eastExit = "NURSERYE6";
	rooms["NURSERYC6"].planet = "TAVROS STATION";
	rooms["NURSERYC6"].system = "SYSTEM: KALAS";
	rooms["NURSERYC6"].moveMinutes = 1;
	rooms["NURSERYC6"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYC6"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYC6"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYC6"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYC6"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYE6"] = new RoomClass(this);
	rooms["NURSERYE6"].roomName = "\nNURSERY";
	rooms["NURSERYE6"].description = "A corridor stretches from east to west, connecting the upper floors of the nursery back to the break room and stairs. To the north is a room labeled simply ‘Milking Station’. To the south, ‘Bio-Science Center’.";
	rooms["NURSERYE6"].runOnEnter = nurseryE6Func;
	rooms["NURSERYE6"].northExit = "NURSERYE4";
	rooms["NURSERYE6"].southExit = "NURSERYE8";
	rooms["NURSERYE6"].eastExit = "NURSERYG6";
	rooms["NURSERYE6"].westExit = "NURSERYC6";
	rooms["NURSERYE6"].planet = "TAVROS STATION";
	rooms["NURSERYE6"].system = "SYSTEM: KALAS";
	rooms["NURSERYE6"].moveMinutes = 1;
	rooms["NURSERYE6"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYE6"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYE6"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYE6"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYE6"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYE4"] = new RoomClass(this);
	rooms["NURSERYE4"].roomName = "NURSERY:\nMILKING STATION";
	rooms["NURSERYE4"].description = "The milking room feels so soft and comfortable, entirely designed to be as relaxing and soothing as possible for long, stress-free hours spent producing sustenance for the nursery’s charges. Soft, warm light floods the room; bright enough to comfortably illuminate the room, but completely unlike the harsh flourescent lighting used throughout the rest of the station, with a soft, inviting couch tucked against one of the walls. Far more homely than anywhere else around Tavros.";
	rooms["NURSERYE4"].runOnEnter = nurseryMilkingRoomFunc;
	rooms["NURSERYE4"].southExit = "NURSERYE6";
	rooms["NURSERYE4"].planet = "TAVROS STATION";
	rooms["NURSERYE4"].system = "SYSTEM: KALAS";
	rooms["NURSERYE4"].moveMinutes = 1;
	rooms["NURSERYE4"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYE4"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYE4"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYE4"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYE4"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYE8"] = new RoomClass(this);
	rooms["NURSERYE8"].roomName = "NURSERY:\nBIO-SCIENCES";
	rooms["NURSERYE8"].description = "";
	rooms["NURSERYE8"].runOnEnter = undefined;
	rooms["NURSERYE8"].northExit = "NURSERYE6";
	rooms["NURSERYE8"].planet = "TAVROS STATION";
	rooms["NURSERYE8"].system = "SYSTEM: KALAS";
	rooms["NURSERYE8"].moveMinutes = 1;
	rooms["NURSERYE8"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYE8"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYE8"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYE8"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYE8"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYG6"] = new RoomClass(this);
	rooms["NURSERYG6"].roomName = "\nNURSERY";
	rooms["NURSERYG6"].description = "A corridor stretches from east to west, connecting the upper floors of the nursery back to the break room and stairs. North is a room bearing your name on it, underscored with ‘Personal Apartment’. Your home away from home when on maternity leave, if need be. Opposite your door is another executive suite marked simply ‘Headmistress Briget’. To the east is a section primarily used for temporary housing.";
	rooms["NURSERYG6"].runOnEnter = undefined;
	rooms["NURSERYG6"].northExit = "NURSERYG4";
	rooms["NURSERYG6"].southExit = "NURSERYG8";
	rooms["NURSERYG6"].westExit = "NURSERYE6";
	rooms["NURSERYG6"].eastExit = "NURSERYI6";
	rooms["NURSERYG6"].planet = "TAVROS STATION";
	rooms["NURSERYG6"].system = "SYSTEM: KALAS";
	rooms["NURSERYG6"].moveMinutes = 1;
	rooms["NURSERYG6"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYG6"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYG6"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYG6"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYG6"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYG4"] = new RoomClass(this);
	rooms["NURSERYG4"].roomName = "NURSERY:\nYOUR APT.";
	rooms["NURSERYG4"].description = "The private suite you’ve been assigned in the nursery is... well, it looks like your room growing up. So much so that you’re half sure Dad just boxed your things up and mailed them out here. Familiar posters, devices, and even the bedspread all remind you of home.\n\nOn top of the bedroom suite, your apartment comes equipped with a kitchen, living room... everything you need to live here more than comfortably for extended periods of time, really.";
	rooms["NURSERYG4"].runOnEnter = nurseryPlayerApptFunc;
	rooms["NURSERYG4"].southExit = "NURSERYG6";
	rooms["NURSERYG4"].planet = "TAVROS STATION";
	rooms["NURSERYG4"].system = "SYSTEM: KALAS";
	rooms["NURSERYG4"].moveMinutes = 1;
	rooms["NURSERYG4"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYG4"].addFlag(GLOBAL.PRIVATE);
	rooms["NURSERYG4"].addFlag(GLOBAL.BED);
	rooms["NURSERYG4"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYG8"] = new RoomClass(this);
	rooms["NURSERYG8"].roomName = "NURSERY:\nBRIGET’S APT.";
	rooms["NURSERYG8"].description = "The apartment granted to your nurse-maid gynoid is surprisingly spartan, given her age and humanism. Maybe she just doesn’t spend much time here? There’s a queen-sized bed, immaculately made, in one room, and a spotlessly clean kitchen that opens into a dining room with a pair of chairs around a mahogany table -- the most expensive-looking thing around.";
	rooms["NURSERYG8"].runOnEnter = nurseryBrigetsApptFunc;
	rooms["NURSERYG8"].northExit = "NURSERYG6";
	rooms["NURSERYG8"].planet = "TAVROS STATION";
	rooms["NURSERYG8"].system = "SYSTEM: KALAS";
	rooms["NURSERYG8"].moveMinutes = 1;
	rooms["NURSERYG8"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYG8"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYG8"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYG8"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYG8"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYI6"] = new RoomClass(this);
	rooms["NURSERYI6"].roomName = "NURSERY:\nTEMP. HOUSING";
	rooms["NURSERYI6"].description = "A couple of spare apartments are situated here, used intentionally as transitional shelter for grown children planning to move out or as living space for guests.";
	rooms["NURSERYI6"].runOnEnter = nurserySpareApptBonus;
	rooms["NURSERYI6"].westExit = "NURSERYG6";
	rooms["NURSERYI6"].planet = "TAVROS STATION";
	rooms["NURSERYI6"].system = "SYSTEM: KALAS";
	rooms["NURSERYI6"].moveMinutes = 1;
	rooms["NURSERYI6"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYI6"].addFlag(GLOBAL.PUBLIC);
	rooms["NURSERYI6"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["NURSERYI6"].addFlag(GLOBAL.FAPPING_ILLEGAL);
	rooms["NURSERYI6"].addFlag(GLOBAL.NURSERY);

	rooms["NURSERYSERA"] = new RoomClass(this);
	rooms["NURSERYSERA"].roomName = "NURSERY:\nSERA’S APT.";
	rooms["NURSERYSERA"].description = "";
	rooms["NURSERYSERA"].runOnEnter = undefined;
	rooms["NURSERYSERA"].southExit = "NURSERYI6";
	rooms["NURSERYSERA"].planet = "TAVROS STATION";
	rooms["NURSERYSERA"].system = "SYSTEM: KALAS";
	rooms["NURSERYSERA"].moveMinutes = 1;
	rooms["NURSERYSERA"].addFlag(GLOBAL.INDOOR);
	rooms["NURSERYSERA"].addFlag(GLOBAL.PRIVATE);
	rooms["NURSERYSERA"].addFlag(GLOBAL.NPC);
	rooms["NURSERYSERA"].addFlag(GLOBAL.NURSERY);
	
	//Random Ramis Bar
	//Time forward 1 ½ hours, move to standalone Some Club, Somewhere On The Merchant Deck,
	rooms["RAMISBAR"] = new RoomClass(this);
	rooms["RAMISBAR"].roomName = "\nSOME BAR";
	rooms["RAMISBAR"].description = "";
	rooms["RAMISBAR"].runOnEnter = undefined;
	rooms["RAMISBAR"].planet = "TAVROS STATION";
	rooms["RAMISBAR"].system = "SYSTEM: KALAS";
	rooms["RAMISBAR"].moveMinutes = 15;
	rooms["RAMISBAR"].addFlag(GLOBAL.INDOOR);
	rooms["RAMISBAR"].addFlag(GLOBAL.PRIVATE);
	rooms["RAMISBAR"].addFlag(GLOBAL.NPC);
	
	// Riya locations
	rooms["RIYAQUEST"] = new RoomClass(this);
	rooms["RIYAQUEST"].roomName = "PIRATE\nBASE";
	rooms["RIYAQUEST"].description = "";
	rooms["RIYAQUEST"].planet = "TAVROS STATION";
	rooms["RIYAQUEST"].system = "SYSTEM: KALAS";
	rooms["RIYAQUEST"].moveMinutes = 1;
	rooms["RIYAQUEST"].runOnEnter = undefined;
	rooms["RIYAQUEST"].addFlag(GLOBAL.INDOOR);
	
	rooms["RIYAPARTY"] = new RoomClass(this);
	rooms["RIYAPARTY"].roomName = "\nDECK 4";
	rooms["RIYAPARTY"].description = "";
	rooms["RIYAPARTY"].planet = "TAVROS STATION";
	rooms["RIYAPARTY"].system = "SYSTEM: KALAS";
	rooms["RIYAPARTY"].moveMinutes = 2;
	rooms["RIYAPARTY"].runOnEnter = undefined;
	rooms["RIYAPARTY"].addFlag(GLOBAL.INDOOR);
	
	//1011 East Walkway 2
	rooms["RESIDENTIAL MIRRIN"] = new RoomClass(this);
	rooms["RESIDENTIAL MIRRIN"].roomName = "\nSTERKURHÚS";
	rooms["RESIDENTIAL MIRRIN"].description = "";
	rooms["RESIDENTIAL MIRRIN"].planet = "TAVROS STATION";
	rooms["RESIDENTIAL MIRRIN"].system = "SYSTEM: KALAS";
	rooms["RESIDENTIAL MIRRIN"].westExit = "RESIDENTIAL DECK 11";
	rooms["RESIDENTIAL MIRRIN"].moveMinutes = 1;
	rooms["RESIDENTIAL MIRRIN"].addFlag(GLOBAL.INDOOR);
	rooms["RESIDENTIAL MIRRIN"].addFlag(GLOBAL.PUBLIC);
	rooms["RESIDENTIAL MIRRIN"].addFlag(GLOBAL.NUDITY_ILLEGAL);
	rooms["RESIDENTIAL MIRRIN"].runOnEnter = mirrinSterkurHusBonus;

	rooms["ANON'S BACK END"] = new RoomClass(this);
	rooms["ANON'S BACK END"].roomName = "ANON’S\nBACK END";
	rooms["ANON'S BACK END"].description = "You find yourself in the back room of Anon’s bar. The crowds filling the entrance thin out around here, but the smells of booze and debauchery are still unmistakable. It would seem this part of the bar is destined for patrons interested in a more peaceful environment than the hustle and bustle that characterizes the rest of the place. To the west is the way to the entrance, where you came from.";
	rooms["ANON'S BACK END"].planet = "TAVROS STATION";
	rooms["ANON'S BACK END"].system = "SYSTEM: KALAS";
	rooms["ANON'S BACK END"].westExit = "ANON'S BAR AND BOARD";
	rooms["ANON'S BACK END"].runOnEnter = anonBackEndBonus;
	rooms["ANON'S BACK END"].moveMinutes = 1;
	rooms["ANON'S BACK END"].addFlag(GLOBAL.INDOOR);
	//rooms["ANON'S BACK END"].addFlag(GLOBAL.BAR);
	rooms["ANON'S BACK END"].addFlag(GLOBAL.PUBLIC);
	rooms["ANON'S BACK END"].addFlag(GLOBAL.NUDITY_ILLEGAL);
}