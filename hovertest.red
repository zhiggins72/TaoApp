Red [
	needs: 'view
]

tip: none

show-tip: func [face ch][
	if tip [exit]
	tip: layout compose [
		below
		text 200 (rejoin ["Character: " ch])
		text 200 "Pinyin, meaning and examples would go here."
	]
	; place it below the character, in screen coordinates
	tip/offset: face/parent/offset + face/offset + 0x80
	view/no-wait/flags tip [no-title]
]

hide-tip: func [][
	if tip [
		unview/only tip
		tip: none
	]
]

view [
	below
	text "Hover over the character:"
	base 60x60 white "道" font-size 28 all-over
		on-over [
			either event/away? [hide-tip][show-tip face "道"]
		]
]
