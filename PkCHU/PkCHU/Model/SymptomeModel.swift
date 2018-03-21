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
    

    
    var date: NSDate {
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
        }
    }
    
    
    init(type : String, date : NSDate){
        self.dao = Symptome.create()
        self.dao.type=type
        self.dao.date=date
    }
    
}
