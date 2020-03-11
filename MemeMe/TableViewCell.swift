//
//  TableViewCell.swift
//  MemeMe
//
//  Created by Sumair Zamir on 09/03/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var memeTableImage: UIImageView!
    @IBOutlet weak var memeTableLabel: UILabel!
    
    // MARK: - Other
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
