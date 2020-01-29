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

`Boolean` will not display. They are automatically turned into 
```
if identifier 
    results[0]
else if results.length > 1
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
`Function` are called with the `arguments` then the `results`.

Examples:
> `[pc.cockNoun 1]`
```
pc.cockNoun(1)
```

> `[aFunction 1 2 3 4|a|b|c|d|e]`

```
aFunction(1, 2, 3, 4, "a", "b", "c", "d, "e")
```
*Note: `aFunction` does not exist*

If the return value is `null`, it will error. 

If the return value is `{ selector: (number) }` and the value of `selector` is in `results`, then `results[selector]` will be used. This gives more range information in the interpreter's output.

Anything else will coerced to `String`

---
Any other data types will be coerced to `String`.

---

## Operators
Operators changes how the parser text is evaluated.
### Range `">"`
This operator only works on numbers.
> `[aNumber > 0 5 10|0-4.99|5-9.99|10+]`

```
if (0 >= aNumber > 5) then
    "0-4.99"
elseif (5 >= aNumber > 10) then
    "5-9.99"
elseif (10 >= aNumber) then
    "10+"
```
> If `aNumber` is `3` then the output is `0-4.99`

*Note: `aNumber` does not exist and is used as an example here*

---
### Equal `"="`
This operator only works on numbers and `String`.

> `[hours = 7 8|You are still asleep|Wake Paige up|Paige is already awake]`
```
if (hours = 7) then
    "You are still asleep"
elseif (hours = 8) then
    "Wake Paige up"
else
    "Paige is already awake"
```
> If `hours` is equal to `8` then the output is `Wake Paige up`

If the value of the `identifer` is outside the range, an error will be displayed.

---

### Reveal `"@"`
This operator goes before an `identifier` and shows either its `type` or what can be added.

> `[@silly]`
```
[yes or no]
```
> `[@pc]`
```
[
    fullname: text
    race: text
    occupation: text
    hairColor: text
    ...
]
```
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

## Capitalization
---
The original `[pc.Name]` capitalization method works if the `identifier` starts lowercase in the code. If the `identifier` is uppercase in the code, then use `[cap|[...]]`.

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
> `argResultValidator(args: Array<String or Number>, results: Array<String>): String or null`

This validates that `arguments` and `results` will not cause a problem when passed to the corresponding function. Return a `String` when there is a problem, `null` otherwise.

An example of this would be `cockSimple` in CreatureDescriptor. `cockSimple` take in one optional `argument` and no `results`.

---
### toCode
> `toCode(args: Array<String or Number>, results: Array<String>): String`

This changes how the code written.

`[b|This is bold text]` normally turns into `b("This is bold text")`

Since `toCode` was supplied, it becomes `"<b>" + "This is bold text" + "</b>"`

---