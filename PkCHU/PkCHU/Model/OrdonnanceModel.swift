//
//  OrdonnanceModel.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class OrdonnanceModel{
    private var dao : Ordonnance
    
    var date: NSDate {
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
        }
    }
    
    var commentaire: String {
        get{
            return self.dao.commentaire!
        }
        set{
            self.dao.commentaire = newValue
        }
    }
    
    init(date : NSDate, commentaire : String){
        self.dao = Ordonnance.create()
        self.dao.date=date
        self.dao.commentaire=commentaire
    }
}
