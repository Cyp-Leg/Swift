//
//  RdvModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class RdvModel{
    private var dao : Rdv
    
    var date: NSDate {
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
        }
    }
    
    var libelle: String {
        get{
            return self.dao.libelle!
        }
        set{
            self.dao.libelle = newValue
        }
    }
    
    init(date : NSDate, libelle : String){
        let entity = CoreDataManager.entity(forName: "Rdv")
        self.dao = Rdv(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date=date
        self.dao.libelle=libelle
    }
}
