Red [
	needs: 'view
]

show-info: func [ch [string!]][
	view/no-wait compose [
		title (rejoin ["Info: " ch])
		below
		text 200 (rejoin ["You clicked: " ch])
		text 200 "This is some test text. Pinyin, meaning and example sentences would go here."
		button "Close" [unview]
	]
]

view [
	below
	text "Click the character:"
	base 60x60 "道" font-size 28 on-down [show-info "道"]
]
