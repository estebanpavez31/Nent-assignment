//
//  ViaplayProductsController.swift
//  NentAssignment
//
//  Controller with the list of products of the selected category
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ViaplayProductsController: UIViewController {
    /// Label with the title of the current section
    @IBOutlet weak var lblTitleViaplay: UILabel!
    /// Label with the description of the current section
    @IBOutlet weak var lblDescriptionViaplay: UILabel!
    /// Table view with the list of sections
    @IBOutlet weak var tableViewProducts: UITableView!
    /// View with an activity indicator used when is loading the products
    @IBOutlet weak var viewLoading: UIView!
    /// Activity indicator inside the loading view
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    /// Button that let refreshes the view
    @IBOutlet weak var btnRefresh: UIButton!
    /// Label that shows the service error
    @IBOutlet weak var lblServiceError: UILabel!

    /// View model to fill the UI of the controller
    var productsViaplayViewModel: ViaplayProductsViewModel!
    /// URL to call the service to obtain the list of categories in the section selected
    var urlcategoryService: String!
    /// Title with the section selected
    var currentSectionTitle: String!

    override func viewWillAppear(_ animated: Bool) {
        getProducts()
    }

    /// Call the service to get the list of products
    func getProducts() {
        Util.showActivityIndicator(controller: self, view: viewLoading, activityIndicator: activityIndicator,
                                   labelError: lblServiceError, refreshButton: btnRefresh)

        GetSectionsViaPlay.sharedInstance.getSections(urlService: urlcategoryService) { categoriesResponse in
            DispatchQueue.main.async {

                guard let category = categoriesResponse else {
                    Util.showError(controller: self, view: self.viewLoading, activityIndicator: self.activityIndicator,
                                   labelError: self.lblServiceError, refreshButton: self.btnRefresh)
                    return
                }

                self.productsViaplayViewModel = ViaplayProductsViewModel(sections: category)
                self.fillUI()
                self.tableViewProducts.reloadData()
                Util.hideActivityIndicator(controller: self, view: self.viewLoading)
            }
        }
    }

    /// Function that sets the data into the scene
    func fillUI() {
        lblTitleViaplay.text = currentSectionTitle
        lblDescriptionViaplay.text = productsViaplayViewModel.descriptionViaplay
    }

    /// Refresh the view recalling the services
    /// - Parameter sender: Button that realizes the action
    @IBAction func refreshView(_ sender: Any) {
        getProducts()
    }

    /// Closes the scene and returns to the list of categories
    /// - Parameter sender: Button that realizes the action
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViaplayProductsController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = productsViaplayViewModel else { return 0 }
        return viewModel.productsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Table.cellProduct,
                                                 for: indexPath) as? ViaplayProductTableCell

        guard let cellSection = cell, let viewModel = productsViaplayViewModel else { return UITableViewCell() }

        cellSection.viaplayProduct = viewModel.productsList[indexPath.row]

        return cellSection
    }
}
