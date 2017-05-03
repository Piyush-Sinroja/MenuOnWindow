//
//  MenuOnWindow.swift
//  MenuOnWindow
//
//  Created by piyush sinroja on 01/05/17.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

var viewWidthHeight: CGFloat = 150 // XibView WidthHeight
var screenWidth: CGFloat = UIScreen.main.bounds.size.width
var screenHeight: CGFloat = UIScreen.main.bounds.size.height

public class MenuOnWindow: NSObject {
    
    var windowApp: UIWindow?
    static var btnMenu = UIButton()
    static var xibView : ViewMenu?
    static var navController = UINavigationController()
    
    //MARK:- Btn Load On Window
    func loadNewView(window: UIWindow, navigation: UINavigationController) {
        windowApp = window
        MenuOnWindow.navController = navigation
        MenuOnWindow.btnMenu = UIButton(type: .custom)
        MenuOnWindow.btnMenu.setTitle("Menu", for: .normal)
        MenuOnWindow.btnMenu.titleLabel?.textAlignment = .center
        MenuOnWindow.btnMenu.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        MenuOnWindow.btnMenu.setTitleColor(UIColor.white, for: .normal)
        MenuOnWindow.btnMenu.backgroundColor = UIColor.black
        MenuOnWindow.btnMenu.frame = CGRect(x: 10, y: 20, width: 45, height: 45)
        MenuOnWindow.btnMenu.layer.cornerRadius = MenuOnWindow.btnMenu.frame.size.width/2
        MenuOnWindow.btnMenu.layer.masksToBounds = true
        MenuOnWindow.btnMenu.addTarget(self, action: #selector(btnMenuAction(sender:)), for: .touchUpInside)
        let panner = UIPanGestureRecognizer(target: self, action: #selector(self.panDidFire(panner:)))
        MenuOnWindow.btnMenu.addGestureRecognizer(panner)
        window.addSubview(MenuOnWindow.btnMenu)
        window.makeKeyAndVisible()
    }
    
    //MARK:- Pan GestureRecognizer
    func panDidFire(panner: UIPanGestureRecognizer) {
        let offset = panner.translation(in: windowApp)
        panner.setTranslation(CGPoint.zero, in: windowApp)
        var center = MenuOnWindow.btnMenu.center
        center.x += offset.x
        center.y += offset.y
        MenuOnWindow.btnMenu.center = center
        if panner.state == .ended || panner.state == .cancelled {
            UIView.animate(withDuration: 0.3) {
                if MenuOnWindow.btnMenu.frame.origin.x < 0 {
                   MenuOnWindow.btnMenu.frame = CGRect(x: 10, y: MenuOnWindow.btnMenu.frame.origin.y, width: MenuOnWindow.btnMenu.frame.size.width, height: MenuOnWindow.btnMenu.frame.size.height)
                }
                else if (MenuOnWindow.btnMenu.frame.origin.x + MenuOnWindow.btnMenu.frame.size.width) > screenWidth {
                    MenuOnWindow.btnMenu.frame = CGRect(x:screenWidth - MenuOnWindow.btnMenu.frame.size.width - 10, y: MenuOnWindow.btnMenu.frame.origin.y, width: MenuOnWindow.btnMenu.frame.size.width, height: MenuOnWindow.btnMenu.frame.size.height)
                }
                if MenuOnWindow.btnMenu.frame.origin.y < 0 {
                    MenuOnWindow.btnMenu.frame = CGRect(x: MenuOnWindow.btnMenu.frame.origin.x, y: 20, width: MenuOnWindow.btnMenu.frame.size.width, height: MenuOnWindow.btnMenu.frame.size.height)
                    
                }
                else if (MenuOnWindow.btnMenu.frame.origin.y + MenuOnWindow.btnMenu.frame.size.height) > screenHeight {
                    MenuOnWindow.btnMenu.frame = CGRect(x:MenuOnWindow.btnMenu.frame.origin.x, y: screenHeight - MenuOnWindow.btnMenu.frame.size.height - 10, width: MenuOnWindow.btnMenu.frame.size.width, height: MenuOnWindow.btnMenu.frame.size.height)
                }
            }
        }
        else if panner.state == .began {
            touchViewRemove()
        }
    }
    
    //MARK:- Button Action
    func btnMenuAction(sender: UIButton) {
        touchViewAddOrRemove()
    }

    //MARK:- TouchView Method
    func touchViewRemove() {
        if MenuOnWindow.xibView != nil {
            MenuOnWindow.xibView?.removeFromSuperview()
            MenuOnWindow.xibView = nil
            MenuOnWindow.btnMenu.setTitle("Open", for:.normal)
        }
    }
    
    func touchViewAddOrRemove()  {
        if MenuOnWindow.xibView != nil {
            MenuOnWindow.xibView?.removeFromSuperview()
            MenuOnWindow.xibView = nil
            MenuOnWindow.btnMenu.setTitle("Open", for:.normal)
        }
        else {
            MenuOnWindow.btnMenu.setTitle("Close", for:.normal)
            MenuOnWindow.xibView = Bundle.main.loadNibNamed("ViewMenu", owner: self, options: nil)?[0] as? ViewMenu
            
            MenuOnWindow.xibView?.dropShadow()
            MenuOnWindow.xibView?.viewTbl.layer.cornerRadius = 5.0
            MenuOnWindow.xibView?.viewTbl.layer.masksToBounds = true
            
            MenuOnWindow.xibView?.registerMethod()
            let btnCenter =  MenuOnWindow.btnMenu.center
            MenuOnWindow.xibView?.layer.cornerRadius = 5.0
            if btnCenter.x > (screenWidth/2)  {
                if btnCenter.y > (screenHeight/2) {
                    MenuOnWindow.xibView?.frame = CGRect(x: MenuOnWindow.btnMenu.frame.origin.x - viewWidthHeight, y: MenuOnWindow.btnMenu.frame.origin.y - viewWidthHeight , width: viewWidthHeight, height: viewWidthHeight)
                }
                else {
                    MenuOnWindow.xibView?.frame = CGRect(x: MenuOnWindow.btnMenu.frame.origin.x - viewWidthHeight, y: MenuOnWindow.btnMenu.frame.origin.y +  MenuOnWindow.btnMenu.frame.height, width: viewWidthHeight, height: viewWidthHeight)
                }
            }
            else {
                if btnCenter.y > (screenHeight/2) {
                    MenuOnWindow.xibView?.frame = CGRect(x: MenuOnWindow.btnMenu.frame.origin.x + MenuOnWindow.btnMenu.frame.width, y: MenuOnWindow.btnMenu.frame.origin.y - viewWidthHeight, width: viewWidthHeight, height: viewWidthHeight)
                }
                else {
                    MenuOnWindow.xibView?.frame = CGRect(x: MenuOnWindow.btnMenu.frame.origin.x + MenuOnWindow.btnMenu.frame.width, y: MenuOnWindow.btnMenu.frame.origin.y +  MenuOnWindow.btnMenu.frame.height, width: viewWidthHeight, height: viewWidthHeight)
                }
            }
            MenuOnWindow.xibView?.backgroundColor = UIColor.green
            windowApp?.addSubview(MenuOnWindow.xibView!)
            windowApp?.bringSubview(toFront: MenuOnWindow.btnMenu)
        }
    }
    
    //MARK:- Push_Pop ViewController
    func push_POP_to_ViewController(destinationVC:UIViewController,isAnimated:Bool) {
        var VCFound:Bool = false
        let viewControllers:NSArray = MenuOnWindow.navController.viewControllers as NSArray
        var indexofVC:NSInteger = 0
        for  vc  in viewControllers  {
            if (vc as AnyObject).nibName == (destinationVC.nibName){
                VCFound = true
                break
            }else{
                indexofVC += 1
            }
        }
        
        if VCFound == true {
            MenuOnWindow.navController.popToViewController(viewControllers.object(at: indexofVC) as! UIViewController, animated: isAnimated)
        }else{
            MenuOnWindow.navController.pushViewController(destinationVC , animated: isAnimated)
        }
        
        touchViewRemove()
    }
}

//MARK:- DropShadow View
extension UIView {
    func dropShadow() {
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.shadowRadius = 5.0
        self.clipsToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
    }
}
