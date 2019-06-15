//
//  DataBase.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/6/15.
//  Copyright © 2019 张驰. All rights reserved.
//

import Foundation
import RealmSwift
class Item: Object {
    @objc dynamic var question : String = ""
    @objc dynamic var anserA :String = ""
    @objc dynamic var anserB :String = ""
    @objc dynamic var anserC :String = ""
    @objc dynamic var anserD :String = ""
    @objc dynamic var score :String = ""
    @objc dynamic var tips :String = ""
    @objc dynamic var anserYN :Bool = false

}

