//
//  ViaplayProductsController.swift
//  NentAssignment
//
//  
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

    /// View model to fill the UI of the controller
    var productsViaplayViewModel: ViaplayProductsViewModel!
    /// URL to call the service to obtain the list of categories in the section selected
    var urlcategoryService: String!
    /// Title with the section selected
    var currentSectionTitle: String!

    override func viewWillAppear(_ animated: Bool) {

        GetSectionsViaPlay.sharedInstance.getSections(urlService: urlcategoryService) { categoriesResponse in
            guard let category = categoriesResponse else { return }

            self.productsViaplayViewModel = ViaplayProductsViewModel(sections: category)
            self.fillUI()
            self.tableViewProducts.reloadData()
        }
    }

    /// Function that sets the data into the scene
    func fillUI() {
        lblTitleViaplay.text = currentSectionTitle
        lblDescriptionViaplay.text = productsViaplayViewModel.descriptionViaplay
    }

    /// Closes the scene and returns to the list of sectiones
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
