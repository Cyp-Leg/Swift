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

    
    var heure: String {
        get{
            return self.dao.heure!
        }
        set{
            self.dao.heure = newValue
        }
    }

    private var medicModel: Medicament
    
    var medicament: Medicament{
        get{
            return self.medicModel
        }
    }
    
    init(heure : String, medicament: Medicament){
        self.dao = Prise.create()
        self.dao.heure=heure
        self.medicModel=medicament
        self.dao.comprendre=medicament
    }
}
