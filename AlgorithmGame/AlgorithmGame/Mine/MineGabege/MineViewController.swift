//
//  MineViewController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    var tableView:UITableView! = nil
    
    let cellArrayTop = ["我的积分","积分兑换"]
    let cellArrayBottm = ["我的答题","我的发布","我的收藏"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    func configUI(){

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: AGWidth, height: AGHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "BodyCell", bundle: nil), forCellReuseIdentifier: "BodyCell")
        tableView.register(UINib(nibName: "ReturnCell", bundle: nil), forCellReuseIdentifier: "ReturnCell")
        tableView.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        self.view.addSubview(tableView)
    }
    override func viewWillAppear(_ animated: Bool) {
        //隐藏导航栏
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //隐藏导航栏
        self.navigationController?.isNavigationBarHidden = false
    }
}


extension MineViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section ==  1 {
            return 2
        }
        if section == 2 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            cell.SginView.layer.cornerRadius = 10
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyCell", for: indexPath) as! BodyCell
            cell.bodylabel.text = cellArrayTop[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyCell", for: indexPath) as! BodyCell
            cell.bodylabel.text = cellArrayBottm[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnCell", for: indexPath) as! ReturnCell
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            cell.returnBtn.addTarget(self, action: #selector(reBtn), for: .touchUpInside)
            return cell
        }

    }
    @objc func reBtn(){
        let alert = UIAlertController(title: "退出系统", message: "请选择操作", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("退出账号", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: "切换账号", style: .default, handler: { _ in
            print("切换账号")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 350.FitHeight
        }
        else if indexPath.section == 3{
            return 110.FitHeight
        }
        return 50.FitHeight
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let centerView = UIView()
            centerView.frame = CGRect(x: 0, y: 0, width: Int(AGWidth), height: Int(5.fitHeight))
            centerView.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            return centerView
        }
        if section == 1 {
            let centerView = UIView()
            centerView.frame = CGRect(x: 0, y: 0, width: Int(AGWidth), height: Int(10.fitHeight))
            centerView.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            return centerView
        }
        else {
            let centerView = UIView()
            centerView.frame = CGRect(x: 0, y: 0, width: Int(AGWidth), height: 0)
            return centerView
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 5.FitHeight
        }
        if section == 1{
            return 10.FitHeight
        }
        else {
            return 0.000001
        }
    }
    
}
