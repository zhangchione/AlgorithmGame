//
//  NewProblemViewController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/6/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import RealmSwift
class NewProblemViewController: UIViewController {
    
    let realm = try! Realm()
    var itemArray: Results<basicsT>?
    
    @IBOutlet weak var subword: UILabel!
    @IBOutlet weak var question: UITextView!
    
    @IBOutlet weak var anserA: UITextView!
    
    @IBOutlet weak var anserB: UITextView!
    
    @IBOutlet weak var anserC: UITextView!
    
    @IBOutlet weak var anserD: UITextView!
    
    @IBOutlet weak var tips: UITextView!
    
    @IBOutlet weak var trueAnser: UITextField!
    
    @IBAction func submitBtn(_ sender: UIButton) {
        
        if trueAnser.text == "" {
            let alert = UIAlertController(title: "添加失败", message:"题目不完整", preferredStyle: .alert)
            let yes = UIAlertAction(title: "确认", style: .default, handler: {(alerts:UIAlertAction) -> Void in
                
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
        else {
            var max = itemArray!.count 
            let basicItem = basicsT()
            basicItem.question = question.text
            basicItem.anserA = anserA.text
            basicItem.anserB = anserB.text
            basicItem.anserC = anserC.text
            basicItem.anserD = anserD.text
            basicItem.anserYN = false
            basicItem.score = "0"
            basicItem.tips = tips.text
            basicItem.trueAnser = trueAnser.text!
            basicItem.id = String(max)
            let alert = UIAlertController(title: "添加成功", message:"", preferredStyle: .alert)
            let yes = UIAlertAction(title: "确认", style: .default, handler: {(alerts:UIAlertAction) -> Void in
               self.saveData(item: basicItem)
                self.navigationController?.popViewController(animated: true)
            })
            
            alert.addAction(yes)
            self.present(alert,animated: true,completion: nil)
        }
    }
    
    func saveData(item:basicsT)
    {
        do {
            try realm.write {
                realm.add(item)
            }
        }catch {
            print("错")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigation.bar.isShadowHidden = true
        self.navigation.bar.alpha = 0
        
        anserD.delegate = self
        anserA.delegate = self
        anserB.delegate = self
        anserC.delegate = self
        // Do any additional setup after loading the view.
        itemArray = realm.objects(basicsT.self)
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

extension NewProblemViewController:UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ content: UITextView) -> Bool {
        if (content.text == "C选项描述") {
            content.text = ""
            self.view.frame = CGRect(x: 0, y: -300, width: 414, height: 896)
            
        }
        if (content.text == "A选项描述") {
            content.text = ""
            
        }
        if (content.text == "B选项描述") {
            content.text = ""
            
        }
        if (content.text == "D选项描述") {
            content.text = ""
            
        }
        if (content.text == "题目描述") {
            content.text = ""
            
        }
        if (content.text == "提示描述") {
            content.text = ""
        }
        content.textColor = UIColor.black
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        subword.text = String(format: "%lu/200", UInt(textView.text.count))
        //字数限制操作
        if textView.text.count >= 200 {
            
            textView.text = (textView.text as NSString?)?.substring(to: 200)
            subword.text = "200/200"
        }
        
    }
}
