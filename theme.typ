#let color = (
	primary: rgb(0, 91, 148),
	primary_c: rgb(148, 57, 0),
	secondary: rgb(152, 125, 28),
	secondary_c: rgb(28,55,152),
	text: rgb(32, 56, 100),
	text_c: rgb(100, 76, 32),
)

#let titech-theme(lang: "jp") = data => {  
    let scriptsize = 8pt
    let flag = image.with("img/flag.svg")
    let _top_bar = place(top, rect(width: 100%, height: .41cm, fill: color.secondary, stroke: none))

    let logical-slide = counter("logical-slide")

    let alert(background: none, slide-info, bodies) = {
        if bodies.len() != 1 {
            panic("default variant of default theme only supports one body per slide")
        }
        let body = bodies.first()
        set text(lang: lang, font: ("Noto Sans CJK JP", "Noto Sans"))

        //background
        if background != none {
            place(background)
        }

        //header
		_top_bar + place(top+center, flag(width: if data.aspect-ratio == "16-9" {3/4} else {1} * 12.126%))

        align(center + horizon, block(breakable: false, body))
    }

    let title-slide(slide-info, bodies) = {
        if bodies.len() != 0 {
            panic("title slide does not allow any body")
        }

        alert(background: image("img/bg_" + data.aspect-ratio + ".jpg"), slide-info, ([
            #text(1.44em)[*#data.title*]

            #line(length: 25.66cm, stroke: .55pt)

            #{
                set text(size: .8em)

                if data.subtitle != none {
                    text[*#data.subtitle*]
                }
            }

            #grid(
                columns: (1fr,) * calc.min(data.authors.len(), 3),
                column-gutter: 1em,
                row-gutter: 1em,
                [#data.authors.at(0).dep\ #text(1.28em, data.authors.at(0).name)]
            )
            #v(1em)
        ],))
    }

    let thanks(slide-info, bodies) = {
        if bodies.len() > 1 {
            panic("you cannot input bodies more than 1")
        }
        set text(1.28em, lang: lang, weight: "bold")

        let content = if lang == "jp" [ご清聴ありがとうございました] 
                 else if lang == "en" [Thanks for your listening!]
        let body = bodies.at(0, default: content)

        alert(
            background: place(bottom, image("img/bg_thanks_" + data.aspect-ratio + ".jpg")), 
            slide-info,
            (move(dy: -1.88cm, body),)
        )
    }

    let default(slide-info, bodies) = {
        set text(color.text, lang: lang, font: ("Noto Sans CJK JP", "Noto Sans"))
        set strong(delta: 100)

        if bodies.len() != 1 {
            panic("default variant of default theme only supports one body per slide")
        }
        let body = bodies.first()

        // header
        _top_bar + place(top+left, dx: 91%, flag(width: if data.aspect-ratio == "19-6" {86.84%} else {1} * 6.5%))
        
        v(1em)

        if "title" in slide-info {
            block(
                width: 100%, breakable: false,
                inset: (x: 1em), outset: 0em,
                heading(level: 1, slide-info.title)
            )
        }
        
        v(1fr)
        block(
            width: 100%, inset: (x: 2em), breakable: false, outset: 0em,
            body
        )
        v(2fr)

        // footer
        place(bottom + right, dx: -.4em, dy: -.5em, text(.9em, logical-slide.display()))
    }

    let wake-up(slide-info, bodies) = {
        set text(color.text, lang: lang, font: ("Noto Sans CJK JP", "Noto Sans"))

        if bodies.len() != 1 {
            panic("wake up variant of default theme only supports one body per slide")
        }
        let body = bodies.first()

        block(
            width: 100%, height: 100%, inset: 2em, breakable: false, outset: 0em,
            fill: color.secondary,
            text(size: 1.5em, fill: white, {v(1fr); body; v(1fr)})
        )
    }

    (
        "alert": alert,
        "title slide": title-slide,
        "thanks": thanks,
        "default": default,
        "wake up": wake-up,
    )
}

#let project(
    title: none,
    authors: none,
    subtitle: none,
    date: none,
    lang: "jp",
    aspect-ratio: "4-3",
    handout: false,
    slides,
    body
) = {
    show: slides.with(
        authors: authors,
	    theme: titech-theme(lang: lang),
        title: [Report about the principle of MMI],
        subtitle: subtitle,
        date: date,
        handout: handout,
        aspect-ratio: aspect-ratio,
    )

    set text(if aspect-ratio == "16-9" {20pt} else {24pt})
    show link: set text(color.text_c)
    show raw: set text(font: "JuliaMono")

    body
}