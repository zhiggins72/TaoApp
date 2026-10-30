Red [
	needs: 'view
]
taoFile: load %chapters.red
chCounter: 1
chContent: taoFile/:chCounter/2
chTxtPrep: []
chTxt: rejoin chTxtPrep
setChTxt: func [len][
	i: 0
	repeat i len [
		append chTxtPrep reduce [taoFile/:chCounter/2/:i newline] 
		i: i + 1
	]
]

setChTxt length? taoFile/:chCounter/2
print chTxt

mainView: [
	across
    space 0x0
    text "道德經"
    return
    gp: panel 300x900 [
        origin 0x0
		
	]
        ; change me testTxt: text z
    ;on-wheel [
        ;v: (to float! sl/data) + (20.0 / (; change me testTxt/size/y - 300) * event/picked)
        ;sl/data: to percent! min 1.0 max 0.0 v
        ;scroll-text
    ;]
    sl: slider 16x300 ;on-change [scroll-text]
    ;do [sl/data: 100%]
	
]
view/flags mainView [resize]
