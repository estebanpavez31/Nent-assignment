//
//  SectionsViaplayModel.swift
//  NentAssignment
//
//  Created by Esteban Pavez on 2020-02-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

// MARK: - SectionsViaplay
struct SectionsViaplayModel: Decodable {
    var title, description: String?
    var links: ViaplayLinks?
    var embedded: ViaplayEmbedded?

    enum CodingKeys: String, CodingKey {
        case title, description
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - Links
struct ViaplayLinks: Decodable {
    var viaplaySections: [ViaplaySection]?
    var viaplayCategoryFilters: [ViaplaySection]?

    enum CodingKeys: String, CodingKey {
        case viaplaySections = "viaplay:sections"
        case viaplayCategoryFilters = "viaplay:categoryFilters"
    }
}

// MARK: - SectionsViaplayEmbedded
struct ViaplayEmbedded: Decodable {
    var viaplayBlocks: [ViaplayBlock]?
}
