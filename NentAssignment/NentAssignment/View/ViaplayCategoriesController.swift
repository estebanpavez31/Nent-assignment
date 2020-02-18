//
//  ViaplayCategoriesController.swift
//  NentAssignment
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

    /// View model to fill the UI of the controller
    var categoriesViaplayViewModel: ViaplaySectionsViewModel!
    /// URL to call the service to obtain the list of categories in the section selected
    var urlcategoryService: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        GetSectionsViaPlay.sharedInstance.getSections(urlService: urlcategoryService) { categoriesResponse in
            guard let category = categoriesResponse else { return }

            self.categoriesViaplayViewModel = ViaplaySectionsViewModel(sections: category)
            self.fillUI()
            self.tableViewSections.reloadData()
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
            Constants.Controller.viaplayCategoriesController) as? ViaplayCategoriesController

        guard let categoriesController = viaplayCategoriesController else { return }

        categoriesController.urlcategoryService = categoriesViaplayViewModel.sectionsViaplay[indexPath.row].urlSection

        self.present(categoriesController, animated: true, completion: nil)
    }
}
