A description can say a parser "type" on a "value" (`Is` parser on `femininity` \> type = `Is`, value = `femininity`). If you do not know what the type does, check the documentation. If you do not know what the value is/does, the [appearance section](https://wiki.smutosaur.us/TiTS/Appearance) of the TiTS wiki is a good place to start.

|Parser | Arguments | Results | Description|
|---------|------|---------|-------------|
|femIs| Infinite `number` | Up to `args` + 1 | `Is` parser on `femininity`|
|femRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `femininity`|
|tallnessIs| Infinite `number` | Up to `args` + 1 | `Is` parser on `tallness`|
|tallnessRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `tallness`|
|thicknessIs| Infinite `number` | Up to `args` + 1 | `Is` parser on `thickness`|
|thicknessRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `thickness`|
|toneIs| Infinite `number` | Up to `args` + 1 | `Is` parser on `tone`|
|toneRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `tone`|
|hipRatingIs| Infinite `number` | Up to `args` + 1 | `Is` parser on `hipRating`|
|hipRatingRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `hipRating`|
|buttRatingIs| Infinite `number` | Up to `args` + 1 | `Is` parser on `buttRating`|
|buttRatingRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `buttRating`|
|skinTypeIs| Infinite [VALID_SKIN_TYPE](NameList.md) | Up to `args` + 1 | Skin type is equal to `arg` |
|hasAccentMarkings||Up to 2||
|eyeTypeIs| Infinite [VALID_EYE_TYPE](NameList.md) | Up to `args` + 1 | Eye type is equal to `arg` |
|hairTypeIs| Infinite [VALID_HAIR_TYPE](NameList.md) | Up to `args` + 1 | Hair type is equal to `arg` |
|beardTypeIs| Infinite [VALID_HAIR_TYPE](NameList.md) | Up to `args` + 1 | Beard type is equal to `arg` |
|faceTypeIs| Infinite [VALID_FACE_TYPE](NameList.md) | Up to `args` + 1 | Face type is equal to `arg` |
|hasFaceFlag| Infinite [VALID_FACE_FLAG](NameList.md) | Up to `args` + 1 | Face flag list has `arg` |
|hasFaceFlags| Infinite [VALID_FACE_FLAG](NameList.md) | Up to 2 | Face flag list has all `args` |
|tongueTypeIs| Infinite [VALID_TONGUE_TYPE](NameList.md) | Up to `args` + 1 | Tongue type is equal to `arg` |
|hasTongueFlag| Infinite [VALID_TONGUE_FLAG](NameList.md) | Up to `args` + 1 | Tongue flag list has `arg` |
|hasTongueFlags| Infinite [VALID_TONGUE_FLAG](NameList.md) | Up to 2 | Tongue flag list has all `args` |
|earTypeIs| Infinite [VALID_EAR_TYPE](NameList.md) | Up to `args` + 1 | Ear type is equal to `arg` |
|hasEarFlag| Infinite [VALID_EAR_FLAG](NameList.md) | Up to `args` + 1 | Ear flag list has `arg` |
|hasEarFlags| Infinite [VALID_EAR_FLAG](NameList.md) | Up to 2 | Ear flag list has all `args` |
|antennaeTypeIs| Infinite [VALID_ANTENNAE_TYPE](NameList.md) | Up to `args` + 1 | Antennae type is equal to `arg` |
|hornTypeIs| Infinite [VALID_HORN_TYPE](NameList.md) | Up to `args` + 1 | Horn type is equal to `arg` |
|armTypeIs| Infinite [VALID_ARM_TYPE](NameList.md) | Up to `args` + 1 | Arm type is equal to `arg` |
|hasArmFlag| Infinite [VALID_ARM_FLAG](NameList.md) | Up to `args` + 1 | Arm flag list has `arg` |
|hasArmFlags| Infinite [VALID_ARM_FLAG](NameList.md) | Up to 2 | Arm flag list has all `args` |
|wingTypeIs| Infinite [VALID_WING_TYPE](NameList.md) | Up to `args` + 1 | Wing type is equal to `arg` |
|legTypeIs| Infinite [VALID_LEG_TYPE](NameList.md) | Up to `args` + 1 | Leg type is equal to `arg` |
|hasLegFlag| Infinite [VALID_LEG_FLAG](NameList.md) | Up to `args` + 1 | Leg flag list has `arg` |
|hasLegFlags| Infinite [VALID_LEG_FLAG](NameList.md) | Up to 2 | Leg flag list has all `args` |
|isBiped|| Up to 2 | Lower body is biped|
|isNaga|| Up to 2 | Lower body is naga|
|isTaur|| Up to 2 | Lower body is taur|
|isCentaur|| Up to 2 | Lower body is centaur|
|isDrider|| Up to 2 | Lower body is drider|
|isGoo|| Up to 2 | Lower body is goo|
|tailTypeIs| Infinite [VALID_TAIL_TYPE](NameList.md) | Up to `args` + 1 | Tail type is equal to `arg` |
|hasTailFlag| Infinite [VALID_TAIL_FLAG](NameList.md) | Up to `args` + 1 | Tail flag list has `arg` |
|hasTailFlags| Infinite [VALID_TAIL_FLAG](NameList.md) | Up to 2 | Tail flag list has all `args` |
|tailCountIs| Infinite `number` | Up to `args` + 1 | Tail count is equal to `arg` |
|tailCountRange| Infinite `number` | Up to `args` + 1 | `Range` parser on `tailCount`|
|hasCock|| Up to 2 | Has a cock |
|hasCocks|| Up to 2 | Has multiple cocks |
|hasACockWithType| Infinite [VALID_COCK_TYPE](NameList.md) | Up to `args` + 1 | A cock's type is equal to `arg` |
|cockCountIs| Infinite `number` | Up to `args` + 1 | Cock count is equal to `arg` |
|cockTypeIs| One `number` (Cock index, starts at 0), Infinite [VALID_COCK_TYPE](NameList.md) | Up to `args` except `number` + 1 | Type of cock at `number` is equal to `arg` |
|cockThatFits| One `number` || Index # of first cock that fits `arg`. Use as `arg` in anything that requires cock position. |
|biggestCockIndex||| Index # of biggest cock. Use as `arg` in anything that requires cock position. |
|smallestCockIndex||| Index # of smallest cock. Use as `arg` in anything that requires cock position. |
|thickestCockIndex||| Index # of thickest cock. Use as `arg` in anything that requires cock position. |
|thinnestCockIndex||| Index # of thinnest cock. Use as `arg` in anything that requires cock position. |
|longestCockIndex||| Index # of longest cock. Use as `arg` in anything that requires cock position. |
|shortestCockIndex||| Index # of shortest cock. Use as `arg` in anything that requires cock position. |
|ballCountIs| Infinite `number` | Up to `args` + 1 | Balls count is equal to `arg` |
|ballSizeIs| Infinite `number` | Up to `args` + 1 | Ball size is equal to `arg` |
|hasBreasts|| Up to 2 ||
|breastCountIs| Infinite `number` | Up to `args` + 1 | Breast count is equal to `arg` |
|breastCupSizeIs| One `number` (Breast index, starts at 0), Infinite [BreastCupSize](BreastCupSize.md) | Up to `args` except `number` + 1 | Cup size of breast at `number` is equal to `arg` |
|hasVagina|| Up to 2 ||
|milkTypeIs| Infinite [VALID_MILK_TYPE](NameList.md) | Up to `args` + 1 | Milk type is equal to `arg` |
|milkQRange| Infinite `number` | Up to `args` + 1 | Milk quantity `range` |
|cumTypeIs| Infinite [VALID_CUM_TYPE](NameList.md) | Up to `args` + 1 | Cum type is equal to `arg` |
|cumQRange| Infinite `number` | Up to `args` + 1 | Cum quantity `range` |
|girlCumTypeIs| Infinite [VALID_GIRL_CUM_TYPE](NameList.md) | Up to `args` + 1 | Girl cum type is equal to `arg` |
|girlCumQRange| Infinite `number` | Up to `args` + 1 | Girl cum quantity `range` |
|isNice|| Up to 2 | Personality is nice |
|isMisch|| Up to 2 | Personality is mischievous |
|isAss|| Up to 2 | Personality is an ass |
|isExposed|| Up to 2 ||
|isChestExposed|| Up to 2 ||
|isCrotchExposed|| Up to 2 ||
|isAssExposed|| Up to 2 ||
|isSexless|| Up to 2 ||
|isMale|| Up to 2 ||
|isFemale|| Up to 2 ||
|isMasculine|| Up to 2 ||
|isFeminine|| Up to 2 ||
|isMan|| Up to 2 ||
|isWoman|| Up to 2 ||
|isFemboy|| Up to 2 ||
|isShemale|| Up to 2 ||
|isCuntboy|| Up to 2 ||
|isFemmyMale|| Up to 2 ||
|isManlyFemale|| Up to 2 ||
|isFemHerm|| Up to 2 ||
|isManHerm|| Up to 2 ||
|lustIs| Infinite `number` | Up to `args` + 1 | Lust is equal to `arg` |
|lustRange| Infinite `number` | Up to `args` + 1 | Lust `range` |
|physiqueIs| Infinite `number` | Up to `args` + 1 | Physique is equal to `arg` |
|physiqueRange| Infinite `number` | Up to `args` + 1 | Physique `range` |
|reflexesIs| Infinite `number` | Up to `args` + 1 | Reflex is equal to `arg` |
|reflexesRange| Infinite `number` | Up to `args` + 1 | Reflexes `range` |
|aimIs| Infinite `number` | Up to `args` + 1 | Aim is equal to `arg` |
|aimRange| Infinite `number` | Up to `args` + 1 | Aim `range` |
|intelligenceIs| Infinite `number` | Up to `args` + 1 | Intelligence is equal to `arg` |
|intelligenceRange| Infinite `number` | Up to `args` + 1 | Intelligence `range` |
|willpowerIs| Infinite `number` | Up to `args` + 1 | Willpower is equal to `arg` |
|willpowerRange| Infinite `number` | Up to `args` + 1 | Willpower `range` |
|libidoIs| Infinite `number` | Up to `args` + 1 | Libido is equal to `arg` |
|libidoRange| Infinite `number` | Up to `args` + 1 | Libido `range` |
|taintIs| Infinite `number` | Up to `args` + 1 | Taint is equal to `arg` |
|taintRange| Infinite `number` | Up to `args` + 1 | Taint `range` |
|inHeat|| Up to 2 ||
|inDeepHeat|| Up to 2 ||
|inRut|| Up to 2 ||
|isBimbo|| Up to 2 ||
|isBro|| Up to 2 ||
|isTreated|| Up to 2 ||
|isTreatedFemale|| Up to 2 ||
|isTreatedMale|| Up to 2 ||
|isTreatedCow|| Up to 2 ||
|isTreatedBull|| Up to 2 ||
|isAmazon|| Up to 2 ||
|isCumCow|| Up to 2 ||
|isCumSlut|| Up to 2 ||
|isFauxCow|| Up to 2 ||
|hasPheromones|| Up to 2 ||
|hasPerk| Infinite [Perk](PerkList.md) | Up to `args` + 1 | Perk list has `arg` |
|hasStatusEffect| Infinite [Status Effect](StatusEffectList.md) | Up to `args` + 1 | Status effect list has `arg` |
|hasPiercing|| Up to 2 ||
|hasEarPiercing|| Up to 2 ||
|hasEyebrowPiercing|| Up to 2 ||
|hasNosePiercing|| Up to 2 ||
|hasLipPiercing|| Up to 2 ||
|hasTonguePiercing|| Up to 2 ||
|hasBellyPiercing|| Up to 2 ||
|hasNipplePiercing| Up to 1 `number` | Up to 2 ||
|hasCockPiercing| Up to 1 `number` | Up to 2 ||
|hasPiercedVaginas| Up to 1 `number` | Up to 2 ||
|hasClitPiercing| Up to 1 `number` | Up to 2 ||
|hasCocksock| Up to 1 `number` | Up to 2 ||
|hasKeyItem| Infinite [Key Item](KeyItemList.md) | Up to `args` + 1 | Key item list has `arg` |
