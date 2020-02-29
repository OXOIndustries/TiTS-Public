package editor.Game.Wrapper {
    import editor.Lang.FunctionInfo;
    import classes.TiTS;

    /**
     * This is used to limit the interpreter's access
     * The main entry point for the interpreter
     */
    public class TiTSWrapper {
        private var game: TiTS;
        private var charDesc: Object;

        private var targetDesc: CreatureWrapper;
        private var attackerDesc: CreatureWrapper;
        private var enemyDesc: CreatureWrapper;

        public function TiTSWrapper(game: TiTS) {
            this.game = game;
            this.charDesc = new Object();

            this.targetDesc = new CreatureWrapper(new ObjectAccessor("target", this.game));
            this.attackerDesc = new CreatureWrapper(new ObjectAccessor("attacker", this.game));
            this.enemyDesc = new CreatureWrapper(new ObjectAccessor("enemy", this.game));

            var descConstructor: *;
            for (var charKey: String in this.game.chars) {
                if (this.game.chars[charKey]) {
                    switch (charKey) {
                        case "ARAKEI":
                            descConstructor = AraKeiWrapper;
                            break;

                        default:
                            descConstructor = CreatureWrapper;
                    }
                    this.charDesc[charKey] = new descConstructor(new ObjectAccessor(charKey, this.game.chars));
                }
            }
        }

        // New Parsers
        /**
         * Wraps a HTML tag around text
         * @param tag
         * @param text
         * @return
         */
        private function htmlTagText(tag: String, text: String): String {
            return "<" + tag + ">" + text + "</" + tag + ">";
        }

        private function iToCode(identifier: String, args: Array, results: Array): String {
            if (results.length > 0)
                return '"' + htmlTagText('i', results[0].substring(1, results[0].length - 1)) + '"';
            else
                return '"' + htmlTagText('i', "") + '"';
        }
        public const i__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.oneResult)
            .setIncludeResults();
        public function i(args: Array, results: Array): String {
            return htmlTagText('i', results[0]);
        }

        private function bToCode(identifier: String, args: Array, results: Array): String {
            if (results.length > 0)
                return '"' + htmlTagText('b', results[0].substring(1, results[0].length - 1)) + '"';
            else
                return '"' + htmlTagText('b', "") + '"';
        }
        public const b__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.oneResult)
            .setIncludeResults();
        public function b(args: Array, results: Array): String {
            return htmlTagText('b', results[0]);
        }

        public const cap__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.oneResult)
            .setIncludeResults();
        public function cap(args: Array, results: Array): String {
            return results[0].charAt(0).toLocaleUpperCase() + results[0].slice(1);
        }

        private function randToCode(identifier: String, args: Array, results: Array): String {
            return identifier + '(' + results.join(', ') + ')';
        }
        public const rand__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.hasOneOptionalNumberArgManyResults)
            .setIncludeResults();
        public function rand(args: Array, results: Array): int {
            if (args.length === 1 && 0 < args[0] && args[0] <= results.length)
                return args[0] - 1;
            else
                return Math.floor(Math.random() * results.length);
        }

        // From TiTS / Old Parsers
        public const silly__info: FunctionInfo = new FunctionInfo()
            .setDesc('Is Silly Mode engaged');
        public function get silly(): Boolean {
            if (this.game.gameOptions)
                return !!this.game.gameOptions.sillyMode;
            return false;
        }
        public const easy__info: FunctionInfo = new FunctionInfo()
            .setDesc('Is Easy Mode engaged');
        public function get easy(): Boolean {
            if (this.game.gameOptions)
                return !!this.game.gameOptions.easyMode;
            return false;
        }

        public function flagIsArgResultValidator(args: Array, results: Array): String {
            if (args.length === 0) return 'needs a flag';
            return Validators.range(args.slice(1), results);
        }
        public const flagIs__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(flagIsArgResultValidator)
            .setDesc('Flag is equal to 1 or 2 or 3...');
        public function flagIs(name: String, ... args): Number {
            return Eval.equals(this.game.flags[name], args);
        }

        public function get target(): CreatureWrapper {
            if (this.game.target == null) return null;
            return this.targetDesc;
        }
        public function get attacker(): CreatureWrapper { 
            if (this.game.attacker == null) return null;
            return this.attackerDesc;
        }
        public function get enemy(): CreatureWrapper { 
            if (this.game.enemy == null) return null;
            return this.enemyDesc;
        }

        public function get pc(): CreatureWrapper { return this.charDesc["PC"]; }
        public function get baby(): CreatureWrapper { return this.charDesc["BABY"]; }

        public function get celise(): CreatureWrapper { return this.charDesc["CELISE"]; }
        public function get rival(): CreatureWrapper { return this.charDesc["RIVAL"]; }
        public function get geoff(): CreatureWrapper { return this.charDesc["GEOFF"]; }
        public function get flahne(): CreatureWrapper { return this.charDesc["FLAHNE"]; }
        public function get zilpack(): CreatureWrapper { return this.charDesc["ZILPACK"]; }
        public function get zil(): CreatureWrapper { return this.charDesc["ZIL"]; }
        public function get penny(): CreatureWrapper { return this.charDesc["PENNY"]; }
        public function get renvra(): CreatureWrapper { return this.charDesc["RENVRA"]; }
        public function get embry(): CreatureWrapper { return this.charDesc["EMBRY"]; }
        public function get shekka(): CreatureWrapper { return this.charDesc["SHEKKA"]; }
        public function get burt(): CreatureWrapper { return this.charDesc["BURT"]; }
        public function get zilFemale(): CreatureWrapper { return this.charDesc["ZILFEMALE"]; }
        public function get cuntsnake(): CreatureWrapper { return this.charDesc["CUNTSNAKE"]; }
        public function get reaha(): CreatureWrapper { return this.charDesc["REAHA"]; }
        public function get dane(): CreatureWrapper { return this.charDesc["DANE"]; }
        public function get mimbrane(): CreatureWrapper { return this.charDesc["MIMBRANE"]; }
        public function get anno(): CreatureWrapper { return this.charDesc["ANNO"]; }
        public function get kiro(): CreatureWrapper { return this.charDesc["KIRO"]; }
        public function get saendra(): CreatureWrapper { return this.charDesc["SAENDRA"]; }
        public function get sera(): CreatureWrapper { return this.charDesc["SERA"]; }
        public function get syri(): CreatureWrapper { return this.charDesc["SYRI"]; }
        public function get vanae(): CreatureWrapper { return this.enemy; }
        public function get vanaeMaiden(): CreatureWrapper { return this.charDesc["MAIDEN_VANAE"]; }
        public function get vanaeHuntress(): CreatureWrapper { return this.charDesc["HUNTRESS_VANAE"]; }
        public function get gianna(): CreatureWrapper { return this.charDesc["GIANNA"]; }
        public function get brynn(): CreatureWrapper { return this.charDesc["BRYNN"]; }
        public function get lane(): CreatureWrapper { return this.charDesc["LANE"]; }
        public function get anarrie(): CreatureWrapper { return this.charDesc["ANARRIE"]; }
        public function get goo(): CreatureWrapper { return this.charDesc["GOO"]; }
        public function get nevrie(): CreatureWrapper { return this.charDesc["NEVRIE"]; }
        public function get queenOfTheDeep(): CreatureWrapper { return this.charDesc["QUEENOFTHEDEEP"]; }
        public function get shade(): CreatureWrapper { return this.charDesc["SHADE"]; }
        public function get bess(): CreatureWrapper { return this.charDesc["BESS"]; }
        public function get ben(): CreatureWrapper { return this.charDesc["BESS"]; }
        public function get taivra(): CreatureWrapper { return this.charDesc["TAIVRA"]; }
        public function get gene(): CreatureWrapper { return this.charDesc["GENE"]; }
        public function get petr(): CreatureWrapper { return this.charDesc["PETR"]; }
        public function get docLash(): CreatureWrapper { return this.charDesc["DRLASH"]; }
        public function get goocubator(): CreatureWrapper { return this.charDesc["GOOCUBATOR"]; }
        public function get kara(): CreatureWrapper { return this.charDesc["KARA"]; }
        public function get fyn(): CreatureWrapper { return this.charDesc["FYN"]; }
        public function get semith(): CreatureWrapper { return this.charDesc["SEMITH"]; }
        public function get emmy(): CreatureWrapper { return this.charDesc["EMMY"]; }
        public function get liriel(): CreatureWrapper { return this.charDesc["LIRIEL"]; }
        public function get lerris(): CreatureWrapper { return this.charDesc["LERRIS"]; }
        public function get nerrasa(): CreatureWrapper { return this.charDesc["NERRASA"]; }
        public function get jerome(): CreatureWrapper { return this.charDesc["JEROME"]; }
        public function get inessa(): CreatureWrapper { return this.charDesc["INESSA"]; }
        public function get edan(): CreatureWrapper { return this.charDesc["EDAN"]; }
        public function get ilaria(): CreatureWrapper { return this.charDesc["ILARIA"]; }
        public function get wulfe(): CreatureWrapper { return this.charDesc["WULFE"]; }
        public function get busky(): CreatureWrapper { return this.charDesc["BUSKY"]; }
        public function get kally(): CreatureWrapper { return this.charDesc["KALLY"]; }
        public function get pexiga(): CreatureWrapper { return this.charDesc["PEXIGA"]; }
        public function get ara(): AraKeiWrapper { return this.charDesc["ARAKEI"]; }
        public function get gwen(): CreatureWrapper { return this.charDesc["GWEN"]; }
        public function get bea(): CreatureWrapper { return this.charDesc["BEA"]; }
        public function get kazra(): CreatureWrapper { return this.charDesc["KAZRA"]; }
        public function get pippa(): CreatureWrapper { return this.charDesc["PIPPA"]; }
        public function get jerynn(): CreatureWrapper { return this.charDesc["JERYNN"]; }
        public function get del(): CreatureWrapper { return this.charDesc["DELILAH"]; }
        public function get yammi(): CreatureWrapper { return this.charDesc["YAMMI"]; }
        public function get mirrin(): CreatureWrapper { return this.charDesc["MIRRIN"]; }
        public function get fisianna(): CreatureWrapper { return this.charDesc["FISIANNA"]; }
        public function get azra(): CreatureWrapper { return this.charDesc["AZRA"]; }
        public function get zil9tails(): CreatureWrapper { return this.charDesc["ZIL9TAILS"]; }
        public function get krymhilde(): CreatureWrapper { return this.charDesc["KRYM"]; }
        public function get paige(): CreatureWrapper { return this.charDesc["PAIGE"]; }
        public function get ciaran(): CreatureWrapper { return this.charDesc["CIARAN"]; }
        public function get ellie(): CreatureWrapper { return this.charDesc["ELLIE"]; }
        public function get sam(): CreatureWrapper { return this.charDesc["SX1TECHGUARD"]; }
        public function get khorgan(): CreatureWrapper { return this.charDesc["CAPTAINKHORGAN"]; }
        public function get tamtam(): CreatureWrapper { return this.charDesc["TAMTAM"]; }
        public function get erika(): CreatureWrapper { return this.charDesc["ERIKA"]; }
        public function get lieve(): CreatureWrapper { return this.charDesc["LIEVE"]; }
        public function get tuuva(): CreatureWrapper { return this.charDesc["TUUVA"]; }
        public function get mitzi(): CreatureWrapper { return this.charDesc["MITZI"]; }
        public function get frostwyrm(): CreatureWrapper { return this.charDesc["FROSTWYRM"]; }
        public function get lah(): CreatureWrapper { return this.charDesc["LAH"]; }
        public function get ardia(): CreatureWrapper { return this.charDesc["ARDIA"]; }
        public function get emmrfox(): CreatureWrapper { return this.charDesc["MRFOX"]; }
        public function get emredd(): CreatureWrapper { return this.charDesc["REDD"]; }
        public function get emponyluver(): CreatureWrapper { return this.charDesc["PONYLUVER"]; }
        public function get emsexyydaddyy(): CreatureWrapper { return this.charDesc["SEXYYDADDYY"]; }
        public function get embountifulbotany(): CreatureWrapper { return this.charDesc["BOUNTIFULBOTANY"]; }
        public function get emsneakysnek(): CreatureWrapper { return this.charDesc["SNEAKYSNEK"]; }
        public function get emripped4yourpleasure(): CreatureWrapper { return this.charDesc["RIPPED4YOURPLEASURE"]; }
        public function get emstormdragon(): CreatureWrapper { return this.charDesc["STORMDRAGON"]; }
        public function get aina(): CreatureWrapper { return this.charDesc["AINA"]; }
        public function get amber(): CreatureWrapper { return this.charDesc["DRYAD"]; }
        public function get zea(): CreatureWrapper { return this.charDesc["ZEA"]; }
        public function get luca(): CreatureWrapper { return this.charDesc["LUCA"]; }
        public function get marion(): CreatureWrapper { return this.charDesc["MARION"]; }
        public function get olympia(): CreatureWrapper { return this.charDesc["OLYMPIA"]; }
        public function get lureling(): CreatureWrapper { return this.charDesc["LURELING"]; }
        public function get roxy(): CreatureWrapper { return this.charDesc["ROXY"]; }
        public function get lorelei(): CreatureWrapper { return this.charDesc["LORELEI"]; }
        public function get varmint(): CreatureWrapper { return this.charDesc["VARMINTPET"]; }
        public function get vahn(): CreatureWrapper { return this.charDesc["VAHN"]; }
        public function get bianca(): CreatureWrapper { return this.charDesc["BIANCA"]; }
        public function get synphia(): CreatureWrapper { return this.charDesc["SYNPHIA"]; }

        // New Parsers
        public const hourIs__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.range)
            .setDesc('Hour is equal to 1 or 2 or 3...');
        public function hourIs(... args): Number {
            return Eval.equals(this.game.hours, args);
        }
        public const hourRange__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.range)
            .setDesc('Hour range');
        public function hourRange(... args): Number {
            return Eval.range(this.game.hours, args);
        }
        public const dayIs__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.range)
            .setDesc('Day is equal to 1 or 2 or 3...');
        public function dayIs(... args): Number {
            return Eval.equals(this.game.days, args);
        }
        public const dayRange__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.range)
            .setDesc('Day range');
        public function dayRange(... args): Number {
            return Eval.range(this.game.days, args);
        }
        public const minuteIs__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.range)
            .setDesc('Minute is equal to 1 or 2 or 3...');
        public function minuteIs(... args): Number {
            return Eval.equals(this.game.minutes, args);
        }
        public const minuteRange__info: FunctionInfo = new FunctionInfo()
            .addArgResultValidator(Validators.range)
            .setDesc('Minute range');
        public function minuteRange(... args): Number {
            return Eval.range(this.game.minutes, args);
        }
    }
}