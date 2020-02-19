//
//  ViaplayCategoriesController.swift
//  NentAssignment
//
//  Controller with the information of the categories related to the section selected
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ViaplayCategoriesController: UIViewController {
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
    var categoriesViaplayViewModel: ViaplaySectionsViewModel!
    /// URL to call the service to obtain the list of categories in the section selected
    var urlcategoryService: String!
    /// Title with the section selected
    var currentSectionTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        getCategories()
    }

    /// Call the service to get the list of categories
    func getCategories() {

        Util.showActivityIndicator(controller: self, view: viewLoading, activityIndicator: activityIndicator,
        labelError: lblServiceError, refreshButton: btnRefresh)

        GetSectionsViaPlay.sharedInstance.getSections(urlService: urlcategoryService) { categoriesResponse in
            DispatchQueue.main.async {
                guard let category = categoriesResponse else {
                    Util.showError(controller: self, view: self.viewLoading, activityIndicator: self.activityIndicator,
                                   labelError: self.lblServiceError, refreshButton: self.btnRefresh)
                    return
                }

                self.categoriesViaplayViewModel = ViaplaySectionsViewModel(sections: category)
                self.fillUI()
                self.tableViewSections.reloadData()
                Util.hideActivityIndicator(controller: self, view: self.viewLoading)
            }
        }
    }

    /// Function that sets the data into the scene
    func fillUI() {
        lblTitleViaplay.text = categoriesViaplayViewModel.titleViaplay
        lblDescriptionViaplay.text = categoriesViaplayViewModel.descriptionViaplay
    }

    /// Closes the scene and returns to the list of sectiones
    /// - Parameter sender: Button that realizes the action
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


    /// Call the service again and refresh the view
    /// - Parameter sender: Button that realizes the action
    @IBAction func refreshView(_ sender: Any) {
        getCategories()
    }
}

extension ViaplayCategoriesController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = categoriesViaplayViewModel else { return 0 }
        return viewModel.categoriesViaplay.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Table.cellSection,
                                                 for: indexPath) as? ViaplaySectionsTableCell

        guard let cellSection = cell, let viewModel = categoriesViaplayViewModel else { return UITableViewCell() }

        cellSection.viaplaySection = viewModel.categoriesViaplay[indexPath.row]

        return cellSection
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        let viaplayCategoriesController = storyBoard.instantiateViewController(withIdentifier:
            Constants.Controller.viaplayProductsController) as? ViaplayProductsController

        guard let categoriesController = viaplayCategoriesController else { return }

        categoriesController.urlcategoryService = categoriesViaplayViewModel.categoriesViaplay[indexPath.row].urlSection
        categoriesController.currentSectionTitle = categoriesViaplayViewModel.categoriesViaplay[indexPath.row].title

        self.present(categoriesController, animated: true, completion: nil)
    }
}
