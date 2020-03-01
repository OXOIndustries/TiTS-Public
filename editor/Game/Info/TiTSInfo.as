package editor.Game.Info {
    import classes.TiTS;

    /**
     * This is used to limit the interpreter's access
     * The main entry point for the interpreter
     */
    public class TiTSInfo {
        private var game: TiTS;
        private var charDesc: Object;

        private var targetDesc: CreatureInfo;
        private var attackerDesc: CreatureInfo;
        private var enemyDesc: CreatureInfo;

        public function TiTSInfo(game: TiTS) {
            this.game = game;
            this.charDesc = new Object();

            this.targetDesc = new CreatureInfo();
            this.attackerDesc = new CreatureInfo();
            this.enemyDesc = new CreatureInfo();

            var descConstructor: *;
            for (var charKey: String in this.game.chars) {
                if (this.game.chars[charKey]) {
                    this.charDesc[charKey] = new CreatureInfo();
                }
            }
        }

        public const i: Object = {
            includeResults: true,
            func: Validators.oneResult
        }
        public const b: Object = {
            includeResults: true,
            func: Validators.oneResult
        }
        public const cap: Object = {
            includeResults: true,
            func: Validators.oneResult
        }
        public const rand: Object = {
            includeResults: true,
            func: Validators.hasOneOptionalNumberArgManyResults
        }

        public function flagIs(args: Array, results: Array): String {
            if (args.length === 0) return 'needs a flag';
            return Validators.range(args.slice(1), results);
        }

        public function get target(): CreatureInfo {
            if (this.game.target == null) return null;
            return this.targetDesc;
        }
        public function get attacker(): CreatureInfo { 
            if (this.game.attacker == null) return null;
            return this.attackerDesc;
        }
        public function get enemy(): CreatureInfo { 
            if (this.game.enemy == null) return null;
            return this.enemyDesc;
        }

        public function get pc(): CreatureInfo { return this.charDesc["PC"]; }
        public function get baby(): CreatureInfo { return this.charDesc["BABY"]; }

        public function get celise(): CreatureInfo { return this.charDesc["CELISE"]; }
        public function get rival(): CreatureInfo { return this.charDesc["RIVAL"]; }
        public function get geoff(): CreatureInfo { return this.charDesc["GEOFF"]; }
        public function get flahne(): CreatureInfo { return this.charDesc["FLAHNE"]; }
        public function get zilpack(): CreatureInfo { return this.charDesc["ZILPACK"]; }
        public function get zil(): CreatureInfo { return this.charDesc["ZIL"]; }
        public function get penny(): CreatureInfo { return this.charDesc["PENNY"]; }
        public function get renvra(): CreatureInfo { return this.charDesc["RENVRA"]; }
        public function get embry(): CreatureInfo { return this.charDesc["EMBRY"]; }
        public function get shekka(): CreatureInfo { return this.charDesc["SHEKKA"]; }
        public function get burt(): CreatureInfo { return this.charDesc["BURT"]; }
        public function get zilFemale(): CreatureInfo { return this.charDesc["ZILFEMALE"]; }
        public function get cuntsnake(): CreatureInfo { return this.charDesc["CUNTSNAKE"]; }
        public function get reaha(): CreatureInfo { return this.charDesc["REAHA"]; }
        public function get dane(): CreatureInfo { return this.charDesc["DANE"]; }
        public function get mimbrane(): CreatureInfo { return this.charDesc["MIMBRANE"]; }
        public function get anno(): CreatureInfo { return this.charDesc["ANNO"]; }
        public function get kiro(): CreatureInfo { return this.charDesc["KIRO"]; }
        public function get saendra(): CreatureInfo { return this.charDesc["SAENDRA"]; }
        public function get sera(): CreatureInfo { return this.charDesc["SERA"]; }
        public function get syri(): CreatureInfo { return this.charDesc["SYRI"]; }
        public function get vanae(): CreatureInfo { return this.enemy; }
        public function get vanaeMaiden(): CreatureInfo { return this.charDesc["MAIDEN_VANAE"]; }
        public function get vanaeHuntress(): CreatureInfo { return this.charDesc["HUNTRESS_VANAE"]; }
        public function get gianna(): CreatureInfo { return this.charDesc["GIANNA"]; }
        public function get brynn(): CreatureInfo { return this.charDesc["BRYNN"]; }
        public function get lane(): CreatureInfo { return this.charDesc["LANE"]; }
        public function get anarrie(): CreatureInfo { return this.charDesc["ANARRIE"]; }
        public function get goo(): CreatureInfo { return this.charDesc["GOO"]; }
        public function get nevrie(): CreatureInfo { return this.charDesc["NEVRIE"]; }
        public function get queenOfTheDeep(): CreatureInfo { return this.charDesc["QUEENOFTHEDEEP"]; }
        public function get shade(): CreatureInfo { return this.charDesc["SHADE"]; }
        public function get bess(): CreatureInfo { return this.charDesc["BESS"]; }
        public function get ben(): CreatureInfo { return this.charDesc["BESS"]; }
        public function get taivra(): CreatureInfo { return this.charDesc["TAIVRA"]; }
        public function get gene(): CreatureInfo { return this.charDesc["GENE"]; }
        public function get petr(): CreatureInfo { return this.charDesc["PETR"]; }
        public function get docLash(): CreatureInfo { return this.charDesc["DRLASH"]; }
        public function get goocubator(): CreatureInfo { return this.charDesc["GOOCUBATOR"]; }
        public function get kara(): CreatureInfo { return this.charDesc["KARA"]; }
        public function get fyn(): CreatureInfo { return this.charDesc["FYN"]; }
        public function get semith(): CreatureInfo { return this.charDesc["SEMITH"]; }
        public function get emmy(): CreatureInfo { return this.charDesc["EMMY"]; }
        public function get liriel(): CreatureInfo { return this.charDesc["LIRIEL"]; }
        public function get lerris(): CreatureInfo { return this.charDesc["LERRIS"]; }
        public function get nerrasa(): CreatureInfo { return this.charDesc["NERRASA"]; }
        public function get jerome(): CreatureInfo { return this.charDesc["JEROME"]; }
        public function get inessa(): CreatureInfo { return this.charDesc["INESSA"]; }
        public function get edan(): CreatureInfo { return this.charDesc["EDAN"]; }
        public function get ilaria(): CreatureInfo { return this.charDesc["ILARIA"]; }
        public function get wulfe(): CreatureInfo { return this.charDesc["WULFE"]; }
        public function get busky(): CreatureInfo { return this.charDesc["BUSKY"]; }
        public function get kally(): CreatureInfo { return this.charDesc["KALLY"]; }
        public function get pexiga(): CreatureInfo { return this.charDesc["PEXIGA"]; }
        public function get ara(): CreatureInfo { return this.charDesc["ARAKEI"]; }
        public function get gwen(): CreatureInfo { return this.charDesc["GWEN"]; }
        public function get bea(): CreatureInfo { return this.charDesc["BEA"]; }
        public function get kazra(): CreatureInfo { return this.charDesc["KAZRA"]; }
        public function get pippa(): CreatureInfo { return this.charDesc["PIPPA"]; }
        public function get jerynn(): CreatureInfo { return this.charDesc["JERYNN"]; }
        public function get del(): CreatureInfo { return this.charDesc["DELILAH"]; }
        public function get yammi(): CreatureInfo { return this.charDesc["YAMMI"]; }
        public function get mirrin(): CreatureInfo { return this.charDesc["MIRRIN"]; }
        public function get fisianna(): CreatureInfo { return this.charDesc["FISIANNA"]; }
        public function get azra(): CreatureInfo { return this.charDesc["AZRA"]; }
        public function get zil9tails(): CreatureInfo { return this.charDesc["ZIL9TAILS"]; }
        public function get krymhilde(): CreatureInfo { return this.charDesc["KRYM"]; }
        public function get paige(): CreatureInfo { return this.charDesc["PAIGE"]; }
        public function get ciaran(): CreatureInfo { return this.charDesc["CIARAN"]; }
        public function get ellie(): CreatureInfo { return this.charDesc["ELLIE"]; }
        public function get sam(): CreatureInfo { return this.charDesc["SX1TECHGUARD"]; }
        public function get khorgan(): CreatureInfo { return this.charDesc["CAPTAINKHORGAN"]; }
        public function get tamtam(): CreatureInfo { return this.charDesc["TAMTAM"]; }
        public function get erika(): CreatureInfo { return this.charDesc["ERIKA"]; }
        public function get lieve(): CreatureInfo { return this.charDesc["LIEVE"]; }
        public function get tuuva(): CreatureInfo { return this.charDesc["TUUVA"]; }
        public function get mitzi(): CreatureInfo { return this.charDesc["MITZI"]; }
        public function get frostwyrm(): CreatureInfo { return this.charDesc["FROSTWYRM"]; }
        public function get lah(): CreatureInfo { return this.charDesc["LAH"]; }
        public function get ardia(): CreatureInfo { return this.charDesc["ARDIA"]; }
        public function get emmrfox(): CreatureInfo { return this.charDesc["MRFOX"]; }
        public function get emredd(): CreatureInfo { return this.charDesc["REDD"]; }
        public function get emponyluver(): CreatureInfo { return this.charDesc["PONYLUVER"]; }
        public function get emsexyydaddyy(): CreatureInfo { return this.charDesc["SEXYYDADDYY"]; }
        public function get embountifulbotany(): CreatureInfo { return this.charDesc["BOUNTIFULBOTANY"]; }
        public function get emsneakysnek(): CreatureInfo { return this.charDesc["SNEAKYSNEK"]; }
        public function get emripped4yourpleasure(): CreatureInfo { return this.charDesc["RIPPED4YOURPLEASURE"]; }
        public function get emstormdragon(): CreatureInfo { return this.charDesc["STORMDRAGON"]; }
        public function get aina(): CreatureInfo { return this.charDesc["AINA"]; }
        public function get amber(): CreatureInfo { return this.charDesc["DRYAD"]; }
        public function get zea(): CreatureInfo { return this.charDesc["ZEA"]; }
        public function get luca(): CreatureInfo { return this.charDesc["LUCA"]; }
        public function get marion(): CreatureInfo { return this.charDesc["MARION"]; }
        public function get olympia(): CreatureInfo { return this.charDesc["OLYMPIA"]; }
        public function get lureling(): CreatureInfo { return this.charDesc["LURELING"]; }
        public function get roxy(): CreatureInfo { return this.charDesc["ROXY"]; }
        public function get lorelei(): CreatureInfo { return this.charDesc["LORELEI"]; }
        public function get varmint(): CreatureInfo { return this.charDesc["VARMINTPET"]; }
        public function get vahn(): CreatureInfo { return this.charDesc["VAHN"]; }
        public function get bianca(): CreatureInfo { return this.charDesc["BIANCA"]; }
        public function get synphia(): CreatureInfo { return this.charDesc["SYNPHIA"]; }

        public const hourIs: Function = Validators.range;
        public const hourRange: Function = Validators.range;
        public const dayIs: Function = Validators.range;
        public const dayRange: Function = Validators.range;
        public const minuteIs: Function = Validators.range;
        public const minuteRange: Function = Validators.range;
    }
}