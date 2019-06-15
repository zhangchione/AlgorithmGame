//
//  HomeViewController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    var tableview:UITableView!
    
    let realm = try! Realm()
    var itemArray: Results<Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configData()

    }
    
    func configData(){

        let dataItems = Item()
        dataItems.question = "衡量一个算法的效率指标是"
        dataItems.anserA = "空间复杂度"
        dataItems.anserB = "时间复杂度"
        dataItems.anserC = "运行时间"
        dataItems.anserD = "编译快慢"
        dataItems.anserYN = false
        dataItems.score = "-1"
        dataItems.tips = "快想想吧~"
        for _ in 1...5 {
            self.saveData(item: dataItems)
        }
        itemArray = realm.objects(Item.self)
        for ii in itemArray! {
            print(ii)
        }
        
        print(itemArray?.count)
    }
    func deleteData(item:Item)
    {
        try! realm.write {
            
            realm.delete(item) // 删除单个数据
        }
    }
    func saveData(item:Item)
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
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: AGWidth, height: AGHeight))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "TopCell", bundle: nil), forCellReuseIdentifier: "TopCell")
        tableview.register(UINib(nibName: "CenterCell", bundle: nil), forCellReuseIdentifier: "CenterCell")
        tableview.separatorStyle = .none
        view.addSubview(tableview)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        //self.navigationController?.navigationBar.isTranslucent = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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
