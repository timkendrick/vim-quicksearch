# vim-quicksearch

> Search for the current selection

## Commands

| Command | Action |
| ------- | ------ |
| `<Plug>QuicksearchSetBuffer` | Set search register to current word/range/selection |

## Usage

```vim
map <leader>/ <Plug>QuicksearchSetBuffer
```

The <kbd>\*</kbd> and <kbd>#</kbd> keys will be automatically remapped in visual mode to search for the currently selected text.
