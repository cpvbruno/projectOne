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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButtonView.addGestureRecognizer(UITapGestureRecognizer( target: self, action: #selector(camera)))
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
        baselineImage.image = image
        dismiss(animated:true, completion: nil)
    }
    
}
