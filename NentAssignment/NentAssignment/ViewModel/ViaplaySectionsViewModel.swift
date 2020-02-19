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
    var categoriesViaplay = [ViaplaySection]()
    var titleViaplay: String!
    var descriptionViaplay: String!

    init(sections: SectionsViaplayModel) {
        setHeaderData(sections: sections)
        setViaplaySections(sections: sections)
        setViaplayCategories(sections: sections)
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
            if let sectionsViaplay = sectionsLinks.viaplaySections {
                self.sectionsViaplay = sectionsViaplay

                for (index, section) in self.sectionsViaplay.enumerated() {
                    guard let sectionUrl = section.urlSection else { continue }
                    self.sectionsViaplay[index].urlSection = sectionUrl.replacingOccurrences(of: "{?dtg}", with: "")
                }

            }
        }
    }

    /// Set the data of with the categories list
    /// - Parameter sections: Model with the response of the service with the info of Viaplay
    mutating func setViaplayCategories(sections: SectionsViaplayModel) {
        if let sectionsLinks = sections.links {
            if let categoriesViaplay = sectionsLinks.viaplayCategoryFilters {
                self.categoriesViaplay = categoriesViaplay

                for (index, section) in self.categoriesViaplay.enumerated() {
                    guard let sectionUrl = section.urlSection else { continue }
                    self.categoriesViaplay[index].urlSection = sectionUrl.replacingOccurrences(of: "{?dtg}", with: "")
                }
            }
        }
    }

}
