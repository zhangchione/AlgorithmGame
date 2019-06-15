//
//  GameOneController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/18.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import RealmSwift

class GameOneController: UIViewController {
    let realm = try! Realm()
    var itemArray: Results<Item>?
    
    var flag = 0
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var anserA: UIButton!
    
    @IBOutlet weak var anserC: UIButton!
    @IBOutlet weak var anserB: UIButton!
    
    @IBOutlet weak var anserD: UIButton!
    
    @IBAction func backBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        flag += 1
        question.text = itemArray![flag].question
        anserA.setTitle(itemArray![flag].anserA, for: UIControl.State.normal)
        anserB.setTitle(itemArray![flag].anserB, for: UIControl.State.normal)
        anserC.setTitle(itemArray![flag].anserC, for: UIControl.State.normal)
        anserD.setTitle(itemArray![flag].anserD, for: UIControl.State.normal)
    }
    @IBAction func tipsBtn(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemArray = realm.objects(Item.self)
        
        question.text = itemArray![flag].question

    }


    

}
