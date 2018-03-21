//
//  PatientDAO.swift
//  PkCHU
//
//  Created by cyp on 19/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Patient{
    static func getNewPatientDAO() -> Patient?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Patient", in: CoreDataManager.context) else {
            return nil
        }
        return Patient(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func save(){
        do{
            try CoreDataManager.save()
        }
        catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func create() -> Patient{
        return Patient(context: CoreDataManager.context)
    }
}
