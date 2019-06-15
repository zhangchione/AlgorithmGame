//
//  MineController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/31.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import SnapKit

class MineController: UIViewController {

    lazy var titleArray = ["给个好评","意见反馈","版本跟新","条款说明"]
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MineHeadCell", bundle: nil), forCellReuseIdentifier: "MineHeadCell")
        tableView.register(UINib(nibName: "MineBodyCell", bundle: nil), forCellReuseIdentifier: "MineBodyCell")
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalTo(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUIVC(self, title: "关于")
    }
    


}
extension MineController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section <= 1 ?  1 : titleArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 138 : 48
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MineHeadCell", for: indexPath) as! MineHeadCell
            cell.userID.text = "账号：" + "1525163730"
            cell.userName.text = "DreamDJUer"
            cell.userImg.layer.cornerRadius = 33
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MineBodyCell", for: indexPath) as! MineBodyCell
            cell.icoImg.image = UIImage(named: "favoriteicon_profile_24x24_")
            cell.icoLabel.text = "设置"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineBodyCell", for: indexPath) as! MineBodyCell
        cell.icoImg.image = UIImage(named: "favoriteicon_profile_24x24_")
        cell.icoLabel.text = titleArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(r: 225, g: 225, b: 225)
        return view
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(r: 243, g: 243, b: 243)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 || section == 1 ? 15 : 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 8 : 0.0001
    }
    
    
}
