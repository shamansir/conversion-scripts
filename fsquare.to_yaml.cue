package fsquare

import "encoding/yaml"

let #checkins = response.checkins.items

let #filtered =
    [ for x in #checkins
        {
            id: x.id
            type: x.type
            lat: x.venue.location.lat
            lng: x.venue.location.lng
        }
    ]

to_yaml: yaml.Marshal(#filtered)
