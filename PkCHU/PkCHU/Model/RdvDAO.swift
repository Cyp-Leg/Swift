//
//  RdvDAO.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Rdv{
    static func getNewRdvDAO() -> Rdv?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Rdv", in: CoreDataManager.context) else {
            return nil
        }
        return Rdv(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func save(){
        do{
            try CoreDataManager.save()
        }
        catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func create() -> Rdv{
        return Rdv(context: CoreDataManager.context)
    }
    
    static func delete(object: Rdv){
        do{
            try CoreDataManager.delete(object: object)
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
}
