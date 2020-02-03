package editor.Descriptors {
    import editor.Lang.FunctionInfo;
    import flash.utils.Dictionary;
    import classes.Creature;
    import classes.TiTS;

    /**
     * This is used to limit the interpreter's access
     * The main entry point for the interpreter
     */
    public class TiTSDescriptor {
        private var game: TiTS;
        private var charDesc: Object;

        private var targetDesc: CreatureDescriptor;
        private var attackerDesc: CreatureDescriptor;
        private var enemyDesc: CreatureDescriptor;

        public function TiTSDescriptor(game: TiTS) {
            this.game = game;
            this.charDesc = new Object();

            this.targetDesc = new CreatureDescriptor(new ObjectAccessor("target", this.game));
            this.attackerDesc = new CreatureDescriptor(new ObjectAccessor("attacker", this.game));
            this.enemyDesc = new CreatureDescriptor(new ObjectAccessor("enemy", this.game));

            var descConstructor: *;
            for (var charKey: String in this.game.chars) {
                if (this.game.chars[charKey]) {
                    switch (charKey) {
                        case "ARAKEI":
                            descConstructor = AraKeiDescriptor;
                            break;

                        default:
                            descConstructor = CreatureDescriptor;
                    }
                    this.charDesc[charKey] = new descConstructor(new ObjectAccessor(charKey, this.game.chars));
                }
            }
        }

        /**
         * Checks for exactly one argument
         */
        private function oneArg(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length === 0) return "needs one argument";
            if (results.length > 0) return "has too many results";
            return null;
        }

        /**
         * Wraps a HTML tag around text
         * @param tag
         * @param text
         * @return
         */
        private function htmlTagText(tag: String, text: String): String {
            return "<" + tag + ">" + text + "</" + tag + ">";
        }

        // Test things
        private function iToCode(identifier: String, args: Array, results: Array): String {
            if (args.length > 0)
                return '"' + htmlTagText('i', args[0].substring(1, args[0].length - 1)) + '"';
            else
                return '"' + htmlTagText('i', "") + '"';
        }
        public const i__info: FunctionInfo = new FunctionInfo()
            .setArgResultValidatorFunc(oneArg)
            .setToCodeFunc(iToCode);
        public function i(text: String): String {
            return htmlTagText('i', text);
        }

        private function bToCode(identifier: String, args: Array, results: Array): String {
            if (args.length > 0)
                return '"' + htmlTagText('b', args[0].substring(1, args[0].length - 1)) + '"';
            else
                return '"' + htmlTagText('b', "") + '"';
        }
        public const b__info: FunctionInfo = new FunctionInfo()
            .setArgResultValidatorFunc(oneArg)
            .setToCodeFunc(bToCode);
        public function b(text: String): String {
            return htmlTagText('b', text);
        }

        public const cap__info: FunctionInfo = new FunctionInfo()
            .setArgResultValidatorFunc(oneArg);
        public function cap(text: String): String {
            return text.charAt(0).toLocaleUpperCase() + text.slice(1);
        }

        // From TiTS
        public const silly__info: FunctionInfo = new FunctionInfo().setDesc('Is Silly Mode engaged');
        public function get silly(): Boolean {
            if (this.game.gameOptions)
                return !!this.game.gameOptions.sillyMode;
            return false;
        }
        public function get easy(): Boolean {
            if (this.game.gameOptions)
                return !!this.game.gameOptions.easyMode;
            return false;
        }

        public function get flags(): Dictionary { return this.game.flags; }

        public function get target(): CreatureDescriptor {
            if (this.game.target == null) return null;
            return this.targetDesc;
        }
        public function get attacker(): CreatureDescriptor { 
            if (this.game.attacker == null) return null;
            return this.attackerDesc;
        }
        public function get enemy(): CreatureDescriptor { 
            if (this.game.enemy == null) return null;
            return this.enemyDesc;
        }

        public function get pc(): CreatureDescriptor { return this.charDesc["PC"]; }
        public function get baby(): CreatureDescriptor { return this.charDesc["BABY"]; }

        public function get celise(): CreatureDescriptor { return this.charDesc["CELISE"]; }
        public function get rival(): CreatureDescriptor { return this.charDesc["RIVAL"]; }
        public function get geoff(): CreatureDescriptor { return this.charDesc["GEOFF"]; }
        public function get flahne(): CreatureDescriptor { return this.charDesc["FLAHNE"]; }
        public function get zilpack(): CreatureDescriptor { return this.charDesc["ZILPACK"]; }
        public function get zil(): CreatureDescriptor { return this.charDesc["ZIL"]; }
        public function get penny(): CreatureDescriptor { return this.charDesc["PENNY"]; }
        public function get renvra(): CreatureDescriptor { return this.charDesc["RENVRA"]; }
        public function get embry(): CreatureDescriptor { return this.charDesc["EMBRY"]; }
        public function get shekka(): CreatureDescriptor { return this.charDesc["SHEKKA"]; }
        public function get burt(): CreatureDescriptor { return this.charDesc["BURT"]; }
        public function get zilFemale(): CreatureDescriptor { return this.charDesc["ZILFEMALE"]; }
        public function get cuntsnake(): CreatureDescriptor { return this.charDesc["CUNTSNAKE"]; }
        public function get reaha(): CreatureDescriptor { return this.charDesc["REAHA"]; }
        public function get dane(): CreatureDescriptor { return this.charDesc["DANE"]; }
        public function get mimbrane(): CreatureDescriptor { return this.charDesc["MIMBRANE"]; }
        public function get anno(): CreatureDescriptor { return this.charDesc["ANNO"]; }
        public function get kiro(): CreatureDescriptor { return this.charDesc["KIRO"]; }
        public function get saendra(): CreatureDescriptor { return this.charDesc["SAENDRA"]; }
        public function get sera(): CreatureDescriptor { return this.charDesc["SERA"]; }
        public function get syri(): CreatureDescriptor { return this.charDesc["SYRI"]; }
        public function get vanae(): CreatureDescriptor { return this.enemy; }
        public function get vanaeMaiden(): CreatureDescriptor { return this.charDesc["MAIDEN_VANAE"]; }
        public function get vanaeHuntress(): CreatureDescriptor { return this.charDesc["HUNTRESS_VANAE"]; }
        public function get gianna(): CreatureDescriptor { return this.charDesc["GIANNA"]; }
        public function get brynn(): CreatureDescriptor { return this.charDesc["BRYNN"]; }
        public function get lane(): CreatureDescriptor { return this.charDesc["LANE"]; }
        public function get anarrie(): CreatureDescriptor { return this.charDesc["ANARRIE"]; }
        public function get goo(): CreatureDescriptor { return this.charDesc["GOO"]; }
        public function get nevrie(): CreatureDescriptor { return this.charDesc["NEVRIE"]; }
        public function get queenOfTheDeep(): CreatureDescriptor { return this.charDesc["QUEENOFTHEDEEP"]; }
        public function get shade(): CreatureDescriptor { return this.charDesc["SHADE"]; }
        public function get bess(): CreatureDescriptor { return this.charDesc["BESS"]; }
        public function get ben(): CreatureDescriptor { return this.charDesc["BESS"]; }
        public function get taivra(): CreatureDescriptor { return this.charDesc["TAIVRA"]; }
        public function get gene(): CreatureDescriptor { return this.charDesc["GENE"]; }
        public function get petr(): CreatureDescriptor { return this.charDesc["PETR"]; }
        public function get docLash(): CreatureDescriptor { return this.charDesc["DRLASH"]; }
        public function get goocubator(): CreatureDescriptor { return this.charDesc["GOOCUBATOR"]; }
        public function get kara(): CreatureDescriptor { return this.charDesc["KARA"]; }
        public function get fyn(): CreatureDescriptor { return this.charDesc["FYN"]; }
        public function get semith(): CreatureDescriptor { return this.charDesc["SEMITH"]; }
        public function get emmy(): CreatureDescriptor { return this.charDesc["EMMY"]; }
        public function get liriel(): CreatureDescriptor { return this.charDesc["LIRIEL"]; }
        public function get lerris(): CreatureDescriptor { return this.charDesc["LERRIS"]; }
        public function get nerrasa(): CreatureDescriptor { return this.charDesc["NERRASA"]; }
        public function get jerome(): CreatureDescriptor { return this.charDesc["JEROME"]; }
        public function get inessa(): CreatureDescriptor { return this.charDesc["INESSA"]; }
        public function get edan(): CreatureDescriptor { return this.charDesc["EDAN"]; }
        public function get ilaria(): CreatureDescriptor { return this.charDesc["ILARIA"]; }
        public function get wulfe(): CreatureDescriptor { return this.charDesc["WULFE"]; }
        public function get busky(): CreatureDescriptor { return this.charDesc["BUSKY"]; }
        public function get kally(): CreatureDescriptor { return this.charDesc["KALLY"]; }
        public function get pexiga(): CreatureDescriptor { return this.charDesc["PEXIGA"]; }
        public function get ara(): AraKeiDescriptor { return this.charDesc["ARAKEI"]; }
        public function get gwen(): CreatureDescriptor { return this.charDesc["GWEN"]; }
        public function get bea(): CreatureDescriptor { return this.charDesc["BEA"]; }
        public function get kazra(): CreatureDescriptor { return this.charDesc["KAZRA"]; }
        public function get pippa(): CreatureDescriptor { return this.charDesc["PIPPA"]; }
        public function get jerynn(): CreatureDescriptor { return this.charDesc["JERYNN"]; }
        public function get del(): CreatureDescriptor { return this.charDesc["DELILAH"]; }
        public function get yammi(): CreatureDescriptor { return this.charDesc["YAMMI"]; }
        public function get mirrin(): CreatureDescriptor { return this.charDesc["MIRRIN"]; }
        public function get fisianna(): CreatureDescriptor { return this.charDesc["FISIANNA"]; }
        public function get azra(): CreatureDescriptor { return this.charDesc["AZRA"]; }
        public function get zil9tails(): CreatureDescriptor { return this.charDesc["ZIL9TAILS"]; }
        public function get krymhilde(): CreatureDescriptor { return this.charDesc["KRYM"]; }
        public function get paige(): CreatureDescriptor { return this.charDesc["PAIGE"]; }
        public function get ciaran(): CreatureDescriptor { return this.charDesc["CIARAN"]; }
        public function get ellie(): CreatureDescriptor { return this.charDesc["ELLIE"]; }
        public function get sam(): CreatureDescriptor { return this.charDesc["SX1TECHGUARD"]; }
        public function get khorgan(): CreatureDescriptor { return this.charDesc["CAPTAINKHORGAN"]; }
        public function get tamtam(): CreatureDescriptor { return this.charDesc["TAMTAM"]; }
        public function get erika(): CreatureDescriptor { return this.charDesc["ERIKA"]; }
        public function get lieve(): CreatureDescriptor { return this.charDesc["LIEVE"]; }
        public function get tuuva(): CreatureDescriptor { return this.charDesc["TUUVA"]; }
        public function get mitzi(): CreatureDescriptor { return this.charDesc["MITZI"]; }
        public function get frostwyrm(): CreatureDescriptor { return this.charDesc["FROSTWYRM"]; }
        public function get lah(): CreatureDescriptor { return this.charDesc["LAH"]; }
        public function get ardia(): CreatureDescriptor { return this.charDesc["ARDIA"]; }
        public function get emmrfox(): CreatureDescriptor { return this.charDesc["MRFOX"]; }
        public function get emredd(): CreatureDescriptor { return this.charDesc["REDD"]; }
        public function get emponyluver(): CreatureDescriptor { return this.charDesc["PONYLUVER"]; }
        public function get emsexyydaddyy(): CreatureDescriptor { return this.charDesc["SEXYYDADDYY"]; }
        public function get embountifulbotany(): CreatureDescriptor { return this.charDesc["BOUNTIFULBOTANY"]; }
        public function get emsneakysnek(): CreatureDescriptor { return this.charDesc["SNEAKYSNEK"]; }
        public function get emripped4yourpleasure(): CreatureDescriptor { return this.charDesc["RIPPED4YOURPLEASURE"]; }
        public function get emstormdragon(): CreatureDescriptor { return this.charDesc["STORMDRAGON"]; }
        public function get aina(): CreatureDescriptor { return this.charDesc["AINA"]; }
        public function get amber(): CreatureDescriptor { return this.charDesc["DRYAD"]; }
        public function get zea(): CreatureDescriptor { return this.charDesc["ZEA"]; }
        public function get luca(): CreatureDescriptor { return this.charDesc["LUCA"]; }
        public function get marion(): CreatureDescriptor { return this.charDesc["MARION"]; }
        public function get olympia(): CreatureDescriptor { return this.charDesc["OLYMPIA"]; }
        public function get lureling(): CreatureDescriptor { return this.charDesc["LURELING"]; }
        public function get roxy(): CreatureDescriptor { return this.charDesc["ROXY"]; }
        public function get lorelei(): CreatureDescriptor { return this.charDesc["LORELEI"]; }
        public function get varmint(): CreatureDescriptor { return this.charDesc["VARMINTPET"]; }
        public function get vahn(): CreatureDescriptor { return this.charDesc["VAHN"]; }
        public function get bianca(): CreatureDescriptor { return this.charDesc["BIANCA"]; }
        public function get synphia(): CreatureDescriptor { return this.charDesc["SYNPHIA"]; }

        // New parsers
        // Validators
        private function hasOneArgUpToTwoResults(args: Array, results: Array): String {
            if (args.length > 1) return "has too many arguments";
            if (args.length === 0) return "needs one argument";
            if (typeof args[0] !== 'number') return "needs one number argument";
            if (results.length > 2) return "has too many results";
            return null;
        }

        private function rangeValidator(args: Array, results: Array): String {
            if (args.length === 0) return 'needs at least one argument';
            if (results.length === 0) return 'needs at least one result';
            if (results.length > args.length + 1) return 'has ' + (results.length - args.length + 1) + ' extraneous results';
            return null;
        }

        // Functionality
        private function rangeEval(value: Number, args: Array): Number {
            for (var idx: int = 0; idx < args.length; idx++) {
                if (args[idx] <= value && (
                    idx === args.length - 1 ||
                    value < args[idx + 1]
                )) {
                    return idx;
                }
            }
            return idx;
        }

        // New Parsers
        public const isHour__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneArgUpToTwoResults);
        public function isHour(arg: Number): Number {
            return this.game.hours == arg ? 0 : 1;
        }
        public const hourRange__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(rangeValidator);
        public function hourRange(... args): Number {
            return rangeEval(this.game.hours, args);
        }
        public const isDay__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneArgUpToTwoResults);
        public function isDay(arg: Number): Number {
            return this.game.days == arg ? 0 : 1;
        }
        public const dayRange__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(rangeValidator);
        public function dayRange(... args): Number {
            return rangeEval(this.game.days, args);
        }
        public const isMinute__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(hasOneArgUpToTwoResults);
        public function isMinute(arg: Number): Number {
            return this.game.minutes == arg ? 0 : 1;
        }
        public const minuteRange__info: FunctionInfo = new FunctionInfo().setArgResultValidatorFunc(rangeValidator);
        public function minuteRange(... args): Number {
            return rangeEval(this.game.minutes, args);
        }
    }
}