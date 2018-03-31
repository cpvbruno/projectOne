//
//  Weight.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import RealmSwift

class Weight: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var val = Float()
    @objc dynamic var date = Date()
}
