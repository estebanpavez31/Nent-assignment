//
//  ViaplaySection-fixture.swift
//  NentAssignmentTests
//
//  Fixture for unit testing Sections and Products model view
//
//  Created by Esteban Pavez on 2020-02-19.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation
import XCTest

@testable import NentAssignment

extension SectionsViaplayModel {

    static func fixture(title: String = FixtureConstants.Viaplay.title,
                        description: String = FixtureConstants.Viaplay.description,
                        links: ViaplayLinks = FixtureConstants.Viaplay.links,
                        embedded: ViaplayEmbedded = FixtureConstants.Viaplay.embedded) -> SectionsViaplayModel {

        return SectionsViaplayModel(title: title, description: description, links: links, embedded: embedded)
    }
}
