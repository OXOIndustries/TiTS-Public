# Parsers
## Understanding parser text
This is how the parsers text is grouped.

`[ (identifier) (optional operator) (arguments) | (results) ]`

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
> `[pc.cumQRange 0 100 1000 5000|0~100|100~1000|1000~5000|5000+]`
```
identifier: "pc.cumQRange"
arguments: [0, 100, 1000, 5000]
results: ["0~100", "100~1000", "1000~5000", "5000+"]
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
