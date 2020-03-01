package editor.Game.Wrapper {
    import classes.Creature;
    import classes.Engine.Utility.*;
    import classes.GLOBAL;
    import classes.kGAMECLASS;
    import classes.Characters.PlayerCharacter;

    /**
     * This is used to limit the interpreter's access
     * Mainly taken from getDesc in Creature
     */
    public class CreatureWrapper {
        private var ownerObj: ObjectAccessor;

        public function CreatureWrapper(ownerObj: ObjectAccessor) {
            this.ownerObj = ownerObj;
        }

        protected function get owner(): Creature { return this.ownerObj.value; }

        // These are from getDescription in Creature
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

        public function base(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public function cockBase(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public function sheath(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public function sheathDescript(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public function sheathOrBase(arg1: * = 0): String {
            return this.owner.sheathDescript(arg1);
        }

        public function get biggestSheath(): String { return this.sheathBiggest; }
        public function get sheathBiggest(): String {
            return this.owner.sheathDescript(this.owner.biggestCockIndex());
        }

        public function knot(arg1: * = 0): String { return this.knotOrBase(arg1); }
        public function knotOrBase(arg1: * = 0): String {
            return this.owner.knotDescript(arg1);
        }

        public function knots(arg1: * = 0): String {
            return (this.owner.hasCocks() ? plural(this.owner.knotDescript(arg1)) : this.owner.knotDescript(arg1));
        }

        public function get knotBiggest(): String {
            return this.owner.knotDescript(this.owner.biggestCockIndex());
        }

        public function sheathOrKnot(arg1: * = 0): String {
            return this.owner.sheathOrKnot(arg1);
        }

        public function knotOrSheath(arg1: * = 0): String {
            return this.owner.knotOrSheath(arg1);
        }

        public function knotBallsHilt(arg1: * = 0): String {
            return this.owner.knotBallsHilt(arg1);
        }

        public function get multiCockDescript(): String { return this.multiCocks; }
        public function get multiCocks(): String {
            return this.owner.multiCockDescript();
        }

        public function cockLength(arg1: * = 0): String { return this.cocklength(arg1); }
        public function cocklength(arg1: * = 0): String {
            return num2Text(Math.floor(this.owner.cLength(arg1)));
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

        public function cocksIsAre(arg1: * = 0): String { return this.dicksIsAre(arg1); }
        public function dicksIsAre(arg1: * = 0): String {
            return (this.owner.hasCocks() ? this.owner.cocksDescript() + " are" : this.owner.cockDescript(arg1) + " is");
        }

        public function cocksLightIsAre(arg1: * = 0): String { return this.dicksLightIsAre(arg1); }
        public function dicksLightIsAre(arg1: * = 0): String {
            return (this.owner.hasCocks() ? this.owner.cocksDescriptLight() + " are" : this.owner.simpleCockNoun(arg1) + " is");
        }

        public function get cocksSimple(): String { return this.cocksNounSimple; }
        public function get cocksShort(): String { return this.cocksNounSimple; }
        public function get cocksNoun(): String { return this.cocksNounSimple; }
        public function get cocksNounSimple(): String {
            return this.owner.simpleCocksNoun();
        }

        public function cockComplex(arg1: * = 0): String { return this.cockNounComplex(arg1); }
        public function cockNounComplex(arg1: * = 0): String {
            return this.owner.cockNounComplex(arg1);
        }

        public function cockLight(arg1: * = 0): String { return this.cockNoun(arg1); }
        public function cockSimple(arg1: * = 0): String { return this.cockNoun(arg1); }
        public function cockNounSimple(arg1: * = 0): String { return this.cockNoun(arg1); }
        public function cockShort(arg1: * = 0): String { return this.cockNoun(arg1); }
        public function cockNoun(arg1: * = 0): String {
            return this.owner.simpleCockNoun(arg1);
        }

        public function dicksNounIsAre(arg1: * = 0): String { return this.cocksNounIsAre(arg1); }
        public function cocksNounIsAre(arg1: * = 0): String {
            return (this.owner.hasCocks() ? this.owner.simpleCocksNoun() + " are" : this.owner.simpleCockNoun(arg1) + " is");
        }

        public function get cockNounBiggest(): String {
            return this.owner.simpleCockNoun(this.owner.biggestCockIndex());
        }

        public function cockSkin(arg1: * = 0): String { return this.dickSkin(arg1); }
        public function dickSkin(arg1: * = 0): String {
            return this.owner.cockSkin(arg1);
        }

        public function cockColor(arg1: * = 0): String { return this.dickColor(arg1); }
        public function dickColor(arg1: * = 0): String {
            return this.owner.cockColor(arg1);
        }

        public function vaginaColor(arg1: * = 0): String { return this.pussyColor(arg1); }
        public function cuntColor(arg1: * = 0): String { return this.pussyColor(arg1); }
        public function pussyColor(arg1: * = 0): String {
            return this.owner.vaginaColor(arg1);
        }

        public function cockHead(arg1: * = 0): String { return this.cockhead(arg1); }
        public function cockhead(arg1: * = 0): String {
            return this.owner.cockHead(arg1);
        }

        public function cockHeadNoun(arg1: * = 0): String {
            return this.owner.cockHeadNoun(arg1);
        }

        public function cockHeads(arg1: * = 0): String { return this.cockheads(arg1); }
        public function cockheads(arg1: * = 0): String {
            return this.owner.cockHeads(arg1);
        }

        public function get cockHeadsNoun(): String {
            return this.owner.cockHeadsNoun();
        }

        public function cockDescript(arg1: * = 0): String { return this.cock(arg1); }
        public function cock(arg1: * = 0): String {
            return this.owner.cockDescript(arg1);
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

        public function cockOrStrapon(arg1: * = -3): String { return this.cockOrHardlight(arg1); }
        public function cockOrHardlight(arg1: * = -3): String {
            return this.owner.cockOrStrapon(arg1,0);
        }

        public function cockOrStraponNoun(arg1: * = -3): String { return this.cockOrHardlightNoun(arg1); }
        public function cockOrHardlightNoun(arg1: * = -3): String {
            return this.owner.cockOrStrapon(arg1,-1);
        }

        public function cockOrStraponFull(arg1: * = -3): String { return this.cockOrHardlightFull(arg1); }
        public function cockOrHardlightFull(arg1: * = -3): String {
            return this.owner.cockOrStrapon(arg1,1);
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

        public function cockOrStraponHead(arg1: * = -3): String {
            return this.owner.cockOrStraponHead(arg1);
        }

        public function get cockOrVag(): String {
            return this.owner.cockOrVag();
        }

        public function nippleNoun(arg1: * = 0): String {
            return this.owner.nippleNoun(arg1);
        }

        public function nipplesNoun(arg1: * = 0): String {
            return this.owner.nipplesNoun(arg1);
        }

        public function nippleNounSimple(arg1: * = 0): String {
            return this.owner.nippleNoun(arg1, true);
        }

        public function nipplesNounSimple(arg1: * = 0): String {
            return this.owner.nipplesNoun(arg1, true);
        }

        public function nipple(arg1: * = 0): String { return this.lipple(arg1); }
        public function nippleDescript(arg1: * = 0): String { return this.lipple(arg1); }
        public function lipple(arg1: * = 0): String {
            return this.owner.nippleDescript(arg1);
        }

        public function nipples(arg1: * = 0): String { return this.lipples(arg1); }
        public function nipplesDescript(arg1: * = 0): String { return this.lipples(arg1); }
        public function lipples(arg1: * = 0): String {
            return this.owner.nipplesDescript(arg1);
        }

        public function milkyNipple(arg1: * = 0): String {
            return this.owner.nippleDescript(arg1, false, true);
        }

        public function milkyNipples(arg1: * = 0): String {
            return this.owner.nipplesDescript(arg1, true);
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

        public function nippleHarden(arg1: * = 0): String { return this.nipplesHarden(arg1); }
        public function nipplesHarden(arg1: * = 0): String {
            return this.owner.nipplesErect(arg1);
        }

        public function nippleHardening(arg1: * = 0): String { return this.nipplesHardening(arg1); }
        public function nipplesHardening(arg1: * = 0): String {
            return this.owner.nipplesErect(arg1, true);
        }

        public function areola(arg1: * = 0): String { return this.areolaDescript(arg1); }
        public function areolaDescript(arg1: * = 0): String {
            return this.owner.areolaDescript(arg1);
        }

        public function areolae(arg1: * = 0): String { return this.areolaeDescript(arg1); }
        public function areolaeDescript(arg1: * = 0): String {
            return this.owner.areolaeDescript(arg1);
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

        public function erectCock(arg1: * = 0): String { return this.flaccidCock(arg1); }
        public function flaccidCock(arg1: * = 0): String {
            return this.owner.cockDescript(arg1, true);
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

        public function chestSimple(arg1: * = 0): String { return this.breastsNoun(arg1); }
        public function chestNoun(arg1: * = 0): String { return this.breastsNoun(arg1); }
        public function breastsNoun(arg1: * = 0): String {
            return this.owner.chestNoun(arg1);
        }

        public function breastNoun(arg1: * = 0): String { return this.breast(arg1); }
        public function breast(arg1: * = 0): String {
            return this.owner.breastNoun(arg1);
        }

        public function breastNounChaste(arg1: * = 0): String { return this.breastDry(arg1); }
        public function breastChaste(arg1: * = 0): String { return this.breastDry(arg1); }
        public function breastNounDry(arg1: * = 0): String { return this.breastDry(arg1); }
        public function breastDry(arg1: * = 0): String {
            return this.owner.breastNoun(arg1, true);
        }

        public function cupSize(arg1: * = 0): String { return this.breastCupSize(arg1); }
        public function breastCup(arg1: * = 0): String { return this.breastCupSize(arg1); }
        public function breastCupSize(arg1: * = 0): String {
            return this.owner.breastCup(arg1);
        }

        public function get allChestDescript(): String { return this.chestFull; }
        public function get fullChest(): String { return this.chestFull; }
        public function get chestFull(): String {
            return this.owner.allChestDesc();
        }

        public function get biggestBreastDescript(): String {
            return this.owner.biggestBreastDescript();
        }

        public function breastDescript(arg1: * = 0): String { return this.tits(arg1); }
        public function breasts(arg1: * = 0): String { return this.tits(arg1); }
        public function boobs(arg1: * = 0): String { return this.tits(arg1); }
        public function tits(arg1: * = 0): String {
            return this.owner.breastDescript(arg1);
        }

        public function get lowestBreasts(): String {
            return this.owner.breastDescript(this.owner.bRows()-1);
        }

        public function cockClit(arg1: * = 0): String {
            return this.owner.cockClit(arg1);
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

        public function vagina(arg1: * = 0): String { return this.cunt(arg1); }
        public function pussy(arg1: * = 0): String { return this.cunt(arg1); }
        public function cunt(arg1: * = 0): String {
            return this.owner.vaginaDescript(arg1);
        }

        //Complex Noun
        public function vaginaNounComplex(arg1: * = 0): String { return this.pussyNounComplex(arg1); }
        public function pussyNounComplex(arg1: * = 0): String {
            return this.owner.vaginaNounComplex(arg1);
        }

        //Simple Noun
        public function vaginaSimple(arg1: * = 0): String { return this.vaginaNounSimple(arg1); }
        public function pussySimple(arg1: * = 0): String { return this.vaginaNounSimple(arg1); }
        public function cuntSimple(arg1: * = 0): String { return this.vaginaNounSimple(arg1); }
        public function vaginaNounSimple(arg1: * = 0): String {
            return this.owner.vaginaNounSimple(arg1);
        }

        //Generic cuntnoun
        public function vaginaNoun(arg1: * = 0): String { return this.cuntNoun(arg1); }
        public function pussyNoun(arg1: * = 0): String { return this.cuntNoun(arg1); }
        public function cuntNoun(arg1: * = 0): String {
            return this.owner.vaginaNounDescript(arg1);
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

        public function vagOrAss(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public function vagOrAsshole(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public function vaginaOrAss(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public function vaginaOrAsshole(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public function pussyOrAss(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public function pussyOrAsshole(arg1: * = 0): String {
            return this.owner.vagOrAss(arg1);
        }

        public function vagOrAssNoun(arg1: * = 0): String { return this.vagOrAssSimple(arg1); }
        public function vagOrAssSimple(arg1: * = 0): String {
            return this.owner.vagOrAssNoun(arg1);
        }

        public function womb(arg1: * = 0): String { return this.uterus(arg1); }
        public function uterus(arg1: * = 0): String {
            return this.owner.wombDescript(arg1);
        }

        public function get wombs(): String { return this.uteri; }
        public function get uteruses(): String { return this.uteri; }
        public function get uteri(): String {
            return this.owner.wombsDescript();
        }

        public function clit(arg1: * = 0): String { return this.clitoris(arg1); }
        public function clitoris(arg1: * = 0): String {
            return this.owner.clitDescript(arg1);
        }

        public function clitNoun(arg1: * = 0): String { return this.clitorisNoun(arg1); }
        public function clitorisNoun(arg1: * = 0): String {
            return this.owner.clitDescript(arg1, true);
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

        public function oneClitPerVagina(arg1: * = 0): String {
            return this.owner.oneClitPerVagina(arg1);
        }

        public function clits(arg1: * = -1): String {
            return this.owner.clitsDescript(arg1);
        }

        public function clitsNoun(arg1: * = -1): String {
            return this.owner.clitsDescript(arg1, true);
        }

        public function clitsIsAre(arg1: * = 0): String {
            return (this.owner.totalClits() != 1 ? this.owner.clitsDescript(arg1) + " are" : this.owner.clitDescript(arg1) + " is");
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

        public function cockShape(arg1: * = 0): String { return this.cocktype(arg1); }
        public function cockshape(arg1: * = 0): String { return this.cocktype(arg1); }
        public function cockType(arg1: * = 0): String { return this.cocktype(arg1); }
        public function cocktype(arg1: * = 0): String {
            return this.owner.cockShape(arg1);
        }

        public function accurateCockName(arg1: * = 0): String {
            return this.owner.accurateCockName(arg1);
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


        // New parsers
        // Lookup
        private function nameToIndex(key: String, name: String): int {
            return GLOBAL[key].indexOf(name.charAt(0).toLocaleUpperCase() + name.slice(1));
        }

        private function mapNameToIndex(key: String): Function {
            return function (name: String, idx: int, arr: Array): int {
                return nameToIndex(key, name);
            }
        }

        // Functionality
        private function hasFlag(flags: Array, args: Array): int {
            for (var idx: int = 0; idx < args.length; idx++) {
                for each (var flag: int in flags)
                    if (args[idx] == flag)
                        return idx;
            }
            return idx;
        }

        private function hasFlags(flags: Array, args: Array): int {
            return hasFlag(flags, args) != args.length ? 0 : 1;
        }


        // Physical Appearance
        // Femininity
        public function femIs(... args): int {
            return Eval.equals(this.owner.femininity, args);
        }

        public function femRange(... args): int {
            return Eval.range(this.owner.femininity, args);
        }

        // Tallness
        public function tallnessIs(... args): int {
            return Eval.equals(this.owner.tallness, args);
        }

        public function tallnessRange(... args): int {
            return Eval.range(this.owner.tallness, args);
        }

        // Thickness
        public function thicknessIs(... args): int {
            return Eval.equals(this.owner.thickness, args);
        }

        public function thicknessRange(... args): int {
            return Eval.range(this.owner.thickness, args);
        }

        // Tone
        public function toneIs(... args): int {
            return Eval.equals(this.owner.tone, args);
        }

        public function toneRange(... args): int {
            return Eval.range(this.owner.tone, args);
        }

        // Hip rating
        public function hipRatingIs(... args): int {
            return Eval.equals(this.owner.hipRating(), args);
        }

        // Butt rating
        public function buttRatingIs(... args): int {
            return Eval.equals(this.owner.buttRating(), args);
        }

        // Body Parts
        // Skin
        public function skinTypeIs(... args): int {
            return Eval.equals(this.owner.skinType, args.map(mapNameToIndex('SKIN_TYPE_NAMES')));
        }

        public function get hasAccentMarkings(): Boolean {
            return this.owner.hasAccentMarkings();
        }

        // Eyes
        public function eyeTypeIs(... args): int {
            return Eval.equals(this.owner.eyeType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        // Hair
        public function hairTypeIs(... args): Number {
            return Eval.equals(this.owner.hairType, args.map(mapNameToIndex('HAIR_TYPE_NAMES')));
        }

        // Beard
        public function beardTypeIs(... args): int {
            return Eval.equals(this.owner.beardType, args.map(mapNameToIndex('HAIR_TYPE_NAMES')));
        }

        // Face
        public function faceTypeIs(... args): int {
            return Eval.equals(this.owner.faceType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        public function hasFaceFlag(... args): int {
            return hasFlag(this.owner.faceFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        public function hasFaceFlags(... args): int {
            return hasFlags(this.owner.faceFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        // Tongue
        public function tongueTypeIs(... args): int {
            return Eval.equals(this.owner.tongueType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        public function hasTongueFlag(... args): int {
            return hasFlag(this.owner.tongueFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        public function hasTongueFlags(... args): int {
            return hasFlags(this.owner.tongueFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        // Ear
        public function earTypeIs(... args): int {
            return Eval.equals(this.owner.earType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        public function hasEarFlag(... args): int {
            return hasFlag(this.owner.earFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        public function hasEarFlags(... args): int {
            return hasFlags(this.owner.earFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        // Antennae
        public function antennaeTypeIs(... args): int {
            return Eval.equals(this.owner.antennaeType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        // Horn
        public function hornTypeIs(... args): int {
            return Eval.equals(this.owner.hornType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        // Arm
        public function armTypeIs(... args): int {
            return Eval.equals(this.owner.armType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        public function hasArmFlag(... args): int {
            return hasFlag(this.owner.armFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        public function hasArmFlags(... args): int {
            return hasFlags(this.owner.armFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        // Wing
        public function wingTypeIs(... args): int {
            return Eval.equals(this.owner.wingType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        // Leg
        public function legTypeIs(... args): int {
            return Eval.equals(this.owner.legType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        public function hasLegFlag(... args): int {
            return hasFlag(this.owner.legFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        public function hasLegFlags(... args): int {
            return hasFlags(this.owner.legFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        // Lowerbody
        public function isBiped(): Boolean {
            return this.owner.isBiped();
        }

        public function isNaga(): Boolean {
            return this.owner.isNaga();
        }

        public function isTaur(): Boolean {
            return this.owner.isTaur();
        }

        public function isCentaur(): Boolean {
            return this.owner.isCentaur();
        }

        public function isDrider(): Boolean {
            return this.owner.isDrider();
        }

        public function isGoo(): Boolean {
            return this.owner.isGoo();
        }

        // Tail
        public function tailTypeIs(... args): int {
            return Eval.equals(this.owner.tailType, args.map(mapNameToIndex('TYPE_NAMES')));
        }

        public function tailCountIs(... args): int {
            return Eval.equals(this.owner.tailCount, args);
        }

        public function tailCountRange(... args): int {
            return Eval.equals(this.owner.tailCount, args);
        }

        public function hasTailFlag(... args): int {
            return hasFlag(this.owner.tailFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        public function hasTailFlags(... args): int {
            return hasFlags(this.owner.tailFlags, args.map(mapNameToIndex('FLAG_NAMES')));
        }

        // Cock
        public function hasCock(): Boolean {
            return this.owner.hasCock();
        }

        public function hasCocks(): Boolean {
            return this.owner.hasCocks();
        }

        public function hasACockWithType(... args): int {
            for (var idx: int = 0; idx < args.length; idx++) {
                if (this.owner.hasCock(nameToIndex('TYPE_NAMES', args[idx])))
                    return idx;
            }
            return args.length;
        }

        public function cockCountIs(... args): int {
            return Eval.equals(this.owner.cocks.length, args);
        }

        public function cockTypeIs(cockIdx: int, ... args): int {
            if (cockIdx >= 0 && cockIdx < this.owner.cocks.length)
                for (var idx: int = 0; idx < args.length; idx++) {
                    if (this.owner.cocks[cockIdx].cType === nameToIndex('TYPE_NAMES', args[idx]))
                        return idx;
                }
            return args.length;
        }

        public function cockThatFits(fits:Number = 0): int {
            return this.owner.cockThatFits(fits);
        }

        public function biggestCockIndex(): int {
            return this.owner.biggestCockIndex();
        }

        public function smallestCockIndex(): int {
            return this.owner.smallestCockIndex();
        }

        public function thickestCockIndex(): int {
            return this.owner.thinnestCockIndex();
        }

        public function thinnestCockIndex(): int {
            return this.owner.thinnestCockIndex();
        }

        public function longestCockIndex(): int {
            return this.owner.longestCockIndex();
        }

        public function shortestCockIndex(): int {
            return this.owner.shortestCockIndex();
        }

        // Balls
        public function ballCountIs(... args): int {
            return Eval.equals(this.owner.balls, args);
        }

        public function ballSizeIs(... args): int {
            return Eval.equals(this.owner.ballSize(), args);
        }

        // Breasts
        public function hasBreasts(): Boolean {
            return this.owner.hasBreasts();
        }

        public function breastCountIs(... args): int {
            return Eval.equals(this.owner.totalBreasts(), args);
        }

        public function breastCupSizeIs(idx: int, ... args): int {
            return Eval.equals(this.owner.breastCup(idx), args);
        }

        // Vagina
        public function hasVagina(): Boolean {
            return this.owner.hasVagina();
        }

        // Fluids
        // Milk
        public function milkTypeIs(... args): int {
            return Eval.equals(this.owner.milkType, args);
        }

        public function milkQRange(... args): int {
            return Eval.range(this.owner.milkQ(), args);
        }

        // Cum
        public function cumTypeIs(... args): int {
            return Eval.equals(this.owner.cumType, args.map(mapNameToIndex('FLUID_TYPE_NAMES')));
        }

        public function cumQRange(... args): int {
            return Eval.range(this.owner.cumQ(), args);
        }

        // Girl Cum
        public function girlCumTypeIs(... args): int {
            return Eval.equals(this.owner.girlCumType, args.map(mapNameToIndex('FLUID_TYPE_NAMES')));
        }

        public function girlCumQRange(... args): int {
            return Eval.range(this.owner.girlCumQ(), args);
        }

        // Personality
        public function isNice(): Boolean {
            return this.owner.isNice();
        }

        public function isMisch(): Boolean {
            return this.owner.isMisch();
        }

        public function isAss(): Boolean {
            return this.owner.isAss();
        }

        // Exposure
        public function isExposed(): Boolean {
            return this.owner.isExposed();
        }

        public function isChestExposed(): Boolean {
            return this.owner.isChestExposed();
        }

        public function isCrotchExposed(): Boolean {
            return this.owner.isCrotchExposed();
        }

        public function isAssExposed(): Boolean {
            return this.owner.isAssExposed();
        }

        // Sex
        public function isSexless(): Boolean {
            return this.owner.isSexless();
        }

        public function isMale(): Boolean {
            return this.owner.isMale();
        }

        public function isFemale(): Boolean {
            return this.owner.isFemale();
        }

        // Sex Appearance
        public function isMasculine(): Boolean {
            return this.owner.isMasculine();
        }

        public function isFeminine(): Boolean {
            return this.owner.isFeminine();
        }

        public function isMan(): Boolean {
            return this.owner.isMan();
        }

        public function isWoman(): Boolean {
            return this.owner.isWoman();
        }

        public function isFemboy(): Boolean {
            return this.owner.isFemboy();
        }

        public function isShemale(): Boolean {
            return this.owner.isShemale();
        }

        public function isCuntboy(): Boolean {
            return this.owner.isCuntboy();
        }

        public function isFemmyMale(): Boolean {
            return this.owner.isFemmyMale();
        }

        public function isManlyFemale(): Boolean {
            return this.owner.isManlyFemale();
        }

        public function isFemHerm(): Boolean {
            return this.owner.isFemHerm();
        }

        public function isManHerm(): Boolean {
            return this.owner.isManHerm();
        }

        // Stats
        public function lustIs(... args): int {
            return Eval.equals(this.owner.lust(), args);
        }

        public function lustRange(... args): int {
            return Eval.range(this.owner.lust(), args);
        }

        public function physiqueIs(... args): int {
            return Eval.equals(this.owner.physique(), args);
        }

        public function physiqueRange(... args): int {
            return Eval.range(this.owner.physique(), args);
        }

        public function reflexesIs(... args): int {
            return Eval.equals(this.owner.reflexes(), args);
        }

        public function reflexesRange(... args): int {
            return Eval.range(this.owner.reflexes(), args);
        }

        public function aimIs(... args): int {
            return Eval.equals(this.owner.aim(), args);
        }

        public function aimRange(... args): int {
            return Eval.range(this.owner.aim(), args);
        }

        public function intelligenceIs(... args): int {
            return Eval.equals(this.owner.intelligence(), args);
        }

        public function intelligenceRange(... args): int {
            return Eval.range(this.owner.intelligence(), args);
        }

        public function willpowerIs(... args): int {
            return Eval.equals(this.owner.willpower(), args);
        }

        public function willpowerRange(... args): int {
            return Eval.range(this.owner.willpower(), args);
        }

        public function libidoIs(... args): int {
            return Eval.equals(this.owner.libido(), args);
        }

        public function libidoRange(... args): int {
            return Eval.range(this.owner.libido(), args);
        }

        public function taintIs(... args): int {
            return Eval.equals(this.owner.taint(), args);
        }

        public function taintRange(... args): int {
            return Eval.range(this.owner.taint(), args);
        }

        // Effects
        // Heat
        public function inHeat(): Boolean {
            return this.owner.inHeat();
        }

        public function inDeepHeat(): Boolean {
            return this.owner.inDeepHeat();
        }

        // Rut
        public function inRut(): Boolean {
            return this.owner.inRut();
        }

        // Bimbo
        public function isBimbo(): Boolean {
            return this.owner.isBimbo();
        }

        public function isBro(): Boolean {
            return this.owner.isBro();
        }

        // Treated
        public function isTreated(): Boolean {
            return this.owner.isTreated();
        }

        public function isTreatedFemale(): Boolean {
            return this.owner.isTreatedFemale();
        }

        public function isTreatedMale(): Boolean {
            return this.owner.isTreatedMale();
        }

        public function isTreatedCow(): Boolean {
            return this.owner.isTreatedCow();
        }

        public function isTreatedBull(): Boolean {
            return this.owner.isTreatedBull();
        }

        public function isAmazon(): Boolean {
            return this.owner.isAmazon();
        }

        public function isCumCow(): Boolean {
            return this.owner.isCumCow();
        }

        public function isCumSlut(): Boolean {
            return this.owner.isCumSlut();
        }

        public function isFauxCow(): Boolean {
            return this.owner.isFauxCow();
        }

        // Pheromones
        public function hasPheromones(): Boolean {
            return this.owner.hasPheromones();
        }

        // Perk
        public function hasPerk(... args): int {
            for (var idx: int = 0; idx < args.length; idx++)
                if (this.owner.hasPerk(args[idx]))
                    return idx;
            return args.length;
        }

        // StatusEffect
        public function hasStatusEffect(... args): int {
            for (var idx: int = 0; idx < args.length; idx++)
                if (this.owner.hasStatusEffect(args[idx]))
                    return idx;
            return args.length;
        }

        // Items
        // Piercing
        public function hasPiercing(): Boolean {
            return this.owner.hasPiercing();
        }
        public function hasEarPiercing(): Boolean {
            return this.owner.hasEarPiercing();
        }
        public function hasEyebrowPiercing(): Boolean {
            return this.owner.hasEyebrowPiercing();
        }
        public function hasNosePiercing(): Boolean {
            return this.owner.hasNosePiercing();
        }
        public function hasLipPiercing(): Boolean {
            return this.owner.hasLipPiercing();
        }
        public function hasTonguePiercing(): Boolean {
            return this.owner.hasTonguePiercing();
        }
        public function hasBellyPiercing(): Boolean {
            return this.owner.hasBellyPiercing();
        }
        public function hasNipplePiercing(idx: int = -1): Boolean {
            return this.owner.hasPiercedNipples(idx);
        }
        public function hasCockPiercing(idx: int = -1): Boolean {
            return this.owner.hasPiercedCocks(idx);
        }
        public function hasPiercedVaginas(idx: int = -1): Boolean {
            return this.owner.hasPiercedVaginas(idx);
        }
        public function hasClitPiercing(idx: int = -1): Boolean {
            return this.owner.hasPiercedClits(idx);
        }
        public function hasCocksock(idx: int = -1): Boolean {
            return this.owner.hasSockedCocks(idx);
        }

        // Keyitem
        public function hasKeyItem(... args): int {
            for (var idx: int = 0; idx < args.length; idx++)
                if (this.owner.hasKeyItem(args[idx]))
                    return idx;
            return args.length;
        }
    }
}