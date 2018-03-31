//
//  Selfies.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import RealmSwift

class Selfie: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var image = NSData()
    @objc dynamic var isBaseline = false
    @objc dynamic var isActualCompare = false
    @objc dynamic var date = Date()
}
