//
//  HeaderCell.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserID: UILabel!
    @IBOutlet weak var UserScore: UILabel!
    @IBOutlet weak var UserGradeBtn: UIButton!
    @IBOutlet weak var SginBtn: UIButton!
    @IBOutlet weak var SginView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
