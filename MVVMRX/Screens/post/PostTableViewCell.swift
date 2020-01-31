//
//  PostTableViewCell.swift
//  MVVMRX
//
//  Created by Ahmed Nasser on 1/31/20.
//  Copyright © 2020 AvaVaas. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
