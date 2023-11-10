//
//  DetailViewController.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/10/23.
//

import UIKit

class DetailViewController: UIViewController {
    var responseData: ResponseData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Example of using responseData to update UI
        if let responseData = responseData {
            print(responseData)
        }
    }
}

