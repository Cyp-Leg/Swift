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
    
    init(nom : String, prenom : String, adresseCabinet : String){
        let entity = CoreDataManager.entity(forName: "Professionnel")
        self.dao = Professionnel(entity: entity, insertInto: CoreDataManager.context)
        self.dao.nom=nom
        self.dao.prenom=prenom
        self.dao.adresseCabinet=adresseCabinet
    }
}
