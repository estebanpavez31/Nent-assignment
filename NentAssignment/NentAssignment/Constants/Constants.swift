//
//  Constants.swift
//  DaresayAssignment
//
//  Constants file used in the entire app
//
//  Created by Esteban Pavez on 2020-02-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

struct Constants {

    struct Services {
        /// Max time out that will take to call the services in seconds
        static let timeOut = Double(15)
        /// HTTP status code of a successful call
        static let statusCodeSuccess = 200
    }

    struct Table {
        static let cellSection = "viaplaySectionsTableCell"
    }

    struct Storyboard {
        static let main = "Main"
    }

    struct Controller {
        static let viaplayCategoriesController = "viaplayCategoriesController"
    }

}
