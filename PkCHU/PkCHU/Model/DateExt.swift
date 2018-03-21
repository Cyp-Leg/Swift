//
//  DateExt.swift
//  PkCHU
//
//  Created by cyp on 21/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import Foundation

extension Date{
    
    func format() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR") as Locale!
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
    
}

