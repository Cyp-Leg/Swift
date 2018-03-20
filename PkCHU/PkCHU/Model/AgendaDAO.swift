//
//  AgendaDAO.swift
//  PkCHU
//
//  Created by cyp on 20/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//


import Foundation
import CoreData
import UIKit


class AgendaDAO: {
    func create() throws -> Rdv {
        return Rdv(context: self.context)
    }
    
    func delete(obj: Specialism) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Specialism]? {
        let request: NSFetchRequest<Specialism> = NSFetchRequest(entityName: "Specialism")
        do {
            let specialisms:[Specialism] = try self.context.fetch(request)
            return specialisms
        } catch let error {
            throw error
        }
    }
    
}
