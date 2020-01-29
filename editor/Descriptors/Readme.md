# Parsers
## Understanding parser text
This is how the parsers text is grouped.

`[ (identifier) (optional operator) (arguments) | (results) ]`

*Note: This does not apply if there is an operator (>, =)*

Examples:
> `[pc.name]`
```
identifier: "pc.name"
arguments: []
results: []
```
> `[pc.cockNoun 1]`
```
identifier: "pc.cockNoun"
arguments: [1]
results: []
```
> `[silly|enabled|disabled]`
```
identifier: "silly"
arguments: []
results: ["enabled", "disabled"]
```
> `[pc.milkVolRange 0 100 1000 5000|0~100|100~1000|1000~5000|5000+]`
```
identifier: "pc.milkVolRange"
arguments: [0, 100, 1000, 5000]
results: ["0~100", "100~1000", "1000~5000", "5000+"]
```
*Note: `milkVolRange` does not exist at time of writing*

## Relation between the code and text
Everything starts with the Descriptor classes. They are a wrapper that limits access to the game. Anything `public` can be used in the text.

## Visiblity
The entry point is TiTSDescriptor. The interpreter will start evaluating identifiers here.

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
## Argument Grouping
`arguments` can be grouped together using parentheses `(` `)`.
> `[pc.hasPerk (Fecund Figure)|exceptionally wide|] hips`
```
identifier: "pc.hasPerk"
arguments: ["Fecund Figure"]
results: ["exceptionally wide", ""]
```
---
## Nesting in `arguments`
When `:` is used, all `results` are changed to `arguments`.
> `[b:|This is bold text]`
```
identifier: "b"
arguments: ["This is bold text"]
results: []
```
---

## Capitalization
---
The original `[pc.Name]` capitalization method works if the `identifier` starts lowercase in the code. If the `identifier` is uppercase in the code, then use `[cap:|[...]]`.

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
This info is accessed by the interpreter by taking the last part of the `identifer` and adding `__info`.

> `cockSimple` -> `cockSimple__info`

---
### argResultValidator
> `argResultValidator(arguments: Array<String or Number>, results: Array<String>): String or null`

This validates that `arguments` and `results` will not cause a problem when passed to the corresponding function and . Return a `String` when there is a problem, `null` otherwise.

An example of this would be `cockSimple` in CreatureDescriptor. `cockSimple` take in one optional `argument` and no `results`.

---
### toCode
> `toCode(identifier: String, arguments: Array<String or Number>, results: Array<String>): String`

This changes how the code written.

`[b:|This is bold text]` normally turns into `b("This is bold text")`

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