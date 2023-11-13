//
//  ViewController.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/10/23.
//

import UIKit

class RecycleInfoViewController: UIViewController {
    var data: String?
    var receivedState : DetailViewController.DetailViewState?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var infoTextView2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleDismissalPanGesture(_:)))
                view.addGestureRecognizer(panGesture)
        
        guard let state = receivedState else { return }

                switch state {
                    case .carbonFootprint:
                        titleLabel.text = "Carbon Footprint"
                        infoTextView.text = data
                    case .resourceImpact:
                        titleLabel.text = "Resource Impact"
                        infoTextView.text = data
                    case .energySavings:
                        titleLabel.text = "Energy Savings"
                        infoTextView.text = data
                    case .recyclingTips:
                        titleLabel.text = "Recycling Tips"
                        infoTextView.text = data
                }
    }
    
    @objc private func handleDismissalPanGesture(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            // Adjust this threshold as necessary
            if translation.y > 25 {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
