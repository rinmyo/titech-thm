#import "theme.typ": *

#show: project.with(
    authors: ((affiliation: "所属など", name: "氏名氏名氏名"),),
    lang: "jp",     //"jp" for japnese, "en" for english. thanks page will be changed perspectively
    title: [タイトルタイトルタイトル\ タイトルタイトルタイトル],
    subtitle: "開催日時、場所、サブタイトル等",
    date: "April 2023",
    aspect-ratio: "4-3",
)

#slide(theme-variant: "title slide")

#new-section("Introduction")

#slide(title: "流れ")[
    + 一番目

    + 二番目

    + 三番目
]

#slide(title: "数式テスト")[
    $ a^2 + b^2 = c^2 $
    $sqrt(2) eq.not 1.414$
]

#set math.equation(numbering: "(1)")

#slide(theme-variant: "thanks")
