package fsquare

import "strings"

let #checkins = response.checkins.items

let #placemarks =
    [ for x in #checkins
        { """
            <Placemark>
                <id>\(x.id)</id>
                <name>\(x.venue.name)</name>
                <description>\(*x.venue.location.address | "Unknown")</description>
                <Point>
                    <coordinates>\(x.venue.location.lat),\(x.venue.location.lng),0</coordinates>
                </Point>
            </Placemark>
            """
        }
    ]

to_xml: """
    <?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <kml xmlns=\"http://www.opengis.net/kml/2.2\">
        \(strings.Join(#placemarks, "\n"))
    </kml>
    """
