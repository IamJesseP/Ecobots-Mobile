//
//  DetailViewController.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/10/23.
//

import UIKit

class DetailViewController: UIViewController {
    var responseData: ResponseData?
    var currentState: DetailViewState?
    
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var carbonFootprintBtn: UIButton!
    @IBOutlet weak var resourceImpactBtn: UIButton!
    @IBOutlet weak var energySavingsBtn: UIButton!
    @IBOutlet weak var recyclingTipsBtn: UIButton!
    @IBOutlet weak var factsBtn: UIButton!
    @IBOutlet weak var factsBtn2: UIButton!
    
    enum DetailViewState {
        case carbonFootprint
        case resourceImpact
        case energySavings
        case recyclingTips
        case facts
        case facts2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Example of using responseData to update UI
        if let responseData = responseData {
            responseLabel.text = responseData.result.response
            print(responseData)
        }
    }
    
    @IBAction func carbonFootprintPressed(_ sender: UIButton) {
        currentState = .carbonFootprint
                performSegue(withIdentifier: "RecycleInfo", sender: self)
    }
    
    @IBAction func resourceImpactPressed(_ sender: UIButton) {
        currentState = .resourceImpact
                performSegue(withIdentifier: "RecycleInfo", sender: self)
    }
    
    @IBAction func energySavingsPressed(_ sender: UIButton) {
        currentState = .energySavings
                performSegue(withIdentifier: "RecycleInfo", sender: self)
    }
    
    @IBAction func recyclingTipsPressed(_ sender: UIButton) {
        currentState = .recyclingTips
                performSegue(withIdentifier: "RecycleInfo", sender: self)
    }
    
    @IBAction func factsPressed(_ sender: UIButton) {
        currentState = .facts
                performSegue(withIdentifier: "RecycleInfo", sender: self)
    }
    
    @IBAction func facts2Pressed(_ sender: UIButton) {
        currentState = .facts2
                performSegue(withIdentifier: "RecycleInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecycleInfo",
           let destinationVC = segue.destination as? RecycleInfoViewController {
            switch currentState {
            case .carbonFootprint:
                destinationVC.data = responseData?.result.carbonFootprint
            case .resourceImpact:
                destinationVC.data = responseData?.result.resourceConservation
            case .energySavings:
                destinationVC.data = responseData?.result.energySavings
            case .recyclingTips:
                destinationVC.data = responseData?.result.recyclingTip
            case .facts:
                destinationVC.data = responseData?.result.facts[0]
            default:
                break
            }
        }
    }
}

