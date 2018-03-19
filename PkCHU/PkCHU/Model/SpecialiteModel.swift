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
        let entity = CoreDataManager.entity(forName: "Specialite")
        self.dao = Specialite(entity: entity, insertInto: CoreDataManager.context)
        self.dao.libelle=libelle
    }
}
