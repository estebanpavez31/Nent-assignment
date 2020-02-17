//
//  GetSectionsViaPlay.swift
//  NentAssignment
//
//  Services class to obtain the data of the Sections from OpenSections
//
//  Created by Esteban Pavez on 2020-02-17.
//  Copyright © 2020 Esteban Pavez. All rights reserved.
//

import Foundation

typealias ServiceResponse = (Data?, NSError?) -> Void

class GetSectionsViaPlay: NSObject, URLSessionDelegate {
    static let sharedInstance = GetSectionsViaPlay()

    /// Call the service via a HTTP GET request and get the json with the data of the Sections
    /// - Parameter onCompletion: Sections object with its data
    func getSections(onCompletion: @escaping (SectionsViaplay?) -> Void) {
        let baseURL = URLServices.urlAPIViaPlay

        let urlComponents = URLComponents(string: baseURL)!

        // Do service call via HTTP Get request
        UtilServices.makeHTTPGetRequest(self, urlComponents: urlComponents,
                                        onCompletion: { data, _ in
                                            onCompletion(self.parsingJSON(data: data))
        })
    }

    /// Parse JSON obtained from service call to transform it to a Sections Object
    /// - Parameter data: Data with json response
    func parsingJSON(data: Data?) -> SectionsViaplay? {
        guard data != nil else {
            return nil
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let sections = try decoder.decode(SectionsViaplay.self, from: data ?? Data())

            Logger.log("Parsing Sections Succeded")

            return sections
        } catch {
            Logger.log("Parsing Sections Failed")
            Logger.log(error.localizedDescription)

            return nil
        }
    }
}
