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
    var itemArray: Results<basicsT>?
    
    var flag = 0
    
    var max = 0
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var ViewA: UIView!
    @IBOutlet weak var ViewB: UIView!
    @IBOutlet weak var ViewC: UIView!
    @IBOutlet weak var ViewD: UIView!
    
    @IBOutlet weak var ViewBack: UIView!
    @IBOutlet weak var ViewNext: UIView!
    @IBOutlet weak var ViewTips: UIView!
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var anserA: UIButton!
    @IBOutlet weak var anserC: UIButton!
    @IBOutlet weak var anserB: UIButton!
    @IBOutlet weak var anserD: UIButton!
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        flag -= 1
        if flag < 0 {
            let alert = UIAlertController(title: "提示", message:"已经是第一题了", preferredStyle: .alert)
            let yes = UIAlertAction(title: "确认", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
            flag += 1
        }
        else {
            updateUI(with: flag)
        }
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        flag += 1
        if flag >= max {
            let alert = UIAlertController(title: "提示", message:"最后一题了", preferredStyle: .alert)
            let yes = UIAlertAction(title: "继续监测", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            let back = UIAlertAction(title: "退出答题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(yes)
            alert.addAction(back)
            self.present(alert,animated: true,completion: nil)
            flag -= 1
        }
        else {
        updateUI(with: flag)

        }
    }
    
    @IBAction func tipsBtn(_ sender: UIButton) {
        if flag < 0 || flag >= max{
            let text = "题目不存在"
            let alert = UIAlertController(title: "提示", message:text, preferredStyle: .alert)
            let yes = UIAlertAction(title: "谢谢啦", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
        else {
            let text = itemArray![flag].tips
            let alert = UIAlertController(title: "提示", message:text, preferredStyle: .alert)
            let yes = UIAlertAction(title: "谢谢啦", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }


    func configUI(){
        self.navigation.bar.isShadowHidden = true
        self.navigation.bar.alpha = 0
        itemArray = realm.objects(basicsT.self)
        max = itemArray!.count
        question.numberOfLines = 0
        updateUI(with: flag)
    }
    
    func updateUI(with Value:Int){
        ViewA.backgroundColor = UIColor.white
        ViewB.backgroundColor = UIColor.white
        ViewC.backgroundColor = UIColor.white
        ViewD.backgroundColor = UIColor.white
        if itemArray![Value].anserYN {
            switch itemArray![Value].trueAnser {
            case "A" : ViewA.backgroundColor = UIColor.green
            case "B" : ViewB.backgroundColor = UIColor.green
            case "C" : ViewC.backgroundColor = UIColor.green
            case "D" : ViewD.backgroundColor = UIColor.green
            default:
                print(1)
            }
        }
        score.text = itemArray![flag].score
        question.text = itemArray![flag].question
        number.text = "第" + String(Int(itemArray![flag].id)! + 1 ) + "题"
        anserA.setTitle(itemArray![flag].anserA, for: UIControl.State.normal)
        anserB.setTitle(itemArray![flag].anserB, for: UIControl.State.normal)
        anserC.setTitle(itemArray![flag].anserC, for: UIControl.State.normal)
        anserD.setTitle(itemArray![flag].anserD, for: UIControl.State.normal)

        anserA.addTarget(self, action: #selector(self.A), for: .touchUpInside)
        anserB.addTarget(self, action: #selector(self.B), for: .touchUpInside)
        anserC.addTarget(self, action: #selector(self.C), for: .touchUpInside)
        anserD.addTarget(self, action: #selector(self.D), for: .touchUpInside)
    }

    
    @objc func A(){
        if itemArray![flag].trueAnser == "A" {
            try! realm.write {
                realm.create(basicsT.self, value: ["id": String(flag), "anserYN": true,"score":"10"], update: true)
                // book 对象的 `title` 属性仍旧保持不变
            }
            score.text = itemArray![flag].score
            flag += 1
            if flag >= max {
                let alert = UIAlertController(title: "回答正确", message:"最后一题了", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续检查", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                let back = UIAlertAction(title: "退出答题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(yes)
                alert.addAction(back)
                self.present(alert,animated: true,completion: nil)
                flag -= 1
            }
            else {
               
                let alert = UIAlertController(title: "恭喜", message:"您回答正确", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续下一题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                self.updateUI(with: self.flag)
                })
                let see = UIAlertAction(title: "在看看", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
                })
                alert.addAction(yes)
                self.present(alert,animated: true,completion: nil)
            }
            ViewA.backgroundColor = UIColor.green
        }
        else {
            let alert = UIAlertController(title: "错误", message:"您回答错误", preferredStyle: .alert)
            let yes = UIAlertAction(title: "重新作答", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
    }
    @objc func B(){
        if itemArray![flag].trueAnser == "B" {
            try! realm.write {
                realm.create(basicsT.self, value: ["id": String(flag), "anserYN": true,"score":"10"], update: true)
                // book 对象的 `title` 属性仍旧保持不变
            }
                    score.text = itemArray![flag].score
            flag += 1
            if flag >= max {
                let alert = UIAlertController(title: "回答正确", message:"最后一题了", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续检查", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                let back = UIAlertAction(title: "退出答题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(yes)
                alert.addAction(back)
                self.present(alert,animated: true,completion: nil)
                flag -= 1
            }
            else {
                
                let alert = UIAlertController(title: "恭喜", message:"您回答正确", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续下一题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.updateUI(with: self.flag)
                })
                let see = UIAlertAction(title: "在看看", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                alert.addAction(yes)
                self.present(alert,animated: true,completion: nil)
            }
            ViewB.backgroundColor = UIColor.green
        }
        else {
            let alert = UIAlertController(title: "错误", message:"您回答错误", preferredStyle: .alert)
            let yes = UIAlertAction(title: "重新作答", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
    }
    @objc func C(){
        if itemArray![flag].trueAnser == "C" {
            try! realm.write {
                realm.create(basicsT.self, value: ["id": String(flag), "anserYN": true,"score":"10"], update: true)
                // book 对象的 `title` 属性仍旧保持不变
            }
                    score.text = itemArray![flag].score
            flag += 1
            if flag >= max {
                let alert = UIAlertController(title: "回答正确", message:"最后一题了", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续检查", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                let back = UIAlertAction(title: "退出答题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(yes)
                alert.addAction(back)
                self.present(alert,animated: true,completion: nil)
                flag -= 1
            }
            else {
                
                let alert = UIAlertController(title: "恭喜", message:"您回答正确", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续下一题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.updateUI(with: self.flag)
                })
                let see = UIAlertAction(title: "在看看", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                alert.addAction(yes)
                self.present(alert,animated: true,completion: nil)
            }
            ViewC.backgroundColor = UIColor.green
        }
        else {
            let alert = UIAlertController(title: "错误", message:"您回答错误", preferredStyle: .alert)
            let yes = UIAlertAction(title: "重新作答", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
    }
    @objc func D(){
        if itemArray![flag].trueAnser == "D" {
            try! realm.write {
                realm.create(basicsT.self, value: ["id": String(flag), "anserYN": true,"score":"10"], update: true)
                // book 对象的 `title` 属性仍旧保持不变
            }
                    score.text = itemArray![flag].score
            flag += 1
            if flag >= max {
                let alert = UIAlertController(title: "回答正确", message:"最后一题了", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续检查", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                let back = UIAlertAction(title: "退出答题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(yes)
                alert.addAction(back)
                self.present(alert,animated: true,completion: nil)
                flag -= 1
            }
            else {
                
                let alert = UIAlertController(title: "恭喜", message:"您回答正确", preferredStyle: .alert)
                let yes = UIAlertAction(title: "继续下一题", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    self.updateUI(with: self.flag)
                })
                let see = UIAlertAction(title: "在看看", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                    
                })
                alert.addAction(yes)
                self.present(alert,animated: true,completion: nil)
            }
            ViewD.backgroundColor = UIColor.green
        }
        else {
            let alert = UIAlertController(title: "错误", message:"您回答错误", preferredStyle: .alert)
            let yes = UIAlertAction(title: "重新作答", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
    }
}
