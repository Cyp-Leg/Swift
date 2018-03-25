//
//  ProfessionnelModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProfessionnelModel{
    private var dao : Professionnel
    
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
    
    var adresseCabinet: String {
        get{
            return self.dao.adresseCabinet!
        }
        set{
            self.dao.adresseCabinet = newValue
        }
    }
    
    private var specialiteModel : Specialite
    
    var specialite: Specialite{
        get{
            return self.specialiteModel
        }
    }
    
    init(nom : String, prenom : String, adresseCabinet : String, specialite: Specialite){
        self.dao = Professionnel.create()
        self.dao.nom=nom
        self.dao.prenom=prenom
        self.dao.adresseCabinet=adresseCabinet
        self.specialiteModel = specialite
        self.dao.posseder = specialite
    }
}
