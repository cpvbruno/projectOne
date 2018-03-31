//
//  SelfiesService.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import Foundation
import RealmSwift

class SelfieService: Database<Selfie> {
    
    func getBaseline() -> Selfie? {
        var result = Selfie()
        
        if let rm = realm {
            do {
                try rm.write() {
                    let filter = NSPredicate(format: "isBaseline = true")
                    let results = rm.objects(Selfie.self).filter(filter)
                    if let first = results.first {
                       result = first
                    }
                }
            } catch {
                //empty
            }
        }
        return nil
    }
    
    func getActualSelfie() -> Selfie? {
        var result = Selfie()
        
        if let rm = realm {
            do {
                try rm.write() {
                    let filter = NSPredicate(format: "isActualCompare = true")
                    let results = rm.objects(Selfie.self).filter(filter)
                    if let first = results.first {
                        result = first
                    }
                }
            } catch {
                //empty
            }
        }
        return nil
    }
}
