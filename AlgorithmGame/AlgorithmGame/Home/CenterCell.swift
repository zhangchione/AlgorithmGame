//
//  CenterCell.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

class CenterCell: UITableViewCell {

    @IBOutlet weak var Div1: UIView!
    @IBOutlet weak var Div2: UIView!
    @IBOutlet weak var Div3: UIView!
    @IBOutlet weak var Div4: UIView!
    @IBOutlet weak var Div5: UIView!
    @IBOutlet weak var Div6: UIView!
    @IBOutlet weak var Div7: UIView!
    
    @IBOutlet weak var basicDiv1: UIButton!
    @IBOutlet weak var basicDiv2: UIButton!
    @IBOutlet weak var basicDiv3: UIButton!
    
    @IBOutlet weak var middelDiv1: UIButton!
    @IBOutlet weak var middelDiv2: UIButton!
    
    @IBOutlet weak var topDiv1: UIButton!
    @IBOutlet weak var topDiv2: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
