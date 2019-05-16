//
//  Extension.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import Foundation
import UIKit

public extension Double {
    var fitWidth: Double {
        return self/414.0 * Double(AGWidth)
    }
    var fitHeight: Double {
        return self/737.0 * Double(AGHeight)
    }
    var FitWidth: CGFloat {
        return CGFloat(self)/414.0 * CGFloat(AGWidth)
    }
    var FitHeight: CGFloat {
        return CGFloat(self)/737.0 * CGFloat(AGHeight)
    }
    var fWidth: Int{
        return Int(self/414.0 * Double(AGWidth))
    }
    var fHeight: Int{
        return Int(self/414.0 * Double(AGHeight))
    }
}

