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

    /// View model to fill the UI of the controller
    var sectionsViaplayViewModel: ViaplaySectionsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        GetSectionsViaPlay.sharedInstance.getSections { sectionsResponse in
            guard let sections = sectionsResponse else { return }

            self.sectionsViaplayViewModel = ViaplaySectionsViewModel(sections: sections)
            self.fillUI()
            self.tableViewSections.reloadData()
        }
    }

    /// Function that sets the data into the scene
    func fillUI() {
        lblTitleViaplay.text = sectionsViaplayViewModel.titleViaplay
        lblDescriptionViaplay.text = sectionsViaplayViewModel.descriptionViaplay
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

        self.present(categoriesController, animated: true, completion: nil)
    }

}
