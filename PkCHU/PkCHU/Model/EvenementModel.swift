//
//  EvenementModel.swift
//  PkCHU
//
//  Created by cyp on 20/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EvenementModel{
    private var dao : Evenement
    
    var type: String {
        get{
            return self.dao.type!
        }
        set{
            self.dao.type = newValue
        }
    }
    
    var date: NSDate{
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
        }
    }
    
    init(type : String, date : NSDate){
        let entity = CoreDataManager.entity(forName: "Evenement")
        self.dao = Evenement(entity: entity, insertInto: CoreDataManager.context)
        self.dao.type=type
        self.dao.date=date
    }
}
