//
//  BasicAlgorithmController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import RealmSwift

class BasicAlgorithmController: UIViewController {

    let realm = try! Realm()
    var itemArray: Results<basicsT>?
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()

    }
    func configUI(){
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AGWidth, height: AGHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "AlHeaderCell", bundle: nil), forCellReuseIdentifier: "AlHeaderCell")
        tableView.register(UINib(nibName: "AlCentCell", bundle: nil), forCellReuseIdentifier: "AlCentCell")
        tableView.register(UINib(nibName: "BottomCell", bundle: nil), forCellReuseIdentifier: "BottomCell")
        itemArray = realm.objects(basicsT.self)
        self.view.addSubview(tableView)
    }
    override func viewWillAppear(_ animated: Bool) {
        title = "挑战详情"
        tableView.reloadData()
    }

  

}

extension BasicAlgorithmController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlHeaderCell", for: indexPath) as! AlHeaderCell
            cell.headerView.layer.cornerRadius = 50
            cell.headerView.layer.borderWidth = 2
            cell.headerView.layer.borderColor = UIColor.blue.cgColor
            cell.grade.textColor = UIColor.blue

            var ans = 0
            for item in itemArray! {
                if item.anserYN {
                    ans += 1
                }
            }
            let sum = ans * 10
            cell.grade.text = String(sum)
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlCentCell", for: indexPath) as! AlCentCell
            cell.collection.reloadData()
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as! BottomCell
            cell.startbtn.addTarget(self, action: #selector(startBtn), for: .touchUpInside)
            cell.newBtn.addTarget(self, action: #selector(newBtn), for: .touchUpInside)
            return cell
        }

    }
    @objc func startBtn(){
        print("知识挑战成功开始")
        let GoneVC = GameOneController()
        self.navigationController?.pushViewController(GoneVC, animated: true)
    }
    @objc func newBtn(){
        print("新建问题中....")
        let GoneVC = NewProblemViewController()
        self.navigationController?.pushViewController(GoneVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240
        }
        if indexPath.section == 2 {
            return 150
        }
        return 300
    }
    
    
}
