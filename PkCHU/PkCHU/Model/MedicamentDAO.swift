//
//  MedicamentDAO.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Medicament{
    static func getNewMedicamentDAO() -> Medicament?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Medicament", in: CoreDataManager.context) else {
            return nil
        }
        return Medicament(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func save(){
        do{
            try CoreDataManager.save()
        }
        catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func create() -> Medicament{
        return Medicament(context: CoreDataManager.context)
    }
}
