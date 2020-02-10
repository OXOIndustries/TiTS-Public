# Understanding the language
### Code Syntax
> `[ (identifier) (arguments) | (results) ]`

`[` starts a parser and `]` ends a parser.

An `identifier` is a list of `identity` separated by `.` Each `identity` accesses a variable starting with the `Object` that was passed to the `interpreter` on creation.

The `arguments` is a list of `String` or `Number`. They are separated by a `space`, `tab` and/or `newline`.

The `results` is a list of `String`. They are separated by `|`. They can include a parser.

Examples:
> `[pc.name]`
```
identifier: ["pc", "name"]
arguments: []
results: []
```
> `[pc.cockNoun 1]`
```
identifier: ["pc", "cockNoun"]
arguments: [1]
results: []
```
> `[silly|enabled|disabled]`
```
identifier: ["silly"]
arguments: []
results: ["enabled", "disabled"]
```
> `[pc.cumQRange 0 100 1000 5000|0~100|100~1000|1000~5000|5000+]`
```
identifier: ["pc", "cumQRange"]
arguments: [0, 100, 1000, 5000]
results: ["0~100", "100~1000", "1000~5000", "5000+"]
```

# Relation between the code and parsers
The `interpreter` takes in a `Object`. Anything `public` can be used in the text.

In the code, a new TiTSDescriptor is passed to the `interpreter`. A Descriptor class is a wrapper around game code to limit access. 

## Visiblity
The entry point is TiTSDescriptor. The interpreter will start evaluating `identifier` here.

> `[silly|enabled|disabled]`

The `silly` is in TiTSDescriptor and is `public`, thus it can be used.

> `[pc.cockNoun 1]`

`pc` is in TiTSDescriptor and is `public`. It returns a CreatureDescriptor.
`cockNoun` is in CreatureDescriptor and is `public`, thus `pc.cockNoun` can be used.

---
## How the interpreter handles data types

`Boolean` types will not display. They are automatically turned into 
```
if (identifier == true)
    results[0]
else if (results.length > 1)
    results[1]
else
    ""
```
Evaluation will fail if `arguments.length >= 0` or `results.length == 0` or `results.length > 2`

---
`int`, `uint`, `Number`, etc. is displayed as is.

---
`Object`, `null` will display an error.

---
`Function` are called with the `arguments` using `apply`. 
> `aFunc.apply(self, arguments)`

Examples:
> `[pc.cockNoun 1]`
```
pc.cockNoun(1)
```

If the return value is `null`, it will error. 

If the return value has a `type` of `number` and `results[number]` exists, then `results[number]` will be used. This gives more range information in the interpreter's output.

Anything else will coerced to `String`.

---
Any other data types will be coerced to `String`.

---
# Adding new parsers
Anything `public` in TiTSDescriptor or subsequent classes will available to the interpreter.

Example:
1. Open TiTSDescriptor.as
2. Add `public const boobs: String = "(.)(.)";` to the TiTSDescriptor class
3. Compile and open the swf
4. Type `[boobs]` and see `(.)(.)` in the output

**Make sure what are adding does NOT change game values. Giving writers the power to change game values can and will cause problems.**

## FunctionInfo
This is for describing a `Function`.
This info is accessed by the interpreter by taking the last `identity` in an `identifier` and adding `__info`.

> `pc.cockSimple` -> `pc.cockSimple__info`

---
### argResultValidator
> `argResultValidator(arguments: Array<String or Number>, results: Array<String>): String or null`

This validates that `arguments` and `results` will not cause a problem when passed to the corresponding function. Return a `String` when there is a problem, `null` otherwise.

An example of this would be `cockSimple` in CreatureDescriptor. `cockSimple` take in one optional `argument` and no `results`.

---
### toCode
> `toCode(identifier: String, arguments: Array<String or Number>, results: Array<String>): String`

This changes how the code written.

`[b|This is bold text]` normally turns into `b("This is bold text")`

Since `toCode` was supplied, it becomes `"<b>This is bold text</b>"`

> `My name is [pc.name]`

```
"My name is [pc.name]"
```
> `[pc.hasPerk HoneyPot]`
```
pc.hasPerk("HoneyPot")
```
---
### getDesc/setDesc
This sets the description that will be displayed in the editor.

---
### includeResults
This changes how functions are called.

Normally, they are called `func.apply(self, args)`, but this changes it to `func.call(self, args, results)`.

*Note: `apply` spreads `args` over the paramters. `call` does not spread.*

---
### identityOverride
Setting this overrides the `identity` used when generating code.

Example:
> Override is `taint()`.

> `[pc.taintIs 5|5|not 5]`
```
(pc.taint() === 5 ? "5" : "not 5")
```