//
//  Util.swift
//  NentAssignment
//
//  Utilities functions that are commonly needed in the entire app
//
//  Created by Esteban Pavez on 2020-02-19.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

struct Util {

    /// Shows in the screen the activity indicator while the products are loading
    /// - Parameters:
    ///   - controller: Controller where is the indicator needs to be shown
    ///   - view: View container with the activity indicator
    ///   - activityIndicator: Activity indicator showing the loading screen
    ///   - labelError: Label with an error string
    ///   - refreshButton: Button that let refresh the view
    static func showActivityIndicator(controller: UIViewController, view: UIView,
                                      activityIndicator: UIActivityIndicatorView, labelError: UILabel, refreshButton: UIButton) {
        controller.view.bringSubviewToFront(view)
        activityIndicator.startAnimating()
        labelError.isHidden = true
        refreshButton.isHidden = true
    }

    /// Hides the activity indicator when the products are already loaded
    /// - Parameters:
    ///   - controller: Controller where is the indicator needs to be hidden
    ///   - view: View container with the activity indicator
    static func hideActivityIndicator(controller: UIViewController, view: UIView) {
        controller.view.sendSubviewToBack(view)
    }

    /// Shows an error in the view
    /// - Parameters:
    ///   - controller: Controller where is the indicator needs to be shown
    ///   - view: View container with the activity indicator
    ///   - activityIndicator: Activity indicator showing the loading screen
    ///   - labelError: Label with an error string
    ///   - refreshButton: Button that let refresh the view
    static func showError(controller: UIViewController, view: UIView,
                          activityIndicator: UIActivityIndicatorView, labelError: UILabel, refreshButton: UIButton) {
        controller.view.bringSubviewToFront(view)
        activityIndicator.stopAnimating()
        labelError.isHidden = false
        refreshButton.isHidden = false
    }
}
