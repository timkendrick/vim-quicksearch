# vim-quicksearch

> Improved searching within buffers

## Commands

| Command | Action |
| ------- | ------ |
| `<Plug>QuicksearchSetBuffer` | Set search register to current word/range/selection |
| `<Plug>QuicksearchSubstitute` | Perform a substitution with the current search entry |

## Usage

```vim
map <leader>/ <Plug>QuicksearchSetBuffer
map <leader>s <Plug>QuicksearchSubstitute
```

The <kbd>\*</kbd> and <kbd>#</kbd> keys will be automatically remapped in visual mode to search for the currently selected text.
