//
//  AppDelegate.swift
//  MenuOnWindow
//
//  Created by piyush sinroja on 28/04/17.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit
@UIApplicationMain
class Appdelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var navController = UINavigationController()
    var menuObj : MenuOnWindow?

    //MARK:- Application LifeCycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewobj = storyboard.instantiateViewController(withIdentifier: "ViewController")

        navController = UINavigationController(rootViewController: viewobj)
        window!.rootViewController = navController
        window!.makeKeyAndVisible()
        menuObj = MenuOnWindow()
        menuObj?.loadNewView(window: window!,navigation: navController)
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


