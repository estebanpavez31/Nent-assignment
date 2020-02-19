//
//  NentAssignmentTests.swift
//  NentAssignmentTests
//
//  Created by Esteban Pavez on 2020-02-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import XCTest
@testable import NentAssignment

class NentAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Sections View Model Unit Tests

    func testHeaderViaplaySectionsViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let sectionsViewModel = ViaplaySectionsViewModel(sections: sections)

        XCTAssertEqual(sections.title, sectionsViewModel.titleViaplay)
        XCTAssertEqual(sections.description, sectionsViewModel.descriptionViaplay)
    }

    func testCountSectionsCategoriesViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let sectionsViewModel = ViaplaySectionsViewModel(sections: sections)

        XCTAssertEqual(sectionsViewModel.sectionsViaplay.count, 3)
        XCTAssertEqual(sectionsViewModel.categoriesViaplay.count, 3)
    }

    func testNameSectionCategoriesViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let sectionsViewModel = ViaplaySectionsViewModel(sections: sections)

        XCTAssertEqual(sectionsViewModel.sectionsViaplay[0].title, "Serier")
        XCTAssertEqual(sectionsViewModel.categoriesViaplay[0].title, "Alla serier")
    }

    func testTypeSectionCategoriesViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let sectionsViewModel = ViaplaySectionsViewModel(sections: sections)

        XCTAssertEqual(sectionsViewModel.sectionsViaplay[0].type, "vod")
        XCTAssertEqual(sectionsViewModel.categoriesViaplay[0].type, "vod")
    }

    func testURLrefactorSectionCategoriesViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let sectionsViewModel = ViaplaySectionsViewModel(sections: sections)

        XCTAssertEqual(sectionsViewModel.sectionsViaplay[0].urlSection, "https://content.viaplay.se/ios-se/serier")
        XCTAssertEqual(sectionsViewModel.categoriesViaplay[0].urlSection, "https://content.viaplay.se/ios-se/serier/samtliga")
    }

    // MARK: - Products View Model Unit Tests

    func testHeaderViaplayProductsViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let productsViewModel = ViaplayProductsViewModel(sections: sections)

        XCTAssertEqual(sections.description, productsViewModel.descriptionViaplay)
    }

    func testCountProductsViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let productsViewModel = ViaplayProductsViewModel(sections: sections)

        XCTAssertEqual(productsViewModel.productsList.count, 1)
    }

    func testProductTitleViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let productsViewModel = ViaplayProductsViewModel(sections: sections)

        XCTAssertEqual(productsViewModel.productsList[0].title, "Grey's Anatomy")
    }

    func testProductSynopsisTypeViewModel() {
        let sections = SectionsViaplayModel.fixture()
        let productsViewModel = ViaplayProductsViewModel(sections: sections)

        XCTAssertEqual(productsViewModel.productsList[0].synopsis, "Flerfaldigt prisbelönad och högt rankad dramaserie. Läkarna på Seattle Grace Hospital hanterar dagligen liv och död medan de finner tröst, vänskap och romantik hos varandra.")
    }

}
