//
//  ViaplayProductTableCell.swift
//  NentAssignment
//
//  Table view cell with the information of the product of the selected section
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

class ViaplayProductTableCell: UITableViewCell {

    /// Label with the title of the product
    @IBOutlet weak var lblTitleProduct: UILabel!
    /// Label with the synopsis of the product
    @IBOutlet weak var lblSynopsis: UILabel!
    /// ImageView with an image of the product
    @IBOutlet weak var imgBoxArt: UIImageView!

    var viaplayProduct: ViaplayProduct! {
        didSet {
            lblTitleProduct.text = viaplayProduct.title
            lblSynopsis.text = viaplayProduct.synopsis
            imgBoxArt.image = viaplayProduct.imageBoxArt
        }
    }

}
