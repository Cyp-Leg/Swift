//
//  MedecinTableViewCell.swift
//  PkCHU
//
//  Created by Cyprien on 25/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class MedecinTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var speLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
