//
//  Context.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import Foundation

class General: NSObject {
    static let selfies = SelfieService().getAll()
    static let baselineSelfie = SelfieService().getBaseline()
    static let actualSelfie = SelfieService().getActualSelfie()
}
