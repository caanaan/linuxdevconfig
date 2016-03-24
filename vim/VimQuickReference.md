Vim Quick Reference:
=======================

## Vim General:
* Vim Leader - Comma ','
* Ctrl + r - Redo
* F10 - Toggle insert mode
* w / b - Move forWard or Back a word
* ^ / $ - Move to beginning or end of line
* { / } - Jump forward or back to next empty line
* H / M / L - Jump to beginning, middle, or bottom of the screen
* gg / G - Jump to beginning or end of the file
* ggVG - Select all text in a file
* Ctrl + v - Column select mode
* Ctrl + v, Select, Shift + i - Insert text into a column
* >> or << - Indent current selection left or right
* Ctrl + t or Ctrl + d - In insert mode, indent the current line left or right

## Copy and Paste To/From System Clipboard
* ,y - Yank the current selection to the system clipboard
* ,yy - Yank the current line to the system clipboard
* ,cp - In normal mode, paste from the system clipboard to Vim
* Ctrl + Shift + V - In insert mode, paste from the system clipboard into Vim

## Window Splitting:
* Alt + up or down arrow - Split Vim window horizontally
* Alt + left or right arrow - Split Via window vertically

## Window Movement:
* Ctrl + up or down arrow - Move up or down in vim windows
* Ctrl + left or right arrow - Move left or right in vim window

## Code Folding:
* za - Toggle current fold
* zR - Open all folds
* zM - Close all folds

## Filenames:
* ,f - Copy the current file's filename to the buffer

## CtrlP - fuzzy file searching:
* Ctrl + p - open CtrlP search window
* ,o - open CtrlP buffer search window
* ,p - open CtrlP most recently used and file search window
* ,[ - open CtrlP tag search window
* Ctrl + f/b - Move forward and back in the search modes
* Ctrl + x - open selection in a new horizontal split

## Ags Searching:
* ,s - Search for all instances of the word under the cursor
* :Ags <searchStr> - Use Ag to search the current path for <searchStr>
* p / P - in an Ags search, navigate to next or previous file path
* r / R - in an Ags search, navigate next or previous search
* oa - in an Ags search, open below the results window

## Easymotion
* <space> + two letters OR ,,s + two letters - Easymotion to two letter matches
* ,,l - Easymotion to the start of a line
* ,,w - Easymotion to the start of a word
* (ez)/ + searchString - (Easymotion or Fuzzy) forward search for searchString in current windows
* (ez)? + searchString - (Easymotion or Fuzzy) backward search for searchString in current windows
  * Tab and Shift-Tab - During a search to navigate to matches 
  * n/N - After a search to navigate to matches

## NerdTree:
* Ctrl + n - Toggle NerdTree window
* r/R - refresh cursor or root directory
* C - Set tree root to selected directory
* I - Show hidden files
* p/P - Go to parent or root directory
* K/J - Go to first / last child
* i - Open in new split
* o/O - Open node (recursively)
* x/X - Close node (recusively)
* ,nf - Find the current file in NerdTree
* cd - Change the current working directory to the selected node

## NerdCommenter:
* cc - Toggle comment
* ,cc - Comment out the selected line(s)
* ,cu - Uncomment out the selected line(s)
* ,cm - Comment block using a single multi-line comment

## Tagbar:
* Ctrl + T - Toggle tagbar
* :UpdateTags - command to force a tag update

## Ultisnips:
* Tab - Expand selected snippet
* Tab - Jump to next snippet section
* Shift + Tab - Jump back to past snippet section
* :UltiSnipsEdit - Open associated snippets file for edit

## Window Splits
* ,- - Reduce the current split's size
* ,= - Increase the current split's size

## Cscope and Ctags Initialization
* ,i - Initialize cscope and ctags files in Vim

## CScope
* cscope -R -b - Generate the cscope.out database from the command line.
* Cscope - source the default cscope.out file.  Can also csa <databaseFile>...
* csf <searchType> <searchItem> - cs find <searchType> <searchItem>
* Ctrl + \ then <searchType> - search for item under cursor in current window
* Ctrl + space then <searchType> - search for item under cursor in new horizontal split
* Search types:
  * 's'   symbol: find all references to the token under cursor
  * 'g'   global: find global definition(s) of the token under cursor
  * 'c'   calls:  find all calls to the function name under cursor
  * 't'   text:   find all instances of the text under cursor
  * 'e'   egrep:  egrep search for the word under cursor
  * 'f'   file:   open the filename under cursor
  * 'i'   includes: find files that include the filename under cursor
  * 'd'   called: find functions that function under cursor calls

## CTags
* ctags -R . - generate a new tags file for the current directory tree
* :set tags+=tags - add the ./tags file to the tags file definition
* Ctrl + ] - Go to the definition of the current tag under the cursor
* :tag <tagName> - to search the tags file for the tag
* CtrlP can also search tags - see its section for info
