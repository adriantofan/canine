module Assets exposing (..)

import Html exposing (Html)
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr


logoSvg =
    svg
        [ SvgAttr.class "h-7 w-7 text-blue-600"
        , SvgAttr.fill "currentColor"
        , SvgAttr.strokeWidth "1"
        , SvgAttr.viewBox "0 0 24 24"
        ]
        [ path
            [ SvgAttr.d "M20.553 3.105l-6 3C11.225 7.77 9.274 9.953 8.755 12.6c-.738 3.751 1.992 7.958 2.861 8.321A.985.985 0 0012 21c6.682 0 11-3.532 11-9 0-6.691-.9-8.318-1.293-8.707a1 1 0 00-1.154-.188zm-7.6 15.86a8.594 8.594 0 015.44-8.046 1 1 0 10-.788-1.838 10.363 10.363 0 00-6.393 7.667 6.59 6.59 0 01-.494-3.777c.4-2 1.989-3.706 4.728-5.076l5.03-2.515A29.2 29.2 0 0121 12c0 4.063-3.06 6.67-8.046 6.965zM3.523 5.38A29.2 29.2 0 003 12a6.386 6.386 0 004.366 6.212 1 1 0 11-.732 1.861A8.377 8.377 0 011 12c0-6.691.9-8.318 1.293-8.707a1 1 0 011.154-.188l6 3A1 1 0 018.553 7.9z"
            ]
            []
        ]


newConversationSvg : Html msg
newConversationSvg =
    svg
        [ SvgAttr.class "h-6 w-6"
        , SvgAttr.viewBox "0 0 24 24"
        , SvgAttr.strokeWidth "2"
        , SvgAttr.stroke "currentColor"
        , SvgAttr.fill "none"
        , SvgAttr.strokeLinecap "round"
        , SvgAttr.strokeLinejoin "round"
        ]
        [ path
            [ SvgAttr.stroke "none"
            , SvgAttr.d "M0 0h24v24H0z"
            , SvgAttr.fill "none"
            ]
            []
        , path
            [ SvgAttr.d "M8 9h8"
            ]
            []
        , path
            [ SvgAttr.d "M8 13h6"
            ]
            []
        , path
            [ SvgAttr.d "M12.01 18.594l-4.01 2.406v-3h-2a3 3 0 0 1 -3 -3v-8a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v5.5"
            ]
            []
        , path
            [ SvgAttr.d "M16 19h6"
            ]
            []
        , path
            [ SvgAttr.d "M19 16v6"
            ]
            []
        ]


conversationSvg =
    svg
        [ SvgAttr.class "h-6 w-6"
        , SvgAttr.viewBox "0 0 24 24"
        , SvgAttr.strokeWidth "2"
        , SvgAttr.stroke "currentColor"
        , SvgAttr.fill "none"
        , SvgAttr.strokeLinecap "round"
        , SvgAttr.strokeLinejoin "round"
        ]
        [ path
            [ SvgAttr.stroke "none"
            , SvgAttr.d "M0 0h24v24H0z"
            , SvgAttr.fill "none"
            ]
            []
        , path
            [ SvgAttr.d "M21 14l-3 -3h-7a1 1 0 0 1 -1 -1v-6a1 1 0 0 1 1 -1h9a1 1 0 0 1 1 1v10"
            ]
            []
        , path
            [ SvgAttr.d "M14 15v2a1 1 0 0 1 -1 1h-7l-3 3v-10a1 1 0 0 1 1 -1h2"
            ]
            []
        ]


discoverSvg =
    svg
        [ SvgAttr.class "h-6 w-6"
        , SvgAttr.viewBox "0 0 24 24"
        , SvgAttr.strokeWidth "2"
        , SvgAttr.stroke "currentColor"
        , SvgAttr.fill "none"
        , SvgAttr.strokeLinecap "round"
        , SvgAttr.strokeLinejoin "round"
        ]
        [ path
            [ SvgAttr.stroke "none"
            , SvgAttr.d "M0 0h24v24H0z"
            , SvgAttr.fill "none"
            ]
            []
        , path
            [ SvgAttr.d "M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0"
            ]
            []
        , path
            [ SvgAttr.d "M21 21l-6 -6"
            ]
            []
        ]


userSvg =
    svg
        [ SvgAttr.class "h-6 w-6"
        , SvgAttr.viewBox "0 0 24 24"
        , SvgAttr.strokeWidth "2"
        , SvgAttr.stroke "currentColor"
        , SvgAttr.fill "none"
        , SvgAttr.strokeLinecap "round"
        , SvgAttr.strokeLinejoin "round"
        ]
        [ path
            [ SvgAttr.stroke "none"
            , SvgAttr.d "M0 0h24v24H0z"
            , SvgAttr.fill "none"
            ]
            []
        , path
            [ SvgAttr.d "M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"
            ]
            []
        , path
            [ SvgAttr.d "M12 10m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"
            ]
            []
        , path
            [ SvgAttr.d "M6.168 18.849a4 4 0 0 1 3.832 -2.849h4a4 4 0 0 1 3.834 2.855"
            ]
            []
        ]


settingsSvg =
    svg
        [ SvgAttr.class "h-6 w-6"
        , SvgAttr.viewBox "0 0 24 24"
        , SvgAttr.strokeWidth "2"
        , SvgAttr.stroke "currentColor"
        , SvgAttr.fill "none"
        , SvgAttr.strokeLinecap "round"
        , SvgAttr.strokeLinejoin "round"
        ]
        [ path
            [ SvgAttr.stroke "none"
            , SvgAttr.d "M0 0h24v24H0z"
            , SvgAttr.fill "none"
            ]
            []
        , path
            [ SvgAttr.d "M19.875 6.27a2.225 2.225 0 0 1 1.125 1.948v7.284c0 .809 -.443 1.555 -1.158 1.948l-6.75 4.27a2.269 2.269 0 0 1 -2.184 0l-6.75 -4.27a2.225 2.225 0 0 1 -1.158 -1.948v-7.285c0 -.809 .443 -1.554 1.158 -1.947l6.75 -3.98a2.33 2.33 0 0 1 2.25 0l6.75 3.98h-.033z"
            ]
            []
        , path
            [ SvgAttr.d "M12 12m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"
            ]
            []
        ]
