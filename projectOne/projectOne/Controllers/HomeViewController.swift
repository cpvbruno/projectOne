//
//  SecondViewController.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var compareView: UIView!
    
    var currentWeight = Weight()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weightTap = UITapGestureRecognizer(target: self, action: #selector(updateWeight))
        weightView.addGestureRecognizer(weightTap)
        
        let compareTap = UITapGestureRecognizer(target: self, action: #selector(pushCompare))
        compareView.addGestureRecognizer(compareTap)
        
        getActualWeight()
    }
    
    func getActualWeight() {
        let service = WeightService()
        let historic = service.getLastOrDefault()
        if historic != nil {
            self.currentWeight = historic as! Weight
            weightValue.text = String(currentWeight.val)
        }
    }
    
    @objc func pushCompare() {
        let mapViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "compare") as? CompareViewController
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
    }
    
    @objc func updateWeight() {
        let alert = UIAlertController(title: "Atualizar Peso", message: "Peso atual", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            if self.currentWeight.val > 0.00 {
                textField.text = String(self.currentWeight.val)
            }
            textField.keyboardType = .numbersAndPunctuation
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Atualizar", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let weight = textField?.text
            if let weightValue = weight?.floatValue {
                self.newWeight(weight: weightValue)
            }
            self.getActualWeight()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func newWeight(weight: Float) {
        let weightObj = Weight()
        weightObj.val = weight
        let service = WeightService()
        service.save(obj: weightObj)
    }
    
}

