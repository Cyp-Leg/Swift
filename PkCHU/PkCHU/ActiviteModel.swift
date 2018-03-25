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

class ActiviteModel{
    private var dao : Activite
    
    var libelle: String {
        get{
            return self.dao.libelle!
        }
        set{
            self.dao.libelle = newValue
        }
    }
    
    var descript: String {
        get{
            return self.dao.descript!
        }
        set{
            self.dao.descript = newValue
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
    
    var heureDebut: String {
        get{
            return self.dao.heureDebut!
        }
        set{
            self.dao.heureDebut = newValue
        }
    }
    
    init(libelle : String, descript : String, recurrence : String, heureDebut : String){
        self.dao = Activite.create()
        self.dao.libelle=libelle
        self.dao.descript=descript
        self.dao.recurrence=recurrence
        self.dao.heureDebut=heureDebut
    }
    
}

