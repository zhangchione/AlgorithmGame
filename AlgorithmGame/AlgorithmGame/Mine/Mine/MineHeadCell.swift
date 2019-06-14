//
//  MineHeadCell.swift
//  PoeticCampus
//
//  Created by 张驰 on 2019/3/22.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

class MineHeadCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
