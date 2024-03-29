//
//  AppDelegate.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import EachNavigationBar
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let realm = try! Realm()
        print(realm.configuration.fileURL!)
        // 从 Realm 数据库中删除所有对象
        try! realm.write {
            realm.deleteAll()
        }
        let tabBarController = ESTabBarController()
        let v1 = HomeViewController()
        let v2 = GroundViewController()
        let v3 = MineController()
        v1.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(BouncesContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        let nav1 = MainNavigationController.init(rootViewController: v1)
        let nav2 = MainNavigationController.init(rootViewController: v2)
        let nav3 = MainNavigationController.init(rootViewController: v3)
        nav1.navigation.configuration.isEnabled = true
        tabBarController.viewControllers = [nav1, nav2, nav3]
        
        //let navigationController = MainNavigationController.init(rootViewController: tabBarController)
        //tabBarController.title = "Example"
        v1.title = "答题广场"
        v2.title = "学习专区"
        v3.title = "关于"
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

