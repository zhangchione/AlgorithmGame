//
//  GroundViewController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

class GroundViewController: UIViewController {
    @IBOutlet weak var oneView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var threeView: UIView!
    
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confgiUI()
        
     
    }
    
    func confgiUI(){
        oneView.layer.cornerRadius = 10
        twoView.layer.cornerRadius = 10
        threeView.layer.cornerRadius = 10
        oneBtn.addTarget(self, action: #selector(one), for: .touchUpInside)
        
    }
    @objc func one(){
        let vc = MacthViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        //隐藏导航栏
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //隐藏导航栏
        self.navigationController?.isNavigationBarHidden = false
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
