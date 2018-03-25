//
//  RdvTableViewCell.swift
//  PkCHU
//
//  Created by Cyprien on 24/03/2018.
//  Copyright © 2018 cyp. All rights reserved.
//

import UIKit

class RdvTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var motifLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
