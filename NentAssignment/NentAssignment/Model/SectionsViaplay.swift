//
//  SectionsViaplay.swift
//  NentAssignment
//
//  Created by Esteban Pavez on 2020-02-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

// MARK: - SectionsViaplay
struct SectionsViaplay: Decodable {
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

// MARK: - ViaplaySection
struct ViaplaySection: Decodable {
    var title, href, type: String?
}

// MARK: - SectionsViaplayEmbedded
struct ViaplayEmbedded: Decodable {
    var viaplayBlocks: [ViaplayBlock]?
}

// MARK: - ViaplayBlock
struct ViaplayBlock: Decodable {
    var embedded: ViaplayBlockEmbedded?
}

// MARK: - ViaplayBlockEmbedded
struct ViaplayBlockEmbedded: Decodable {
    var viaplayProducts: [ViaplayProduct]?
}

// MARK: - ViaplayProduct
struct ViaplayProduct: Decodable {
    var content: ViaplayProductContent?
}

// MARK: - Content
struct ViaplayProductContent: Decodable {
    var images: ViaplayProductImages?
    var series: ViaplayProductSeries?
}

// MARK: - Images
struct ViaplayProductImages: Decodable {
    var boxart: ViaplayProductBoxart?
}

// MARK: - Boxart
struct ViaplayProductBoxart: Decodable {
    var url: String?
}

// MARK: - Series
struct ViaplayProductSeries: Decodable {
    var title, synopsis: String?
}
