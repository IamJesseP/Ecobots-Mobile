//
//  ViewController.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/10/23.
//

import UIKit

class RecycleViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var recycleLabel: UILabel!
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
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            // Handle the error of image conversion
            return
        }
        sendImageToAPI(imageData: imageData, imageName: "photo")

    }

    
    func sendImageToAPI(imageData: Data, imageName: String) {
        let url = URL(string: "http://127.0.0.1:4000/recycle")!
        let request = createMultipartRequest(url: url, imageData: imageData, imageName: imageName)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // Handle error
                print("Error: \(error)")
                return
            }
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                // Process the response
                self.handleServerResponse(data)
            } else {
                print("error")
            }
        }
        task.resume()
    }
    
    func createMultipartRequest(url: URL, imageData: Data, imageName: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()

        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"\(imageName)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        return request
    }


    func handleServerResponse(_ data: Data) {
        do {
            let responseObj = try JSONDecoder().decode(ResponseData.self, from: data)
            let response = responseObj.result

            // Use the response data as needed
//            print("Response: \(response.response)")
//            print("Carbon Footprint: \(response.carbonFootprint)")
//            print("Facts: \(response.facts.joined(separator: ", "))")
//            print("Recycling Tip: \(response.recyclingTip)")
//            print("Resource Conservation: \(response.resourceConservation)")

            // Update UI or perform other actions with the decoded data
            DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "DetailView", sender: responseObj)
                    }
        } catch {
            // Handle JSON parsing error
            print("JSON Error: \(error)")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" { // This should match the identifier used in performSegue
            if let destinationVC = segue.destination as? DetailViewController,
               let dataToSend = sender as? ResponseData {
                destinationVC.responseData = dataToSend
            }
        }
    }


    
    private func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

