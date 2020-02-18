//
//  ViaplayProductsViewModel.swift
//  NentAssignment
//
//  View Model to fill the UI of the Viaplay Products View Controller
//
//  Created by Esteban Pavez on 2020-02-18.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import UIKit

struct ViaplayProductsViewModel {
    var descriptionViaplay: String!
    var productsList = [ViaplayProduct]()

    init(sections: SectionsViaplayModel) {
        setDescription(sections: sections)
        
        let viaPlayProducts = validateModel(sections: sections)
        if viaPlayProducts.isEmpty { return }

        generateProductList(viaPlayProducts: viaPlayProducts)
    }

    /// Validates the different levels of the model if there is someone Nil
    /// - Parameter sections: Model with the data to fill the UI
    func validateModel(sections: SectionsViaplayModel) -> [ViaplayProductModel] {
        guard let embedded = sections.embedded else { return [] }
        guard let block = embedded.viaplayBlocks else { return [] }
        guard let products = block[0].embedded else { return [] }
        guard let viaPlayProducts = products.viaplayProducts else { return [] }

        return viaPlayProducts
    }

    /// Generates the array with the list of products shown in the last scene
    /// - Parameter viaPlayProducts: Array with the products of the model
    mutating func generateProductList(viaPlayProducts: [ViaplayProductModel]) {
        for product in viaPlayProducts {
            guard let content = product.content else { continue }

            let titleProduct = setTitle(content: content)
            let synopsisProduct = setSynopsis(content: content)
            let imageProduct = setImage(content: content)

            self.productsList.append(ViaplayProduct(title: titleProduct, synopsis: synopsisProduct, imageBoxArt: imageProduct))
        }
    }

    /// Validates and sets the description of the current section
    /// - Parameter sections: Sections model with the info to fill UI
    mutating func setDescription(sections: SectionsViaplayModel) {
        if let description = sections.description {
            self.descriptionViaplay = description
        }
    }

    /// Validates and sets the image of the product
    /// - Parameter content: Content model with the data to get the image
    func setImage(content: ViaplayProductContent) -> UIImage {
        guard let image = content.images else { return UIImage() }
        guard let boxart = image.boxart else { return UIImage() }
        guard let url = boxart.url else { return UIImage() }

        let imageURL = URL(string: url) ?? URL(fileURLWithPath: "")

        // Set image from URL
        let imageData = try? Data(contentsOf: imageURL)
        if let imageData = imageData {
            return UIImage(data: imageData) ?? UIImage()
        } else {
            return UIImage()
        }
    }

    /// Validates and sets the title of the product
    /// - Parameter content: Content model with the data to get the Title of the product
    func setTitle(content: ViaplayProductContent) -> String {
        /// Sets where title parameter to take (in some cases there is a "title" in the first level, and in other into the "series" level)
        if let title = content.title {
            return title
        } else {
            guard let series = content.series else { return String() }
            guard let title = series.title else { return String() }
            return title
        }
    }

    /// Validates and sets the synopsis of the product
    /// - Parameter content: Content model with the data to get the synopsis of the product
    func setSynopsis(content: ViaplayProductContent) -> String {
        guard let synopsis = content.synopsis else { return String() }

        return synopsis
    }
}
