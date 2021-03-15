package fsquare

response: checkins: {
    count: int
    items: [...#Checkin]
}

#User: {
    id: string
    firstName: string
    lastName: string
    gender: string
    countryCode: string
    relationship: string
    canonicalUrl: string
    canonicalPath: string
    photo: #Photo
}

#Location: {
    lat: float
    lng: float
    postalCode?: string
    cc: string
    city?: string
    state?: string
    country: string
    contextLine: string
    contextGeoId: int
    formattedAddress: [...string]
    address?: string
    venuePage?: string
    labeledLatLngs: [...#LabeledLatLng]
    neighborhood?: _
    crossStreet?: string
}

#Venue: {
    id: string
    name: string
    location: #Location
    url?: string
    canonicalUrl: string
    canonicalPath: string
    categories: [...#Category]
    verified: bool
    stats: #VenueStats
    beenHere: lastCheckinExpiredAt: int
    canonicalName?: string
    venuePage?: id: string
    menu?: _
    venueRatingBlacklisted?: bool
    inside?: #Venue
    locked?: bool
    storeId?: _
    hasMenu?: bool
}

#Checkin: {
    type: string
    id: string
    canonicalUrl: string
    canonicalPath: string
    timeZoneOffset: int
    exactContextLine?: string
    createdAt: int
    displayGeo: {
        id: string
        name: string
    }
    venue?: #Venue
    likes?: _
    like?: bool
    isMayor?: bool
    sticker?: _
    photos?: _
    posts?: _
    comments?: _
    source?: _
    score?: total: int
    stickerPowerup?: _
    showStickerUpsell?: bool
    entities?: _
    shout?: _
    with?: [...#User]
    overlaps?: #Overlaps
    user?: #User
    createdBy?: #User
}

#Overlaps: {
    count: int
    summary: string
    items: [...#Checkin]
    score?: total: int
}

#Category: {
    id: string
    name: string
    pluralName: string
    shortName: string
    primary: bool
    icon: #Icon
}

#Photo: {
    prefix: string
    suffix: string
}

#Icon: {
    prefix: string
    suffix: string
    mapPrefix: string
}

#VenueStats: {
    tipCount: int
    usersCount: int
    checkinsCount: int
}

#LabeledLatLng: {
    lat: float
    lng: float
    label: string
}
