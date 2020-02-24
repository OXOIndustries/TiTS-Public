# Parsers
Any text between `[ ]` is a `parser`.

## Inside a parser
> `[ (identifier) (arguments) | (results) ]`

`identifier` is a list of `identity` separated by `"."`.

`identity` is the name of a variable in memory.

`arguments` is a list of `text` or `number` separated by at least one `space` or `tab`.

`results` is a list of `text` separated by `|`. They can include `parsers`.

Examples:
> `[pc.name]`
```
identifier: ("pc", "name")
arguments: ()
results: ()
```
> `[pc.cockNoun 1]`
```
identifier: ("pc", "cockNoun")
arguments: (1)
results: ()
```
> `[silly|enabled|disabled]`
```
identifier: ("silly")
arguments: ()
results: ("enabled", "disabled")
```
> `[pc.cumQRange 0 100 1000 5000|0~100|100~1000|1000~5000|5000+]`
```
identifier: ("pc", "cumQRange")
arguments: (0, 100, 1000, 5000)
results: ("0~100", "100~1000", "1000~5000", "5000+")
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

---
## Argument Grouping
`arguments` can be grouped together using parentheses `( )`. When grouped, `spaces` and `tabs` are included.

> `[pc.hasPerk (Fecund Figure)|exceptionally wide] hips`
```
identifier: "pc.hasPerk"
arguments: ["Fecund Figure"]
results: ["exceptionally wide", ""]
```
---

## Capitalization
If the first letter of any lowercase `identity` is uppercase, the result wil be capitalized. If the first letter of an `identity` is already uppercase, then use `cap`.

> `pc.skinColor` is lowercase, so `pc.SkinColor` will capitalize the result.

> `flags.MET_FLAHNE` is uppercase, so use `cap`.

---
## Range
If `Range` is at the end of an `identifier`, then that parser is a range operation.

An infinite amount of `number` `arguments` can be used.

If the `value` of the `identifier` is greater than or equal to the first selected `argument` and less than the second selected `argument`, output the `result` at the same position of the first selected `argument`.


> `[hourRange 7 10 12|7-9.99|10-11.99|12+]`

```
if (7 <= hour < 10) then output "7-9.99"

if (10 <= hour < 12) then output "10-11.99"

if (12 <= hour) then output "12+"
```
> If `hour` is `11` then the output is `10-11.99` because `11` is greater than `10` and less than `12`.

---
## Is
If `Is` is at the end of an `identity`, that means this is an equals range operation.

An infinite amount of `text` or `number` `arguments` can be used.

If the `value` of the `identity` equals the `argument`, output the `result` at the same position of the matching `argument`.

> `[hourIs 7 8|You are still asleep|Wake Paige up|Paige is already awake]`
```
if (hour equals 7) then output "You are still asleep"

if (hour equals 8) then output "Wake Paige up"

else output "Paige is already awake"
```
> If `hour` is equal to `8` then the output is `Wake Paige up`
