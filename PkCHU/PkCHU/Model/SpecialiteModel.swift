//
//  SpecialiteModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SpecialiteModel{
    private var dao : Specialite
    
    var libelle: String {
        get{
            return self.dao.libelle!
        }
        set{
            self.dao.libelle = newValue
        }
    }
    
    init(libelle : String){
        self.dao = Specialite.create()
        self.dao.libelle=libelle
    }
}
