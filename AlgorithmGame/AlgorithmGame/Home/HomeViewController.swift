//
//  HomeViewController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import RealmSwift
import EachNavigationBar

class HomeViewController: UIViewController {
    
    var tableview:UITableView!
    
    let realm = try! Realm()
    var itemArray: Results<basicsT>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configData()

    }
    

    func deleteData(item:basicsT)
    {
        try! realm.write {
            
            realm.delete(item) // 删除单个数据
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
    func configUI(){
                //setUIVC(self, title: "答题广场")
        self.navigation.bar.isShadowHidden = true
        //self.navigation.bar.alpha = 0
       // self.navigationItem.title = ""
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: AGWidth, height: AGHeight))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "TopCell", bundle: nil), forCellReuseIdentifier: "TopCell")
        tableview.register(UINib(nibName: "CenterCell", bundle: nil), forCellReuseIdentifier: "CenterCell")
        tableview.separatorStyle = .none
        view.addSubview(tableview)
    }
    override func viewWillAppear(_ animated: Bool) {
       // self.navigationController?.isNavigationBarHidden = true
        //self.navigationController?.navigationBar.isTranslucent = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = false
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as!TopCell
            cell.selectionStyle = .none
            cell.userView.layer.cornerRadius = 8
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CenterCell", for: indexPath) as! CenterCell
            cell.selectionStyle = .none
            cell.Div1.layer.cornerRadius = 8
            cell.Div2.layer.cornerRadius = 8
            cell.Div3.layer.cornerRadius = 8
            cell.Div4.layer.cornerRadius = 8
            cell.Div5.layer.cornerRadius = 8
            cell.Div6.layer.cornerRadius = 8
            cell.Div7.layer.cornerRadius = 8
            cell.basicDiv1.addTarget(self, action: #selector(basic1), for: .touchUpInside)
            
            return cell
        }
    }
    
    @objc func basic1() {
        let basciVc = BasicAlgorithmController()
        self.navigationController?.pushViewController(basciVc, animated: true)
    }
    @objc func basic2() {
        
    }
    @objc func basic3() {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200.FitHeight
        }
        else {
            return 600.FitHeight
        }
    }
    
    
}

extension HomeViewController {
    func configData(){
        let dataItems = basicsT()
        dataItems.question = "在棋盘覆盖问题中,对于（2^k）*(2^k)的特殊棋盘，所需y的L型骨牌的个数是"
        dataItems.anserA = "（4^k-1）*3"
        dataItems.anserB = "2^k/3"
        dataItems.anserC = "4^k"
        dataItems.anserD = "2^k"
        dataItems.anserYN = false
        dataItems.score = "0"
        dataItems.tips = "快想想吧~"
        dataItems.id = "0"
        dataItems.trueAnser = "A"
        self.saveData(item: dataItems)

        let dataItems1 = basicsT()
        dataItems1.question = "衡量一个算法好坏的标准是"
        dataItems1.anserA = "运行速度快"
        dataItems1.anserB = "占用空间少"
        dataItems1.anserC = "时间复杂度低"
        dataItems1.anserD = "代码短"
        dataItems1.anserYN = false
        dataItems1.score = "0"
        dataItems1.tips = "快想想吧~"
        dataItems1.id = "1"
        dataItems1.trueAnser = "C"
        self.saveData(item: dataItems1)
        
                let dataItems2 = basicsT()
        dataItems2.question = "以下不可以使用分治法求解的是"
        dataItems2.anserA = "棋盘覆盖问题"
        dataItems2.anserB = "选择问题"
        dataItems2.anserC = "归并排序"
        dataItems2.anserD = "0/1背包问题"
        dataItems2.anserYN = false
        dataItems2.score = "0"
        dataItems2.tips = "快想想吧~"
        dataItems2.id = "2"
        dataItems2.trueAnser = "D"
        self.saveData(item: dataItems2)
        let dataItems3 = basicsT()
        dataItems3.question = "二分搜索算法是利用(         )实现的算法"
        dataItems3.anserA = "分治策略"
        dataItems3.anserB = "动态规划法"
        dataItems3.anserC = "贪心法"
        dataItems3.anserD = "回溯法"
        dataItems3.anserYN = false
        dataItems3.score = "0"
        dataItems3.tips = "快想想吧~"
        dataItems3.id = "3"
        dataItems3.trueAnser = "A"
        self.saveData(item: dataItems3)
        
        let dataItems4 = basicsT()
        
        
        dataItems4.question = "实现合并排序利用的算法是(        )"
        dataItems4.anserA = "分治策略"
        dataItems4.anserB = "动态规划法"
        dataItems4.anserC = "贪心法"
        dataItems4.anserD = "回溯法"
        dataItems4.anserYN = false
        dataItems4.score = "0"
        dataItems4.tips = "快想想吧~"
        dataItems4.id = "4"
        dataItems4.trueAnser = "A"
        self.saveData(item: dataItems4)
        
        let dataItems5 = basicsT()
        
        dataItems5.question = "使用分治法求解不需要满足的条件是( )"
        dataItems5.anserA = "子问题必须是一样的"
        dataItems5.anserB = "子问题不能够重复"
        dataItems5.anserC = "子问题的解可以合并"
        dataItems5.anserD = "原问题和子问题使用相同的方法解"
        dataItems5.anserYN = false
        dataItems5.score = "0"
        dataItems5.tips = "快想想吧~"
        dataItems5.id = "5"
        dataItems5.trueAnser = "A"
        self.saveData(item: dataItems5)
        
                let dataItems6 = basicsT()
        
        
        dataItems6.question = "最长公共子序列算法利用的算法是(        )"
        dataItems6.anserA = "分支界限法"
        dataItems6.anserB = "动态规划法"
        dataItems6.anserC = "贪心法"
        dataItems6.anserD = "回溯法"
        dataItems6.anserYN = false
        dataItems6.score = "0"
        dataItems6.tips = "快想想吧~"
        dataItems6.id = "6"
        dataItems6.trueAnser = "B"
        self.saveData(item: dataItems6)
        
                let dataItems7 = basicsT()
        
        dataItems7.question = "下列算法中通常以自底向上的方式求解最优解的是(        )"
        dataItems7.anserA = "备忘录法"
        dataItems7.anserB = "动态规划法"
        dataItems7.anserC = "贪心法"
        dataItems7.anserD = "回溯法"
        dataItems7.anserYN = false
        dataItems7.score = "0"
        dataItems7.tips = "快想想吧~"
        dataItems7.id = "7"
        dataItems7.trueAnser = "B"
        self.saveData(item: dataItems7)
                let dataItems8 = basicsT()
        
        dataItems8.question = "实现最大子段和利用的算法是(       )"
        dataItems8.anserA = "备忘录法"
        dataItems8.anserB = "动态规划法"
        dataItems8.anserC = "贪心法"
        dataItems8.anserD = "回溯法"
        dataItems8.anserYN = false
        dataItems8.score = "0"
        dataItems8.tips = "快想想吧~"
        dataItems8.id = "8"
        dataItems8.trueAnser = "B"
        self.saveData(item: dataItems8)
        
                let dataItems9 = basicsT()
        
        dataItems9.question = "矩阵连乘问题的算法可由(         )设计实现"
        dataItems9.anserA = "分支界限法"
        dataItems9.anserB = "动态规划法"
        dataItems9.anserC = "贪心法"
        dataItems9.anserD = "回溯法"
        dataItems9.anserYN = false
        dataItems9.score = "0"
        dataItems9.tips = "快想想吧~"
        dataItems9.id = "9"
        dataItems9.trueAnser = "B"
        self.saveData(item: dataItems9)
        
        itemArray = realm.objects(basicsT.self)
        for ii in itemArray! {
            print(ii)
        }
        
        print(itemArray?.count)
    }
}
