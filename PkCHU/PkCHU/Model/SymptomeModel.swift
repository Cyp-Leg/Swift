//
//  SymptomeModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SymptomeModel{
    private var dao : Symptome
    
    var type: String {
        get{
            return self.dao.type!
        }
        set{
            self.dao.type = newValue
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
    
    
    init(type : String, descript : String){
        let entity = CoreDataManager.entity(forName: "Symptome")
        self.dao = Symptome(entity: entity, insertInto: CoreDataManager.context)
        self.dao.type=type
        self.dao.descript=descript
    }
    
}
