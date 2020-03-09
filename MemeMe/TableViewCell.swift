//
//  TableViewCell.swift
//  MemeMe
//
//  Created by Aiman Nabeel on 09/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var memeTableImage: UIImageView!
    @IBOutlet weak var memeTableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
