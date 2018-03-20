//
//  EvenementDAO.swift
//  PkCHU
//
//  Created by cyp on 20/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Evenement{
    static func getNewEvenementDAO() -> Evenement?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Evenement", in: CoreDataManager.context) else {
            return nil
        }
        return Evenement(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func save(){
        do{
            try CoreDataManager.save()
        }
        catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func create() -> Evenement{
        return Evenement(context: CoreDataManager.context)
    }
}
