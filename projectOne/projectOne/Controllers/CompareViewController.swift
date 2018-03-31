//
//  CompareViewController.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import UIKit

class CompareViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraButtonView: UIView!
    @IBOutlet weak var baselineImage: UIImageView!
    @IBOutlet weak var compareImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButtonView.addGestureRecognizer(UITapGestureRecognizer( target: self, action: #selector(camera)))
        getBaseline()
    }
    
    func getBaseline() {
        if UserDefaults.standard.object(forKey: "baseline") != nil {
            let data = UserDefaults.standard.string(forKey: "baseline")
            let dataDecoded : Data = Data(base64Encoded: data!, options: .ignoreUnknownCharacters)!
            compareImage.image = UIImage(data: dataDecoded)
        }
    }
    
    @objc func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: {
                print("Worked")
            })
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        if UserDefaults.standard.object(forKey: "baseline") != nil {
            UserDefaults.standard.set(base64(image: image, format: ImageFormat.png), forKey: "compareImage")
            compareImage.image = image
        } else {
            UserDefaults.standard.set(base64(image: image, format: ImageFormat.png), forKey: "baseline")
            baselineImage.image = image
        }
        dismiss(animated:true, completion: nil)
    }
    
    public enum ImageFormat {
        case png
        case jpeg(CGFloat)
    }
    
    public func base64(image: UIImage, format: ImageFormat) -> String? {
        var imageData: Data?
        switch format {
        case .png: imageData = UIImagePNGRepresentation(image)
        case .jpeg(let compression): imageData = UIImageJPEGRepresentation(image, compression)
        }
        return imageData?.base64EncodedString()
    }

    
}
