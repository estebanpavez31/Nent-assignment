//
//  ViaplaySectionsTableCell.swift
//  NentAssignment
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ViaplaySectionsTableCell: UITableViewCell {

    /// Label with the title of the section
    @IBOutlet weak var lblTitleSection: UILabel!
    /// Label with the type of the section
    @IBOutlet weak var lblType: UILabel!

    var viaplaySection: ViaplaySection! {
        didSet {
            lblTitleSection?.text = viaplaySection.title
            lblType?.text = viaplaySection.type
        }
    }

}
