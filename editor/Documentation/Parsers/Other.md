|Parser | Arguments | Results | Description|
|---------|------|---------|------------|
|i || One | Italicizes `result`|
|b || One | Bolds `result`|
|cap || One | Capitalizes `result`|
|rand | One optional `number` | Infinite | Selects a random `result`. Optional `arg` selects `result`.|
|silly || Up to 2 | Silly mode enabled or disabled|
|flagIs | One [flag name](Lists/FlagList.md), Infinite `number` or `text` | Up to `args` except [flag name](Lists/FlagList.md) + 1 | Flag with name is equal to `arg` |
|hourIs | Infinite `number` | Up to `args` + 1 | Hour is equal to `arg` |
|hourRange | Infinite `number` | Up to `args` + 1 | `Range` operation on `hour`|
|dayIs | Infinite `number` | Up to `args` + 1 | Day is equal to `arg` |
|dayRange | Infinite `number` | Up to `args` + 1 | `Range` operation on `day`|
|minuteIs | Infinite `number` | Up to `args` + 1 | Minute is equal to `arg` |
|minuteRange | Infinite `number` | Up to `args` + 1 | `Range` operation on `minute`|
