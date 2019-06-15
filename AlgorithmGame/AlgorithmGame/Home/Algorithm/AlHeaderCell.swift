//
//  AlHeaderCell.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/18.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

class AlHeaderCell: UITableViewCell {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var grade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
