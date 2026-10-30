Red [needs: 'View]

t: []
i: 0
loop 100 [append t reduce [i newline] i: i + 1]
z: rejoin t

scroll-text: does [
    testTxt/offset/y: to integer! negate (testTxt/size/y - 300) * (1.0 - to float! sl/data)
]

view [
    across
    space 0x0
    gp: panel 300x300 [
        origin 0x0
        testTxt: text z
    ] on-wheel [
        v: (to float! sl/data) + (20.0 / (testTxt/size/y - 300) * event/picked)
        sl/data: to percent! min 1.0 max 0.0 v
        scroll-text
    ]
    sl: slider 16x300 on-change [scroll-text]
    do [sl/data: 100%]
]
