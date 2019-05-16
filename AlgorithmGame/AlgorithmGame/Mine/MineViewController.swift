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
        self.view.addSubview(tableView)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension MineViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section ==  1 {
            return 5
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyCell", for: indexPath) as! BodyCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnCell", for: indexPath) as! ReturnCell
            return cell
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 350.0
        }
        else if indexPath.section == 2{
            return 70
        }
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}
