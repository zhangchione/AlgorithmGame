//
//  DataBases.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/31.
//  Copyright © 2019 张驰. All rights reserved.
//

import Foundation
import RealmSwift
class User: Object {
    @objc dynamic var userName : String = ""
    @objc dynamic var userID :String = ""
    @objc dynamic var pwd : String = ""
    @objc dynamic var sign: String = ""
    @objc dynamic var achievement:String = ""
    @objc dynamic var history:String = ""
    @objc dynamic var img:String = ""
}
class Dog: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var conttent :String = ""
}

class Items: Object {
    @objc dynamic var time :String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var conttent :String = ""
}
