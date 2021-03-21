package fsquare

import "strings"

let #checkins = response.checkins.items

let #filtered =
    [ for x in #checkins { x.id }
    ]

to_xml: "\(strings.Join(#filtered, "\n"))"
