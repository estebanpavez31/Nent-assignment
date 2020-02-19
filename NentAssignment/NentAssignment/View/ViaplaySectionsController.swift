//
//  ViaplaySectionsController.swift
//  NentAssignment
//
//  Class with the main controller of the app, where the sections of Viaplay are shown
//
//  Created by Esteban Pavez on 2020-02-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ViaplaySectionsController: UIViewController {

    /// Label with the title of the current section
    @IBOutlet weak var lblTitleViaplay: UILabel!
    /// Label with the description of the current section
    @IBOutlet weak var lblDescriptionViaplay: UILabel!
    /// Table view with the list of sections
    @IBOutlet weak var tableViewSections: UITableView!
    /// View with an activity indicator used when is loading the products
    @IBOutlet weak var viewLoading: UIView!
    /// Activity indicator inside the loading view
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    /// Button that let refreshes the view
    @IBOutlet weak var btnRefresh: UIButton!
    /// Label that shows the service error
    @IBOutlet weak var lblServiceError: UILabel!

    /// View model to fill the UI of the controller
    var sectionsViaplayViewModel: ViaplaySectionsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        getSections()
    }

    /// Call the service to get the list of sections
    func getSections() {
        Util.showActivityIndicator(controller: self, view: viewLoading, activityIndicator: activityIndicator,
        labelError: lblServiceError, refreshButton: btnRefresh)

        GetSectionsViaPlay.sharedInstance.getSections { sectionsResponse in
            DispatchQueue.main.async {
                guard let sections = sectionsResponse else {
                    Util.showError(controller: self, view: self.viewLoading, activityIndicator: self.activityIndicator,
                                   labelError: self.lblServiceError, refreshButton: self.btnRefresh)

                    return
                }

                self.sectionsViaplayViewModel = ViaplaySectionsViewModel(sections: sections)
                self.fillUI()
                self.tableViewSections.reloadData()
                Util.hideActivityIndicator(controller: self, view: self.viewLoading)
            }
        }
    }

    /// Function that sets the data into the scene
    func fillUI() {
        lblTitleViaplay.text = sectionsViaplayViewModel.titleViaplay
        lblDescriptionViaplay.text = sectionsViaplayViewModel.descriptionViaplay
    }


    /// Call the service again and refresh the view
    /// - Parameter sender: Button that realizes the action
    @IBAction func refreshView(_ sender: Any) {
        getSections()
    }

}

extension ViaplaySectionsController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = sectionsViaplayViewModel else { return 0 }
        return viewModel.sectionsViaplay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Table.cellSection, for: indexPath) as? ViaplaySectionsTableCell

        guard let cellSection = cell, let viewModel = sectionsViaplayViewModel else { return UITableViewCell() }
        
        cellSection.viaplaySection = viewModel.sectionsViaplay[indexPath.row]

        return cellSection
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        let viaplayCategoriesController = storyBoard.instantiateViewController(withIdentifier:
            Constants.Controller.viaplayCategoriesController) as? ViaplayCategoriesController

        guard let categoriesController = viaplayCategoriesController else { return }

        categoriesController.urlcategoryService = sectionsViaplayViewModel.sectionsViaplay[indexPath.row].urlSection
        categoriesController.currentSectionTitle = sectionsViaplayViewModel.sectionsViaplay[indexPath.row].title

        self.present(categoriesController, animated: true, completion: nil)
    }

}
