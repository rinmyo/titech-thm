#import "typst-slides/slides.typ": *
#import "theme.typ": titech-theme, color, project

#show: project.with(
    slides,
    authors: ((affiliation: "Your Affiliation", name: "Your Name"),),
    lang: "en",
    title: [Report about the principle of MMI\ Report about the principle of MMI],
    subtitle: "開催日時、場所、サブタイトル等",
    date: "April 2023",
    aspect-ratio: "4-3",
)

#slide(theme-variant: "title slide")

#new-section("Introduction")

#slide(title: "Process")[
    + the first step

    + the second step

    + the third step
]

#slide(title: "モードの導出")[
    $ a^2 + b^2 = c^2 $
    $sqrt(2) eq.not 1.414$
]

#set math.equation(numbering: "(1)")


#slide(theme-variant: "thanks")