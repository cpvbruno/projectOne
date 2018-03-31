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
        if General.baselineSelfie != nil {
            baselineImage.image = UIImage(data: General.baselineSelfie?.image as! Data)
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
        handleSelfie(image: image)
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
    
    private func handleSelfie(image: UIImage) {
        let service = SelfieService()
        if General.baselineSelfie != nil {
            let newActualSelfie = Selfie()
            newActualSelfie.isActualCompare = true
            newActualSelfie.image = NSData(data: UIImagePNGRepresentation(image)!)
            service.save(obj: newActualSelfie)
        } else {
            let newBaseline = Selfie()
            newBaseline.isBaseline = true
            newBaseline.image = NSData(data: UIImagePNGRepresentation(image)!)
            service.save(obj: newBaseline)
        }
    }
    
}
