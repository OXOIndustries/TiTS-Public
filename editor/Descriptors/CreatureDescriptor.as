package editor.Descriptors {
    import classes.Creature;
    import classes.Engine.Utility.*;
    import classes.GLOBAL;
    import classes.kGAMECLASS;
    import classes.Characters.PlayerCharacter;

    /**
     * This is used to limit the interpreter's access
     * Mainly taken from getDesc in Creature
     */
    public class CreatureDescriptor {
        private var ownerObj: ObjectAccessor;

        public function CreatureDescriptor(ownerObj: ObjectAccessor) {
            this.ownerObj = ownerObj;
        }

        protected function get owner(): Creature { return this.ownerObj.value; }

        private function hasOneOptionalNumberArgNoResults(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length === 1 && typeof args[0] !== 'number') return "first argument is need to be a number";
            if (results.length > 0) return "has too many results";
            return null;
        }

        private function oldParserToCode(identifier: String, args: Array, results: Array): String {
            var text: String = '"[' + identifier;
            if (args.length > 0)
                text += ' ' + args.join(' ')
            text += ']"';
            return text;
        };

        // These are from getDescription in Creature
        public const height__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get height(): String {
            return this.owner.height();
        }
        public const gear__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get gear(): String {
            return this.owner.gearDescript();
        }
        public const clothes__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get clothes(): String {
            return this.owner.clothesDescript(); // isolates layer unlike gear -- armor if its there, otherwise both undergarments
        }
        public const ship__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ship(): String {
            if(this.owner is PlayerCharacter) return kGAMECLASS.PCShipName(true);
            else return "ship";
        }
        public const shipModel__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get shipModel(): String {
            if(this.owner is PlayerCharacter) return kGAMECLASS.PCShipModel();
            else return "ship";
        }
        public const short__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get short(): String { return this.name; }
        public const name__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get name(): String {
            return this.owner.nameDisplay();
        }
        public const fullName__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get fullName(): String { return this.fullname; }
        public const fullname__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get fullname(): String {
            return this.owner.short + (this.owner is PlayerCharacter) ? " Steele" : "";
        }
        public const race__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get race(): String {
            return this.owner.race();
        }
        public const raceType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceType(): String { return this.stripRace; }
        public const raceShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceShort(): String { return this.stripRace; }
        public const raceSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceSimple(): String { return this.stripRace; }
        public const simpleRace__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get simpleRace(): String { return this.stripRace; }
        public const raceStrip__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceStrip(): String { return this.stripRace; }
        public const stripRace__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get stripRace(): String {
            return this.owner.raceShort();
        }
        public const raceTypeStrict__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceTypeStrict(): String { return this.raceTypeHuman; }
        public const raceTypeHuman__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceTypeHuman(): String {
            return this.owner.raceShort(true);
        }
        public const raceCute__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceCute(): String {
            return this.owner.raceCute();
        }
        public const raceCuteShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceCuteShort(): String { return this.raceCuteSimple; }
        public const raceCuteSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceCuteSimple(): String {
            return this.owner.raceCute(true);
        }
        public const raceBoyGirl__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceBoyGirl(): String {
            return this.owner.raceCute(false, true);
        }
        public const raceBoyGirlShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceBoyGirlShort(): String { return this.raceBoyGirlSimple; }
        public const raceBoyGirlSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get raceBoyGirlSimple(): String {
            return this.owner.raceCute(true, true);
        }
        public const aRace__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRace(): String {
            return indefiniteArticle(this.owner.race());
        }
        public const aRaceType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceType(): String { return this.aStripRace; }
        public const aRaceShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceShort(): String { return this.aStripRace; }
        public const aRaceSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceSimple(): String { return this.aStripRace; }
        public const aSimpleRace__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aSimpleRace(): String { return this.aStripRace; }
        public const aRaceStrip__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceStrip(): String { return this.aStripRace; }
        public const aStripRace__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aStripRace(): String {
            return indefiniteArticle(this.owner.raceShort());
        }
        public const aRaceTypeStrict__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceTypeStrict(): String { return this.aRaceTypeHuman; }
        public const aRaceTypeHuman__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceTypeHuman(): String {
            return indefiniteArticle(this.owner.raceShort(true));
        }
        public const aRaceCute__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceCute(): String {
            return indefiniteArticle(this.owner.raceCute());
        }
        public const aRaceCuteShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceCuteShort(): String { return this.aRaceCuteSimple; }
        public const aRaceCuteSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceCuteSimple(): String {
            return indefiniteArticle(this.owner.raceCute(true));
        }
        public const aRaceBoyGirl__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceBoyGirl(): String {
            return indefiniteArticle(this.owner.raceCute(false, true));
        }
        public const aRaceBoyGirlShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceBoyGirlShort(): String { return this.aRaceBoyGirlSimple; }
        public const aRaceBoyGirlSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aRaceBoyGirlSimple(): String {
            return indefiniteArticle(this.owner.raceCute(true, true));
        }
        // public function get class(): String { return this.occupation(); }
        public const classType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get classType(): String { return this.occupation; }
        public const characterClass__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get characterClass(): String { return this.occupation; }
        public const startingCareer__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get startingCareer(): String { return this.occupation; }
        public const occupation__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get occupation(): String {
            return GLOBAL.CLASS_NAMES[this.owner.characterClass].toLowerCase();
        }
        public const aClass__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aClass(): String { return this.anOccupation; }
        public const aClassType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aClassType(): String { return this.anOccupation; }
        public const aCharacterClass__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aCharacterClass(): String { return this.anOccupation; }
        public const aStartingCareer__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aStartingCareer(): String { return this.anOccupation; }
        public const anOccupation__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get anOccupation(): String {
            return indefiniteArticle(GLOBAL.CLASS_NAMES[this.owner.characterClass].toLowerCase());
        }
        public const armor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get armor(): String {
            return this.owner.armor.longName;
        }
        public const weapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get weapon(): String {
            return this.owner.getWeaponName(true);
        }
        public const meleeWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get meleeWeapon(): String { return this.weaponMelee; }
        public const weaponMelee__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get weaponMelee(): String {
            return this.owner.meleeWeapon.longName;
        }
        public const rangedWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get rangedWeapon(): String { return this.weaponRanged; }
        public const weaponRanged__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get weaponRanged(): String {
            return this.owner.rangedWeapon.longName;
        }
        public const rangedNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get rangedNoun(): String { return this.bowNoun; }
        public const gunNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get gunNoun(): String { return this.bowNoun; }
        public const bowNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get bowNoun(): String {
            return this.owner.getRangedNoun();
        }
        public const mainWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mainWeapon(): String { return this.weaponStat; }
        public const weaponMain__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get weaponMain(): String { return this.weaponStat; }
        public const weaponStat__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get weaponStat(): String {
            return this.owner.getWeaponName(true);
        }
        public const heldWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get heldWeapon(): String {
            return this.owner.heldWeaponName();
        }
        public const draw__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get draw(): String {
            return this.owner.weaponActionReady(false, "stat", false);
        }
        public const holster__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get holster(): String {
            return this.owner.weaponActionRelax(false, "stat", false);
        }
        public const drawing__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get drawing(): String {
            return this.owner.weaponActionReady(true, "stat", false);
        }
        public const holstering__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get holstering(): String {
            return this.owner.weaponActionRelax(true, "stat", false);
        }
        public const drawWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get drawWeapon(): String { return this.readyWeapon; }
        public const readyWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get readyWeapon(): String {
            return this.owner.weaponActionReady(false, "stat");
        }
        public const holsterWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get holsterWeapon(): String { return this.relaxWeapon; }
        public const relaxWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get relaxWeapon(): String {
            return this.owner.weaponActionRelax(false, "stat");
        }
        public const drawingWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get drawingWeapon(): String { return this.readyingWeapon; }
        public const readyingWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get readyingWeapon(): String {
            return this.owner.weaponActionReady(true, "stat");
        }
        public const holsteringWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get holsteringWeapon(): String { return this.relaxingWeapon; }
        public const relaxingWeapon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get relaxingWeapon(): String {
            return this.owner.weaponActionRelax(true, "stat");
        }
        public const readyMelee__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get readyMelee(): String {
            return this.owner.weaponActionReady(false, "melee");
        }
        public const relaxMelee__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get relaxMelee(): String {
            return this.owner.weaponActionRelax(false, "melee");
        }
        public const readyingMelee__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get readyingMelee(): String {
            return this.owner.weaponActionReady(true, "melee");
        }
        public const relaxingMelee__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get relaxingMelee(): String {
            return this.owner.weaponActionRelax(true, "melee");
        }
        public const readyRanged__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get readyRanged(): String {
            return this.owner.weaponActionReady(false, "ranged");
        }
        public const relaxRanged__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get relaxRanged(): String {
            return this.owner.weaponActionRelax(false, "ranged");
        }
        public const readyingRanged__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get readyingRanged(): String {
            return this.owner.weaponActionReady(true, "ranged");
        }
        public const relaxingRanged__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get relaxingRanged(): String {
            return this.owner.weaponActionRelax(true, "ranged");
        }
        public const move__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get move(): String {
            return this.owner.moveAction();
        }
        public const walk__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get walk(): String {
            return this.owner.moveAction(false, true);
        }
        public const moving__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get moving(): String {
            return this.owner.moveAction(true);
        }
        public const walking__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get walking(): String {
            return this.owner.moveAction(true, true);
        }
        public const lowerUndergarment__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowerUndergarment(): String {
            return this.owner.lowerUndergarment.longName;
        }
        public const upperUndergarment__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get upperUndergarment(): String {
            return this.owner.upperUndergarment.longName;
        }
        public const upperGarment__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get upperGarment(): String {
            return this.owner.upperGarmentDescript();
        }
        public const upperGarmentOuter__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get upperGarmentOuter(): String {
            return this.owner.upperGarmentOuterDescript();
        }
        public const upperGarments__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get upperGarments(): String {
            return this.owner.upperGarmentsDescript();
        }
        public const lowerGarments__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowerGarments(): String {
            return this.owner.lowerGarmentsDescript();
        }
        public const lowerGarment__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowerGarment(): String {
            return this.owner.lowerGarmentDescript();
        }
        public const underGarment__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get underGarment(): String {
            return this.owner.underGarmentDescript();
        }
        public const underGarments__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get underGarments(): String {
            return this.owner.underGarmentsDescript();
        }
        public const lowerGarmentOuter__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowerGarmentOuter(): String {
            return this.owner.lowerGarmentOuterDescript();
        }
        public const covers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get covers(): String { return this.coverings; }
        public const coverings__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get coverings(): String {
            return this.owner.covers();
        }
        public const crotchCover__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get crotchCover(): String {
            return this.owner.crotchCover();
        }
        public const crotchCoverUnder__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get crotchCoverUnder(): String {
            return this.owner.crotchCoverUnder();
        }
        public const crotchCovers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get crotchCovers(): String {
            return this.owner.crotchCovers();
        }
        public const assCover__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get assCover(): String {
            return this.owner.assCover();
        }
        public const assCoverUnder__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get assCoverUnder(): String {
            return this.owner.assCoverUnder();
        }
        public const assCovers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get assCovers(): String {
            return this.owner.assCovers();
        }
        public const chestCover__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chestCover(): String {
            return this.owner.chestCover();
        }
        public const chestCoverUnder__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chestCoverUnder(): String {
            return this.owner.chestCoverUnder();
        }
        public const chestCovers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chestCovers(): String {
            return this.owner.chestCovers();
        }
        public const skinNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinNoun(): String {
            return this.owner.skinNoun(true);
        }
        public const skinFurScalesNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinFurScalesNoun(): String { return this.skinScalesFurNoun; }
        public const skinScalesFurNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinScalesFurNoun(): String {
            return this.owner.skinNoun(false);
        }
        public const skinNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinNounSimple(): String {
            return this.owner.skinNoun(true, true);
        }
        public const skinFurScalesNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinFurScalesNounSimple(): String {
            return this.owner.skinNoun(false, true);
        }
        public const skinFurScalesColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinFurScalesColor(): String {
            return this.owner.skinFurScalesColor();
        }
        public const skinFurScales__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinFurScales(): String { return this.skinfurscales; }
        public const skinfurscales__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinfurscales(): String {
            return this.owner.skinFurScales();
        }
        public const skin__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skin(): String {
            return this.owner.skin();
        }
        public const skinColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinColor(): String { return this.skinTone; }
        public const skinTone__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinTone(): String {
            return this.owner.skinTone;
        }
        public const accentColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get accentColor(): String { return this.skinAccent; }
        public const skinAccent__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get skinAccent(): String {
            return this.owner.skinAccent;
        }
        public const accentMarkings__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get accentMarkings(): String {
            return this.owner.accentMarkingsDescript();
        }
        public const accentMarked__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get accentMarked(): String {
            return this.owner.accentMarkingsDescript(false);
        }
        public const accentMarkingsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get accentMarkingsNoun(): String {
            return this.owner.accentMarkingsDescript(true, true);
        }
        public const accentMarkedSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get accentMarkedSimple(): String {
            return this.owner.accentMarkingsDescript(false, true);
        }
        public const furColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get furColor(): String {
            return this.owner.furColor;
        }
        public const scaleColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get scaleColor(): String {
            return this.owner.scaleColor;
        }
        public const chitinColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chitinColor(): String {
            return this.owner.chitinColor("", true);
        }
        public const chitinColorBody__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chitinColorBody(): String {
            return this.owner.chitinColor("body", true);
        }
        public const chitinColorArm__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chitinColorArm(): String {
            return this.owner.chitinColor("arm", true);
        }
        public const chitinColorLeg__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chitinColorLeg(): String {
            return this.owner.chitinColor("leg", true);
        }
        public const chitinColorTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chitinColorTail(): String {
            return this.owner.chitinColor("tail", true);
        }
        public const ears__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ears(): String {
            return this.owner.earsDescript();
        }
        public const ear__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ear(): String {
            return this.owner.earDescript();
        }
        public const eyes__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eyes(): String {
            return this.owner.eyesDescript();
        }
        public const eye__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eye(): String {
            return this.owner.eyeDescript();
        }
        public const eyePigment__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eyePigment(): String { return this.eyeColor; }
        public const eyeColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eyeColor(): String {
            return this.owner.eyeColor;
        }
        public const nose__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nose(): String {
            return this.owner.noseDescript();
        }
        public const hairsDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hairsDescript(): String {
            return this.owner.hairsDescript();
        }
        public const hairDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hairDescript(): String { return this.hair; }
        public const hair__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hair(): String {
            return this.owner.hairDescript();
        }
        public const hairNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hairNoun(): String {
            return this.owner.hairNoun();
        }
        public const hairs__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hairs(): String { return this.hairsNoun; }
        public const hairsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hairsNoun(): String {
            return this.owner.hairsNoun();
        }
        public const hairColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hairColor(): String {
            return this.owner.hairColor;
        }
        public const beard__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get beard(): String {
            return this.owner.beard();
        }
        public const beardNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get beardNoun(): String {
            return this.owner.beardStyles(true);
        }
        public const beardColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get beardColor(): String {
            return this.owner.beardColor;
        }
        public const face__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get face(): String {
            return this.owner.face();
        }
        public const mouth__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mouth(): String {
            return this.owner.mouthDescript();
        }
        public const mouthFull__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mouthFull(): String {
            return this.owner.mouthDescript(true, false);
        }
        public const mouthFullChaste__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mouthFullChaste(): String {
            return this.owner.mouthDescript(true, true);
        }
        public const mouthChaste__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mouthChaste(): String {
            return this.owner.mouthDescript(false, true);
        }
        public const lips__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lips(): String {
            return this.owner.lipsDescript();
        }
        public const lipsChaste__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lipsChaste(): String {
            return this.owner.lipsDescript(false,true);
        }
        public const lip__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lip(): String {
            return this.owner.lipDescript();
        }
        public const lipChaste__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lipChaste(): String {
            return this.owner.lipDescript(false,true);
        }
        public const lipColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lipColor(): String {
            return this.owner.lipColor;
        }
        public const tongue__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tongue(): String {
            return this.owner.tongueDescript();
        }
        public const tongueNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tongueNoun(): String {
            return this.owner.tongueNoun();
        }
        public const tongueNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tongueNounSimple(): String {
            return this.owner.tongueNoun(true,false);
        }
        public const tonguePierced__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tonguePierced(): String {
            return this.owner.tongueNoun(false,true);
        }
        public const gills__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get gills(): String {
            return this.owner.gillsDesc();
        }
        public const gill__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get gill(): String {
            return this.owner.gillDesc();
        }
        public const tail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tail(): String {
            return this.owner.tailDescript();
        }
        public const tailNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailNoun(): String {
            return this.owner.tailDescript(true);
        }
        public const onetail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get onetail(): String { return this.oneTail; }
        public const oneTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneTail(): String {
            return this.owner.oneTailDescript();
        }
        public const eachtail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachtail(): String { return this.eachTail; }
        public const eachTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachTail(): String {
            return this.owner.eachTailDescript();
        }
        public const tails__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tails(): String {
            return this.owner.tailsDescript();
        }
        public const tailsIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailsIsAre(): String {
            return (this.owner.hasTails() ? this.owner.tailsDescript() + " are" : this.owner.tailsDescript() + " is");
        }
        public const crotch__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get crotch(): String { return this.genitals; }
        public const groin__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get groin(): String { return this.genitals; }
        public const genitals__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get genitals(): String {
            return this.owner.crotchDescript();
        }
        public const base__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function base(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public const cockBase__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockBase(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public const sheath__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function sheath(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public const sheathDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function sheathDescript(arg1: * = 0): String { return this.sheathOrBase(arg1); }
        public const sheathOrBase__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function sheathOrBase(arg1: * = 0): String {
            return this.owner.sheathDescript(arg1);
        }
        public const biggestSheath__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestSheath(): String { return this.sheathBiggest; }
        public const sheathBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sheathBiggest(): String {
            return this.owner.sheathDescript(this.owner.biggestCockIndex());
        }
        public const knot__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function knot(arg1: * = 0): String { return this.knotOrBase(arg1); }
        public const knotOrBase__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function knotOrBase(arg1: * = 0): String {
            return this.owner.knotDescript(arg1);
        }
        public const knots__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function knots(arg1: * = 0): String {
            return (this.owner.hasCocks() ? plural(this.owner.knotDescript(arg1)) : this.owner.knotDescript(arg1));
        }
        public const knotBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get knotBiggest(): String {
            return this.owner.knotDescript(this.owner.biggestCockIndex());
        }
        public const sheathOrKnot__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function sheathOrKnot(arg1: * = 0): String {
            return this.owner.sheathOrKnot(arg1);
        }
        public const knotOrSheath__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function knotOrSheath(arg1: * = 0): String {
            return this.owner.knotOrSheath(arg1);
        }
        public const knotBallsHilt__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function knotBallsHilt(arg1: * = 0): String {
            return this.owner.knotBallsHilt(arg1);
        }
        public const multiCockDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get multiCockDescript(): String { return this.multiCocks; }
        public const multiCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get multiCocks(): String {
            return this.owner.multiCockDescript();
        }
        public const cockLength__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockLength(arg1: * = 0): String { return this.cocklength(arg1); }
        public const cocklength__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cocklength(arg1: * = 0): String {
            return num2Text(Math.floor(this.owner.cLength(arg1)));
        }
        public const cockCount__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockCount(): String {
            return num2Text(this.owner.cocks.length);
        }
        public const cocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocks(): String { return this.dicks; }
        public const cocksDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksDescript(): String { return this.dicks; }
        public const dicks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get dicks(): String {
            return this.owner.cocksDescript();
        }
        public const cocksDescriptLight__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksDescriptLight(): String { return this.dicksLight; }
        public const cocksLight__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksLight(): String { return this.dicksLight; }
        public const dicksLight__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get dicksLight(): String {
            return this.owner.cocksDescriptLight();
        }
        public const cocksIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cocksIsAre(arg1: * = 0): String { return this.dicksIsAre(arg1); }
        public const dicksIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function dicksIsAre(arg1: * = 0): String {
            return (this.owner.hasCocks() ? this.owner.cocksDescript() + " are" : this.owner.cockDescript(arg1) + " is");
        }
        public const cocksLightIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cocksLightIsAre(arg1: * = 0): String { return this.dicksLightIsAre(arg1); }
        public const dicksLightIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function dicksLightIsAre(arg1: * = 0): String {
            return (this.owner.hasCocks() ? this.owner.cocksDescriptLight() + " are" : this.owner.simpleCockNoun(arg1) + " is");
        }
        public const cocksSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksSimple(): String { return this.cocksNounSimple; }
        public const cocksShort__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksShort(): String { return this.cocksNounSimple; }
        public const cocksNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksNoun(): String { return this.cocksNounSimple; }
        public const cocksNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cocksNounSimple(): String {
            return this.owner.simpleCocksNoun();
        }
        public const cockComplex__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockComplex(arg1: * = 0): String { return this.cockNounComplex(arg1); }
        public const cockNounComplex__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockNounComplex(arg1: * = 0): String {
            return this.owner.cockNounComplex(arg1);
        }
        public const cockLight__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockLight(arg1: * = 0): String { return this.cockNoun(arg1); }
        public const cockSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockSimple(arg1: * = 0): String { return this.cockNoun(arg1); }
        public const cockNounSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockNounSimple(arg1: * = 0): String { return this.cockNoun(arg1); }
        public const cockShort__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockShort(arg1: * = 0): String { return this.cockNoun(arg1); }
        public const cockNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockNoun(arg1: * = 0): String {
            return this.owner.simpleCockNoun(arg1);
        }
        public const dicksNounIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function dicksNounIsAre(arg1: * = 0): String { return this.cocksNounIsAre(arg1); }
        public const cocksNounIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cocksNounIsAre(arg1: * = 0): String {
            return (this.owner.hasCocks() ? this.owner.simpleCocksNoun() + " are" : this.owner.simpleCockNoun(arg1) + " is");
        }
        public const cockNounBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockNounBiggest(): String {
            return this.owner.simpleCockNoun(this.owner.biggestCockIndex());
        }
        public const cockSkin__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockSkin(arg1: * = 0): String { return this.dickSkin(arg1); }
        public const dickSkin__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function dickSkin(arg1: * = 0): String {
            return this.owner.cockSkin(arg1);
        }
        public const cockColor__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockColor(arg1: * = 0): String { return this.dickColor(arg1); }
        public const dickColor__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function dickColor(arg1: * = 0): String {
            return this.owner.cockColor(arg1);
        }
        public const vaginaColor__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaColor(arg1: * = 0): String { return this.pussyColor(arg1); }
        public const cuntColor__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cuntColor(arg1: * = 0): String { return this.pussyColor(arg1); }
        public const pussyColor__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussyColor(arg1: * = 0): String {
            return this.owner.vaginaColor(arg1);
        }
        public const cockHead__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockHead(arg1: * = 0): String { return this.cockhead(arg1); }
        public const cockhead__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockhead(arg1: * = 0): String {
            return this.owner.cockHead(arg1);
        }
        public const cockHeadNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockHeadNoun(arg1: * = 0): String {
            return this.owner.cockHeadNoun(arg1);
        }
        public const cockHeads__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockHeads(arg1: * = 0): String { return this.cockheads(arg1); }
        public const cockheads__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockheads(arg1: * = 0): String {
            return this.owner.cockHeads(arg1);
        }
        public const cockHeadsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockHeadsNoun(): String {
            return this.owner.cockHeadsNoun();
        }
        public const cockDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockDescript(arg1: * = 0): String { return this.cock(arg1); }
        public const cock__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cock(arg1: * = 0): String {
            return this.owner.cockDescript(arg1);
        }
        public const biggestCockDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCockDescript(): String { return this.cockBiggest; }
        public const biggestCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCock(): String { return this.cockBiggest; }
        public const cockBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockBiggest(): String {
            return this.owner.cockDescript(this.owner.biggestCockIndex());
        }
        public const biggestCockNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCockNoun(): String { return this.cockBiggestNoun; }
        public const cockBiggestNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockBiggestNoun(): String {
            return this.owner.simpleCockNoun(this.owner.biggestCockIndex());
        }
        public const biggestCockHead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCockHead(): String { return this.cockheadBiggest; }
        public const biggestCockhead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCockhead(): String { return this.cockheadBiggest; }
        public const cockHeadBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockHeadBiggest(): String { return this.cockheadBiggest; }
        public const cockheadBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockheadBiggest(): String {
            return this.owner.cockHead(this.owner.biggestCockIndex());
        }
        public const smallestCockHead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get smallestCockHead(): String { return this.cockheadSmallest; }
        public const smallestCockhead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get smallestCockhead(): String { return this.cockheadSmallest; }
        public const cockHeadSmallest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockHeadSmallest(): String { return this.cockheadSmallest; }
        public const cockheadSmallest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockheadSmallest(): String {
            return this.owner.cockHead(this.owner.smallestCockIndex());
        }
        public const smallestCockDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get smallestCockDescript(): String { return this.cockSmallest; }
        public const smallestCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get smallestCock(): String { return this.cockSmallest; }
        public const cockSmallest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockSmallest(): String {
            return this.owner.cockDescript(this.owner.smallestCockIndex());
        }
        public const smallestCockNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get smallestCockNoun(): String { return this.cockSmallestNoun; }
        public const cockSmallestNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockSmallestNoun(): String {
            return this.owner.simpleCockNoun(this.owner.smallestCockIndex());
        }
        public const shortestCockDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get shortestCockDescript(): String { return this.cockShortest; }
        public const shortestCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get shortestCock(): String { return this.cockShortest; }
        public const cockShortest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockShortest(): String {
            return this.owner.cockDescript(this.owner.shortestCockIndex());
        }
        public const shortestCockNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get shortestCockNoun(): String { return this.cockShortestNoun; }
        public const cockShortestNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockShortestNoun(): String {
            return this.owner.simpleCockNoun(this.owner.shortestCockIndex());
        }
        public const eachCockHead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachCockHead(): String {
            return this.owner.eachCockHead();
        }
        public const tailCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCock(): String { return this.cockTail; }
        public const cockTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockTail(): String {
            return this.owner.tailCockDescript();
        }
        public const tailCockHead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCockHead(): String {
            return this.owner.tailCockHead();
        }
        public const tailCockHeads__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCockHeads(): String {
            return this.owner.tailCockHeads();
        }
        public const tailCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCocks(): String { return this.cockTails; }
        public const cockTails__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockTails(): String {
            return this.owner.tailCocksDescript();
        }
        public const cockOrStrapon__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrStrapon(arg1: * = -3): String { return this.cockOrHardlight(arg1); }
        public const cockOrHardlight__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrHardlight(arg1: * = -3): String {
            return this.owner.cockOrStrapon(arg1,0);
        }
        public const cockOrStraponNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrStraponNoun(arg1: * = -3): String { return this.cockOrHardlightNoun(arg1); }
        public const cockOrHardlightNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrHardlightNoun(arg1: * = -3): String {
            return this.owner.cockOrStrapon(arg1,-1);
        }
        public const cockOrStraponFull__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrStraponFull(arg1: * = -3): String { return this.cockOrHardlightFull(arg1); }
        public const cockOrHardlightFull__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrHardlightFull(arg1: * = -3): String {
            return this.owner.cockOrStrapon(arg1,1);
        }
        public const hardlightCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hardlightCock(): String {
            return this.owner.cockOrStrapon(-1,0);
        }
        public const hardlightCockNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hardlightCockNoun(): String {
            return this.owner.cockOrStrapon(-1,-1);
        }
        public const hardlightCockFull__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hardlightCockFull(): String {
            return this.owner.cockOrStrapon(-1,1);
        }
        public const cockOrStraponHead__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockOrStraponHead(arg1: * = -3): String {
            return this.owner.cockOrStraponHead(arg1);
        }
        public const cockOrVag__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cockOrVag(): String {
            return this.owner.cockOrVag();
        }
        public const nippleNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nippleNoun(arg1: * = 0): String {
            return this.owner.nippleNoun(arg1);
        }
        public const nipplesNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipplesNoun(arg1: * = 0): String {
            return this.owner.nipplesNoun(arg1);
        }
        public const nippleNounSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nippleNounSimple(arg1: * = 0): String {
            return this.owner.nippleNoun(arg1, true);
        }
        public const nipplesNounSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipplesNounSimple(arg1: * = 0): String {
            return this.owner.nipplesNoun(arg1, true);
        }
        public const nipple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipple(arg1: * = 0): String { return this.lipple(arg1); }
        public const nippleDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nippleDescript(arg1: * = 0): String { return this.lipple(arg1); }
        public const lipple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function lipple(arg1: * = 0): String {
            return this.owner.nippleDescript(arg1);
        }
        public const nipples__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipples(arg1: * = 0): String { return this.lipples(arg1); }
        public const nipplesDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipplesDescript(arg1: * = 0): String { return this.lipples(arg1); }
        public const lipples__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function lipples(arg1: * = 0): String {
            return this.owner.nipplesDescript(arg1);
        }
        public const milkyNipple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function milkyNipple(arg1: * = 0): String {
            return this.owner.nippleDescript(arg1, false, true);
        }
        public const milkyNipples__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function milkyNipples(arg1: * = 0): String {
            return this.owner.nipplesDescript(arg1, true);
        }
        public const nippleCuntDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCuntDescript(): String { return this.cuntNipple; }
        public const nippleCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCunt(): String { return this.cuntNipple; }
        public const cuntNipple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntNipple(): String {
            return this.owner.nippleCuntDescript();
        }
        public const nippleCuntsDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCuntsDescript(): String { return this.cuntNipples; }
        public const nippleCunts__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCunts(): String { return this.cuntNipples; }
        public const cuntNipples__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntNipples(): String {
            return this.owner.nippleCuntsDescript();
        }
        public const nippleCockDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCockDescript(): String { return this.dickNipple; }
        public const nippleCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCock(): String { return this.dickNipple; }
        public const dickNipple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get dickNipple(): String {
            return this.owner.nippleCockDescript();
        }
        public const nippleCocksDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCocksDescript(): String { return this.dickNipples; }
        public const nippleCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleCocks(): String { return this.dickNipples; }
        public const dickNipples__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get dickNipples(): String {
            return this.owner.nippleCocksDescript();
        }
        public const nippleColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nippleColor(): String {
            return this.owner.nippleColor;
        }
        public const nipplePiercings__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nipplePiercings(): String {
            return "nipple piercings"; // 9999
        }
        public const nippleHarden__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nippleHarden(arg1: * = 0): String { return this.nipplesHarden(arg1); }
        public const nipplesHarden__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipplesHarden(arg1: * = 0): String {
            return this.owner.nipplesErect(arg1);
        }
        public const nippleHardening__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nippleHardening(arg1: * = 0): String { return this.nipplesHardening(arg1); }
        public const nipplesHardening__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function nipplesHardening(arg1: * = 0): String {
            return this.owner.nipplesErect(arg1, true);
        }
        public const areola__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function areola(arg1: * = 0): String { return this.areolaDescript(arg1); }
        public const areolaDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function areolaDescript(arg1: * = 0): String {
            return this.owner.areolaDescript(arg1);
        }
        public const areolae__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function areolae(arg1: * = 0): String { return this.areolaeDescript(arg1); }
        public const areolaeDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function areolaeDescript(arg1: * = 0): String {
            return this.owner.areolaeDescript(arg1);
        }
        public const eachCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachCock(): String {
            return this.owner.eachCock();
        }
        public const eachCockIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachCockIsAre(): String {
            return this.owner.eachCock() + (this.owner.hasCocks() ? " are" : " is");
        }
        public const oneCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneCock(): String {
            return this.owner.oneCock();
        }
        public const oneCockHead__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneCockHead(): String {
            return this.owner.oneCockHead();
        }
        public const erectCock__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function erectCock(arg1: * = 0): String { return this.flaccidCock(arg1); }
        public const flaccidCock__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function flaccidCock(arg1: * = 0): String {
            return this.owner.cockDescript(arg1, true);
        }
        public const erectCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get erectCocks(): String { return this.flaccidCocks; }
        public const flaccidCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get flaccidCocks(): String {
            return this.owner.cocksDescript(true);
        }
        public const erectMultiCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get erectMultiCocks(): String { return this.flaccidMultiCocks; }
        public const flaccidMultiCocks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get flaccidMultiCocks(): String {
            return this.owner.multiCockDescript(true);
        }
        public const eachErectCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachErectCock(): String { return this.eachFlaccidCock; }
        public const eachFlaccidCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachFlaccidCock(): String {
            return this.owner.eachCock(true);
        }
        public const oneErectCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneErectCock(): String { return this.oneFlaccidCock; }
        public const oneFlaccidCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneFlaccidCock(): String {
            return this.owner.oneCock(true);
        }
        public const balls__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get balls(): String {
            return this.owner.ballsDescript();
        }
        public const ballsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballsNoun(): String {
            return this.owner.ballNoun(true);
        }
        public const ballNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballNoun(): String {
            return this.owner.ballNoun(false);
        }
        public const ballsNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballsNounSimple(): String {
            return this.owner.ballsNounSimple();
        }
        public const ballNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballNounSimple(): String {
            return this.owner.ballsNounSimple(true);
        }
        public const ballsNounIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballsNounIsAre(): String {
            return this.owner.ballNoun(true) + " " + (this.owner.balls == 1 ? "is" : "are");
        }
        public const ballsNounSimpleIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballsNounSimpleIsAre(): String {
            return this.owner.ballsNounSimple() + " " + (this.owner.balls == 1 ? "is" : "are");
        }
        public const ball__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ball(): String {
            return this.owner.ballsDescript();
        }
        public const ballsIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballsIsAre(): String {
            return this.owner.hasBalls() ? this.owner.ballsDescript() + " are" : this.owner.ballDescript() + " is";
        }
        public const prostate__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get prostate(): String { return this.scrotum; }
        public const sack__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sack(): String { return this.scrotum; }
        public const ballsack__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballsack(): String { return this.scrotum; }
        public const ballSack__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ballSack(): String { return this.scrotum; }
        public const nutsack__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nutsack(): String { return this.scrotum; }
        public const scrotum__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get scrotum(): String {
            return this.owner.sackDescript();
        }
        public const sackTexture__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sackTexture(): String {
            return this.owner.sackTexture();
        }
        public const chestDesc__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chestDesc(): String { return this.chest; }
        public const chest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chest(): String {
            return this.owner.chestDesc();
        }
        public const chestSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function chestSimple(arg1: * = 0): String { return this.breastsNoun(arg1); }
        public const chestNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function chestNoun(arg1: * = 0): String { return this.breastsNoun(arg1); }
        public const breastsNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastsNoun(arg1: * = 0): String {
            return this.owner.chestNoun(arg1);
        }
        public const breastNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastNoun(arg1: * = 0): String { return this.breast(arg1); }
        public const breast__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breast(arg1: * = 0): String {
            return this.owner.breastNoun(arg1);
        }
        public const breastNounChaste__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastNounChaste(arg1: * = 0): String { return this.breastDry(arg1); }
        public const breastChaste__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastChaste(arg1: * = 0): String { return this.breastDry(arg1); }
        public const breastNounDry__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastNounDry(arg1: * = 0): String { return this.breastDry(arg1); }
        public const breastDry__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastDry(arg1: * = 0): String {
            return this.owner.breastNoun(arg1, true);
        }
        public const cupSize__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cupSize(arg1: * = 0): String { return this.breastCupSize(arg1); }
        public const breastCup__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastCup(arg1: * = 0): String { return this.breastCupSize(arg1); }
        public const breastCupSize__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastCupSize(arg1: * = 0): String {
            return this.owner.breastCup(arg1);
        }
        public const allChestDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get allChestDescript(): String { return this.chestFull; }
        public const fullChest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get fullChest(): String { return this.chestFull; }
        public const chestFull__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get chestFull(): String {
            return this.owner.allChestDesc();
        }
        public const biggestBreastDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestBreastDescript(): String {
            return this.owner.biggestBreastDescript();
        }
        public const breastDescript__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breastDescript(arg1: * = 0): String { return this.tits(arg1); }
        public const breasts__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function breasts(arg1: * = 0): String { return this.tits(arg1); }
        public const boobs__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function boobs(arg1: * = 0): String { return this.tits(arg1); }
        public const tits__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function tits(arg1: * = 0): String {
            return this.owner.breastDescript(arg1);
        }
        public const lowestBreasts__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowestBreasts(): String {
            return this.owner.breastDescript(this.owner.bRows()-1);
        }
        public const cockClit__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockClit(arg1: * = 0): String {
            return this.owner.cockClit(arg1);
        }
        public const anus__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get anus(): String { return this.butthole; }
        public const assholeDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get assholeDescript(): String { return this.butthole; }
        public const asshole__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get asshole(): String { return this.butthole; }
        public const butthole__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get butthole(): String {
            return this.owner.assholeDescript();
        }
        public const anusSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get anusSimple(): String { return this.assholeNoun; }
        public const assholeSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get assholeSimple(): String { return this.assholeNoun; }
        public const anusNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get anusNoun(): String { return this.assholeNoun; }
        public const assholeNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get assholeNoun(): String {
            return this.owner.assholeDescript(true);
        }
        public const buttDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get buttDescript(): String { return this.ass; }
        public const butt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get butt(): String { return this.ass; }
        public const ass__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ass(): String {
            return this.owner.buttDescript();
        }
        public const buttcheek__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get buttcheek(): String { return this.asscheek; }
        public const asscheek__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get asscheek(): String {
            return this.owner.buttDescript(false, true);
        }
        public const buttsDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get buttsDescript(): String { return this.asses; }
        public const buttcheeks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get buttcheeks(): String { return this.asses; }
        public const asscheeks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get asscheeks(): String { return this.asses; }
        public const cheeks__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cheeks(): String { return this.asses; }
        public const butts__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get butts(): String { return this.asses; }
        public const asses__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get asses(): String {
            return this.owner.buttDescript(true);
        }
        public const hipDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hipDescript(): String { return this.hip; }
        public const hip__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hip(): String {
            return this.owner.hipDescript();
        }
        public const hipsDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hipsDescript(): String { return this.hips; }
        public const hips__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hips(): String {
            return this.owner.hipsDescript();
        }
        public const thighDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get thighDescript(): String { return this.thigh; }
        public const thigh__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get thigh(): String {
            return this.owner.thighDescript();
        }
        public const thighsDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get thighsDescript(): String { return this.thighs; }
        public const thighs__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get thighs(): String {
            return this.owner.thighsDescript();
        }
        public const vagina__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vagina(arg1: * = 0): String { return this.cunt(arg1); }
        public const pussy__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussy(arg1: * = 0): String { return this.cunt(arg1); }
        public const cunt__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cunt(arg1: * = 0): String {
            return this.owner.vaginaDescript(arg1);
        }
        //Complex Noun
        public const vaginaNounComplex__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaNounComplex(arg1: * = 0): String { return this.pussyNounComplex(arg1); }
        public const pussyNounComplex__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussyNounComplex(arg1: * = 0): String {
            return this.owner.vaginaNounComplex(arg1);
        }
        //Simple Noun
        public const vaginaSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaSimple(arg1: * = 0): String { return this.vaginaNounSimple(arg1); }
        public const pussySimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussySimple(arg1: * = 0): String { return this.vaginaNounSimple(arg1); }
        public const cuntSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cuntSimple(arg1: * = 0): String { return this.vaginaNounSimple(arg1); }
        public const vaginaNounSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaNounSimple(arg1: * = 0): String {
            return this.owner.vaginaNounSimple(arg1);
        }
        //Generic cuntnoun
        public const vaginaNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaNoun(arg1: * = 0): String { return this.cuntNoun(arg1); }
        public const pussyNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussyNoun(arg1: * = 0): String { return this.cuntNoun(arg1); }
        public const cuntNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cuntNoun(arg1: * = 0): String {
            return this.owner.vaginaNounDescript(arg1);
        }
        public const multiCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get multiCunt(): String { return this.multiVagina; }
        public const multiCunts__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get multiCunts(): String { return this.multiVagina; }
        public const multiVaginas__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get multiVaginas(): String { return this.multiVagina; }
        public const multiVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get multiVagina(): String {
            return this.owner.multiCuntDescript();
        }
        public const vaginasNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginasNoun(): String { return this.vaginasNounSimple; }
        public const pussiesNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get pussiesNoun(): String { return this.vaginasNounSimple; }
        public const cuntsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntsNoun(): String { return this.vaginasNounSimple; }
        public const vaginasSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginasSimple(): String { return this.vaginasNounSimple; }
        public const pussiesSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get pussiesSimple(): String { return this.vaginasNounSimple; }
        public const cuntsSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntsSimple(): String { return this.vaginasNounSimple; }
        public const vaginasNounSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginasNounSimple(): String {
            return this.owner.simpleVaginasNoun();
        }
        public const vaginas__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginas(): String { return this.cunts; }
        public const pussies__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get pussies(): String { return this.cunts; }
        public const cunts__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cunts(): String {
            return this.owner.vaginasDescript();
        }
        public const vaginasLight__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginasLight(): String { return this.cuntsLight; }
        public const pussiesLight__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get pussiesLight(): String { return this.cuntsLight; }
        public const cuntsLight__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntsLight(): String {
            return this.owner.vaginasDescriptLight();
        }
        public const eachVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachVagina(): String { return this.eachCunt; }
        public const eachPussy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachPussy(): String { return this.eachCunt; }
        public const eachCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachCunt(): String {
            return this.owner.eachVagina();
        }
        public const oneVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneVagina(): String { return this.oneCunt; }
        public const onePussy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get onePussy(): String { return this.oneCunt; }
        public const oneCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneCunt(): String {
            return this.owner.oneVagina();
        }
        public const biggestVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestVagina(): String { return this.biggestCunt; }
        public const vaginaBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginaBiggest(): String { return this.biggestCunt; }
        public const cuntBiggest__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntBiggest(): String { return this.biggestCunt; }
        public const biggestCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCunt(): String {
            return this.owner.vaginaDescript(this.owner.biggestVaginaIndex());
        }
        public const vaginasIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginasIsAre(): String { return this.pussiesIsAre; }
        public const cuntsIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntsIsAre(): String { return this.pussiesIsAre; }
        public const pussiesIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get pussiesIsAre(): String {
            return (this.owner.hasVaginas() ? this.owner.vaginasDescript() + " are" : this.owner.vaginaDescript() + " is");
        }
        public const vaginasLightIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get vaginasLightIsAre(): String { return this.pussiesLightIsAre; }
        public const cuntsLightIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntsLightIsAre(): String { return this.pussiesLightIsAre; }
        public const pussiesLightIsAre__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get pussiesLightIsAre(): String {
            return this.owner.simpleVaginasNoun() + (this.owner.hasVaginas() ?" are" : " is");
        }    
        public const vagOrAss__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vagOrAss(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public const vagOrAsshole__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vagOrAsshole(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public const vaginaOrAss__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaOrAss(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public const vaginaOrAsshole__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vaginaOrAsshole(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public const pussyOrAss__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussyOrAss(arg1: * = 0): String { return this.pussyOrAsshole(arg1); }
        public const pussyOrAsshole__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function pussyOrAsshole(arg1: * = 0): String {
            return this.owner.vagOrAss(arg1);
        }
        public const vagOrAssNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vagOrAssNoun(arg1: * = 0): String { return this.vagOrAssSimple(arg1); }
        public const vagOrAssSimple__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function vagOrAssSimple(arg1: * = 0): String {
            return this.owner.vagOrAssNoun(arg1);
        }
        public const womb__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function womb(arg1: * = 0): String { return this.uterus(arg1); }
        public const uterus__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function uterus(arg1: * = 0): String {
            return this.owner.wombDescript(arg1);
        }
        public const wombs__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get wombs(): String { return this.uteri; }
        public const uteruses__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get uteruses(): String { return this.uteri; }
        public const uteri__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get uteri(): String {
            return this.owner.wombsDescript();
        }
        public const clit__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clit(arg1: * = 0): String { return this.clitoris(arg1); }
        public const clitoris__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clitoris(arg1: * = 0): String {
            return this.owner.clitDescript(arg1);
        }
        public const clitNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clitNoun(arg1: * = 0): String { return this.clitorisNoun(arg1); }
        public const clitorisNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clitorisNoun(arg1: * = 0): String {
            return this.owner.clitDescript(arg1, true);
        }
        public const biggestCuntClit__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get biggestCuntClit(): String {
            return this.owner.clitDescript(this.owner.biggestVaginaIndex());
        }
        public const eachClit__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachClit(): String { return this.eachClitoris; }
        public const eachClitoris__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachClitoris(): String {
            return this.owner.eachClit();
        }
        public const oneClit__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneClit(): String { return this.oneClitoris; }
        public const oneClitoris__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneClitoris(): String {
            return this.owner.oneClit();
        }
        public const oneClitPerVagina__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function oneClitPerVagina(arg1: * = 0): String {
            return this.owner.oneClitPerVagina(arg1);
        }
        public const clits__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clits(arg1: * = -1): String {
            return this.owner.clitsDescript(arg1);
        }
        public const clitsNoun__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clitsNoun(arg1: * = -1): String {
            return this.owner.clitsDescript(arg1, true);
        }
        public const clitsIsAre__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function clitsIsAre(arg1: * = 0): String {
            return (this.owner.totalClits() != 1 ? this.owner.clitsDescript(arg1) + " are" : this.owner.clitDescript(arg1) + " is");
        }
        public const tailVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailVagina(): String { return this.tailgina; }
        public const tailCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCunt(): String { return this.tailgina; }
        public const cuntTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntTail(): String { return this.tailgina; }
        public const tailgina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailgina(): String {
            return this.owner.tailVaginaDescript();
        }
        public const tailVaginas__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailVaginas(): String { return this.tailginas; }
        public const tailCunts__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCunts(): String { return this.tailginas; }
        public const cuntTails__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cuntTails(): String { return this.tailginas; }
        public const tailginas__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailginas(): String {
            return this.owner.tailVaginasDescript();
        }
        public const oneTailgina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneTailgina(): String { return this.oneTailCunt; }
        public const oneTailCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneTailCunt(): String {
            return this.owner.oneTailVaginaDescript();
        }
        public const milkNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkNoun(): String { return this.milkType; }
        public const milkType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkType(): String {
            return this.owner.fluidNoun(this.owner.milkType);
        }
        public const milkDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkDescript(): String { return this.milk; }
        public const milk__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milk(): String {
            return this.owner.milkDescript();
        }
        public const cumDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumDescript(): String { return this.cum; }
        public const cum__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cum(): String {
            return this.owner.cumDescript();
        }
        public const femCum__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCum(): String { return this.girlcum; }
        public const femcum__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femcum(): String { return this.girlcum; }
        public const girlCumDescript__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumDescript(): String { return this.girlcum; }
        public const girlCum__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCum(): String { return this.girlcum; }
        public const girlcum__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlcum(): String {
            return this.owner.girlCumDescript();
        }
        public const cumNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumNoun(): String { return this.cumType; }
        public const cumType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumType(): String {
            return this.owner.fluidNoun(this.owner.cumType);
        }
        public const femCumNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumNoun(): String { return this.girlCumType; }
        public const femCumType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumType(): String { return this.girlCumType; }
        public const girlCumNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumNoun(): String { return this.girlCumType; }
        public const girlCumType__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumType(): String {
            return this.owner.fluidNoun(this.owner.girlCumType);
        }
        public const cumColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumColor(): String {
            return this.owner.cumColor();
        }
        public const cumColorNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumColorNoun(): String { return this.cumColorSimple; }
        public const cumColorSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumColorSimple(): String {
            return this.owner.fluidColorSimple(this.owner.cumType);
        }
        public const cumGem__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumGem(): String {
            return this.owner.cumGem();
        }
        public const femCumGem__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumGem(): String { return this.girlCumGem; }
        public const girlCumGem__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumGem(): String {
            return this.owner.girlCumGem();
        }
        public const milkGem__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkGem(): String {
            return this.owner.milkGem();
        }
        public const femCumColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumColor(): String { return this.girlCumColor; }
        public const girlCumColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumColor(): String {
            return this.owner.girlCumColor();
        }
        public const femCumColorNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumColorNoun(): String { return this.girlCumColorSimple; }
        public const femCumColorSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumColorSimple(): String { return this.girlCumColorSimple; }
        public const girlCumColorNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumColorNoun(): String { return this.girlCumColorSimple; }
        public const girlCumColorSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumColorSimple(): String {
            return this.owner.fluidColorSimple(this.owner.girlCumType);
        }
        public const milkColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkColor(): String {
            return this.owner.milkColor();
        }
        public const milkColorNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkColorNoun(): String { return this.milkColorSimple; }
        public const milkColorSimple__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkColorSimple(): String {
            return this.owner.fluidColorSimple(this.owner.milkType);
        }
        public const cumVisc__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumVisc(): String {
            return this.owner.fluidViscosity(this.owner.cumType);
        }
        public const femCumVisc__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumVisc(): String { return this.girlCumVisc; }
        public const girlCumVisc__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumVisc(): String {
            return this.owner.fluidViscosity(this.owner.girlCumType);
        }
        public const milkVisc__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkVisc(): String {
            return this.owner.fluidViscosity(this.owner.milkType);
        }
        public const cumFlavor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cumFlavor(): String {
            return this.owner.fluidFlavor(this.owner.cumType);
        }
        public const femCumFlavor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get femCumFlavor(): String { return this.girlCumFlavor; }
        public const girlCumFlavor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlCumFlavor(): String {
            return this.owner.fluidFlavor(this.owner.girlCumType);
        }
        public const milkFlavor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get milkFlavor(): String {
            return this.owner.fluidFlavor(this.owner.milkType);
        }
        public const wing__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get wing(): String {
            return this.owner.wingDescript();
        }
        public const wings__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get wings(): String {
            return this.owner.wingsDescript();
        }
        public const wingNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get wingNoun(): String {
            return this.owner.wingDescript(true);
        }
        public const wingsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get wingsNoun(): String {
            return this.owner.wingsDescript(true);
        }
        public const arm__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get arm(): String {
            return this.owner.armDescript();
        }
        public const arms__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get arms(): String {
            return this.owner.armsDescript();
        }
        public const armFull__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get armFull(): String {
            return this.owner.armDescript(true);
        }
        public const armsFull__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get armsFull(): String {
            return this.owner.armsDescript(true);
        }
        public const armNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get armNoun(): String {
            return this.owner.armNoun();
        }
        public const armsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get armsNoun(): String {
            return this.owner.armsNoun();
        }
        public const hand__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hand(): String {
            return this.owner.hand();
        }
        public const hands__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hands(): String {
            return this.owner.hands();
        }
        public const finger__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get finger(): String {
            return this.owner.finger();
        }
        public const fingers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get fingers(): String {
            return this.owner.fingers();
        }
        public const lowerbody__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowerbody(): String { return this.lowerBody; }
        public const lowerBody__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get lowerBody(): String {
            return this.owner.lowerBody();
        }
        public const leg__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get leg(): String {
            return this.owner.leg();
        }
        public const legNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legNoun(): String {
            return this.owner.legNoun();
        }
        public const legsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legsNoun(): String {
            return this.owner.legsNoun();
        }
        public const legs__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legs(): String {
            return this.owner.legs();
        }
        // case "leg(s)":
        public const legOrLegs__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legOrLegs(): String { return this.legsOrLeg; }
        public const legsOrLeg__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legsOrLeg(): String {
            return this.owner.legOrLegs();
        }
        public const legOrLegsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legOrLegsNoun(): String {
            return (this.owner.legCount == 1 ? this.owner.legNoun() : this.owner.legsNoun());
        }
        public const legFurScales__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get legFurScales(): String {
            return this.owner.legFurScales();
        }
        public const knee__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get knee(): String {
            return this.owner.kneeDescript();
        }
        public const knees__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get knees(): String {
            return this.owner.kneesDescript();
        }
        public const footOrFeet__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get footOrFeet(): String { return this.feet; }
        public const feetOrFoot__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get feetOrFoot(): String { return this.feet; }
        public const feet__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get feet(): String {
            return this.owner.feet();
        }
        public const foot__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get foot(): String {
            return this.owner.foot();
        }
        public const toe__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get toe(): String {
            return this.owner.toe();
        }
        public const toes__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get toes(): String {
            return this.owner.toes();
        }
        public const belly__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get belly(): String { return this.abdomen; }
        public const stomach__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get stomach(): String { return this.abdomen; }
        public const tummy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tummy(): String { return this.abdomen; }
        public const abdomen__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get abdomen(): String {
            return this.owner.bellyDescript();
        }
        public const bellySize__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get bellySize(): String {
            return this.owner.bellyDescript(true);
        }
        public const mistress__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mistress(): String { return this.masterMistress; }
        public const master__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get master(): String { return this.masterMistress; }
        public const masterMistress__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get masterMistress(): String {
            return this.owner.mf("master", "mistress");
        }
        public const he__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get he(): String { return this.ey; }
        public const she__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get she(): String { return this.ey; }
        public const heShe__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get heShe(): String { return this.ey; } // Shamelessly stole these from Alderbro. :3
        public const ey__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ey(): String {
            return this.owner.mf("he", "she");
        }
        public const him__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get him(): String { return this.em; }
        public const himHer__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get himHer(): String { return this.em; }
        public const em__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get em(): String {
            return this.owner.mf("him", "her");
        }
        public const himHerIt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get himHerIt(): String {
            return this.owner.mfn("him","her","it");
        }
        public const his__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get his(): String { return this.eir; }
        public const hisHer__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hisHer(): String { return this.eir; }
        public const eir__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eir(): String {
            return this.owner.mf("his", "her");
        }
        public const hisHers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hisHers(): String { return this.eirs; }
        public const eirs__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eirs(): String {
            return this.owner.mf("his", "hers");
        }
        public const sir__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sir(): String {
            return this.owner.mf("sir", "ma’am");
        }
        // case "ma'am":
        //     return this.owner.mf("sir", "ma’am");
        // }
        public const misterMiss__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get misterMiss(): String { return this.miss; }
        public const mister__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mister(): String { return this.miss; }
        public const miss__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get miss(): String {
            return this.owner.mf("mister", "miss");
        }
        public const mr__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mr(): String { return this.ms; }
        public const ms__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get ms(): String {
            return this.owner.mf("Mr", "Ms");
        }
        public const man__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get man(): String { return this.manWoman; }
        public const woman__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get woman(): String { return this.manWoman; }
        public const manWoman__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get manWoman(): String {
            return this.owner.mf("man", "woman");
        }
        public const boy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get boy(): String { return this.girlBoy; }
        public const girl__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girl(): String { return this.girlBoy; }
        public const boyGirl__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get boyGirl(): String { return this.girlBoy; }
        public const girlBoy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get girlBoy(): String {
            return this.owner.mf("boy", "girl");
        }
        public const guy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get guy(): String { return this.guyGirl; }
        // public function get girl(): String { return this.guyGirl(); }
        public const guyGirl__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get guyGirl(): String {
            return this.owner.mf("guy","girl");
        }
        public const son__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get son(): String { return this.daughterSon; }
        public const daughter__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get daughter(): String { return this.daughterSon; }
        public const sonDaughter__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sonDaughter(): String { return this.daughterSon; }
        public const daughterSon__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get daughterSon(): String {
            return this.owner.mf("son", "daughter");
        }
        public const daddy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get daddy(): String { return this.daddyMommy; }
        public const mommy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get mommy(): String { return this.daddyMommy; }
        public const daddyMommy__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get daddyMommy(): String {
            return this.owner.mf("daddy", "mommy");
        }
        // public function get son(): String { return this.sonDaughter(); }
        // public function get daughter(): String { return this.sonDaughter(); }
        // public function get sonDaughter(): String {
        //     return this.owner.mf("son", "daughter");
        // }
        public const brother__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get brother(): String { return this.broSis; }
        public const sister__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sister(): String { return this.broSis; }
        public const brotherSister__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get brotherSister(): String { return this.broSis; }
        public const bro__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get bro(): String { return this.broSis; }
        public const sis__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get sis(): String { return this.broSis; }
        public const broSis__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get broSis(): String {
            return this.owner.mf("brother", "sister");
        }
        public const uncle__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get uncle(): String { return this.uncleAunt; }
        public const aunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get aunt(): String { return this.uncleAunt; }
        public const uncleAunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get uncleAunt(): String {
            return this.owner.mf("uncle", "aunt");
        }
        public const nephew__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nephew(): String { return this.nephewNiece; }
        public const niece__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get niece(): String { return this.nephewNiece; }
        public const nephewNiece__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get nephewNiece(): String {
            return this.owner.mf("nephew", "niece");
        }
        public const handsome__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get handsome(): String { return this.handsomeCute; }
        public const cute__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get cute(): String { return this.handsomeCute; }
        public const handsomeCute__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get handsomeCute(): String {
            return this.owner.mf("handsome", "cute");
        }
        public const cockShape__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockShape(arg1: * = 0): String { return this.cocktype(arg1); }
        public const cockshape__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockshape(arg1: * = 0): String { return this.cocktype(arg1); }
        public const cockType__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cockType(arg1: * = 0): String { return this.cocktype(arg1); }
        public const cocktype__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function cocktype(arg1: * = 0): String {
            return this.owner.cockShape(arg1);
        }
        public const accurateCockName__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneOptionalNumberArgNoResults).setToCodeFunc(oldParserToCode);
        public function accurateCockName(arg1: * = 0): String {
            return this.owner.accurateCockName(arg1);
        }
        public const tailGenital__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailGenital(): String { return this.genitail; }
        public const genitalTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get genitalTail(): String { return this.genitail; }
        public const genitail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get genitail(): String {
            return this.owner.tailGenitalDescript();
        }
        public const tailGenitals__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailGenitals(): String { return this.genitails; }
        public const genitalTails__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get genitalTails(): String { return this.genitails; }
        public const genitails__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get genitails(): String {
            return this.owner.tailGenitalsDescript();
        }
        public const oneTailGenital__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneTailGenital(): String { return this.oneGenitail; }
        public const oneGenitalTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneGenitalTail(): String { return this.oneGenitail; }
        public const oneGenitail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneGenitail(): String {
            return this.owner.oneTailGenitalDescript();
        }
        public const oneTailCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneTailCock(): String { return this.oneCockTail; }
        public const oneCockTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneCockTail(): String {
            return this.owner.oneTailGenitalDescript("cock");
        }
        //public function get oneTailVagina(): String { return this.oneTailgina(); }
        //public function get oneTailCunt(): String { return this.oneTailgina(); }
        //public function get oneCuntTail(): String { return this.oneTailgina(); }
        //public function get oneTailgina(): String {
        //    return this.owner.oneTailGenitalDescript("cunt");
        //}
        public const oneTailVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneTailVagina(): String { return this.oneCuntTail; }
        public const oneCuntTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneCuntTail(): String {
            return this.owner.oneTailGenitalDescript("cunt");
        }
        public const eachTailGenital__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachTailGenital(): String { return this.eachGenitalTail; }
        public const eachGenitalTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachGenitalTail(): String {
            return this.owner.eachTailGenitalDescript();
        }
        public const eachTailCock__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachTailCock(): String { return this.eachCockTail; }
        public const eachCockTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachCockTail(): String {
            return this.owner.eachTailGenitalDescript("cock");
        }
        public const eachTailVagina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachTailVagina(): String { return this.eachTailgina; }
        public const eachTailCunt__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachTailCunt(): String { return this.eachTailgina; }
        public const eachCuntTail__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachCuntTail(): String { return this.eachTailgina; }
        public const eachTailgina__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachTailgina(): String {
            return this.owner.eachTailGenitalDescript("cunt");
        }
        public const tailCockColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCockColor(): String { return this.tailGenitalColor; }
        public const tailCuntColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailCuntColor(): String { return this.tailGenitalColor; }
        public const tailGenitalColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get tailGenitalColor(): String {
            return this.owner.tailGenitalColorDesc();
        }
        public const horn__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get horn(): String {
            return this.owner.hornDescript();
        }
        public const eachHorn__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get eachHorn(): String {
            return this.owner.eachHorn();
        }
        public const oneHorn__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get oneHorn(): String {
            return this.owner.oneHorn();
        }
        public const horns__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get horns(): String {
            return this.owner.hornsDescript();
        }
        public const hornNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hornNoun(): String {
            return this.owner.hornNoun();
        }
        public const hornsNoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hornsNoun(): String {
            return this.owner.hornsNoun();
        }
        public const hornColor__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hornColor(): String {
            return this.owner.hornColor();
        }
        public const antenna__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get antenna(): String {
            return this.owner.antennaeDescript(false);
        }
        public const antennae__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get antennae(): String {
            return this.owner.antennaeDescript();
        }
        public const combatName__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatName(): String {
            return this.owner.getCombatName();
        }
        public const combatPronoun__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatPronoun(): String { return this.combatHimHer; }
        public const combatHimHer__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHimHer(): String {
            return this.owner.getCombatPronoun("o");
        }
        public const combatHeShe__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHeShe(): String {
            return this.owner.getCombatPronoun("s");
        }
        public const combatHisHer__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHisHer(): String {
            return this.owner.getCombatPronoun("pa");
        }
        public const combatHisHers__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHisHers(): String {
            return this.owner.getCombatPronoun("pp");
        }
        public const combatHimself__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHimself(): String { return this.combatHimselfHerself; }
        public const combatHerself__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHerself(): String { return this.combatHimselfHerself; }
        public const combatYourself__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatYourself(): String { return this.combatHimselfHerself; }
        public const combatHimselfHerself__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get combatHimselfHerself(): String {
            return this.owner.getCombatPronoun("sl");
        }
        public const has__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get has(): String { return this.hasHave; }
        public const have__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get have(): String { return this.hasHave; }
        public const hasHave__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get hasHave(): String {
            return (this.owner is PlayerCharacter || this.owner.isPlural ? "have" : "has");
        }
        public const barkMeow__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get barkMeow(): String {
            return this.owner.catDog("meow", "bark", true);
        }
        public const meowBark__info: FunctionInfo = new FunctionInfo().setToCodeFunc(oldParserToCode);
        public function get meowBark(): String {
            return this.owner.catDog("meow", "bark", false);
        }

        // New parsers
        private function hasOneArgUpToTwoResults(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length === 0) return "needs one argument";
            if (typeof args[0] !== 'string') return "needs one text argument";
            if (results.length > 2) return "has too many results";
            return null;
        }

        public const hasPerk__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneArgUpToTwoResults);
        public function hasPerk(arg: String): Object {
            return this.owner.hasPerk(arg) ? 0 : 1;
        }

        public const hasStatusEffect__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneArgUpToTwoResults);
        public function hasStatusEffect(arg: String): Object {
            return this.owner.hasStatusEffect(arg) ? 0 : 1;
        }
    }
}