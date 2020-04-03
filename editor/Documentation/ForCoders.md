# How it works
```ActionScript
var text: String = "";

var parser: Parser = new Parser();
var parseResult: ParseResult = parser.parse(text);

var tits: TiTS = new TiTS();

var wrapper: TiTSWrapper = new TiTSWrapper(tits);
var info: TiTSInfo = new TiTSInfo(tits);

var interpreter: Interpreter = new Interpreter();
var interpretResult: InterpretResult = interpreter.interpret(parseResult.root, wrapper, info);

var codifier: Codifier = new Codifier();
var codeMap: TiTSCodeMap = new TiTSCodeMap(tits);
var codeResult = codifier.interpret(parserResult.root, codeMap);

```
---
```ActionScript
var text: String = "";
```
This is the text that will be parsed.

---
```ActionScript
var parser: Parser = new Parser();
```
This is the `Parser`. It will parse text into an [Abstract Syntax Tree (AST)](https: //en.wikipedia.org/wiki/Abstract_syntax_tree). That tree will be used by the interpreter to produce the result you see on screen.

---
```ActionScript
var parseResult: ParseResult = parser.parse(text);
```
This is a call to the `parser` passing `text` as an argument. The `parseResult` contains the `root` node of the AST and any `errors`.

---
```ActionScript
var tits: TiTS = new TiTS();
```
This is the game. There is likely more code to properly initialize the game.

---
```ActionScript
var wrapper: TiTSWrapper = new TiTSWrapper(tits);
```
This is a wrapper. Its purpose is to be an interface between the game and the interpreter.

Anything `public` in this class is a parser. For example, `[silly|enabled|disabled]` is
```ActionScript
public function get silly(): Boolean {
    if (this.game.gameOptions)
        return !!this.game.gameOptions.sillyMode;
    return false;
}
```
The source code to use the parser `[pc.name]` is
```ActionScript
// TiTSWrapper.as
public function get pc(): CreatureWrapper { return this.charDesc["PC"]; }

// CreatureWrapper.as
public function get name(): String {
    return this.owner.nameDisplay();
}
```
So the call for the parser `[pc.name]` is `pc.name`

Likewise, the call for the parser `[pc.cockLength 1]` is `pc.cockLength(1)`

These functions do not know about the results.

The call for the parser `[hourIs 7|morning]` is `hourIs(7)`. `morning` is not included in the call because it is a result.

To visualize the parser a bit better, think of `[hourIs 7|morning]` in coding as `selectResult(hourIs(7), ["morning", ""])` or `["morning", ""][hourIs(7)]`.

`hourIs(7)` would return `0` or `1` which would be used to select from `["morning", ""]`. This formula can be used for all the parsers and there is a way to change this functionality mentioned later.

---
```ActionScript
var info: TiTSInfo = new TiTSInfo(tits);
```
This class contains information about the parsers. It is responsible for checking the arguments and results to make sure they are correct.

The `public` members should mimic the wrapper, if needed.
```ActionScript
// TiTSWrapper.as
public function flagIs(name: String, ... args): Number {
    return Eval.equals(this.game.flags[name], args);
}

// TiTSInfo.as
public function flagIs(args: Array, results: Array): String {
    if (args.length === 0) return 'needs a flag';
    return Validators.range(args.slice(1), results);
}
```

If a parser's return type is a `Boolean`, no check is needed.
```ActionScript
// TiTSWrapper.as
public function get silly(): Boolean {
    if (this.game.gameOptions)
        return !!this.game.gameOptions.sillyMode;
    return false;
}

// TiTSInfo.as
```
> Return type is `Boolean`, so TiTSInfo does not need the member `silly`.

These functions check the arguments and results for problems. If there is a problem, return a `String` stating why, else, return `null`. The function declaration is `(args: Array, results: Array): String`. There are helper functions in `Validators.as`.
```ActionScript
// TiTSInfo.as
public const hourIs: Function = Validators.range;

// Validators.as
public static function range(args: Array, results: Array): String {
    if (args.length === 0) return 'needs at least one argument';
    if (results.length === 0) return 'needs at least one result';
    if (results.length > args.length + 1) return 'has ' + (results.length - (args.length + 1)) + ' extraneous results';
    return null;
}
```
> `hourIs` expects at least one argument, one result and amount of results cannot be more the amount of arguments + 1.


This is a special case. `rand` wants pick a result, but can't access them. If the info for `rand` is changed to an object that has `includeResults`, the call to `rand` from the interpreter will be different. The function declaration for that call is `(args: Array, results: Array)`.

```ActionScript
// TiTSWrapper.as
public function rand(args: Array, results: Array): int {
    if (args.length === 1 && 0 < args[0] && args[0] <= results.length)
        return args[0] - 1;
    else
        return Math.floor(Math.random() * results.length);
}

// TiTSInfo.as
public const rand: Object = {
    includeResults: true,
    func: Validators.hasOneOptionalNumberArgManyResults
}
```

An example of this change. Starting with the parser `[hourIs 7 12|morning|noon]` and the following code:
```ActionScript
// TiTSWrapper.as
public function hourIs(... args): Number {
    return Eval.equals(this.game.hours, args);
}

// TiTSInfo.as
public const hourIs: Function = Validators.range;
```

The code equivalent for `[hourIs 7 12|morning|noon]` would look like `hourIs(7, 12)`, but if the info of `hourIs` has the `includeResults`

```ActionScript
// TiTSInfo.as
public const hourIs: Object = {
    includeResults: true,
    func: Validators.range
}
```

`hourIs` would change to the following

```ActionScript
// TiTSWrapper.as
public function hourIs(args: Array, results: Array): Number {
    return Eval.equals(this.game.hours, args);
}
```

The code equivalent for `[hourIs 7 12|morning|noon]` would look like `hourIs([7, 12], ["morning", "noon"])`.


---
```ActionScript
var interpreter: Interpreter = new Interpreter();
```
This is the interpreter. It interprets the AST supplied from the parser.

---
```ActionScript
var interpretResult: InterpretResult = interpreter.interpret(parseResult.root, wrapper, info);
```
The is a call passing the AST from the `parseResult`, the `wrapper` and the `info` to create an `interpretResult`. The `interpretResult` contains the `result` text, the `ranges` of the text or parsers that were used, and any `errors`.

---
```ActionScript
var codifier: Codifier = new Codifier();
var codeMap: TiTSCodeMap = new TiTSCodeMap(tits);
var codeResult: InterpretResult = codifier.interpret(parserResult.root, codeMap);
```
This interprets the AST from the parser into code.

The public members in the `codeMap` should mimic the wrapper if they have results. For example, `[pc.name]` cannot have results, so it does not need to be in the code map. `[hourIs 7|morning]` can have results, so it does need to be in the code map. There are helper functions in `ToCode`.