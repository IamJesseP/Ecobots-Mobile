//
//  responseData.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/10/23.
//

import Foundation
import UIKit

struct ResponseData: Codable {
    struct Result: Codable {
        let response: String
        let carbonFootprint: String
        let facts: [String]
        let recyclingTip: String
        let energySavings: String
        let resourceConservation: String
    }

    let result: Result
}
