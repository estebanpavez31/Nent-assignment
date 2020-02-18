//
//  ViaplayProduct.swift
//  NentAssignment
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

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
