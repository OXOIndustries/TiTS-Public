package classes.Descriptors {
    import classes.Creature;
    import classes.Engine.Utility.*;
	import classes.GLOBAL;
    import classes.kGAMECLASS;
    import classes.Characters.PlayerCharacter;

    public class CreatureDescriptor {
        private var ownerObj: ObjectAccessor;
        
        public function CreatureDescriptor(ownerObj: ObjectAccessor) {
            this.ownerObj = ownerObj;
        }
        
        protected function get owner(): Creature { return this.ownerObj.value; }
        
        public function get height(): String {
            return this.owner.height();
        }
        public function get gear(): String {
            return this.owner.gearDescript();
        }
        public function get clothes(): String {
            return this.owner.clothesDescript(); // isolates layer unlike gear -- armor if its there, otherwise both undergarments
        }
        public function get ship(): String {
            if(this.owner is PlayerCharacter) return kGAMECLASS.PCShipName(true);
            else return "ship";
        }
        public function get shipModel(): String {
            if(this.owner is PlayerCharacter) return kGAMECLASS.PCShipModel();
            else return "ship";
        }
        public function get short(): String { return this.name; }
        public function get name(): String {
            return this.owner.nameDisplay();
        }
        public function get fullName(): String { return this.fullname; }
        public function get fullname(): String {
            return this.owner.short + (this.owner is PlayerCharacter) ? " Steele" : "";
        }
        public function get race(): String {
            return this.owner.race();
        }
        public function get raceType(): String { return this.stripRace; }
        public function get raceShort(): String { return this.stripRace; }
        public function get raceSimple(): String { return this.stripRace; }
        public function get simpleRace(): String { return this.stripRace; }
        public function get raceStrip(): String { return this.stripRace; }
        public function get stripRace(): String {
            return this.owner.raceShort();
        }
        public function get raceTypeStrict(): String { return this.raceTypeHuman; }
        public function get raceTypeHuman(): String {
            return this.owner.raceShort(true);
        }
        public function get raceCute(): String {
            return this.owner.raceCute();
        }
        public function get raceCuteShort(): String { return this.raceCuteSimple; }
        public function get raceCuteSimple(): String {
            return this.owner.raceCute(true);
        }
        public function get raceBoyGirl(): String {
            return this.owner.raceCute(false, true);
        }
        public function get raceBoyGirlShort(): String { return this.raceBoyGirlSimple; }
        public function get raceBoyGirlSimple(): String {
            return this.owner.raceCute(true, true);
        }
        public function get aRace(): String {
            return indefiniteArticle(this.owner.race());
        }
        public function get aRaceType(): String { return this.aStripRace; }
        public function get aRaceShort(): String { return this.aStripRace; }
        public function get aRaceSimple(): String { return this.aStripRace; }
        public function get aSimpleRace(): String { return this.aStripRace; }
        public function get aRaceStrip(): String { return this.aStripRace; }
        public function get aStripRace(): String {
            return indefiniteArticle(this.owner.raceShort());
        }
        public function get aRaceTypeStrict(): String { return this.aRaceTypeHuman; }
        public function get aRaceTypeHuman(): String {
            return indefiniteArticle(this.owner.raceShort(true));
        }
        public function get aRaceCute(): String {
            return indefiniteArticle(this.owner.raceCute());
        }
        public function get aRaceCuteShort(): String { return this.aRaceCuteSimple; }
        public function get aRaceCuteSimple(): String {
            return indefiniteArticle(this.owner.raceCute(true));
        }
        public function get aRaceBoyGirl(): String {
            return indefiniteArticle(this.owner.raceCute(false, true));
        }
        public function get aRaceBoyGirlShort(): String { return this.aRaceBoyGirlSimple; }
        public function get aRaceBoyGirlSimple(): String {
            return indefiniteArticle(this.owner.raceCute(true, true));
        }
        // public function get class(): String { return this.occupation(); }
        public function get classType(): String { return this.occupation; }
        public function get characterClass(): String { return this.occupation; }
        public function get startingCareer(): String { return this.occupation; }
        public function get occupation(): String {
            return GLOBAL.CLASS_NAMES[this.owner.characterClass].toLowerCase();
        }
        public function get aClass(): String { return this.anOccupation; }
        public function get aClassType(): String { return this.anOccupation; }
        public function get aCharacterClass(): String { return this.anOccupation; }
        public function get aStartingCareer(): String { return this.anOccupation; }
        public function get anOccupation(): String {
            return indefiniteArticle(GLOBAL.CLASS_NAMES[this.owner.characterClass].toLowerCase());
        }
        public function get armor(): String {
            return this.owner.armor.longName;
        }
        public function get weapon(): String {
            return this.owner.getWeaponName(true);
        }
        public function get meleeWeapon(): String { return this.weaponMelee; }
        public function get weaponMelee(): String {
            return this.owner.meleeWeapon.longName;
        }
        public function get rangedWeapon(): String { return this.weaponRanged; }
        public function get weaponRanged(): String {
            return this.owner.rangedWeapon.longName;
        }
        public function get rangedNoun(): String { return this.bowNoun; }
        public function get gunNoun(): String { return this.bowNoun; }
        public function get bowNoun(): String {
            return this.owner.getRangedNoun();
        }
        public function get mainWeapon(): String { return this.weaponStat; }
        public function get weaponMain(): String { return this.weaponStat; }
        public function get weaponStat(): String {
            return this.owner.getWeaponName(true);
        }
        public function get heldWeapon(): String {
            return this.owner.heldWeaponName();
        }
        public function get draw(): String {
            return this.owner.weaponActionReady(false, "stat", false);
        }
        public function get holster(): String {
            return this.owner.weaponActionRelax(false, "stat", false);
        }
        public function get drawing(): String {
            return this.owner.weaponActionReady(true, "stat", false);
        }
        public function get holstering(): String {
            return this.owner.weaponActionRelax(true, "stat", false);
        }
        public function get drawWeapon(): String { return this.readyWeapon; }
        public function get readyWeapon(): String {
            return this.owner.weaponActionReady(false, "stat");
        }
        public function get holsterWeapon(): String { return this.relaxWeapon; }
        public function get relaxWeapon(): String {
            return this.owner.weaponActionRelax(false, "stat");
        }
        public function get drawingWeapon(): String { return this.readyingWeapon; }
        public function get readyingWeapon(): String {
            return this.owner.weaponActionReady(true, "stat");
        }
        public function get holsteringWeapon(): String { return this.relaxingWeapon; }
        public function get relaxingWeapon(): String {
            return this.owner.weaponActionRelax(true, "stat");
        }
        public function get readyMelee(): String {
            return this.owner.weaponActionReady(false, "melee");
        }
        public function get relaxMelee(): String {
            return this.owner.weaponActionRelax(false, "melee");
        }
        public function get readyingMelee(): String {
            return this.owner.weaponActionReady(true, "melee");
        }
        public function get relaxingMelee(): String {
            return this.owner.weaponActionRelax(true, "melee");
        }
        public function get readyRanged(): String {
            return this.owner.weaponActionReady(false, "ranged");
        }
        public function get relaxRanged(): String {
            return this.owner.weaponActionRelax(false, "ranged");
        }
        public function get readyingRanged(): String {
            return this.owner.weaponActionReady(true, "ranged");
        }
        public function get relaxingRanged(): String {
            return this.owner.weaponActionRelax(true, "ranged");
        }
        public function get move(): String {
            return this.owner.moveAction();
        }
        public function get walk(): String {
            return this.owner.moveAction(false, true);
        }
        public function get moving(): String {
            return this.owner.moveAction(true);
        }
        public function get walking(): String {
            return this.owner.moveAction(true, true);
        }
        public function get lowerUndergarment(): String {
            return this.owner.lowerUndergarment.longName;
        }
        public function get upperUndergarment(): String {
            return this.owner.upperUndergarment.longName;
        }
        public function get upperGarment(): String {
            return this.owner.upperGarmentDescript();
        }
        public function get upperGarmentOuter(): String {
            return this.owner.upperGarmentOuterDescript();
        }
        public function get upperGarments(): String {
            return this.owner.upperGarmentsDescript();
        }
        public function get lowerGarments(): String {
            return this.owner.lowerGarmentsDescript();
        }
        public function get lowerGarment(): String {
            return this.owner.lowerGarmentDescript();
        }
        public function get underGarment(): String {
            return this.owner.underGarmentDescript();
        }
        public function get underGarments(): String {
            return this.owner.underGarmentsDescript();
        }
        public function get lowerGarmentOuter(): String {
            return this.owner.lowerGarmentOuterDescript();
        }
        public function get covers(): String { return this.coverings; }
        public function get coverings(): String {
            return this.owner.covers();
        }
        public function get crotchCover(): String {
            return this.owner.crotchCover();
        }
        public function get crotchCoverUnder(): String {
            return this.owner.crotchCoverUnder();
        }
        public function get crotchCovers(): String {
            return this.owner.crotchCovers();
        }
        public function get assCover(): String {
            return this.owner.assCover();
        }
        public function get assCoverUnder(): String {
            return this.owner.assCoverUnder();
        }
        public function get assCovers(): String {
            return this.owner.assCovers();
        }
        public function get chestCover(): String {
            return this.owner.chestCover();
        }
        public function get chestCoverUnder(): String {
            return this.owner.chestCoverUnder();
        }
        public function get chestCovers(): String {
            return this.owner.chestCovers();
        }
        public function get skinNoun(): String {
            return this.owner.skinNoun(true);
        }
        public function get skinFurScalesNoun(): String { return this.skinScalesFurNoun; }
        public function get skinScalesFurNoun(): String {
            return this.owner.skinNoun(false);
        }
        public function get skinNounSimple(): String {
            return this.owner.skinNoun(true, true);
        }
        public function get skinFurScalesNounSimple(): String {
            return this.owner.skinNoun(false, true);
        }
        public function get skinFurScalesColor(): String {
            return this.owner.skinFurScalesColor();
        }
        public function get skinFurScales(): String { return this.skinfurscales; }
        public function get skinfurscales(): String {
            return this.owner.skinFurScales();
        }
        public function get skin(): String {
            return this.owner.skin();
        }
        public function get skinColor(): String { return this.skinTone; }
        public function get skinTone(): String {
            return this.owner.skinTone;
        }
        public function get accentColor(): String { return this.skinAccent; }
        public function get skinAccent(): String {
            return this.owner.skinAccent;
        }
        public function get accentMarkings(): String {
            return this.owner.accentMarkingsDescript();
        }
        public function get accentMarked(): String {
            return this.owner.accentMarkingsDescript(false);
        }
        public function get accentMarkingsNoun(): String {
            return this.owner.accentMarkingsDescript(true, true);
        }
        public function get accentMarkedSimple(): String {
            return this.owner.accentMarkingsDescript(false, true);
        }
        public function get furColor(): String {
            return this.owner.furColor;
        }
        public function get scaleColor(): String {
            return this.owner.scaleColor;
        }
        public function get chitinColor(): String {
            return this.owner.chitinColor("", true);
        }
        public function get chitinColorBody(): String {
            return this.owner.chitinColor("body", true);
        }
        public function get chitinColorArm(): String {
            return this.owner.chitinColor("arm", true);
        }
        public function get chitinColorLeg(): String {
            return this.owner.chitinColor("leg", true);
        }
        public function get chitinColorTail(): String {
            return this.owner.chitinColor("tail", true);
        }
        public function get ears(): String {
            return this.owner.earsDescript();
        }
        public function get ear(): String {
            return this.owner.earDescript();
        }
        public function get eyes(): String {
            return this.owner.eyesDescript();
        }
        public function get eye(): String {
            return this.owner.eyeDescript();
        }
        public function get eyePigment(): String { return this.eyeColor; }
        public function get eyeColor(): String {
            return this.owner.eyeColor;
        }
        public function get nose(): String {
            return this.owner.noseDescript();
        }
        public function get hairsDescript(): String {
            return this.owner.hairsDescript();
        }
        public function get hairDescript(): String { return this.hair; }
        public function get hair(): String {
            return this.owner.hairDescript();
        }
        public function get hairNoun(): String {
            return this.owner.hairNoun();
        }
        public function get hairs(): String { return this.hairsNoun; }
        public function get hairsNoun(): String {
            return this.owner.hairsNoun();
        }
        public function get hairColor(): String {
            return this.owner.hairColor;
        }
        public function get beard(): String {
            return this.owner.beard();
        }
        public function get beardNoun(): String {
            return this.owner.beardStyles(true);
        }
        public function get beardColor(): String {
            return this.owner.beardColor;
        }
        public function get face(): String {
            return this.owner.face();
        }
        public function get mouth(): String {
            return this.owner.mouthDescript();
        }
        public function get mouthFull(): String {
            return this.owner.mouthDescript(true, false);
        }
        public function get mouthFullChaste(): String {
            return this.owner.mouthDescript(true, true);
        }
        public function get mouthChaste(): String {
            return this.owner.mouthDescript(false, true);
        }
        public function get lips(): String {
            return this.owner.lipsDescript();
        }
        public function get lipsChaste(): String {
            return this.owner.lipsDescript(false,true);
        }
        public function get lip(): String {
            return this.owner.lipDescript();
        }
        public function get lipChaste(): String {
            return this.owner.lipDescript(false,true);
        }
        public function get lipColor(): String {
            return this.owner.lipColor;
        }
        public function get tongue(): String {
            return this.owner.tongueDescript();
        }
        public function get tongueNoun(): String {
            return this.owner.tongueNoun();
        }
        public function get tongueNounSimple(): String {
            return this.owner.tongueNoun(true,false);
        }
        public function get tonguePierced(): String {
            return this.owner.tongueNoun(false,true);
        }
        public function get gills(): String {
            return this.owner.gillsDesc();
        }
        public function get gill(): String {
            return this.owner.gillDesc();
        }
        public function get tail(): String {
            return this.owner.tailDescript();
        }
        public function get tailNoun(): String {
            return this.owner.tailDescript(true);
        }
        public function get onetail(): String { return this.oneTail; }
        public function get oneTail(): String {
            return this.owner.oneTailDescript();
        }
        public function get eachtail(): String { return this.eachTail; }
        public function get eachTail(): String {
            return this.owner.eachTailDescript();
        }
        public function get tails(): String {
            return this.owner.tailsDescript();
        }
        public function get tailsIsAre(): String {
            return (this.owner.hasTails() ? this.owner.tailsDescript() + " are" : this.owner.tailsDescript() + " is");
        }
        public function get crotch(): String { return this.genitals; }
        public function get groin(): String { return this.genitals; }
        public function get genitals(): String {
            return this.owner.crotchDescript();
        }
        public function base(args: Array, results: Array): String { return this.sheathOrBase(args, results); }
        public function cockBase(args: Array, results: Array): String { return this.sheathOrBase(args, results); }
        public function sheath(args: Array, results: Array): String { return this.sheathOrBase(args, results); }
        public function sheathDescript(args: Array, results: Array): String { return this.sheathOrBase(args, results); }
        public function sheathOrBase(args: Array, results: Array): String {
            return this.owner.sheathDescript(args[0]);
        }
        public function get biggestSheath(): String { return this.sheathBiggest; }
        public function get sheathBiggest(): String {
            return this.owner.sheathDescript(this.owner.biggestCockIndex());
        }
        public function knot(args: Array, results: Array): String { return this.knotOrBase(args, results); }
        public function knotOrBase(args: Array, results: Array): String {
            return this.owner.knotDescript(args[0]);
        }
        public function knots(args: Array, results: Array): String {
            return (this.owner.hasCocks() ? plural(this.owner.knotDescript(args[0])) : this.owner.knotDescript(args[0]));
        }
        public function get knotBiggest(): String {
            return this.owner.knotDescript(this.owner.biggestCockIndex());
        }
        public function sheathOrKnot(args: Array, results: Array): String {
            return this.owner.sheathOrKnot(args[0]);
        }
        public function knotOrSheath(args: Array, results: Array): String {
            return this.owner.knotOrSheath(args[0]);
        }
        public function knotBallsHilt(args: Array, results: Array): String {
            return this.owner.knotBallsHilt(args[0]);
        }
        public function get multiCockDescript(): String { return this.multiCocks; }
        public function get multiCocks(): String {
            return this.owner.multiCockDescript();
        }
        public function cockLength(args: Array, results: Array): String { return this.cocklength(args, results); }
        public function cocklength(args: Array, results: Array): String {
            return num2Text(Math.floor(this.owner.cLength(args[0])));
        }
        public function get cockCount(): String {
            return num2Text(this.owner.cocks.length);
        }
        public function get cocks(): String { return this.dicks; }
        public function get cocksDescript(): String { return this.dicks; }
        public function get dicks(): String {
            return this.owner.cocksDescript();
        }
        public function get cocksDescriptLight(): String { return this.dicksLight; }
        public function get cocksLight(): String { return this.dicksLight; }
        public function get dicksLight(): String {
            return this.owner.cocksDescriptLight();
        }
        public function cocksIsAre(args: Array, results: Array): String { return this.dicksIsAre(args, results); }
        public function dicksIsAre(args: Array, results: Array): String {
            return (this.owner.hasCocks() ? this.owner.cocksDescript() + " are" : this.owner.cockDescript(args[0]) + " is");
        }
        public function cocksLightIsAre(args: Array, results: Array): String { return this.dicksLightIsAre(args, results); }
        public function dicksLightIsAre(args: Array, results: Array): String {
            return (this.owner.hasCocks() ? this.owner.cocksDescriptLight() + " are" : this.owner.simpleCockNoun(args[0]) + " is");
        }
        public function get cocksSimple(): String { return this.cocksNounSimple; }
        public function get cocksShort(): String { return this.cocksNounSimple; }
        public function get cocksNoun(): String { return this.cocksNounSimple; }
        public function get cocksNounSimple(): String {
            return this.owner.simpleCocksNoun();
        }
        public function cockComplex(args: Array, results: Array): String { return this.cockNounComplex(args, results); }
        public function cockNounComplex(args: Array, results: Array): String {
            return this.owner.cockNounComplex(args[0]);
        }
        public function cockLight(args: Array, results: Array): String { return this.cockNoun(args, results); }
        public function cockSimple(args: Array, results: Array): String { return this.cockNoun(args, results); }
        public function cockNounSimple(args: Array, results: Array): String { return this.cockNoun(args, results); }
        public function cockShort(args: Array, results: Array): String { return this.cockNoun(args, results); }
        public function cockNoun(args: Array, results: Array): String {
            return this.owner.simpleCockNoun(args[0]);
        }
        public function dicksNounIsAre(args: Array, results: Array): String { return this.cocksNounIsAre(args, results); }
        public function cocksNounIsAre(args: Array, results: Array): String {
            return (this.owner.hasCocks() ? this.owner.simpleCocksNoun() + " are" : this.owner.simpleCockNoun(args[0]) + " is");
        }
        public function get cockNounBiggest(): String {
            return this.owner.simpleCockNoun(this.owner.biggestCockIndex());
        }
        public function cockSkin(args: Array, results: Array): String { return this.dickSkin(args, results); }
        public function dickSkin(args: Array, results: Array): String {
            return this.owner.cockSkin(args[0]);
        }
        public function cockColor(args: Array, results: Array): String { return this.dickColor(args, results); }
        public function dickColor(args: Array, results: Array): String {
            return this.owner.cockColor(args[0]);
        }
        public function vaginaColor(args: Array, results: Array): String { return this.pussyColor(args, results); }
        public function cuntColor(args: Array, results: Array): String { return this.pussyColor(args, results); }
        public function pussyColor(args: Array, results: Array): String {
            return this.owner.vaginaColor(args[0]);
        }
        public function cockHead(args: Array, results: Array): String { return this.cockhead(args, results); }
        public function cockhead(args: Array, results: Array): String {
            return this.owner.cockHead(args[0]);
        }
        public function cockHeadNoun(args: Array, results: Array): String {
            return this.owner.cockHeadNoun(args[0]);
        }
        public function cockHeads(args: Array, results: Array): String { return this.cockheads(args, results); }
        public function cockheads(args: Array, results: Array): String {
            return this.owner.cockHeads(args[0]);
        }
        public function get cockHeadsNoun(): String {
            return this.owner.cockHeadsNoun();
        }
        public function cockDescript(args: Array, results: Array): String { return this.cock(args, results); }
        public function cock(args: Array, results: Array): String {
            return this.owner.cockDescript(args[0]);
        }
        public function get biggestCockDescript(): String { return this.cockBiggest; }
        public function get biggestCock(): String { return this.cockBiggest; }
        public function get cockBiggest(): String {
            return this.owner.cockDescript(this.owner.biggestCockIndex());
        }
        public function get biggestCockNoun(): String { return this.cockBiggestNoun; }
        public function get cockBiggestNoun(): String {
            return this.owner.simpleCockNoun(this.owner.biggestCockIndex());
        }
        public function get biggestCockHead(): String { return this.cockheadBiggest; }
        public function get biggestCockhead(): String { return this.cockheadBiggest; }
        public function get cockHeadBiggest(): String { return this.cockheadBiggest; }
        public function get cockheadBiggest(): String {
            return this.owner.cockHead(this.owner.biggestCockIndex());
        }
        public function get smallestCockHead(): String { return this.cockheadSmallest; }
        public function get smallestCockhead(): String { return this.cockheadSmallest; }
        public function get cockHeadSmallest(): String { return this.cockheadSmallest; }
        public function get cockheadSmallest(): String {
            return this.owner.cockHead(this.owner.smallestCockIndex());
        }
        public function get smallestCockDescript(): String { return this.cockSmallest; }
        public function get smallestCock(): String { return this.cockSmallest; }
        public function get cockSmallest(): String {
            return this.owner.cockDescript(this.owner.smallestCockIndex());
        }
        public function get smallestCockNoun(): String { return this.cockSmallestNoun; }
        public function get cockSmallestNoun(): String {
            return this.owner.simpleCockNoun(this.owner.smallestCockIndex());
        }
        public function get shortestCockDescript(): String { return this.cockShortest; }
        public function get shortestCock(): String { return this.cockShortest; }
        public function get cockShortest(): String {
            return this.owner.cockDescript(this.owner.shortestCockIndex());
        }
        public function get shortestCockNoun(): String { return this.cockShortestNoun; }
        public function get cockShortestNoun(): String {
            return this.owner.simpleCockNoun(this.owner.shortestCockIndex());
        }
        public function get eachCockHead(): String {
            return this.owner.eachCockHead();
        }
        public function get tailCock(): String { return this.cockTail; }
        public function get cockTail(): String {
            return this.owner.tailCockDescript();
        }
        public function get tailCockHead(): String {
            return this.owner.tailCockHead();
        }
        public function get tailCockHeads(): String {
            return this.owner.tailCockHeads();
        }
        public function get tailCocks(): String { return this.cockTails; }
        public function get cockTails(): String {
            return this.owner.tailCocksDescript();
        }
        public function cockOrStrapon(args: Array, results: Array): String { return this.cockOrHardlight(args, results); }
        public function cockOrHardlight(args: Array, results: Array): String {
            return this.owner.cockOrStrapon(args[0],0);
        }
        public function cockOrStraponNoun(args: Array, results: Array): String { return this.cockOrHardlightNoun(args, results); }
        public function cockOrHardlightNoun(args: Array, results: Array): String {
            return this.owner.cockOrStrapon(args[0],-1);
        }
        public function cockOrStraponFull(args: Array, results: Array): String { return this.cockOrHardlightFull(args, results); }
        public function cockOrHardlightFull(args: Array, results: Array): String {
            return this.owner.cockOrStrapon(args[0],1);
        }
        public function get hardlightCock(): String {
            return this.owner.cockOrStrapon(-1,0);
        }
        public function get hardlightCockNoun(): String {
            return this.owner.cockOrStrapon(-1,-1);
        }
        public function get hardlightCockFull(): String {
            return this.owner.cockOrStrapon(-1,1);
        }
        public function cockOrStraponHead(args: Array, results: Array): String {
            return this.owner.cockOrStraponHead(args[0]);
        }
        public function get cockOrVag(): String {
            return this.owner.cockOrVag();
        }
        public function nippleNoun(args: Array, results: Array): String {
            return this.owner.nippleNoun(args[0]);
        }
        public function nipplesNoun(args: Array, results: Array): String {
            return this.owner.nipplesNoun(args[0]);
        }
        public function nippleNounSimple(args: Array, results: Array): String {
            return this.owner.nippleNoun(args[0], true);
        }
        public function nipplesNounSimple(args: Array, results: Array): String {
            return this.owner.nipplesNoun(args[0], true);
        }
        public function nipple(args: Array, results: Array): String { return this.lipple(args, results); }
        public function nippleDescript(args: Array, results: Array): String { return this.lipple(args, results); }
        public function lipple(args: Array, results: Array): String {
            return this.owner.nippleDescript(args[0]);
        }
        public function nipples(args: Array, results: Array): String { return this.lipples(args, results); }
        public function nipplesDescript(args: Array, results: Array): String { return this.lipples(args, results); }
        public function lipples(args: Array, results: Array): String {
            return this.owner.nipplesDescript(args[0]);
        }
        public function milkyNipple(args: Array, results: Array): String {
            return this.owner.nippleDescript(args[0], false, true);
        }
        public function milkyNipples(args: Array, results: Array): String {
            return this.owner.nipplesDescript(args[0], true);
        }
        public function get nippleCuntDescript(): String { return this.cuntNipple; }
        public function get nippleCunt(): String { return this.cuntNipple; }
        public function get cuntNipple(): String {
            return this.owner.nippleCuntDescript();
        }
        public function get nippleCuntsDescript(): String { return this.cuntNipples; }
        public function get nippleCunts(): String { return this.cuntNipples; }
        public function get cuntNipples(): String {
            return this.owner.nippleCuntsDescript();
        }
        public function get nippleCockDescript(): String { return this.dickNipple; }
        public function get nippleCock(): String { return this.dickNipple; }
        public function get dickNipple(): String {
            return this.owner.nippleCockDescript();
        }
        public function get nippleCocksDescript(): String { return this.dickNipples; }
        public function get nippleCocks(): String { return this.dickNipples; }
        public function get dickNipples(): String {
            return this.owner.nippleCocksDescript();
        }
        public function get nippleColor(): String {
            return this.owner.nippleColor;
        }
        public function get nipplePiercings(): String {
            return "nipple piercings"; // 9999
        }
        public function nippleHarden(args: Array, results: Array): String { return this.nipplesHarden(args, results); }
        public function nipplesHarden(args: Array, results: Array): String {
            return this.owner.nipplesErect(args[0]);
        }
        public function nippleHardening(args: Array, results: Array): String { return this.nipplesHardening(args, results); }
        public function nipplesHardening(args: Array, results: Array): String {
            return this.owner.nipplesErect(args[0], true);
        }
        public function areola(args: Array, results: Array): String { return this.areolaDescript(args, results); }
        public function areolaDescript(args: Array, results: Array): String {
            return this.owner.areolaDescript(args[0]);
        }
        public function areolae(args: Array, results: Array): String { return this.areolaeDescript(args, results); }
        public function areolaeDescript(args: Array, results: Array): String {
            return this.owner.areolaeDescript(args[0]);
        }
        public function get eachCock(): String {
            return this.owner.eachCock();
        }
        public function get eachCockIsAre(): String {
            return this.owner.eachCock() + (this.owner.hasCocks() ? " are" : " is");
        }
        public function get oneCock(): String {
            return this.owner.oneCock();
        }
        public function get oneCockHead(): String {
            return this.owner.oneCockHead();
        }
        public function erectCock(args: Array, results: Array): String { return this.flaccidCock(args, results); }
        public function flaccidCock(args: Array, results: Array): String {
            return this.owner.cockDescript(args[0], true);
        }
        public function get erectCocks(): String { return this.flaccidCocks; }
        public function get flaccidCocks(): String {
            return this.owner.cocksDescript(true);
        }
        public function get erectMultiCocks(): String { return this.flaccidMultiCocks; }
        public function get flaccidMultiCocks(): String {
            return this.owner.multiCockDescript(true);
        }
        public function get eachErectCock(): String { return this.eachFlaccidCock; }
        public function get eachFlaccidCock(): String {
            return this.owner.eachCock(true);
        }
        public function get oneErectCock(): String { return this.oneFlaccidCock; }
        public function get oneFlaccidCock(): String {
            return this.owner.oneCock(true);
        }
        public function get balls(): String {
            return this.owner.ballsDescript();
        }
        public function get ballsNoun(): String {
            return this.owner.ballNoun(true);
        }
        public function get ballNoun(): String {
            return this.owner.ballNoun(false);
        }
        public function get ballsNounSimple(): String {
            return this.owner.ballsNounSimple();
        }
        public function get ballNounSimple(): String {
            return this.owner.ballsNounSimple(true);
        }
        public function get ballsNounIsAre(): String {
            return this.owner.ballNoun(true) + " " + (this.owner.balls == 1 ? "is" : "are");
        }
        public function get ballsNounSimpleIsAre(): String {
            return this.owner.ballsNounSimple() + " " + (this.owner.balls == 1 ? "is" : "are");
        }
        public function get ball(): String {
            return this.owner.ballsDescript();
        }
        public function get ballsIsAre(): String {
            return this.owner.hasBalls() ? this.owner.ballsDescript() + " are" : this.owner.ballDescript() + " is";
        }
        public function get prostate(): String { return this.scrotum; }
        public function get sack(): String { return this.scrotum; }
        public function get ballsack(): String { return this.scrotum; }
        public function get ballSack(): String { return this.scrotum; }
        public function get nutsack(): String { return this.scrotum; }
        public function get scrotum(): String {
            return this.owner.sackDescript();
        }
        public function get sackTexture(): String {
            return this.owner.sackTexture();
        }
        public function get chestDesc(): String { return this.chest; }
        public function get chest(): String {
            return this.owner.chestDesc();
        }
        public function chestSimple(args: Array, results: Array): String { return this.breastsNoun(args, results); }
        public function chestNoun(args: Array, results: Array): String { return this.breastsNoun(args, results); }
        public function breastsNoun(args: Array, results: Array): String {
            return this.owner.chestNoun(args[0]);
        }
        public function breastNoun(args: Array, results: Array): String { return this.breast(args, results); }
        public function breast(args: Array, results: Array): String {
            return this.owner.breastNoun(args[0]);
        }
        public function breastNounChaste(args: Array, results: Array): String { return this.breastDry(args, results); }
        public function breastChaste(args: Array, results: Array): String { return this.breastDry(args, results); }
        public function breastNounDry(args: Array, results: Array): String { return this.breastDry(args, results); }
        public function breastDry(args: Array, results: Array): String {
            return this.owner.breastNoun(args[0], true);
        }
        public function cupSize(args: Array, results: Array): String { return this.breastCupSize(args, results); }
        public function breastCup(args: Array, results: Array): String { return this.breastCupSize(args, results); }
        public function breastCupSize(args: Array, results: Array): String {
            return this.owner.breastCup(args[0]);
        }
        public function get allChestDescript(): String { return this.chestFull; }
        public function get fullChest(): String { return this.chestFull; }
        public function get chestFull(): String {
            return this.owner.allChestDesc();
        }
        public function get biggestBreastDescript(): String {
            return this.owner.biggestBreastDescript();
        }
        public function breastDescript(args: Array, results: Array): String { return this.tits(args, results); }
        public function breasts(args: Array, results: Array): String { return this.tits(args, results); }
        public function boobs(args: Array, results: Array): String { return this.tits(args, results); }
        public function tits(args: Array, results: Array): String {
            return this.owner.breastDescript(args[0]);
        }
        public function get lowestBreasts(): String {
            return this.owner.breastDescript(this.owner.bRows()-1);
        }
        public function cockClit(args: Array, results: Array): String {
            return this.owner.cockClit(args[0]);
        }
        public function get anus(): String { return this.butthole; }
        public function get assholeDescript(): String { return this.butthole; }
        public function get asshole(): String { return this.butthole; }
        public function get butthole(): String {
            return this.owner.assholeDescript();
        }
        public function get anusSimple(): String { return this.assholeNoun; }
        public function get assholeSimple(): String { return this.assholeNoun; }
        public function get anusNoun(): String { return this.assholeNoun; }
        public function get assholeNoun(): String {
            return this.owner.assholeDescript(true);
        }
        public function get buttDescript(): String { return this.ass; }
        public function get butt(): String { return this.ass; }
        public function get ass(): String {
            return this.owner.buttDescript();
        }
        public function get buttcheek(): String { return this.asscheek; }
        public function get asscheek(): String {
            return this.owner.buttDescript(false, true);
        }
        public function get buttsDescript(): String { return this.asses; }
        public function get buttcheeks(): String { return this.asses; }
        public function get asscheeks(): String { return this.asses; }
        public function get cheeks(): String { return this.asses; }
        public function get butts(): String { return this.asses; }
        public function get asses(): String {
            return this.owner.buttDescript(true);
        }
        public function get hipDescript(): String { return this.hip; }
        public function get hip(): String {
            return this.owner.hipDescript();
        }
        public function get hipsDescript(): String { return this.hips; }
        public function get hips(): String {
            return this.owner.hipsDescript();
        }
        public function get thighDescript(): String { return this.thigh; }
        public function get thigh(): String {
            return this.owner.thighDescript();
        }
        public function get thighsDescript(): String { return this.thighs; }
        public function get thighs(): String {
            return this.owner.thighsDescript();
        }
        public function vagina(args: Array, results: Array): String { return this.cunt(args, results); }
        public function pussy(args: Array, results: Array): String { return this.cunt(args, results); }
        public function cunt(args: Array, results: Array): String {
            return this.owner.vaginaDescript(args[0]);
        }
        //Complex Noun
        public function vaginaNounComplex(args: Array, results: Array): String { return this.pussyNounComplex(args, results); }
        public function pussyNounComplex(args: Array, results: Array): String {
            return this.owner.vaginaNounComplex(args[0]);
        }
        //Simple Noun
        public function vaginaSimple(args: Array, results: Array): String { return this.vaginaNounSimple(args, results); }
        public function pussySimple(args: Array, results: Array): String { return this.vaginaNounSimple(args, results); }
        public function cuntSimple(args: Array, results: Array): String { return this.vaginaNounSimple(args, results); }
        public function vaginaNounSimple(args: Array, results: Array): String {
            return this.owner.vaginaNounSimple(args[0]);
        }
        //Generic cuntnoun
        public function vaginaNoun(args: Array, results: Array): String { return this.cuntNoun(args, results); }
        public function pussyNoun(args: Array, results: Array): String { return this.cuntNoun(args, results); }
        public function cuntNoun(args: Array, results: Array): String {
            return this.owner.vaginaNounDescript(args[0]);
        }
        public function get multiCunt(): String { return this.multiVagina; }
        public function get multiCunts(): String { return this.multiVagina; }
        public function get multiVaginas(): String { return this.multiVagina; }
        public function get multiVagina(): String {
            return this.owner.multiCuntDescript();
        }
        public function get vaginasNoun(): String { return this.vaginasNounSimple; }
        public function get pussiesNoun(): String { return this.vaginasNounSimple; }
        public function get cuntsNoun(): String { return this.vaginasNounSimple; }
        public function get vaginasSimple(): String { return this.vaginasNounSimple; }
        public function get pussiesSimple(): String { return this.vaginasNounSimple; }
        public function get cuntsSimple(): String { return this.vaginasNounSimple; }
        public function get vaginasNounSimple(): String {
            return this.owner.simpleVaginasNoun();
        }
        public function get vaginas(): String { return this.cunts; }
        public function get pussies(): String { return this.cunts; }
        public function get cunts(): String {
            return this.owner.vaginasDescript();
        }
        public function get vaginasLight(): String { return this.cuntsLight; }
        public function get pussiesLight(): String { return this.cuntsLight; }
        public function get cuntsLight(): String {
            return this.owner.vaginasDescriptLight();
        }
        public function get eachVagina(): String { return this.eachCunt; }
        public function get eachPussy(): String { return this.eachCunt; }
        public function get eachCunt(): String {
            return this.owner.eachVagina();
        }
        public function get oneVagina(): String { return this.oneCunt; }
        public function get onePussy(): String { return this.oneCunt; }
        public function get oneCunt(): String {
            return this.owner.oneVagina();
        }
        public function get biggestVagina(): String { return this.biggestCunt; }
        public function get vaginaBiggest(): String { return this.biggestCunt; }
        public function get cuntBiggest(): String { return this.biggestCunt; }
        public function get biggestCunt(): String {
            return this.owner.vaginaDescript(this.owner.biggestVaginaIndex());
        }
        public function get vaginasIsAre(): String { return this.pussiesIsAre; }
        public function get cuntsIsAre(): String { return this.pussiesIsAre; }
        public function get pussiesIsAre(): String {
            return (this.owner.hasVaginas() ? this.owner.vaginasDescript() + " are" : this.owner.vaginaDescript() + " is");
        }
        public function get vaginasLightIsAre(): String { return this.pussiesLightIsAre; }
        public function get cuntsLightIsAre(): String { return this.pussiesLightIsAre; }
        public function get pussiesLightIsAre(): String {
            return this.owner.simpleVaginasNoun() + (this.owner.hasVaginas() ?" are" : " is");
        }    
        public function vagOrAss(args: Array, results: Array): String { return this.pussyOrAsshole(args, results); }
        public function vagOrAsshole(args: Array, results: Array): String { return this.pussyOrAsshole(args, results); }
        public function vaginaOrAss(args: Array, results: Array): String { return this.pussyOrAsshole(args, results); }
        public function vaginaOrAsshole(args: Array, results: Array): String { return this.pussyOrAsshole(args, results); }
        public function pussyOrAss(args: Array, results: Array): String { return this.pussyOrAsshole(args, results); }
        public function pussyOrAsshole(args: Array, results: Array): String {
            return this.owner.vagOrAss(args[0]);
        }
        public function vagOrAssNoun(args: Array, results: Array): String { return this.vagOrAssSimple(args, results); }
        public function vagOrAssSimple(args: Array, results: Array): String {
            return this.owner.vagOrAssNoun(args[0]);
        }
        public function womb(args: Array, results: Array): String { return this.uterus(args, results); }
        public function uterus(args: Array, results: Array): String {
            return this.owner.wombDescript(args[0]);
        }
        public function get wombs(): String { return this.uteri; }
        public function get uteruses(): String { return this.uteri; }
        public function get uteri(): String {
            return this.owner.wombsDescript();
        }
        public function clit(args: Array, results: Array): String { return this.clitoris(args, results); }
        public function clitoris(args: Array, results: Array): String {
            return this.owner.clitDescript(args[0]);
        }
        public function clitNoun(args: Array, results: Array): String { return this.clitorisNoun(args, results); }
        public function clitorisNoun(args: Array, results: Array): String {
            return this.owner.clitDescript(args[0], true);
        }
        public function get biggestCuntClit(): String {
            return this.owner.clitDescript(this.owner.biggestVaginaIndex());
        }
        public function get eachClit(): String { return this.eachClitoris; }
        public function get eachClitoris(): String {
            return this.owner.eachClit();
        }
        public function get oneClit(): String { return this.oneClitoris; }
        public function get oneClitoris(): String {
            return this.owner.oneClit();
        }
        public function oneClitPerVagina(args: Array, results: Array): String {
            return this.owner.oneClitPerVagina(args[0]);
        }
        public function clits(args: Array, results: Array): String {
            return this.owner.clitsDescript(args[0]);
        }
        public function clitsNoun(args: Array, results: Array): String {
            return this.owner.clitsDescript(args[0], true);
        }
        public function clitsIsAre(args: Array, results: Array): String {
            return (this.owner.totalClits() != 1 ? this.owner.clitsDescript(args[0]) + " are" : this.owner.clitDescript(args[0]) + " is");
        }
        public function get tailVagina(): String { return this.tailgina; }
        public function get tailCunt(): String { return this.tailgina; }
        public function get cuntTail(): String { return this.tailgina; }
        public function get tailgina(): String {
            return this.owner.tailVaginaDescript();
        }
        public function get tailVaginas(): String { return this.tailginas; }
        public function get tailCunts(): String { return this.tailginas; }
        public function get cuntTails(): String { return this.tailginas; }
        public function get tailginas(): String {
            return this.owner.tailVaginasDescript();
        }
        public function get oneTailgina(): String { return this.oneTailCunt; }
        public function get oneTailCunt(): String {
            return this.owner.oneTailVaginaDescript();
        }
        public function get milkNoun(): String { return this.milkType; }
        public function get milkType(): String {
            return this.owner.fluidNoun(this.owner.milkType);
        }
        public function get milkDescript(): String { return this.milk; }
        public function get milk(): String {
            return this.owner.milkDescript();
        }
        public function get cumDescript(): String { return this.cum; }
        public function get cum(): String {
            return this.owner.cumDescript();
        }
        public function get femCum(): String { return this.girlcum; }
        public function get femcum(): String { return this.girlcum; }
        public function get girlCumDescript(): String { return this.girlcum; }
        public function get girlCum(): String { return this.girlcum; }
        public function get girlcum(): String {
            return this.owner.girlCumDescript();
        }
        public function get cumNoun(): String { return this.cumType; }
        public function get cumType(): String {
            return this.owner.fluidNoun(this.owner.cumType);
        }
        public function get femCumNoun(): String { return this.girlCumType; }
        public function get femCumType(): String { return this.girlCumType; }
        public function get girlCumNoun(): String { return this.girlCumType; }
        public function get girlCumType(): String {
            return this.owner.fluidNoun(this.owner.girlCumType);
        }
        public function get cumColor(): String {
            return this.owner.cumColor();
        }
        public function get cumColorNoun(): String { return this.cumColorSimple; }
        public function get cumColorSimple(): String {
            return this.owner.fluidColorSimple(this.owner.cumType);
        }
        public function get cumGem(): String {
            return this.owner.cumGem();
        }
        public function get femCumGem(): String { return this.girlCumGem; }
        public function get girlCumGem(): String {
            return this.owner.girlCumGem();
        }
        public function get milkGem(): String {
            return this.owner.milkGem();
        }
        public function get femCumColor(): String { return this.girlCumColor; }
        public function get girlCumColor(): String {
            return this.owner.girlCumColor();
        }
        public function get femCumColorNoun(): String { return this.girlCumColorSimple; }
        public function get femCumColorSimple(): String { return this.girlCumColorSimple; }
        public function get girlCumColorNoun(): String { return this.girlCumColorSimple; }
        public function get girlCumColorSimple(): String {
            return this.owner.fluidColorSimple(this.owner.girlCumType);
        }
        public function get milkColor(): String {
            return this.owner.milkColor();
        }
        public function get milkColorNoun(): String { return this.milkColorSimple; }
        public function get milkColorSimple(): String {
            return this.owner.fluidColorSimple(this.owner.milkType);
        }
        public function get cumVisc(): String {
            return this.owner.fluidViscosity(this.owner.cumType);
        }
        public function get femCumVisc(): String { return this.girlCumVisc; }
        public function get girlCumVisc(): String {
            return this.owner.fluidViscosity(this.owner.girlCumType);
        }
        public function get milkVisc(): String {
            return this.owner.fluidViscosity(this.owner.milkType);
        }
        public function get cumFlavor(): String {
            return this.owner.fluidFlavor(this.owner.cumType);
        }
        public function get femCumFlavor(): String { return this.girlCumFlavor; }
        public function get girlCumFlavor(): String {
            return this.owner.fluidFlavor(this.owner.girlCumType);
        }
        public function get milkFlavor(): String {
            return this.owner.fluidFlavor(this.owner.milkType);
        }
        public function get wing(): String {
            return this.owner.wingDescript();
        }
        public function get wings(): String {
            return this.owner.wingsDescript();
        }
        public function get wingNoun(): String {
            return this.owner.wingDescript(true);
        }
        public function get wingsNoun(): String {
            return this.owner.wingsDescript(true);
        }
        public function get arm(): String {
            return this.owner.armDescript();
        }
        public function get arms(): String {
            return this.owner.armsDescript();
        }
        public function get armFull(): String {
            return this.owner.armDescript(true);
        }
        public function get armsFull(): String {
            return this.owner.armsDescript(true);
        }
        public function get armNoun(): String {
            return this.owner.armNoun();
        }
        public function get armsNoun(): String {
            return this.owner.armsNoun();
        }
        public function get hand(): String {
            return this.owner.hand();
        }
        public function get hands(): String {
            return this.owner.hands();
        }
        public function get finger(): String {
            return this.owner.finger();
        }
        public function get fingers(): String {
            return this.owner.fingers();
        }
        public function get lowerbody(): String { return this.lowerBody; }
        public function get lowerBody(): String {
            return this.owner.lowerBody();
        }
        public function get leg(): String {
            return this.owner.leg();
        }
        public function get legNoun(): String {
            return this.owner.legNoun();
        }
        public function get legsNoun(): String {
            return this.owner.legsNoun();
        }
        public function get legs(): String {
            return this.owner.legs();
        }
        // case "leg(s)":
        public function get legOrLegs(): String { return this.legsOrLeg; }
        public function get legsOrLeg(): String {
            return this.owner.legOrLegs();
        }
        public function get legOrLegsNoun(): String {
            return (this.owner.legCount == 1 ? this.owner.legNoun() : this.owner.legsNoun());
        }
        public function get legFurScales(): String {
            return this.owner.legFurScales();
        }
        public function get knee(): String {
            return this.owner.kneeDescript();
        }
        public function get knees(): String {
            return this.owner.kneesDescript();
        }
        public function get footOrFeet(): String { return this.feet; }
        public function get feetOrFoot(): String { return this.feet; }
        public function get feet(): String {
            return this.owner.feet();
        }
        public function get foot(): String {
            return this.owner.foot();
        }
        public function get toe(): String {
            return this.owner.toe();
        }
        public function get toes(): String {
            return this.owner.toes();
        }
        public function get belly(): String { return this.abdomen; }
        public function get stomach(): String { return this.abdomen; }
        public function get tummy(): String { return this.abdomen; }
        public function get abdomen(): String {
            return this.owner.bellyDescript();
        }
        public function get bellySize(): String {
            return this.owner.bellyDescript(true);
        }
        public function get mistress(): String { return this.masterMistress; }
        public function get master(): String { return this.masterMistress; }
        public function get masterMistress(): String {
            return this.owner.mf("master", "mistress");
        }
        public function get he(): String { return this.ey; }
        public function get she(): String { return this.ey; }
        public function get heShe(): String { return this.ey; } // Shamelessly stole these from Alderbro. :3
        public function get ey(): String {
            return this.owner.mf("he", "she");
        }
        public function get him(): String { return this.em; }
        public function get himHer(): String { return this.em; }
        public function get em(): String {
            return this.owner.mf("him", "her");
        }
        public function get himHerIt(): String {
            return this.owner.mfn("him","her","it");
        }
        public function get his(): String { return this.eir; }
        public function get hisHer(): String { return this.eir; }
        public function get eir(): String {
            return this.owner.mf("his", "her");
        }
        public function get hisHers(): String { return this.eirs; }
        public function get eirs(): String {
            return this.owner.mf("his", "hers");
        }
        public function get sir(): String {
            return this.owner.mf("sir", "ma’am");
        }
        // case "ma'am":
        //     return this.owner.mf("sir", "ma’am");
        // }
        public function get misterMiss(): String { return this.miss; }
        public function get mister(): String { return this.miss; }
        public function get miss(): String {
            return this.owner.mf("mister", "miss");
        }
        public function get mr(): String { return this.ms; }
        public function get ms(): String {
            return this.owner.mf("Mr", "Ms");
        }
        public function get man(): String { return this.manWoman; }
        public function get woman(): String { return this.manWoman; }
        public function get manWoman(): String {
            return this.owner.mf("man", "woman");
        }
        public function get boy(): String { return this.girlBoy; }
        public function get girl(): String { return this.girlBoy; }
        public function get boyGirl(): String { return this.girlBoy; }
        public function get girlBoy(): String {
            return this.owner.mf("boy", "girl");
        }
        public function get guy(): String { return this.guyGirl; }
        // public function get girl(): String { return this.guyGirl(); }
        public function get guyGirl(): String {
            return this.owner.mf("guy","girl");
        }
        public function get son(): String { return this.daughterSon; }
        public function get daughter(): String { return this.daughterSon; }
        public function get sonDaughter(): String { return this.daughterSon; }
        public function get daughterSon(): String {
            return this.owner.mf("son", "daughter");
        }
        public function get daddy(): String { return this.daddyMommy; }
        public function get mommy(): String { return this.daddyMommy; }
        public function get daddyMommy(): String {
            return this.owner.mf("daddy", "mommy");
        }
        // public function get son(): String { return this.sonDaughter(); }
        // public function get daughter(): String { return this.sonDaughter(); }
        // public function get sonDaughter(): String {
        //     return this.owner.mf("son", "daughter");
        // }
        public function get brother(): String { return this.broSis; }
        public function get sister(): String { return this.broSis; }
        public function get brotherSister(): String { return this.broSis; }
        public function get bro(): String { return this.broSis; }
        public function get sis(): String { return this.broSis; }
        public function get broSis(): String {
            return this.owner.mf("brother", "sister");
        }
        public function get uncle(): String { return this.uncleAunt; }
        public function get aunt(): String { return this.uncleAunt; }
        public function get uncleAunt(): String {
            return this.owner.mf("uncle", "aunt");
        }
        public function get nephew(): String { return this.nephewNiece; }
        public function get niece(): String { return this.nephewNiece; }
        public function get nephewNiece(): String {
            return this.owner.mf("nephew", "niece");
        }
        public function get handsome(): String { return this.handsomeCute; }
        public function get cute(): String { return this.handsomeCute; }
        public function get handsomeCute(): String {
            return this.owner.mf("handsome", "cute");
        }
        public function cockShape(args: Array, results: Array): String { return this.cocktype(args, results); }
        public function cockshape(args: Array, results: Array): String { return this.cocktype(args, results); }
        public function cockType(args: Array, results: Array): String { return this.cocktype(args, results); }
        public function cocktype(args: Array, results: Array): String {
            return this.owner.cockShape(args[0]);
        }
        public function accurateCockName(args: Array, results: Array): String {
            return this.owner.accurateCockName(args[0]);
        }
        public function get tailGenital(): String { return this.genitail; }
        public function get genitalTail(): String { return this.genitail; }
        public function get genitail(): String {
            return this.owner.tailGenitalDescript();
        }
        public function get tailGenitals(): String { return this.genitails; }
        public function get genitalTails(): String { return this.genitails; }
        public function get genitails(): String {
            return this.owner.tailGenitalsDescript();
        }
        public function get oneTailGenital(): String { return this.oneGenitail; }
        public function get oneGenitalTail(): String { return this.oneGenitail; }
        public function get oneGenitail(): String {
            return this.owner.oneTailGenitalDescript();
        }
        public function get oneTailCock(): String { return this.oneCockTail; }
        public function get oneCockTail(): String {
            return this.owner.oneTailGenitalDescript("cock");
        }
        //public function get oneTailVagina(): String { return this.oneTailgina(); }
        //public function get oneTailCunt(): String { return this.oneTailgina(); }
        //public function get oneCuntTail(): String { return this.oneTailgina(); }
        //public function get oneTailgina(): String {
        //    return this.owner.oneTailGenitalDescript("cunt");
        //}
        public function get oneTailVagina(): String { return this.oneCuntTail; }
        public function get oneCuntTail(): String {
            return this.owner.oneTailGenitalDescript("cunt");
        }
        public function get eachTailGenital(): String { return this.eachGenitalTail; }
        public function get eachGenitalTail(): String {
            return this.owner.eachTailGenitalDescript();
        }
        public function get eachTailCock(): String { return this.eachCockTail; }
        public function get eachCockTail(): String {
            return this.owner.eachTailGenitalDescript("cock");
        }
        public function get eachTailVagina(): String { return this.eachTailgina; }
        public function get eachTailCunt(): String { return this.eachTailgina; }
        public function get eachCuntTail(): String { return this.eachTailgina; }
        public function get eachTailgina(): String {
            return this.owner.eachTailGenitalDescript("cunt");
        }
        public function get tailCockColor(): String { return this.tailGenitalColor; }
        public function get tailCuntColor(): String { return this.tailGenitalColor; }
        public function get tailGenitalColor(): String {
            return this.owner.tailGenitalColorDesc();
        }
        public function get horn(): String {
            return this.owner.hornDescript();
        }
        public function get eachHorn(): String {
            return this.owner.eachHorn();
        }
        public function get oneHorn(): String {
            return this.owner.oneHorn();
        }
        public function get horns(): String {
            return this.owner.hornsDescript();
        }
        public function get hornNoun(): String {
            return this.owner.hornNoun();
        }
        public function get hornsNoun(): String {
            return this.owner.hornsNoun();
        }
        public function get hornColor(): String {
            return this.owner.hornColor();
        }
        public function get antenna(): String {
            return this.owner.antennaeDescript(false);
        }
        public function get antennae(): String {
            return this.owner.antennaeDescript();
        }
        public function get combatName(): String {
            return this.owner.getCombatName();
        }
        public function get combatPronoun(): String { return this.combatHimHer; }
        public function get combatHimHer(): String {
            return this.owner.getCombatPronoun("o");
        }
        public function get combatHeShe(): String {
            return this.owner.getCombatPronoun("s");
        }
        public function get combatHisHer(): String {
            return this.owner.getCombatPronoun("pa");
        }
        public function get combatHisHers(): String {
            return this.owner.getCombatPronoun("pp");
        }
        public function get combatHimself(): String { return this.combatHimselfHerself; }
        public function get combatHerself(): String { return this.combatHimselfHerself; }
        public function get combatYourself(): String { return this.combatHimselfHerself; }
        public function get combatHimselfHerself(): String {
            return this.owner.getCombatPronoun("sl");
        }
        public function get has(): String { return this.hasHave; }
        public function get have(): String { return this.hasHave; }
        public function get hasHave(): String {
            return (this.owner is PlayerCharacter || this.owner.isPlural ? "have" : "has");
        }
        public function get barkMeow(): String {
            return this.owner.catDog("meow", "bark", true);
        }
        public function get meowBark(): String {
            return this.owner.catDog("meow", "bark", false);
        }
    }
}