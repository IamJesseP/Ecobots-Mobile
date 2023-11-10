//
//  ViewController.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/10/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recycleButton(_ sender: Any) {
        #if targetEnvironment(simulator)
        // Use a mock image when running on the simulator
        self.handleCapturedImage(UIImage(named: "MockImage")!)
        #else
        // Camera functionality for real devices
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true, completion: nil)
        } else {
            // Handle the error - alert the user that the camera is not available
            showAlert(withTitle: "Error", message: "Camera is not available")
        }
        #endif
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let capturedImage = info[.originalImage] as? UIImage {
            handleCapturedImage(capturedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    private func handleCapturedImage(_ image: UIImage) {
        print("Image captured")
        // Do something with the image, e.g., display it in a UIImageView
    }

    private func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

