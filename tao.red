Red [
	needs: 'view
]
taoFile: load %chapters.red
chCounter: 1
chContent: taoFile/:chCounter/2
chTxtPrep: []
setChTxtPrep: func [len][
	clear chTxtPrep
	print ["txtprep: " chTxtPrep]
	repeat i len [
		append chTxtPrep reduce [taoFile/:chCounter/2/:i newline] 
		print taoFile/:chCounter/2/:i
		print chCounter
	]
]
setChTxtPrep length? taoFile/:chCounter/2
chTxt: rejoin chTxtPrep

updateChTxt: func [i][
	if all [(chCounter + i > 0) (chCounter + i <= length? taoFile)][
		chCounter: chCounter + i
		setChTxtPrep length? taoFile/:chCounter/2
		chTxt: rejoin chTxtPrep
		print "all check success"
	]
]

scroll-text: does [
    testTxt/offset/y: to integer! negate (testTxt/size/y - 300) * (1.0 - to float! sl/data)
]

mainView: [
	size 400x500
	across
    space 0x0
    text "道德經"
    return
    gp: panel 100x290 [
        origin 0x0
        testTxt: text chTxt		
	]
	
    on-wheel [
        v: (to float! sl/data) + (20.0 / (testTxt/size/y - 290) * event/picked)
        sl/data: to percent! min 1.0 max 0.0 v
        scroll-text
    ]
    sl: slider 16x290 on-change [scroll-text]
    do [sl/data: 100%]
    return
    panel [
		prevBtn: button "Previous Chapter" on-down [updateChTxt -1 testTxt/text: chTxt]
		nextBtn: button "Next Chapter"     on-down [updateChTxt 1  testTxt/text: chTxt]
	]
]
view/flags mainView [resize]
