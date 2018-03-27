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
    
   /* var preparation: String {
        get{
       //     return self.dao.preparation!
        }
        set{
     //       self.dao.preparation = newValue
        }
    }
    */
    
    private var professionnelModel : Professionnel
    
    var professionnel: Professionnel{
        get{
            return self.professionnelModel
        }
    }
    
    init(date : NSDate, libelle : String, preparation: String, professionnel: Professionnel){
        self.dao = Rdv.create()
        self.dao.date=date
        self.dao.libelle=libelle
        self.professionnelModel = professionnel
        self.dao.concerner = professionnel
     //   self.dao.preparation = preparation
    }
}
