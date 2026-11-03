Red [needs: 'View]

mainView: [
    title "Resize test"
    on-resizing [
        print ["resizing:" face/size]
        p/size: face/size - 20x20
        b/3: face/size - 50x50
    ]
    on-resize [
        print ["resize finished:" face/size ]
    ]
    p: panel 300x300 blue draw [
        b: box 30x30 290x290
    ]
]

view/flags mainView [resize]
