//
//  FixtureConstants.swift
//  NentAssignment
//
//  Constants used in the fixtures classes for unit testing
//
//  Created by Esteban Pavez on 2020-02-19.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct FixtureConstants {

    struct Viaplay {
        static let title = "TV-serier online - Streama serier på nätet eller ladda ned"
        static let description = "Viaplay erbjuder TV-serier på nätet för hela familjen. Streama serier online i hög kvalitet eller ladda ned till tablet eller mobil!"
        static let links = ViaplayLinks(viaplaySections: viaplaySections, viaplayCategoryFilters: viaplayCategoryFilters)
        static let embedded = ViaplayEmbedded(viaplayBlocks: viaplayBlocks)

        static let viaplaySections = [ViaplaySection(title: "Serier", urlSection: "https://content.viaplay.se/ios-se/serier{?dtg}", type: "vod"),
                                      ViaplaySection(title: "Film", urlSection: "https://content.viaplay.se/ios-se/film{?dtg}", type: "vod"),
                                      ViaplaySection(title: "Sport", urlSection: "https://content.viaplay.se/ios-se/sport3{?dtg}", type: "sport")]
        static let viaplayCategoryFilters = [ViaplaySection(title: "Alla serier",
                                                            urlSection: "https://content.viaplay.se/ios-se/serier/samtliga{?dtg}", type: "vod"),
                                             ViaplaySection(title: "Action",
                                                            urlSection: "https://content.viaplay.se/ios-se/serier/action{?dtg}", type: "vod"),
                                             ViaplaySection(title: "Animation",
                                                            urlSection: "https://content.viaplay.se/ios-se/serier/animation{?dtg}", type: "sport")]

        static let viaplayBlocks = [ViaplayBlock(embedded: viaplayBlockEmbedded)]
        static let viaplayBlockEmbedded = ViaplayBlockEmbedded(viaplayProducts: viaplayProducts)
        static let viaplayProducts = [ViaplayProductModel(content: ViaplayProductContent(images: ViaplayProductImages(boxart: ViaplayProductBoxart(url: "https://i-viaplay-com.akamaized.net/viaplay-prod/279/80/GreysAnatomy15_cover.jpg?width=199&height=298&template=abcstudios")),
                                                                                         series: ViaplayProductSeries(title: "Grey's Anatomy"),
                                                                                         synopsis: "Flerfaldigt prisbelönad och högt rankad dramaserie. Läkarna på Seattle Grace Hospital hanterar dagligen liv och död medan de finner tröst, vänskap och romantik hos varandra.",
                                                                                         title: "Grey's Anatomy"))]

    }
}
