package fsquare

import "strings"

let #checkins = response.checkins.items

let #filtered =
    [ for x in #checkins
        { "<id attr=\"test\">\(x.id)</id>"
        }
    ]

to_xml: "<xml>\(strings.Join(#filtered, "\n"))</xml>"
