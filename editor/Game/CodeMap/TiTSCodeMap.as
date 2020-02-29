package editor.Game.CodeMap {
    import classes.TiTS;

    /**
     * This is used to limit the interpreter's access
     * The main entry point for the interpreter
     */
    public class TiTSCodeMap {
        private var game: TiTS;
        private var charDesc: Object;

        private var targetDesc: CreatureCodeMap;
        private var attackerDesc: CreatureCodeMap;
        private var enemyDesc: CreatureCodeMap;

        public function TiTSCodeMap(game: TiTS) {
            this.game = game;
            this.charDesc = new Object();

            this.targetDesc = new CreatureCodeMap();
            this.attackerDesc = new CreatureCodeMap();
            this.enemyDesc = new CreatureCodeMap();

            var descConstructor: *;
            for (var charKey: String in this.game.chars)
                if (this.game.chars[charKey])
                    this.charDesc[charKey] = new CreatureCodeMap();
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

        public function i(identifier: String, args: Array, results: Array): String {
            if (results.length > 0)
                return '"' + htmlTagText('i', results[0].substring(1, results[0].length - 1)) + '"';
            else
                return '"' + htmlTagText('i', "") + '"';
        }

        public function b(identifier: String, args: Array, results: Array): String {
            if (results.length > 0)
                return '"' + htmlTagText('b', results[0].substring(1, results[0].length - 1)) + '"';
            else
                return '"' + htmlTagText('b', "") + '"';
        }

        public function cap(identifier: String, args: Array, results: Array): String {
            return results[0].charAt(0).toLocaleUpperCase() + results[0].slice(1);
        }

        public function rand(identifier: String, args: Array, results: Array): String {
            return 'RandomInCollection(' + results.join(', ') + ')';
        }

        // From TiTS / Old Parsers
        public function silly(identifier: String, args: Array, results: Array): String {
            return ToCode.boolean('silly()', results);
        }

        public function easy(identifier: String, args: Array, results: Array): String {
            return ToCode.boolean('easy()', results);
        }

        public function flagIs(identifier: String, args: Array, results: Array): String {
            return ToCode.equals('flags["' + args[0] + '"]', args.slice(1), results);
        }

        public function get target(): CreatureCodeMap {
            if (this.game.target == null) return null;
            return this.targetDesc;
        }
        public function get attacker(): CreatureCodeMap { 
            if (this.game.attacker == null) return null;
            return this.attackerDesc;
        }
        public function get enemy(): CreatureCodeMap { 
            if (this.game.enemy == null) return null;
            return this.enemyDesc;
        }

        public function get pc(): CreatureCodeMap { return this.charDesc["PC"]; }
        public function get baby(): CreatureCodeMap { return this.charDesc["BABY"]; }

        public function get celise(): CreatureCodeMap { return this.charDesc["CELISE"]; }
        public function get rival(): CreatureCodeMap { return this.charDesc["RIVAL"]; }
        public function get geoff(): CreatureCodeMap { return this.charDesc["GEOFF"]; }
        public function get flahne(): CreatureCodeMap { return this.charDesc["FLAHNE"]; }
        public function get zilpack(): CreatureCodeMap { return this.charDesc["ZILPACK"]; }
        public function get zil(): CreatureCodeMap { return this.charDesc["ZIL"]; }
        public function get penny(): CreatureCodeMap { return this.charDesc["PENNY"]; }
        public function get renvra(): CreatureCodeMap { return this.charDesc["RENVRA"]; }
        public function get embry(): CreatureCodeMap { return this.charDesc["EMBRY"]; }
        public function get shekka(): CreatureCodeMap { return this.charDesc["SHEKKA"]; }
        public function get burt(): CreatureCodeMap { return this.charDesc["BURT"]; }
        public function get zilFemale(): CreatureCodeMap { return this.charDesc["ZILFEMALE"]; }
        public function get cuntsnake(): CreatureCodeMap { return this.charDesc["CUNTSNAKE"]; }
        public function get reaha(): CreatureCodeMap { return this.charDesc["REAHA"]; }
        public function get dane(): CreatureCodeMap { return this.charDesc["DANE"]; }
        public function get mimbrane(): CreatureCodeMap { return this.charDesc["MIMBRANE"]; }
        public function get anno(): CreatureCodeMap { return this.charDesc["ANNO"]; }
        public function get kiro(): CreatureCodeMap { return this.charDesc["KIRO"]; }
        public function get saendra(): CreatureCodeMap { return this.charDesc["SAENDRA"]; }
        public function get sera(): CreatureCodeMap { return this.charDesc["SERA"]; }
        public function get syri(): CreatureCodeMap { return this.charDesc["SYRI"]; }
        public function get vanae(): CreatureCodeMap { return this.enemy; }
        public function get vanaeMaiden(): CreatureCodeMap { return this.charDesc["MAIDEN_VANAE"]; }
        public function get vanaeHuntress(): CreatureCodeMap { return this.charDesc["HUNTRESS_VANAE"]; }
        public function get gianna(): CreatureCodeMap { return this.charDesc["GIANNA"]; }
        public function get brynn(): CreatureCodeMap { return this.charDesc["BRYNN"]; }
        public function get lane(): CreatureCodeMap { return this.charDesc["LANE"]; }
        public function get anarrie(): CreatureCodeMap { return this.charDesc["ANARRIE"]; }
        public function get goo(): CreatureCodeMap { return this.charDesc["GOO"]; }
        public function get nevrie(): CreatureCodeMap { return this.charDesc["NEVRIE"]; }
        public function get queenOfTheDeep(): CreatureCodeMap { return this.charDesc["QUEENOFTHEDEEP"]; }
        public function get shade(): CreatureCodeMap { return this.charDesc["SHADE"]; }
        public function get bess(): CreatureCodeMap { return this.charDesc["BESS"]; }
        public function get ben(): CreatureCodeMap { return this.charDesc["BESS"]; }
        public function get taivra(): CreatureCodeMap { return this.charDesc["TAIVRA"]; }
        public function get gene(): CreatureCodeMap { return this.charDesc["GENE"]; }
        public function get petr(): CreatureCodeMap { return this.charDesc["PETR"]; }
        public function get docLash(): CreatureCodeMap { return this.charDesc["DRLASH"]; }
        public function get goocubator(): CreatureCodeMap { return this.charDesc["GOOCUBATOR"]; }
        public function get kara(): CreatureCodeMap { return this.charDesc["KARA"]; }
        public function get fyn(): CreatureCodeMap { return this.charDesc["FYN"]; }
        public function get semith(): CreatureCodeMap { return this.charDesc["SEMITH"]; }
        public function get emmy(): CreatureCodeMap { return this.charDesc["EMMY"]; }
        public function get liriel(): CreatureCodeMap { return this.charDesc["LIRIEL"]; }
        public function get lerris(): CreatureCodeMap { return this.charDesc["LERRIS"]; }
        public function get nerrasa(): CreatureCodeMap { return this.charDesc["NERRASA"]; }
        public function get jerome(): CreatureCodeMap { return this.charDesc["JEROME"]; }
        public function get inessa(): CreatureCodeMap { return this.charDesc["INESSA"]; }
        public function get edan(): CreatureCodeMap { return this.charDesc["EDAN"]; }
        public function get ilaria(): CreatureCodeMap { return this.charDesc["ILARIA"]; }
        public function get wulfe(): CreatureCodeMap { return this.charDesc["WULFE"]; }
        public function get busky(): CreatureCodeMap { return this.charDesc["BUSKY"]; }
        public function get kally(): CreatureCodeMap { return this.charDesc["KALLY"]; }
        public function get pexiga(): CreatureCodeMap { return this.charDesc["PEXIGA"]; }
        public function get ara(): CreatureCodeMap { return this.charDesc["ARAKEI"]; }
        public function get gwen(): CreatureCodeMap { return this.charDesc["GWEN"]; }
        public function get bea(): CreatureCodeMap { return this.charDesc["BEA"]; }
        public function get kazra(): CreatureCodeMap { return this.charDesc["KAZRA"]; }
        public function get pippa(): CreatureCodeMap { return this.charDesc["PIPPA"]; }
        public function get jerynn(): CreatureCodeMap { return this.charDesc["JERYNN"]; }
        public function get del(): CreatureCodeMap { return this.charDesc["DELILAH"]; }
        public function get yammi(): CreatureCodeMap { return this.charDesc["YAMMI"]; }
        public function get mirrin(): CreatureCodeMap { return this.charDesc["MIRRIN"]; }
        public function get fisianna(): CreatureCodeMap { return this.charDesc["FISIANNA"]; }
        public function get azra(): CreatureCodeMap { return this.charDesc["AZRA"]; }
        public function get zil9tails(): CreatureCodeMap { return this.charDesc["ZIL9TAILS"]; }
        public function get krymhilde(): CreatureCodeMap { return this.charDesc["KRYM"]; }
        public function get paige(): CreatureCodeMap { return this.charDesc["PAIGE"]; }
        public function get ciaran(): CreatureCodeMap { return this.charDesc["CIARAN"]; }
        public function get ellie(): CreatureCodeMap { return this.charDesc["ELLIE"]; }
        public function get sam(): CreatureCodeMap { return this.charDesc["SX1TECHGUARD"]; }
        public function get khorgan(): CreatureCodeMap { return this.charDesc["CAPTAINKHORGAN"]; }
        public function get tamtam(): CreatureCodeMap { return this.charDesc["TAMTAM"]; }
        public function get erika(): CreatureCodeMap { return this.charDesc["ERIKA"]; }
        public function get lieve(): CreatureCodeMap { return this.charDesc["LIEVE"]; }
        public function get tuuva(): CreatureCodeMap { return this.charDesc["TUUVA"]; }
        public function get mitzi(): CreatureCodeMap { return this.charDesc["MITZI"]; }
        public function get frostwyrm(): CreatureCodeMap { return this.charDesc["FROSTWYRM"]; }
        public function get lah(): CreatureCodeMap { return this.charDesc["LAH"]; }
        public function get ardia(): CreatureCodeMap { return this.charDesc["ARDIA"]; }
        public function get emmrfox(): CreatureCodeMap { return this.charDesc["MRFOX"]; }
        public function get emredd(): CreatureCodeMap { return this.charDesc["REDD"]; }
        public function get emponyluver(): CreatureCodeMap { return this.charDesc["PONYLUVER"]; }
        public function get emsexyydaddyy(): CreatureCodeMap { return this.charDesc["SEXYYDADDYY"]; }
        public function get embountifulbotany(): CreatureCodeMap { return this.charDesc["BOUNTIFULBOTANY"]; }
        public function get emsneakysnek(): CreatureCodeMap { return this.charDesc["SNEAKYSNEK"]; }
        public function get emripped4yourpleasure(): CreatureCodeMap { return this.charDesc["RIPPED4YOURPLEASURE"]; }
        public function get emstormdragon(): CreatureCodeMap { return this.charDesc["STORMDRAGON"]; }
        public function get aina(): CreatureCodeMap { return this.charDesc["AINA"]; }
        public function get amber(): CreatureCodeMap { return this.charDesc["DRYAD"]; }
        public function get zea(): CreatureCodeMap { return this.charDesc["ZEA"]; }
        public function get luca(): CreatureCodeMap { return this.charDesc["LUCA"]; }
        public function get marion(): CreatureCodeMap { return this.charDesc["MARION"]; }
        public function get olympia(): CreatureCodeMap { return this.charDesc["OLYMPIA"]; }
        public function get lureling(): CreatureCodeMap { return this.charDesc["LURELING"]; }
        public function get roxy(): CreatureCodeMap { return this.charDesc["ROXY"]; }
        public function get lorelei(): CreatureCodeMap { return this.charDesc["LORELEI"]; }
        public function get varmint(): CreatureCodeMap { return this.charDesc["VARMINTPET"]; }
        public function get vahn(): CreatureCodeMap { return this.charDesc["VAHN"]; }
        public function get bianca(): CreatureCodeMap { return this.charDesc["BIANCA"]; }
        public function get synphia(): CreatureCodeMap { return this.charDesc["SYNPHIA"]; }

        // New Parsers
        public function hourIs(identifier: String, args: Array, results: Array): String {
            return ToCode.equals('hours', args, results);
        }

        public function hourRange(identifier: String, args: Array, results: Array): String {
            return ToCode.range('hours', args, results);
        }

        public function dayIs(identifier: String, args: Array, results: Array): String {
            return ToCode.equals('days', args, results);
        }

        public function dayRange(identifier: String, args: Array, results: Array): String {
            return ToCode.range('days', args, results);
        }

        public function minuteIs(identifier: String, args: Array, results: Array): String {
            return ToCode.equals('minutes', args, results);
        }

        public function minuteRange(identifier: String, args: Array, results: Array): String {
            return ToCode.range('minutes', args, results);
        }
    }
}