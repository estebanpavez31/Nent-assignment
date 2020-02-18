//
//  ViaplaySectionsViewModel.swift
//  NentAssignment
//
//  View Model to fill the UI of the Viaplay Sections View Controller
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct ViaplaySectionsViewModel {
    var sectionsViaplay = [ViaplaySection]()
    var titleViaplay: String!
    var descriptionViaplay: String!

    init(sections: SectionsViaplayModel) {
        setHeaderData(sections: sections)
        setViaplaySections(sections: sections)
    }


    /// Set the data on the header of the scene, over the list of sections
    /// - Parameter sections: Model with the response of the service with the info of Viaplay
    mutating func setHeaderData(sections: SectionsViaplayModel) {
        if let title = sections.title {
            titleViaplay = title
        }
        if let description = sections.description {
            descriptionViaplay = description
        }
    }

    /// Set the data of with the sections list
    /// - Parameter sections: Model with the response of the service with the info of Viaplay
    mutating func setViaplaySections(sections: SectionsViaplayModel) {
        if let sectionsLinks = sections.links {
            if let sectionsCategories = sectionsLinks.viaplaySections {
                sectionsViaplay = sectionsCategories
            }
        }
    }
}
