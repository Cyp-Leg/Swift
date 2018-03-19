//
//  PriseModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PriseModel{
    private var dao : Prise
    
    var commentaire: String {
        get{
            return self.dao.commentaire!
        }
        set{
            self.dao.commentaire = newValue
        }
    }
    
    var heure: String {
        get{
            return self.dao.heure!
        }
        set{
            self.dao.heure = newValue
        }
    }
    
    var quantite: Int32 {
        get{
            return self.dao.quantite
        }
        set{
            self.dao.quantite = newValue
        }
    }
    
    var recurrence: String {
        get{
            return self.dao.recurrence!
        }
        set{
            self.dao.recurrence = newValue
        }
    }
    
    init(commentaire : String, heure : String, quantite : Int32, recurrence: String){
        let entity = CoreDataManager.entity(forName: "Prise")
        self.dao = Prise(entity: entity, insertInto: CoreDataManager.context)
        self.dao.commentaire=commentaire
        self.dao.heure=heure
        self.quantite=quantite
        self.recurrence=recurrence
    }
}
