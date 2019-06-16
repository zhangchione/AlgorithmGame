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
        itemArray = realm.objects(basicsT.self)
        for ii in itemArray! {
            print(ii)
        }
        
        print(itemArray?.count)
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
