Red [needs 'View]

file: load %chapters.red
txt: file/1/2/1
boxBlock: [size 300x300]
addBox: func [chLength][
    i: 1
    repeat i chLength [
        txt: file/1/2/:i
        append boxBlock compose [box 30x50 (to-string txt) return]
    ]
]

addBox length? file/1/2

view boxBlock

comment {
    b: [tab-panel 300x300 [ "tab a" [box blue 10x10]]]
    loop 3 [append b/3/2 [box red 10x10]]
    view b
}
