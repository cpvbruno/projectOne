//
//  BaseViewController.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
}
