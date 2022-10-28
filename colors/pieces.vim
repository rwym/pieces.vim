" pieces.vim - http://github.com/Miraboreas/pieces.vim
" Vim colorscheme. White text on a black background.
"
" Remove all existing highlighting.

set background=dark
highlight clear
if exists("syntax on")
    syntax reset
endif
let g:colors_name = "pieces"

let s:pieces = {}
let s:pieces.black = [16, "#000000"]
let s:pieces.white = [255, "#eeeeee"]
let s:pieces.grey = [243, "#767676"]
let s:pieces.cyan = [24, "#00afaf"]
let s:pieces.darkblue = [18, "#000087"]
let s:pieces.darkgreen = [22, "#005f00"]
let s:pieces.blue = [39, "#00afff"]
let s:pieces.green = [82, "#5fff00"]
let s:pieces.darkred = [52, "#5f0000"]
let s:pieces.darkpurple = [53, "#5f005f"]
let s:pieces.lightpurple = [141, "#af87ff"]
let s:pieces.violet = [99, "#875fff"]
let s:pieces.darkyellow = [214, "#ffaf00"]
let s:pieces.red = [160, "#df00000"]
let s:pieces.purple = [92, "#8700df"]
let s:pieces.yellow = [190, "#dfff00"]
let s:pieces.pink = [212, "#ff87df"]

function! s:HL(item, fgColor, bgColor, style, ...)
	let undesirable_runtimes = a:000
	for runtime in undesirable_runtimes
		if has(runtime)
			return
		end
	endfor

	let target = 'cterm'
	let pindex = 0
	if has('gui_running')
		let target = 'gui'
		let pindex = 1
	end

	let command  = 'hi ' . a:item
	let command .= ' ' . target . 'fg=' . a:fgColor[pindex]
	let command .= ' ' . target . 'bg=' . a:bgColor[pindex]
	let command .= ' ' . target . '=' . a:style

	execute command
endfunction

" PRIMITIVES
call s:HL('Boolean'		  , s:pieces.violet, s:pieces.black , 'bold'	   )
call s:HL('Character'	  , s:pieces.violet, s:pieces.black , 'bold'	   )
call s:HL('Constant'	  , s:pieces.violet, s:pieces.black , 'bold'	   )
call s:HL('Float'		  , s:pieces.violet, s:pieces.black , 'bold'	   )
call s:HL('Number'		  , s:pieces.violet, s:pieces.black , 'bold'	   )
call s:HL('String'		  , s:pieces.violet, s:pieces.black , 'bold'	   )
call s:HL('SpecialChar'	  , s:pieces.violet, s:pieces.black , 'bold'	   )

" COMMENTS
call s:HL('Comment'		  , s:pieces.grey, s:pieces.black , 'none'	   )
call s:HL('SpecialComment', s:pieces.grey, s:pieces.black , 'none'	   )
call s:HL('Title'		  , s:pieces.white, s:pieces.black , 'none'	   )
call s:HL('Todo'		  , s:pieces.purple, s:pieces.black , 'none'	   )

" LINES, COLUMNS
call s:HL('LineNr'		  , s:pieces.white, s:pieces.black , 'italic'	   )
call s:HL('CursorLine'	  , s:pieces.white , s:pieces.black, 'none'	   )
call s:HL('CursorLineNr'  , s:pieces.white, s:pieces.black , 'none'	   )

call s:HL('ColorColumn'	  , s:pieces.white , s:pieces.black, 'none'	   )
call s:HL('CursorColumn'  , s:pieces.white, s:pieces.black, 'none'	   )

" VISUAL MODE
call s:HL('Visual'		  , s:pieces.black , s:pieces.white, 'none'	   )
call s:HL('VisualNOS'	  , s:pieces.black , s:pieces.white, 'none'	   )

" SEARCH
call s:HL('Search'		  , s:pieces.purple , s:pieces.grey, 'none'	   )
call s:HL('IncSearch'	  , s:pieces.purple, s:pieces.grey , 'none'	   )

" SPELLING
call s:HL('SpellBad'	  , s:pieces.white , s:pieces.red	  , 'none'	   )
call s:HL('SpellCap'	  , s:pieces.white , s:pieces.red	  , 'none'	   )
call s:HL('SpellLocal'	  , s:pieces.white , s:pieces.red	  , 'none'	   )
call s:HL('SpellRare'	  , s:pieces.white , s:pieces.red	  , 'none'	   )

" ERROR
call s:HL('Error'		  , s:pieces.red	, s:pieces.black , 'none'	   )

" COMMAND MODE MESSAGES
call s:HL('ErrorMsg'	  , s:pieces.red	, s:pieces.black , 'none'	   )
call s:HL('WarningMsg'	  , s:pieces.darkyellow	, s:pieces.black , 'none'	   )
call s:HL('ModeMsg'		  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('MoreMsg'		  , s:pieces.white	, s:pieces.black , 'none'	   )

" PREPROCESSOR DIRECTIVES
call s:HL('Include'		  , s:pieces.grey	, s:pieces.black , 'bold'	   )
call s:HL('Define'		  , s:pieces.grey	, s:pieces.black , 'bold'	   )
call s:HL('Macro'		  , s:pieces.grey	, s:pieces.black , 'bold'	   )
call s:HL('PreCondit'	  , s:pieces.grey	, s:pieces.black , 'bold'	   )
call s:HL('PreProc'		  , s:pieces.grey	, s:pieces.black , 'bold'	   )

" BINDINGS
call s:HL('Identifier'	  , s:pieces.white	, s:pieces.black , 'bold'	   )
call s:HL('Function'	  , s:pieces.white	, s:pieces.black , 'bold'	   )
call s:HL('Keyword'		  , s:pieces.white	, s:pieces.black , 'bold'	   )
call s:HL('Operator'	  , s:pieces.white	, s:pieces.black , 'bold'	   )

" TYPES
call s:HL('Type'		  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Typedef'	  	  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('StorageClass'  , s:pieces.white, s:pieces.black , 'none'	   )
call s:HL('Structure'	  , s:pieces.white, s:pieces.black , 'none'	   )

" FLOW CONTROL
call s:HL('Statement'	  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Conditional'	  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Repeat'		  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Label'		  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Exception'	  , s:pieces.white	, s:pieces.black , 'none'	   )

" MISC
call s:HL('Normal'		  , s:pieces.white, s:pieces.black , 'none'	   )
call s:HL('Cursor'		  , s:pieces.white , s:pieces.black , 'none'	   , 'gui_macvim')
call s:HL('Underlined'	  , s:pieces.white, s:pieces.black , 'underline')
call s:HL('SpecialKey'	  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('NonText'		  , s:pieces.white , s:pieces.black , 'none'	   )
call s:HL('Directory'  	  , s:pieces.blue, s:pieces.black , 'none'	   )

" FOLD
call s:HL('FoldColumn'	  , s:pieces.white, s:pieces.black , 'none'	   )
call s:HL('Folded'		  , s:pieces.white, s:pieces.black , 'none'	   )

" PARENTHESIS
call s:HL('MatchParen'	  , s:pieces.red, s:pieces.black , 'bold'	   )

" POPUP
call s:HL('Pmenu'		  , s:pieces.white , s:pieces.black, 'none'	   )
call s:HL('PmenuSbar'	  , s:pieces.white , s:pieces.black, 'none'	   )
call s:HL('PmenuSel'	  , s:pieces.violet , s:pieces.black, 'none'	   )
call s:HL('PmenuThumb'	  , s:pieces.violet, s:pieces.white, 'none'	   )

" SPLITS
call s:HL('VertSplit'	  , s:pieces.white, s:pieces.black , 'none'	   )

" OTHERS
call s:HL('Debug'		  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Delimiter'  	  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Question'   	  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('Special'		  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('StatusLine' 	  , s:pieces.white	, s:pieces.black , 'none'	   , 'gui_macvim')
call s:HL('StatusLineNC'  , s:pieces.white	, s:pieces.black , 'none'	   , 'gui_macvim')
call s:HL('Tag'			  , s:pieces.white	, s:pieces.black , 'none'	   )
call s:HL('WildMenu'   	  , s:pieces.white	, s:pieces.black , 'none'	   )

" DIFF
call s:HL('DiffAdd'		  , s:pieces.white , s:pieces.green , 'none'	   )
call s:HL('DiffChange'	  , s:pieces.white , s:pieces.blue  , 'none'	   )
call s:HL('DiffDelete'	  , s:pieces.white , s:pieces.red   , 'none'	   )
