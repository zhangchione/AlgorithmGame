//
//  Extension.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/5/16.
//  Copyright © 2019 张驰. All rights reserved.
//

import Foundation
import UIKit

public extension Double {
    var fitWidth: Double {
        return self/414.0 * Double(AGWidth)
    }
    var fitHeight: Double {
        return self/896.0 * Double(AGHeight)
    }
    var FitWidth: CGFloat {
        return CGFloat(self)/414.0 * CGFloat(AGWidth)
    }
    var FitHeight: CGFloat {
        return CGFloat(self)/896.0 * CGFloat(AGHeight)
    }
    var fWidth: Int{
        return Int(self/414.0 * Double(AGWidth))
    }
    var fHeight: Int{
        return Int(self/896.0 * Double(AGHeight))
    }
}

extension UIViewController{
    public func setTabBar(controller: UIViewController, title: String, image: UIImage, selectedImage: UIImage) -> UIViewController{
        controller.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return controller
    }
    public func setUIVC(_ viewController: UIViewController, title: String){
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        viewController.navigationController!.setLargeTitle(viewController.navigationController!)
    }
}


extension UINavigationController{
    public func setLargeTitle(_ navigationController: UINavigationController){
        /// 设置大标题
        if #available(iOS 11.0, *)
        {
            navigationController.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.automatic
            navigationController.navigationBar.prefersLargeTitles = true
        }
        /// 黑线消失
        navigationController.navigationBar.shadowImage = UIImage()
    }
}

extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    class func navigationBarTintColor() -> UIColor{
        return UIColor(r: 94, g: 199, b: 217)
    }
    
    class func globalCyanColor() -> UIColor{
        return UIColor(r: 7, g: 216, b: 243)
    }
}

extension UIView{
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOpacity:Float{
        get{
            return layer.shadowOpacity
        }
        set{
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable
    var shadowColor:UIColor{
        get{
            return (layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) :nil)!
        }
        set{
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
}

extension UIView {
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
