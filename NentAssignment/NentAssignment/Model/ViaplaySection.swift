//
//  ViaplaySection.swift
//  NentAssignment
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

// MARK: - ViaplaySection
struct ViaplaySection: Decodable {
    var title, urlSection, type: String?

    enum CodingKeys: String, CodingKey {
        case title, type
        case urlSection = "href"
    }
}

