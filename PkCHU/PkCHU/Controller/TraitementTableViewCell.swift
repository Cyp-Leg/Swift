//
//  SymptomeTableViewCell.swift
//  PkCHU
//
//  Created by cyp on 21/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit
import CoreData

class TraitementTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var medicament: UILabel!
    
    @IBOutlet weak var dose: UILabel!
    
    @IBOutlet weak var heurePrise: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


