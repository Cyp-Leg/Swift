//
//  PatientModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PatientModel{
    private var dao : Patient
    
    var nom: String {
        get{
            return self.dao.nom!
        }
        set{
            self.dao.nom = newValue
        }
    }
    
    var prenom: String {
        get{
            return self.dao.prenom!
        }
        set{
            self.dao.prenom = newValue
        }
    }
    
    init(nom : String, prenom : String){
        self.dao = Patient.create()
        self.dao.nom=nom
        self.dao.prenom=prenom
    }
}
