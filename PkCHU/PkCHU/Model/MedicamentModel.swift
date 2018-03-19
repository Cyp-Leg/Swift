//
//  ActiviteModel.swift
//  PkCHU
//
//  Created by cyp on 12/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MedicamentModel{
    private var dao : Medicament
    
    var nom: String {
        get{
            return self.dao.nom!
        }
        set{
            self.dao.nom = newValue
        }
    }
    
    var dose: Float {
        get{
            return self.dao.dose
        }
        set{
            self.dao.dose = newValue
        }
    }
    
    init(nom : String, dose : Float){
        let entity = CoreDataManager.entity(forName: "Medicament")
        self.dao = Medicament(entity: entity, insertInto: CoreDataManager.context)
        self.dao.nom=nom
        self.dao.dose=dose
    }
}


