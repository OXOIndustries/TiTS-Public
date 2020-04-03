# TiTS New Parser Docs

Written by end5.

CoC2 is a different game than TiTS, so the parsers will be different.

I suggest reading and learning how CoC2 parsers works first, then coming back to this.

[Click here for CoC2 parser documentation](https://www.fenoxo.com/play/CoC2/release/documentation.html)

Changes listed below.

# Change in wording
Arguments are the values separated by spaces "` `"

Results are the values separated by pipes "`|`"

Example: `[pc.cumQRange 0 100 1000 5000|0~100|100~1000|1000~5000|5000+]`
* Arguments = `0`, `100`, `1000`, `5000`
* Results = `0~100`, `100~1000`, `1000~5000`, `5000+`

# Arguments
## New
Arguments that have spaces in them can be combined by using `()`. For example, `[pc.hasPerk Amazonian Endurance|You are always ready for another round.|You are exhausted.]` would look for the perk `Amazonian` and the perk `Endurance`, but by surrounding them in parenthesis, `[pc.hasPerk (Amazonian Endurance)|You are always ready for another round.|You are exhausted.]`, it instead looks for the perk `Amazonian Endurance`.

Arguments can now be parsers.
An example `[pc.cockTypeIs [pc.longestCockIndex] human equine tentacle|terran penis|flared cock|squirming tentacle dick]`.
The first argument of `pc.cockTypeIs` is a number to select which cock you are looking at. `[pc.longestCockIndex]` computes and provides the number of the longest cock.

# Range parsers
## Changed/New
Range parsers have been divided into `Range` and `Is`.
`Range` works the same as before.
`Is` parsers are written the same as `Range` parser, but instead of computing if a value is between arguments, they compute if the value is one of the arguments.
A `Is` example would be `[minuteIs 15 30 45|quarter past|half past|quarter to|]` checks if the `minute` is `15`, `30` or `45` and displays `quarter past`, `half past` or `quarter to`.

# Flag Parsers
## Changed
Use the `[flagIs `[flag_name_here](FlagList.md)` argument1 argument2 ...|...]`. The arguments can be numbers or text.

# Random Parser
## New
The random parser can take an optional number as a argument. That number forces the parser to pick that variation. An example `[rand 1|ceiling|face|chest|floor|...]` would display `ceiling`. Changing the `1` to a `3` would display `chest` instead of `ceiling`.


# Other changes
## Whitespace
Newlines following the end of the `result` text are ignored.
```
Silly mode is [silly
|enabled

|disabled

].
```
Displays 
```
Silly mode is disabled.
```

---
## Indentation
The space between the start of a line and the first `|` determines the amount of indentation for all `results` of that parser. A tab counts as one space.

Example: Two space indentation
```
SILLY MODE
[silly
  |==========
   ENABLED
  |==========
   DISABLED
]
```
Displays
```
SILLY MODE
==========
 ENABLED
```

# Removed
These are either impossible to create or have not been implemented at the time of writing
* Party "dot" parsers
* Companions and Existence Parser
* A/An Parser
* TPS Parser
* Plural/Singular Parser

# Big List of Parsers
"char" is a placeholder for a name from the [character name list](Character/Names.md). In combat you can use "attacker", "target" and "enemy".

[List of character names](Parsers/Character/Names.md)

[List of simple character parsers](Parsers/Character/Simple.md)

[List of complex character parsers](Parsers/Character/Complex.md)

[List of other parsers](Parsers/Other.md)

[List of breast cup sizes](Lists/StatusEffectList.md)

[List of various body types and flags](Lists/NameList.md)

[List of status effects](Lists/StatusEffectList.md)

[List of perks](Lists/PerkList.md)

[List of key items](Lists/KeyItemList.md)

[List of flags](Lists/FlagList.md)
