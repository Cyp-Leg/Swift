//
//  ActiviteTableViewCell.swift
//  PkCHU
//
//  Created by cyp on 17/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class ActiviteTableViewCell: UITableViewCell {

    @IBOutlet weak var nomActiviteLabel: UILabel!
    
    @IBOutlet weak var dateActiviteLabel: UILabel!
     
    @IBOutlet weak var heureActiviteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
