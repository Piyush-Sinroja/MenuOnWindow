//
//  SecondViewController.swift
//  MenuOnWindow
//
//  Created by piyush sinroja on 01/05/17.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let appdel = UIApplication.shared.delegate as! Appdelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second View"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        print("First View",appdel.navController.viewControllers)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
