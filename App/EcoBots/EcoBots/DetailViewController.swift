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
    var capturedImage: UIImage?
    
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var carbonFootprintBtn: UIButton!
    @IBOutlet weak var resourceImpactBtn: UIButton!
    @IBOutlet weak var energySavingsBtn: UIButton!
    @IBOutlet weak var recyclingTipsBtn: UIButton!
    @IBOutlet weak var capturedImageView: UIImageView!
    
    enum DetailViewState {
        case carbonFootprint
        case resourceImpact
        case energySavings
        case recyclingTips
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let responseData = responseData {
            responseLabel.text = responseData.result.response
        }
        if let image = capturedImage {
            capturedImageView.image = image
        } else {
            print("Image is nil")
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
    
    
    
    // passing state, specific json data, and custom modal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecycleInfo",
           let destinationVC = segue.destination as? RecycleInfoViewController {
            destinationVC.modalPresentationStyle = .custom
            destinationVC.transitioningDelegate = customTransitionDelegate
            destinationVC.receivedState = currentState
            switch currentState {
            case .carbonFootprint:
                destinationVC.data = responseData?.result.carbonFootprint
            case .resourceImpact:
                destinationVC.data = responseData?.result.resourceConservation
            case .energySavings:
                destinationVC.data = responseData?.result.energySavings
            case .recyclingTips:
                destinationVC.data = responseData?.result.recyclingTip
            default:
                break
            }
        }
    }
}

