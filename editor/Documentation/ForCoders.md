# Understanding the language
### Code Syntax
> `[ (identifier) (arguments) | (results) ]`

`[` starts a parser and `]` ends a parser.

An `identifier` is a list of `identity` separated by `.` Each `identity` accesses a variable starting with the `Object` that was passed to the `interpreter` on creation.

The `arguments` is a list of `String` or `Number` separated by at least one `space` or `tab`.

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
---
## Whitespace
Newlines following the end of the `result` text are ignored.
> `Silly mode is [silly`
>
> `|enabled`
>
> `|disabled`
>
> `].` 
```
Silly mode is disabled.
```
---
## Indentation
The space between the start of a line and the first `|` determines the amount of indentation for all `results` of that parser. A tab counts as one space.

Example: Two space indentation
> ```
> SILLY MODE
> [silly
>   |==========
>    ENABLED
>   |==========
>    DISABLED
> ]
```
SILLY MODE
==========
 ENABLED
```

# Relation between the code and parsers
The `interpreter` takes in a `Object`. Anything `public` can be used in the text.

In the code, a new TiTSWrapper is passed to the `interpreter`. A Wrapper class is a wrapper around game code to limit access. 

## Visiblity
The entry point is TiTSWrapper. The interpreter will start evaluating `identifier` here.

> `[silly|enabled|disabled]`

The `silly` is in TiTSWrapper and is `public`, thus it can be used.

> `[pc.cockNoun 1]`

`pc` is in TiTSWrapper and is `public`. It returns a CreatureWrapper.
`cockNoun` is in CreatureWrapper and is `public`, thus `pc.cockNoun` can be used.

---
## How the interpreter handles data types
---
### Functions
`Function` types are evaluated first. They are called with the `arguments` using `apply`.
> `aFunc.apply(self, arguments)`

or with `call` if `includeResults` is set. More on that in the `FunctionInfo` section.
> `aFunc.apply(self, arguments, results)`

Examples:
> `[pc.cockNoun 1]`
```
pc.cockNoun(1)
```

The type of the result of the function call is then used below.
If the return value is `null`, it will error. 

---
### Booleans
`Boolean` types will not display. They are automatically turned into 
```
if (identifier == true)
    results[0]
else if (results.length > 1)
    results[1]
else
    ""
```
---
### Numbers
`Number` types do not display. They select from the `results`. If there are no `results` in the range, use empty string.
```
if (num < results.length)
    results[num]
else
    ""
```
---
### Other
`Object`, `null` will display an error.

Anything else will coerced to `String`.

---
# Adding new parsers
Anything `public` in TiTSWrapper or subsequent classes will available to the interpreter.

Example:
1. Open TiTSWrapper.as
2. Add `public const boobs: String = "(.)(.)";` to the TiTSWrapper class
3. Compile and open the swf
4. Type `[boobs]` and see `(.)(.)` in the output

**Make sure what are adding does NOT change game values. Giving writers the power to change game values can and will cause problems.**

## Info

Info classes provide validation and other useful information and must mirror `Wrapper` classes.

If a value has a type of `function`, it will be considered a validator.

If a value has a type of `object`, it will be considered an info object.
```
{
    func: // Validator. Function
    includeResults: // Whether or not to include results. Boolean
}
```

### Validation
> `function(arguments: Array<String or Number>, results: Array<String>): String or null`

This validates that `arguments` and `results` will not cause a problem when passed to the corresponding function. Return a `String` when there is a problem, `null` otherwise.

An example of this would be `cockSimple` in CreatureWrapper. `cockSimple` take in one optional `argument` and no `results`.

---
### includeResults
This changes how functions are called.

Normally, they are called `func.apply(self, args)`, but this changes it to `func.call(self, args, results)`.

*Note: `apply` spreads `args` over the paramters. `call` does not spread.*

## CodeMap
---
> `function (identifier: String, arguments: Array<String or Number>, results: Array<String>): String`

`CodeMap` classes must mirror `Wrapper` classes.

The functions in these classes transform the `parser` into `code`.
